package questionanswer

import groovy.json.JsonSlurper
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.dao.DataIntegrityViolationException

class SurveyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	SurveyService surveyService

    def index() {
		//redirect(action: "list", params:params)
		if (session.user != null){
			def u = User.findByName(session.user)
			def hisProfile = u.getProfile()
			if (hisProfile.status.equals(Enum_profile.TEACHER)){
				redirect(controller:"Survey", action: "list")
			}else{
				redirect(controller:"Survey", action: "student_view")
			}
		}else{
        	render(view: "authentification")
		}
    }
	
	def show_s_student(Long id) {
		def surveyInstance = Survey.get(id)
		if (!surveyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Survey'), id])
			redirect(action: "list")
			return
		}

		[surveyInstance: surveyInstance]
	}
	
	def vote() {
		Survey s = Survey.get(params.survey)
		if(s==null) {
			String tid = params.s.find(/[1-9]+/)
			int sid = Integer.parseInt(tid)
			s =  Survey.get(sid)
		}
		def student = User.findByName(session.user)
		def userSurvey = UserSurvey.get(student.getId(), s.getId())
		Answer a = Answer.findByAnswer(params.answer)
		surveyService.voteForSurveyWithAnswer(s,a)
		userSurvey.setVoted(true)
		redirect(action: "student_view", controller: "Survey", id: params.qid, params: [surv: s])
	}
	
	def submit(Long id) {
		def surveyInstance = Survey.get(id)
		surveyService.submitSurvey(surveyInstance)
		redirect(action: "show", id: surveyInstance.id)
	}

	def close(Long id) {
			def surveyInstance = Survey.get(id)
			surveyService.closeSurvey(surveyInstance)
			redirect(action: "stats", id: surveyInstance.id)
	}
	
	def stats(Long id) {
		def surveyInstance = Survey.get(id)
		def slurper = new JsonSlurper()
		def rightAnswer
		def map = slurper.parseText(surveyInstance.getMapJson())
		map.entrySet().each {
			def answer = Answer.get(Integer.parseInt(it.key))
			if(answer.isRight())
				rightAnswer = answer
		}
		def myList = surveyService.CalculateStatistics(surveyInstance) as grails.converters.JSON
		def myGlobalList = surveyService.CalculateStatisticsGlobal(surveyInstance) as grails.converters.JSON
		render(view: "stats_diagrams", model: [surveyInstance: surveyInstance, rightAnswer:rightAnswer, listStats : myList, listGlobalStats : myGlobalList])
	}
	
	def stats_student(Long id) {
		def surveyInstance = Survey.get(id)
		def slurper = new JsonSlurper()
		def rightAnswer
		def map = slurper.parseText(surveyInstance.getMapJson())
		map.entrySet().each {
			def answer = Answer.get(Integer.parseInt(it.key))
			if(answer.isRight())
				rightAnswer = answer
		}
		def myList = surveyService.CalculateStatistics(surveyInstance) as grails.converters.JSON
		def myGlobalList = surveyService.CalculateStatisticsGlobal(surveyInstance) as grails.converters.JSON
		render(view: "stats_diagrams_student", model: [surveyInstance: surveyInstance, rightAnswer:rightAnswer, listStats : myList, listGlobalStats : myGlobalList])
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [surveyInstanceList: Survey.list(params), surveyInstanceTotal: Survey.count()]
    }
	
	def student_view(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[surveyInstanceList: Survey.list(params), surveyInstanceTotal: Survey.count()]
	}

    def create() {
        [surveyInstance: new Survey(params)]
    }

    def save() {
        def surveyInstance = new Survey(params)
        if (!surveyInstance.save(flush: true)) {
            render(view: "create", model: [surveyInstance: surveyInstance])
            return
        }
		def question = Question.get( params.question.id)
		surveyService.addAnswersInSurveyFromQuestion(surveyInstance,question)
		def students = User.findAll("\
			from User as u, \
				 Profile as p \
			where u.profile = p.id and p.status = ?", [Enum_profile.STUDENT])
		students.each {
			def student = User.get(it.id[0])
			UserSurvey.create(student, surveyInstance, false)
		}
        flash.message = message(code: 'default.created.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])
        redirect(action: "show", id: surveyInstance.id)
    }

    def show(Long id) {
        def surveyInstance = Survey.get(id)
        if (!surveyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), id])
            redirect(action: "list")
            return
        }

        [surveyInstance: surveyInstance]
    }

    def edit(Long id) {
        def surveyInstance = Survey.get(id)
        if (!surveyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), id])
            redirect(action: "list")
            return
        }

        [surveyInstance: surveyInstance]
    }

    def update(Long id, Long version) {
        def surveyInstance = Survey.get(id)
        if (!surveyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (surveyInstance.version > version) {
                surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'survey.label', default: 'Survey')] as Object[],
                          "Another user has updated this Survey while you were editing")
                render(view: "edit", model: [surveyInstance: surveyInstance])
                return
            }
        }

        surveyInstance.properties = params

        if (!surveyInstance.save(flush: true)) {
            render(view: "edit", model: [surveyInstance: surveyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])
        redirect(action: "show", id: surveyInstance.id)
    }

    def delete(Long id) {
        def surveyInstance = Survey.get(id)
        if (!surveyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), id])
            redirect(action: "list")
            return
        }
		
		UserSurvey.removeAll(surveyInstance)

        try {
            surveyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'survey.label', default: 'Survey'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'survey.label', default: 'Survey'), id])
            redirect(action: "show", id: id)
        }
    }
}

package questionanswer

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.dao.DataIntegrityViolationException

class SurveyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	SurveyService surveyService
	
	def logIn(){
		def u = User.findByNameAndPassword(params.name, params.password)
		if (u){
			def hisProfile = u.getProfile()
			if (hisProfile.status.equals("Teacher")){
				flash.message = "Hello "+ u.toString()
				redirect(action: "list")
			}else{
				flash.message = "Hello "+ u.toString()
				 redirect(action: "student_view")
			}	
		}else{
			flash.message = "Error during authentification, please try again"
			redirect(controller:"survey", action:"index")	
		}
	}

    def index() {
		//redirect(action: "list", params:params)
		if (session.user != null){
			def u = User.findByName(session.user)
			def hisProfile = u.getProfile()
			if (hisProfile.status.equals("Teacher")){
				redirect(controller:"Survey", action: "list")
			}else{
				redirect(controller:"Survey", action: "student_view")
			}
		}else{
        	render(view: "authentification")
		}
    }
	
	def vote() {
		Survey s = Survey.get(params.survey)
		if(s==null) {
			String tid = params.s.find(/[1-9]+/)
			int sid = Integer.parseInt(tid)
			s =  Survey.get(sid)
		}
		Answer a = Answer.findByAnswer(params.answer)
		surveyService.voteForSurveyWithAnswer(s,a)
		redirect(action: "show_q_student", controller: "Question", id: params.qid, params: [surv: s])
	}
	
	def submit(Long id) {
		def surveyInstance = Survey.get(id)
		surveyService.submitSurvey(surveyInstance)
		redirect(action: "show", id: surveyInstance.id)
	}

	def close(Long id) {
			def surveyInstance = Survey.get(id)
			surveyService.closeSurvey(surveyInstance)
			redirect(action: "show", id: surveyInstance.id)
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

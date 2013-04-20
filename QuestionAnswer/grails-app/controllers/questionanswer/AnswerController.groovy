package questionanswer

import org.springframework.dao.DataIntegrityViolationException

class AnswerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	AnswerService answerService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [answerInstanceList: Answer.list(params), answerInstanceTotal: Answer.count()]
    }

    def create(Long id) {
		def q = Question.get(id)
		[answerInstance: new Answer(params), questionInstance : q]
    }

    def save() {
		def question = Question.get(params.question.id)
		if(params.right) {
			if(question.getHasARightAnswer()) {
				flash.message = "Error : a right answer has already been assigned. The creation of the answer has been canceled."
			} else {
				def answerInstance = new Answer(params)
				if (!answerInstance.save(flush: true)) {
					render(view: "create", model: [answerInstance: answerInstance])
					return
				}
				question.setHasARightAnswer(true)
				flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
			}
		} else {
			def answerInstance = new Answer(params)
			if (!answerInstance.save(flush: true)) {
				render(view: "create", model: [answerInstance: answerInstance])
				return
			}
			flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
		}
        redirect(action: "create", id: params.question.id)
    }

    def show(Long id) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        [answerInstance: answerInstance]
    }

    def edit(Long id) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }
		def q = Question.get(params.qid)

        [answerInstance: answerInstance, questionInstance:q]
    }

    def update(Long id, Long version, Boolean checked) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (answerInstance.version > version) {
                answerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'answer.label', default: 'Answer')] as Object[],
                          "Another user has updated this Answer while you were editing")
                render(view: "edit", model: [answerInstance: answerInstance])
                return
            }
        }
			
        answerInstance.properties = params

		if (!answerInstance.save(flush: true)) {
			render(view: "edit", model: [answerInstance: answerInstance])
			return
		}
		Boolean wasChecked = new Boolean(params.wasChecked)
		def q = Question.get(params.qid)
		if(wasChecked) {
			if(!answerInstance.isRight()) {
				q.setHasARightAnswer(false)
			} else {
				q.setHasARightAnswer(true)
			}
			flash.message = message(code: 'default.updated.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
		} else {
			if(answerInstance.isRight()) {
				if(!q.getHasARightAnswer()) {
					q.setHasARightAnswer(true)
					flash.message = message(code: 'default.updated.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
				} else {
					answerInstance.right = false
					answerInstance.save(flush: true)
					flash.message = "Error : a right answer has already been assigned. The update of the answer has been canceled."
				}
			}
		}

        redirect(action: "show", id: answerInstance.id)
    }

    def delete(Long id) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        try {
            answerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "show", id: id)
        }
    }
}

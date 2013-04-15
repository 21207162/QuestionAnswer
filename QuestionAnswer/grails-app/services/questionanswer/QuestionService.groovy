package questionanswer

import org.springframework.dao.DataIntegrityViolationException

class QuestionService {

	def createQuestion (params){
			[questionInstance: new Question(params)]		
	}
	
	def deleteQuestion (Question q){
		def questionInstance = Question.get(id)
		if (!questionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
			redirect(action: "list")
			return
		}

		try {
			questionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
			redirect(action: "show", id: id)
		}
	}
}

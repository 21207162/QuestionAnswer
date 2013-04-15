package questionanswer

import org.springframework.dao.DataIntegrityViolationException

class QuestionService {

	def createQuestion (params){
		[questionInstance: new Question(params)]		
	}
	
	def deleteQuestion (Question q){
	}
}

package questionanswer

class AnswerService {

    def createAnswer(params) {
		[answerInstance: new Answer(params)]
    }
	
	def deleteAnswer(Answer a){
	}
}

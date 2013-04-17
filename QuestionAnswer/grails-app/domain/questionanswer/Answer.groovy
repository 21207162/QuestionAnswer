package questionanswer

class Answer {
	Question question
	String answer
	Boolean right

    static constraints = {
    }
	
	def isRight(){
		return right = true
	}
	
	String toString() {
		answer
	}
}

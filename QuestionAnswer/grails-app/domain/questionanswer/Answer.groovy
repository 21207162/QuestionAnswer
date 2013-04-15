package questionanswer

class Answer {
	Question question
	String answer
	Boolean right
	static int counter=0

    static constraints = {
    }
	
	def isRight(){
		return right = true
	}
}

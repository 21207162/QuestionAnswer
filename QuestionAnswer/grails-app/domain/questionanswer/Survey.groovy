package questionanswer

class Survey {
	Question question
	Map<Answer,Integer> answers = new HashMap<Answer,Integer>()
	Boolean open

    static constraints = {
    }
}

package questionanswer

class Survey {
	Question question
	def answers = [:]
	Boolean open
	String mapJson
	
	static transients= ["answers"]
	
    static constraints = {
		mapJson(nullable:true)
    }
}

package questionanswer

class Survey {
	Question question
	def answers = [:]
	Enum_state_survey open
	String mapJson
	
	static transients= ["answers"]
	
    static constraints = {
		mapJson(nullable:true)
    }
}

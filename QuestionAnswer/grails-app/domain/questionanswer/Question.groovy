package questionanswer

import java.util.List;

class Question {
	String title
	static hasMany=[answers:Answer]
	User author
	Boolean hasARightAnswer = false
	
	String toString() {
		title + " ?"
	}
	
    static constraints = {
		title(blank:false)
		hasARightAnswer(nullable:true)
		author(nullable:true)
    }
}

package questionanswer

import java.util.List;

class Question {
	String title
	static hasMany=[answers:Answer]
	User author
	
	String toString() {
		title + " ?"
	}
	
    static constraints = {
		title(blank:false)
		author(nullable:true)
    }
}

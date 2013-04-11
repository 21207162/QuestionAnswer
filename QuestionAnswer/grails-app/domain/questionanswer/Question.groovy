package questionanswer

class Question {

	String title
	User author
	
	String toString() {
		title + " ?"
	}
	
    static constraints = {
		title(blank:false)
		author(nullable:true)
    }
}

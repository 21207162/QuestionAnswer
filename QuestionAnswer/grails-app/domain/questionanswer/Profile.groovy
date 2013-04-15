package questionanswer

class Profile {
	/*enum Status {
		STUDENT, TEACHER
	  }*/
	
	String status
	

    static constraints = {
		status(blank:false)
    }
}

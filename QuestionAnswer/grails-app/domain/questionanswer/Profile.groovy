package questionanswer

class Profile {
	enum Status {
		STUDENT, TEACHER
	  }
	
	Status status
	

    static constraints = {
		status(blank:false)
    }
}

package questionanswer

class Profile {
	
	/*enum StatusEnum{
		TEACHER("teacher"), STUDENT("student")
	}*/

	String status

    static constraints = {
		status(blank:false)
    }
}

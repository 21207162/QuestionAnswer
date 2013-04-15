package questionanswer

class User {
	String forename
	String name
	String password
	Profile profile

	
	String toString() {
		forename + " " + name
	}
	
    static constraints = {
		forename(blank:false)
		name(blank:false)
		password(blank:false, nullable:true) 
		profile(blank:false)
    }
}

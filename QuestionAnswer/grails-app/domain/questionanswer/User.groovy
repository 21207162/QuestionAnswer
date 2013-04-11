package questionanswer

class User {
	String forename
	String name
	Profile profile

	
	String toString() {
		forename + " " + name
	}
	
    static constraints = {
		forename(blank:false)
		name(blank:false)
		profile(blank:false)
    }
}

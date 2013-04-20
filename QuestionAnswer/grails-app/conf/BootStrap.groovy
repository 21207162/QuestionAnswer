import questionanswer.Profile
import questionanswer.User
import questionanswer.Question
import questionanswer.Answer
import questionanswer.Survey
import questionanswer.Enum_profile



class BootStrap {

    def init = { servletContext ->
		Profile teacher = new Profile(status:Enum_profile.TEACHER)
		
		if(!teacher.save()) {
			teacher.errors.allErrors.each{error ->
				println "An error occured with adam"}
		}
		
		Profile student = new Profile(status:Enum_profile.STUDENT)
		
		if(!student.save()) {
			student.errors.allErrors.each{error ->
				println "An error occured with adam"}
		}
		
		User t1 = new User(forename:"Franck", name:"Silvestre", password:"coucou", profile:teacher)
		
		if(!t1.save()) {
			t1.errors.allErrors.each{error ->
				println "An error occured with adam"}
		}
		
		User s1 = new User(forename:"Axel", name:"Robert", password:"coucou", profile:student)
		
		if(!s1.save()) {
			s1.errors.allErrors.each{error ->
				println "An error occured with adam"}
		}
		
		
    }
    def destroy = {
    }
}

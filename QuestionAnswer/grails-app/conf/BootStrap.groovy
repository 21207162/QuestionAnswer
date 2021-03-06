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
				println "An error occured with teacher"}
		}
		
		Profile student = new Profile(status:Enum_profile.STUDENT)
		
		if(!student.save()) {
			student.errors.allErrors.each{error ->
				println "An error occured with student"}
		}
		
		User t1 = new User(forename:"Franck", name:"Silvestre", password:"coucou", profile:teacher)
		
		if(!t1.save()) {
			t1.errors.allErrors.each{error ->
				println "An error occured with t1"}
		}
		
		User t2 = new User(forename:"Frederic", name:"Migeon", password:"coucou", profile:teacher)
		
		if(!t2.save()) {
			t2.errors.allErrors.each{error ->
				println "An error occured with t2"}
		}
		
		
    }
    def destroy = {
    }
}

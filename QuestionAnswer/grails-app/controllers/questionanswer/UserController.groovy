package questionanswer

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        //redirect(action: "list", params: params)
    }
	

	
	def logIn(){
		def u = User.findByNameAndPassword(params.name, params.password)
		if (u){
		def hisProfile = u.getProfile()
		if (hisProfile.status.equals(Enum_profile.TEACHER)){
		flash.message = "Hello "+ u.toString()
		session.user = u.name
		redirect(controller:"Survey", action: "list")
		}else{
		flash.message = "Hello "+ u.toString()
		session.user = u.name
		redirect(controller:"Survey", action: "student_view")
		}
		}else{
		flash.message = "Error during authentification, please try again"
		redirect(controller:"Survey", action:"index")
		}
		}
	
	def logOut(){
		session.user=null
		redirect(controller:"Survey", view:"index")
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
		if (params.passwordsignup == params.passwordsignup_confirm){
			def profile = Profile.findByStatus(Enum_profile.STUDENT)
			def userInstance = new User(forename:params.forenamesignup, name:params.namesignup, password:params.passwordsignup, profile:profile)
			if (!userInstance.save(flush: true)) {
				render(view: "create", model: [userInstance: userInstance])
				return
			}
			flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
			redirect(controller:"Survey", action: "index", id: userInstance.id)
		}else{
			flash.message = "Error during signin, check your password"
		}
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}

package questionnaire



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SondageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		accesDirection()
        params.max = Math.min(max ?: 10, 100)
        respond Sondage.list(params), model:[sondageInstanceCount: Sondage.count()]
    }

    def show(Sondage sondageInstance) {
        respond sondageInstance
    }

    def create() {
		accesDirection()
        respond new Sondage(params)
    }

    @Transactional
    def save(Sondage sondageInstance) {
        if (sondageInstance == null) {
            notFound()
            return
        }

        if (sondageInstance.hasErrors()) {
            respond sondageInstance.errors, view:'create'
            return
        }
		
        sondageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sondage.label', default: 'Sondage'), sondageInstance.id])
                redirect sondageInstance
            }
            '*' { respond sondageInstance, [status: CREATED] }
        }
    }

    def edit(Sondage sondageInstance) {
		accesDirection()
        respond sondageInstance
    }
	
    @Transactional
    def update(Sondage sondageInstance) {
        if (sondageInstance == null) {
            notFound()
            return
        }

        if (sondageInstance.hasErrors()) {
            respond sondageInstance.errors, view:'edit'
            return
        }
        sondageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Sondage.label', default: 'Sondage'), sondageInstance.id])
                redirect sondageInstance
            }
            '*'{ respond sondageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Sondage sondageInstance) {

        if (sondageInstance == null) {
            notFound()
            return
        }

        sondageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Sondage.label', default: 'Sondage'), sondageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sondage.label', default: 'Sondage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	protected void accesDirection(){
		if(session.user==null){
			redirect controller:"logging", action:"login"
			return
		}
		if(!session.user.class.getName().equals("questionnaire.Direction")){
			flash.message="Vous n'etes pas admin! Veuillez monter en grade :P"
			redirect (controller:"eleve", action:"index")
			return
		}
	}
}

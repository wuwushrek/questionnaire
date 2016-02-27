package questionnaire
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EleveController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		if(session.user==null){
			redirect(controller:"logging",action:"login")
			return
		}
		if(session.user.class.getName().equals("questionnaire.Direction"))
		{
			flash.message="Vous etes Admin! Redirection vers accueil Admin..."
			redirect (controller:"direction", action:"indexChoix")
			return
		}
        params.max = Math.min(max ?: 10, 100)
        respond Sondage.list(params),model:[sondageInstanceCount: Sondage.count()]
    }

    def show(Eleve eleveInstance) {
        respond eleveInstance
    }	

    @Transactional
    def save(Eleve eleveInstance) {
        if (eleveInstance == null) {
            notFound()
            return
        }

        if (eleveInstance.hasErrors()) {
            respond eleveInstance.errors, view:'create'
            return
        }

        eleveInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eleve.label', default: 'Eleve'), eleveInstance.id])
                redirect eleveInstance
            }
            '*' { respond eleveInstance, [status: CREATED] }
        }
    }

    def edit(Eleve eleveInstance) {
        respond eleveInstance
    }

    @Transactional
    def update(Eleve eleveInstance) {
        if (eleveInstance == null) {
            notFound()
            return
        }

        if (eleveInstance.hasErrors()) {
            respond eleveInstance.errors, view:'edit'
            return
        }

        eleveInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Eleve.label', default: 'Eleve'), eleveInstance.id])
                redirect eleveInstance
            }
            '*'{ respond eleveInstance, [status: OK] }
        }
    }

    /*@Transactional
    def delete(Eleve eleveInstance) {

        if (eleveInstance == null) {
            notFound()
            return
        }

        eleveInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Eleve.label', default: 'Eleve'), eleveInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }*/

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eleve.label', default: 'Eleve'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package questionnaire
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EleveController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Eleve.list(params), model:[eleveInstanceCount: Eleve.count()]
    }

    def show(Eleve eleveInstance) {
        respond eleveInstance
    }	

    def create() {
        respond new Eleve(params)
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

    @Transactional
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
    }

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

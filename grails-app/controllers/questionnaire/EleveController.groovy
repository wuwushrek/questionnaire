package questionnaire
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EleveController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		accesEleve()
        params.max = Math.min(max ?: 10, 100)
        respond Sondage.list(params),model:[sondageInstanceCount: Sondage.count()]
    }

    def show(Eleve eleveInstance) {
        respond eleveInstance
    }	
	
	def create (){
		accesDirection()
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
		
		if(!params.mdp2.equals(params.mdp)){
			flash.message="Verifier les deux mots de passe"
			redirect(action:"create")
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
		if(session.user==null){
			redirect controller:"logging", action:"login"
			return
		}
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
	
	protected void accesEleve(){
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

package questionnaire

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DirectionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def indexChoix() {
		accesDirection()
	}
	
	def sondageStat(){
		accesDirection()
		def notes = Sondage.findByNom(params.id).note
		def note1=0
		def note2=0
		def note3=0
		def note4=0
		def note5=0
		def note6=0
		for(Note note: notes){
			if(note.note==1)
				note1++;
			else if(note.note==2)
				note2++;
			else if(note.note==3)
				note3++;
			else if(note.note==4)
				note4++;
			else if(note.note==5)
				note5++;
			else if(note.note==6)
				note6++;
		}
		int s=note1+note2+note3+note4+note5+note6;
		int moy =(note1 + note2*2+note3*3+note4*4+note5*5+note6*6)/s;
		int var = ((1-moy)*(1-moy)*note1+(2-moy)*(2-moy)*note2+(3-moy)*(3-moy)*note3+(4-moy)*(4-moy)*note4+
			(5-moy)*(5-moy)*note5+(6-moy)*(6-moy)*note6)/s;
		return [id:params.id,note1: note1,note2: note2,note3: note3,note4: note4,
			note5: note5,note6:note6,enregistre:s,moyenne:moy,variance:var]
	}
	
    def index(Integer max) {
		accesDirection()
        params.max = Math.min(max ?: 10, 100)
        respond Sondage.list(params),model:[sondageInstanceCount: Sondage.count()]
    }

    def show(Direction directionInstance) {
		accesDirection()
        respond directionInstance
    }

    def create() {
        redirect(controller:"sondage", action:"create")
    }

    @Transactional
    def save(Direction directionInstance) {
        if (directionInstance == null) {
            notFound()
            return
        }

        if (directionInstance.hasErrors()) {
            respond directionInstance.errors, view:'create'
            return
        }

        directionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'direction.label', default: 'Direction'), directionInstance.id])
                redirect directionInstance
            }
            '*' { respond directionInstance, [status: CREATED] }
        }
    }
	def statSondageEleve(){
		accesDirection()
		return [sondageInstanceList:Sondage.list(), eleveInstanceList:Eleve.list()]
	}
	
    def edit(Direction directionInstance) {
		accesDirection()
        respond directionInstance
    }

    @Transactional
    def update(Direction directionInstance) {
        if (directionInstance == null) {
            notFound()
            return
        }

        if (directionInstance.hasErrors()) {
            respond directionInstance.errors, view:'edit'
            return
        }

        directionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Direction.label', default: 'Direction'), directionInstance.id])
                redirect directionInstance
            }
            '*'{ respond directionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Direction directionInstance) {

        if (directionInstance == null) {
            notFound()
            return
        }

        directionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Direction.label', default: 'Direction'), directionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'direction.label', default: 'Direction'), params.id])
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

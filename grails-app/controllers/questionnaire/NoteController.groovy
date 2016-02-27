package questionnaire



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NoteController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def showQuestionnaire() {
		if(session.user==null){
			redirect(controller:"logging", action:"login")
			return
		}
		if(session.user.class.getName().equals("questionnaire.Direction"))
		{
			flash.message="Vous ne pouvez pas visualiser une note! Seul un eleve peut.."
			redirect (controller:"direction", action:"index")
			return
		}
		
		String nomQuestionnaire=params.id;
		Sondage sond = Sondage.findByNom(nomQuestionnaire)
		if(sond==null){
			flash.message="Sondage: ${params.id} a expire ou est inexistant !veuillez choisir un sondage en cours"
			redirect (controller:"eleve", action:"index")
			return
		}		
		Note noteSondage=Note.findBySondageAndEleve(sond,session.user)	
		if(noteSondage==null){
			return params
		}else{
			redirect(action:"showNote",params:[id:nomQuestionnaire,dejateste:true])
		}
	}

	def showNote(){
		if(!params.dejateste){
			if(session.user==null){
				redirect(controller:"logging", action:"login")
				return
			}
			if(session.user.class.getName().equals("questionnaire.Direction"))
			{
				flash.message="Vous ne pouvez pas visualiser une note! Seul un eleve peut.."
				redirect (controller:"direction", action:"index")
				return
			}
		}
		Note note = Note.findBySondageAndEleve(Sondage.findByNom(params.id),session.user)

		if(note==null){
			flash.message="Sondage ${params.id} a expire ou est inexistant !veuillez choisir un sondage en cours"
			redirect (controller:"eleve", action:"index")
			return
		}
		return [sondage:params.id,note:note.note]
	}

	def valider(){
		if(session.user==null){
			redirect(controller:"logging", action:"login")
			return
		}
		String nomQuestionnaire = params.id;
		if(params.note==null){
			flash.message="Vous n'avez pas rentre de note ! Veuillez le faire..."
			redirect (action:"showQuestionnaire",params:[id:nomQuestionnaire])
			return
		}
		Sondage sond= Sondage.findByNom(nomQuestionnaire)
		if(sond==null){
			flash.message="Sondage ${params.id} a expire ou est inexistant !veuillez choisir un sondage en cours"
			redirect (controller:"eleve", action:"index")
			return
		}
		/*Note note = Note.findBySondageAndEleve(sond,session.user)
		if (note!=null){
			redirect(action:"showNote",params:[id:nomQuestionnaire,dejateste:true])
			return
		}*/
		Note maNote = new Note(note:params.note,sondage:sond,eleve:session.user);
		maNote.save()
		redirect (action:"showNote",params:[id:nomQuestionnaire,dejateste:true])
	}

	def retour(){
		redirect (controller:"eleve", action:"index")
	}

	@Transactional
	def delete(Note noteInstance) {

		if (noteInstance == null) {
			notFound()
			return
		}

		noteInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Note.label', default: 'Note'),
					noteInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}
}

package questionnaire



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NoteController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def showQuestionnaire() {
		accesEleve()	
		String nomQuestionnaire=params.id;
		Sondage sond = Sondage.findByNom(nomQuestionnaire)
		if(sond==null){
			flash.message="Sondage: ${params.id} est inexistant !veuillez choisir un sondage en cours"
			redirect (controller:"eleve", action:"index")
			return
		}
		return params
	}

	def showNote(){
		accesEleve()
		Note note = Note.findBySondageAndEleve(Sondage.findByNom(params.id),session.user)
		if(note==null){
			flash.message="Sondage: ${params.id} est inexistant ou n' a pas encore ete envoye !"
			redirect (controller:"eleve", action:"index")
			return
		}
		return [sondage:params.id,note:note.note]
	}

	def valider(){
		accesEleve()
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
		if (Note.findBySondageAndEleve(sond,session.user)!=null){
			redirect(action:"showNote",params:[id:nomQuestionnaire])
			return
		}
		Note maNote = new Note(note:params.note,sondage:sond,eleve:session.user);
		maNote.save()
		redirect (action:"showNote",params:[id:nomQuestionnaire])
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
}

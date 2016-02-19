package questionnaire



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NoteController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	/* def index(Integer max) {
	 params.max = Math.min(max ?: 10, 100)
	 respond Note.list(params), model:[noteInstanceCount: Note.count()]
	 }*/
	def showQuestionnaire() {
		if(session.user==null){
			redirect(controller:"logging", action:"login")
			return
		}
		String nomQuestionnaire=params.id;
		Sondage sond = Sondage.findByNom(nomQuestionnaire)
		if(sond==null){
			flash.message="Sondage ${params.id} a expire ou est inexistant !veuillez choisir un sondage en cours"
			redirect (controller:"eleve", action:"index")
			return
		}
		//println("Nom questionnaire "+nomQuestionnaire + "   "+((session.user).note==null))
		
		println("CONTROLLERRRRRRRRRRRR:    "+session.user.class.getName())
		if(session.user.class.getName().equals("questionnaire.Direction"))
		{
			flash.message="Direction ${params.id} n'a pas accès à cette page"
			redirect (controller:"direction", action:"index")
			return
		}
		
		Note noteSondage=Note.findBySondageAndEleve(sond,session.user)
		//Note noteSondage = ((session.user).note).find {(it.sondage).nom==nomQuestionnaire}

		
		if(noteSondage==null){
			return params
		}else{
			redirect(action:"showNote",params:[id:nomQuestionnaire])
		}
	}

	def showNote(){
		if(session.user==null){
			redirect(controller:"logging", action:"login")
			return
		}
		
		
		if(session.user.class.getName().equals("questionnaire.Direction"))
		{
			flash.message="Direction ${params.id} n'a pas accès à cette page"
			redirect (controller:"direction", action:"index")
			return
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
		Sondage sond= Sondage.findByNom(nomQuestionnaire)
		if(sond==null){
			flash.message="Sondage ${params.id} a expire ou est inexistant !veuillez choisir un sondage en cours"
			redirect (controller:"eleve", action:"index")
			return
		}
		Note note = Note.findBySondageAndEleve(sond,session.user)
		if (note!=null){
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
}

package questionnaire

class LoggingController {

	def index = { redirect(action: "login") }
	def login = {
		if(session.user!=null){
			redirect (controller:"eleve", action:"index")
			return
		}
	}
	def logout={
		session.user=null
		redirect(action:"login")
	}
	def authentification ={
		
		def eleve = Eleve.findByNomAndMdp(params.login,params.mdp)
		if(eleve){
			session.user=eleve                                           
			redirect(controller:"eleve" , action:"index")
		}
		else {
			eleve = Direction.findByNomAndMdp(params.login,params.mdp)
			if(eleve){
				session.user=eleve
				flash.message= "Login: ${eleve.nom}"
				redirect(controller:"direction" , action:"indexChoix")
			}else{
				flash.message= "Combinaison mot de passe ou Identifiant fausse. Recommencez !"
				redirect(action:"login")
			}
		}
	}
}

package questionnaire

class LoggingController {

	def index = { redirect(action: "login") }
	
	def login = {
		if(session.user!=null){
			if(session.user.class.getName().equals("questionnaire.Direction"))
			{
				redirect (controller:"direction", action:"indexChoix")
				return
			}else{
				redirect (controller:"eleve", action:"index")
				return
			}
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
				redirect(controller:"direction" , action:"indexChoix")
			}else{
				flash.message= "Combinaison mot de passe ou Identifiant fausse. Recommencez !"
				redirect(action:"login")
			}
		}
	}
}

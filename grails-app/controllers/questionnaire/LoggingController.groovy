package questionnaire

class LoggingController {

	def index = { redirect(action: "login") }
	def login = {
	}
	def logout={
	}
	def authentification ={
		def eleve = Eleve.findByNomAndMdp(params.login,params.mdp)
		if(eleve){
			session.eleve=eleve
			flash.message= "Login: ${eleve.nom}"                                                    
			redirect(controller:"eleve" , action:"index")
		}
		else {
			eleve = Direction.findByNomAndMdp(params.login,params.mdp)
			if(eleve){
				session.eleve=eleve
				flash.message= "Login: ${eleve.nom}"
				redirect(controller:"direction" , action:"index")
			}else{
				flash.message= "Combinaison mot de passe ou Identifiant fausse. Recommencez !"
				redirect(action:"login")
			}
		}
	}
}

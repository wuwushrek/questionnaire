package questionnaire

class Direction {
	String nom,mdp
	static hasMany=[sondages: Sondage]
	static constraints = {
		nom(blank:false,size:3..30)
		mdp(blank:false,size:3..25)
	}
}

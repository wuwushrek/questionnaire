package questionnaire

class Eleve {
	String nom, mdp;
	static constraints = {
		nom(blank: false, nullable: false, unique: true)
		mdp(blank: false, minSize: 4);
	}	
}

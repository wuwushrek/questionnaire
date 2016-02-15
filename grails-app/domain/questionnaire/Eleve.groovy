package questionnaire

class Eleve {
	String nom, mdp;
	static constraints = {
		mdp(blank: false, minSize: 4);
	}
}

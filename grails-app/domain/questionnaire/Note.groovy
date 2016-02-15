package questionnaire

class Note {
	String nom;
	int note;

	static belongsTo=[sondage: Sondage];
	static constraints = {
		//NomEnseign = this.sondage.getNom();
		nom(blank:false,size:3..30)
		note(min:1,max:6)
	}
}

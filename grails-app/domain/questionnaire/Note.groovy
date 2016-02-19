package questionnaire

class Note {
	int note;

	static belongsTo=[sondage: Sondage, eleve:Eleve];
	static constraints = {
		note(min:1,max:6)
	}
}

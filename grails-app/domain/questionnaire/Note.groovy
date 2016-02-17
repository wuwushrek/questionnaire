package questionnaire

class Note {
	int note;

	static belongsTo=[sondage: Sondage];
	static constraints = {
		note(min:1,max:6)
	}
}

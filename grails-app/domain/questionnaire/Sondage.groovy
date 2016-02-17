package questionnaire

class Sondage {
	String nom;

	Date debut=new Date()
	Date fin=new Date()
	static hasMany=[note:Note]
	static constraints = {
		debut(blank : false)
		fin(blank : false,min: new Date())
		nom(blank:false,size:3..30)
	}
	String toString(){
		//possibilite d'ajouter directement les dates de debut et de fin a ...
		return nom;
	}
}

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
	
	double getMoy(){
		double moy = 0;
		for(int i=0;i<note.size();i++){
			moy += note.getAt(i).note;
		}
		moy/=note.size();
		return moy;
	}
	
	String toString(){
		//possibilite d'ajouter directement les dates de debut et de fin a�...
		return nom;
	}
}

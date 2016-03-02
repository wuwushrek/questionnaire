package questionnaire

class Sondage {
	String nom
	Date debut
	Date fin
	static hasMany=[note:Note]
	
	static constraints = {
		nom(blank:false,unique: true, size:3..30)
		debut(validator: {return (it>=new Date())})
		fin(min: new Date())
	}
	
	double getMoy(){
		double moy = 0;
		for(int i=0;i<note.size();i++){
			moy += note.getAt(i).note;
		}
		return moy!=0?moy/note.size():0;
	}
	
	String toString(){
		//possibilite d'ajouter directement les dates de debut et de fin
		return nom;
	}
}

import questionnaire.Direction
import questionnaire.Eleve

class BootStrap {
	def init = { servletContext ->
		environments {
			def development = development {

				def admin = new Direction(nom:'admin', mdp:'sorbetcitron'); // un seul admin
				admin.save();
				if(admin.hasErrors()) {
					println admin.getErrors();
				}

				Eleve[] user = new Eleve[6];

				user[0] = new Eleve(nom:'alix', mdp:'alix');
				user[1] = new Eleve(nom:'leaLeCam', mdp:'lealecam');
				user[2] = new Eleve(nom:'antoine', mdp:'antoine');
				user[3] = new Eleve(nom:'franck', mdp:'franck');
				user[4] = new Eleve(nom:'roman', mdp:'roman');
				user[5] = new Eleve(nom:'zakaria', mdp:'zakaria');

				for(int i = 0; i < 6; i++)
				{
					user[i].save();
					if(user[i].hasErrors()) {
						println user[i].getErrors();
					}
				}
			}
		}
	}
	def destroy = {
	}
}

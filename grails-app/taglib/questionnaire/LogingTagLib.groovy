package questionnaire

class LogingTagLib {
	//static defaultEncodeAs = [taglib:'html']
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def loginControl = {
		if(request.getSession(false) && session.user){
			out << "${session.user.nom} "
			out << "<input class=\"round-button-circle\" type=\"submit\" value=\"Logout\">"
			//out << """[${link(action:"logout", controller:"logging"){"Logout"}}]"""
		} else {
			out << """[${link(action:"login", controller:"logging"){"Login"}}]"""
		}
	}
}

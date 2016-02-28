package questionnaire

class DejaValideTagLib {
	//static defaultEncodeAs = [taglib:'html']
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def checkEncours={attrs, body->
		Sondage sondage = Sondage.findByNom(attrs.sondage)
		if(sondage.fin>new Date() && sondage.debut<new Date()){
			out << body()
		}
	}
	def checkAVenir={attrs, body->
		Sondage sondage = Sondage.findByNom(attrs.sondage)
		if(sondage.debut>new Date()){
			out << body()
		}
	}
	def checkTermine={attrs, body->
		Sondage sondage = Sondage.findByNom(attrs.sondage)
		if(sondage.fin<new Date()){
			out << body()
		}
	}
	def checkSondage={ attrs, body->
		Eleve eleve = Eleve.findByNom(attrs.eleve)
		for(Sondage sond : Sondage.list()){
			Note note = Note.findBySondageAndEleve(sond,eleve);
			if(note==null){
				out<<"<th style=\"text-align:center;\"><input type=\"radio\" onClick=\"return false;\"/></th>"
			}else{
				out<<"<th style=\"text-align:center;\"><input type=\"radio\" checked=\"checked\" onClick=\"return false;\"/></th>"
			}
		}
	}
	def checkValide={attrs,body->
		if(Note.findBySondageAndEleve(attrs.sondage,session.user)!=null){
			out<<"<td style=\"text-align:center;\"><input type=\"radio\" checked=\"checked\" onClick=\"return false;\"/></td>"
		}else{
			out<<"<td style=\"text-align:center;\"><input type=\"radio\" onClick=\"return false;\"/></td>"
		}
	}
}

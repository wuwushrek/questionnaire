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
}

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Questionnaire</title>
<link rel="stylesheet"
	href="${resource(dir:'css',file:'custombutton.css')}" />
</head>
</head>
<body>
	<a href="#create-direction" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="create-direction" class="content scaffold-create" role="main">
		<h1 style="font-size:30px;font-family:'Comic Sans MS','Lucida Sans Unicode';"><b>Faites votre choix</b></h1>
		<br>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div style="margin:auto;text-align:center;">
			<g:form action="index">
				<input class="retourbutton" type="submit" style="width:300px;"
					value="Liste des questionnaires">
			</g:form>
		</div>
		<br>
		<div style="margin:auto;text-align:center;">
			<g:form action="statSondageEleve">
				<input class="retourbutton" type="submit" style="width:300px;"
					value="Voir Sondages|Eleves">
			</g:form>
		</div>
		
		<br>
		<div style="margin:auto;text-align:center;">
			<g:form controller="sondage" action="create">
				<input class="retourbutton" type="submit" style="width:300px;"
					value="Creer un questionnaire">
			</g:form>
		</div>
		<br>
		<div style="margin:auto;text-align:center;">
			<g:form controller="eleve" action="create">
				<!-- A changer -->
				<input class="retourbutton" type="submit" style="width:300px;"
					value="Ajouter un eleve">
			</g:form>
		</div>
		<br>
	</div>
</body>
</html>

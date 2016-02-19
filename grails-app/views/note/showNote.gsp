<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Questionnaire rempli</title>
<link rel="stylesheet"
	href="${resource(dir:'css',file:'custombutton.css')}" />
</head>
<body>
	<div
		style="color: #87CEFA; vertical-align: middle; text-align: center; font-family: 'Bauhaus 93', helvetica, serif; font-size: 20px">
		<h2>Formulaire Enregistré</h2>
	</div>
	<g:if test="${flash.message}">
		<div class="message" role="status" style="color:#FF0000">
			${flash.message}
		</div>
	</g:if>
	<br>
	<table class="buttons" border="1" >
		<tr>
			<th style="color: #708090; vertical-align: middle; text-align: center; font-size: 20px">
				${sondage}
			</th>
			<th style="color: #FF0000; vertical-align: middle; text-align: center; font-size: 20px">
				${note}
			</th>
		</tr>
	</table>
	<g:form class="buttons" action="retour" methode="post">
		<input class="retourbutton" type="submit" value="Retour">
	</g:form>
</body>
</html>
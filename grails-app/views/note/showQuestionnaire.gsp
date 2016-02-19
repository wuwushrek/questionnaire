
<%@ page import="questionnaire.Note"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'note.label', default: 'Note')}" />
<title>Notation enseignement</title>
<link rel="stylesheet"
	href="${resource(dir:'css',file:'custombutton.css')}" />
</head>
<body>
	<div
		style="color: #87CEFA; vertical-align: middle; text-align: center; font-family: 'Bauhaus 93', helvetica, serif; font-size: 20px">
		<h3>Attribuez une note à l'enseignement</h3>
	</div>
	<br>
	<div
		style="color: #708090; vertical-align: middle; text-align: center; font-family: 'Bauhaus 93', helvetica, serif">
		<h2>Votre note :</h2>
	</div>
	<br>
	<g:if test="${flash.message}">
		<div class="message" role="status"
			style="color: #FF0000; text-align: center">
			${flash.message}
		</div>
	</g:if>
	<g:form action="valider" methode="post" id="${params.id}">
	<table>
		<tr>
			<td style="width:50px;color:#000080;">${params.id}</td>
			<g:radioGroup name="note" values="[1,2,3,4,5,6]" value="1">
				<td>
					${it.radio}
				</td>
			</g:radioGroup>
		</tr>
		<tr style="color: #A0522D; font-size: 15px; text-align: center">
			<td></td>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
		</tr>
	</table>
	<br>
	<div class="buttons">
		<g:form class="right_part" action="valider" methode="post" id="${params.id}">
			<input class="validerbutton" type="submit" value="Valider">
		</g:form>
		<g:form class="left_part" action="retour" methode="post">
			<input class="retourbutton" type="submit" value="Retour">
		</g:form>
	</div>
	</g:form>
</body>
</html>

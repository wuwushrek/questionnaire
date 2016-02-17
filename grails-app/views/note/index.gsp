
<%@ page import="questionnaire.Note"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'note.label', default: 'Note')}" />
<title><g:message code="Choix note" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-note" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="radio" style="text-align: center; width: 100%; margin-top:10%;">
		<input id="1" type="radio" name="note" value="1">
		<labelfor="1">1</label> <input id="2" type="radio" name="note"
			value="2"> <label for="2">2</label> <input id="3"
			type="radio" name="note" value="3"> <label for="3">3</label>
		<input id="4" type="radio" name="note" value="4"> <label
			for="4">4</label> <input id="5" type="radio" name="note" value="5">
		<label for="5">5</label> <input id="6" type="radio" name="note"
			value="6"> <label for="6">6</label>
	</div>

	<div style="text-align: center; margin-top:5%;">
		<button class="button">Valider</button>
	</div>



	<style type="text/css">
label {
	padding-left: 12px;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	transition-duration: 0.4s;
}

.button:hover {
	background-color: #AAAAAA;
	color: white;
}
</style>
</body>
</html>

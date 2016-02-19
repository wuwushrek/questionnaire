<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'direction.label', default: 'Direction')}" />
<title>Questionnaire</title>
<link rel="stylesheet"
	href="${resource(dir:'css',file:'custombutton.css')}" />
</head>
</head>
<body>
	<a href="#create-direction" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-direction" class="content scaffold-create" role="main">
		<h1>Faites votre choix</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div>
			<g:form action="index">
				<input class="retourbutton" type="submit"
					value="Liste des questionnaires">
			</g:form>
		</div>
		<div>
			<g:form controller="sondage" action="create">
				<input class="retourbutton" type="submit"
					value="Creer un questionnaire">
			</g:form>
		</div>
		<div>
			<g:form controller="eleve" action="index">
				<!-- A changer -->
				<input class="retourbutton" type="submit" value="Ajouter un ELeve">
			</g:form>
		</div>
	</div>
</body>
</html>

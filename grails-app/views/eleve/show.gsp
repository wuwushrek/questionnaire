
<%@ page import="questionnaire.Eleve" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eleve.label', default: 'Eleve')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-eleve" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" controller="direction" action="indexChoix"><g:message code="Accueil Admin" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="direction" action="statSondageEleve"><g:message code="Listes des Eleves" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Ajouter Eleve" args="[entityName]" /></g:link></li>
				
			</ul>
		</div>
		<div id="show-eleve" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list eleve">
			
				<g:if test="${eleveInstance?.mdp}">
				<li class="fieldcontain">
					<span id="mdp-label" class="property-label"><g:message code="eleve.mdp.label" default="Mdp" /></span>
					
						<span class="property-value" aria-labelledby="mdp-label"><g:fieldValue bean="${eleveInstance}" field="mdp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eleveInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="eleve.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${eleveInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:eleveInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${eleveInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

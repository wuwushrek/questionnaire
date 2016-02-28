
<%@ page import="questionnaire.Sondage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sondage.label', default: 'Sondage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sondage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" controller="direction" action="indexChoix"><g:message code="Accueil Admin" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="direction" action="index"><g:message code="Listes sondages" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="créer sondage" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sondage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sondage">
			
				<g:if test="${sondageInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="sondage.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${sondageInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sondageInstance?.debut}">
				<li class="fieldcontain">
					<span id="debut-label" class="property-label"><g:message code="sondage.debut.label" default="Debut" /></span>
					
						<span class="property-value" aria-labelledby="debut-label"><g:formatDate date="${sondageInstance?.debut}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sondageInstance?.fin}">
				<li class="fieldcontain">
					<span id="fin-label" class="property-label"><g:message code="sondage.fin.label" default="Fin" /></span>
					
						<span class="property-value" aria-labelledby="fin-label"><g:formatDate date="${sondageInstance?.fin}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:sondageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${sondageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

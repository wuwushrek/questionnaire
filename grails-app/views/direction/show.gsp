
<%@ page import="questionnaire.Direction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'direction.label', default: 'Direction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-direction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-direction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list direction">
			
				<g:if test="${directionInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="direction.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${directionInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${directionInstance?.mdp}">
				<li class="fieldcontain">
					<span id="mdp-label" class="property-label"><g:message code="direction.mdp.label" default="Mdp" /></span>
					
						<span class="property-value" aria-labelledby="mdp-label"><g:fieldValue bean="${directionInstance}" field="mdp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${directionInstance?.sondages}">
				<li class="fieldcontain">
					<span id="sondages-label" class="property-label"><g:message code="direction.sondages.label" default="Sondages" /></span>
					
						<g:each in="${directionInstance.sondages}" var="s">
						<span class="property-value" aria-labelledby="sondages-label"><g:link controller="sondage" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:directionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${directionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

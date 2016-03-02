<%@ page import="questionnaire.Sondage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sondage.label', default: 'Sondage')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-sondage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" controller="direction" action="indexChoix"><g:message code="Accueil Admin" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="direction" action="index"><g:message code="Listes sondages" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-sondage" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${sondageInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${sondageInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:sondageInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${sondageInstance?.version}" />
				<fieldset class="form">
					<g:render template="form2"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="questionnaire.Eleve" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eleve.label', default: 'Eleve')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-eleve" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-eleve" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					<g:sortableColumn property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage en cours')}" />
					<g:sortableColumn property="date" title="${message(code: 'Eleve.nom.label', default: 'Date de fin')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${sondageInstance.id}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td><g:link action="show" id="${sondageInstance.id}">${fieldValue(bean: sondageInstance, field: "fin")}</g:link></td>
					</tr>
				</g:each>
				</tbody>
				<thead>
					<tr>
					<g:sortableColumn property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage à venir')}" />
					<g:sortableColumn property="nom" title="${message(code: 'eleve.nom.label', default: 'Date de début')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${sondageInstance.id}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td><g:link action="show" id="${sondageInstance.id}">${fieldValue(bean: sondageInstance, field: "debut")}</g:link></td>
					</tr>
				</g:each>
				</tbody>
				<thead>
					<tr>
					<g:sortableColumn property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage terminé')}" />
					<g:sortableColumn property="nom" title="${message(code: 'eleve.nom.label', default: 'Date de fin')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${sondageInstance.id}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td><g:link action="show" id="${sondageInstance.id}">${fieldValue(bean: sondageInstance, field: "fin")}</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${InstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

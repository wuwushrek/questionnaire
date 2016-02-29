
<%@ page import="questionnaire.Direction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'direction.label', default: 'Direction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-direction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="indexChoix"><g:message code="Accueil Admin" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="créer sondage" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-direction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nom" title="${message(code: 'direction.nom.label', default: 'Sondage en cours')}" />
						<g:sortableColumn property="mdp" title="${message(code: 'direction.mdp.label', default: 'Moyenne')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
				<g:checkEncours sondage="${sondageInstance}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td> <g:link controller= "direction" action="sondageStat" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td> <g:link controller= "direction" action="sondageStat" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "moy")}</g:link></td>
					</tr>
					</g:checkEncours>
				</g:each>
				</tbody>
				<thead>
					<tr>
					<g:sortableColumn property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage à venir')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
				<g:checkAVenir sondage="$sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link ccontroller="sondage" action="edit" resource="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td><g:link ccontroller="sondage" action="edit" resource="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "moy")}</g:link></td>
					</tr>
				</g:checkAVenir>
				</g:each>
				</tbody>
				<thead>
					<tr>
					<g:sortableColumn property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage terminé')}" />
					<g:sortableColumn property="mdp" title="${message(code: 'eleve.mdp.label', default: 'Moyenne')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
				<g:checkTermine sondage="$sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link controller="direction" action="sondageStat" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td><g:link controller="direction" action="sondageStat" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "moy")}</g:link></td>
					</tr>
				</g:checkTermine>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sondageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

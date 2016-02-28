
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
		<div id="list-eleve" class="content scaffold-list" role="main">
			<h1 style="font-size:20px">Liste des sondages</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status" style="color:#FF0000">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					<g:sortableColumn style="width:50%" property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage en cours')}" />
					<g:sortableColumn style="width:50%" property="date" title="${message(code: 'eleve.nom.label', default: 'Date de fin')}" />
					<g:sortableColumn style="width:50%" property="nom" title="${message(code: 'eleve.nom.label', default: 'Valide?')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
				<g:checkEncours sondage="${sondageInstance}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link controller= "note" action="showQuestionnaire" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td><g:link controller= "note" action="showQuestionnaire" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "fin")}</g:link></td>
						<g:checkValide sondage="${sondageInstance}"></g:checkValide>
					</tr>
					</g:checkEncours>
				</g:each>
				</tbody>
			</table>
			<table>
				<thead>
					<tr>
					<g:sortableColumn style="width:50%" property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage à venir')}" />
					<g:sortableColumn style="width:50%" property="nom" title="${message(code: 'eleve.nom.label', default: 'Date de début')}" />
					<g:sortableColumn style="width:50%" property="date" title="${message(code: 'eleve.nom.label', default: 'Valider?')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
				<g:checkAVenir sondage="$sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td style="color:blue;">${fieldValue(bean: sondageInstance, field: "nom")}</td>
						<td style="color:blue;">${fieldValue(bean: sondageInstance, field: "debut")}</td>
					</tr>
				</g:checkAVenir>
				</g:each>
				</tbody>
				</table>
				<table>
				<thead>
					<tr>
					<g:sortableColumn style="width:50%" property="nom" title="${message(code: 'eleve.nom.label', default: 'Sondage terminé')}" />
					<g:sortableColumn style="width:50%" property="nom" title="${message(code: 'eleve.nom.label', default: 'Date de fin')}" />
					<g:sortableColumn style="width:50%" property="nom" title="${message(code: 'eleve.nom.label', default: 'Valide?')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
				<g:checkTermine sondage="$sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link controller="note" action="showNote" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link></td>
						<td><g:link controller="note" action="showNote" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "fin")}</g:link></td>
						<g:checkValide sondage="${sondageInstance}"></g:checkValide>
					</tr>
				</g:checkTermine>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${InstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

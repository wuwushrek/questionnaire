
<%@ page import="questionnaire.Note" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-note" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-note" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'note.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'note.note.label', default: 'Note')}" />
					
						<th><g:message code="note.sondage.label" default="Sondage" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${noteInstanceList}" status="i" var="noteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${noteInstance.id}">${fieldValue(bean: noteInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: noteInstance, field: "note")}</td>
					
						<td>${fieldValue(bean: noteInstance, field: "sondage")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${noteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

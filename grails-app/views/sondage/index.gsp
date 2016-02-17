
<%@ page import="questionnaire.Sondage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sondage.label', default: 'Sondage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sondage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sondage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nom" title="${message(code: 'sondage.nom.label', default: 'Nom')}" />
						<g:sortableColumn property="debut" title="${message(code: 'sondage.debut.label', default: 'Debut')}" />
					
						<g:sortableColumn property="fin" title="${message(code: 'sondage.fin.label', default: 'Fin')}" />
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sondageInstance.id}">${fieldValue(bean: sondageInstance, field: "debut")}</g:link></td>
					
						<td><g:formatDate date="${sondageInstance.fin}" /></td>
					
						<td>${fieldValue(bean: sondageInstance, field: "nom")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sondageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

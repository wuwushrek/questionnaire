<%@ page import="questionnaire.Direction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet"
			href="${resource(dir:'css',file:'custombutton.css')}" />
		<title>Stat Sondage/Eleve </title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="indexChoix"><g:message code="Accueil Admin" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="créer sondage" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="eleve" action="create"><g:message code="Ajouter Eleve" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-direction" class="content scaffold-list" role="main">
			<h1 style="font-size:30px;text-align:center;font-family:'Comic Sans MS','Lucida Sans Unicode';"><b>Visualisation des sondages soumis par chaque élève</b></h1>
			<br>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table border= "1" style="text-align:center;">
			<thead>
					<tr>
						<th style="text-align:center;background:#FF9933;">Eleves</th>
						<g:each in="${sondageInstanceList}" status="i" var="sondageInstance">
							<th style="text-align:center;background:#FF9933;">
								<g:link controller= "direction" action="sondageStat" id="${sondageInstance}">${fieldValue(bean: sondageInstance, field: "nom")}</g:link>
							</th>
						</g:each>
					</tr>
				</thead>
				<tbody>
				<g:each in="${eleveInstanceList}" status="i" var="eleveInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<th style="text-align:center;"> ${eleveInstance} </th>
						<g:checkSondage eleve="$eleveInstance"></g:checkSondage>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:form class="buttons" action="index" methode="post">
				<input class="retourbutton" type="submit" value="Retour">
			</g:form>
		</div>
	</body>
</html>

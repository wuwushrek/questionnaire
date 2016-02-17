<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${resource(dir:'css',file:'LoginTemp.css')}" />
<title>Login</title>
</head>
<body>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:form action="authentification" methode="post">
			<g:render template="/layouts/loggingTemplates" />
		</g:form>
	</div>
</body>
</html>
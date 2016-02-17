
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${resource(dir:'css',file:'LoginTemp.css')}" />
<title>Login</title>
</head>
<body>
	<!--style="background-image:url('${resource(dir: "images", file: "test.jpg")}')">-->
	<g:if test="${flash.message}">
		<div class="message" role="status" style="color:#FF0000;text-align:center">
			${flash.message}
		</div>
	</g:if>
	<g:form action="authentification" methode="post">
		<g:render template="/layouts/loggingTemplates" />
	</g:form>
</body>
</html>

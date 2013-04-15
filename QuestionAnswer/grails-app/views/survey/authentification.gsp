<%@ page import="questionanswer.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Back home</a></li>
			</ul>
		</div>
		<div id="container">
			<div class="space"></div>
			<h1>Authentification</h1>
			<div class="space"></div>
			<g:if test="${flash.authenticationFailure}">
				Login failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
			</g:if>
			<g:form class="login" controller="survey" action="logIn" method="post">
			    <label for="name">User name :</label><g:textField name="name"/><br/>
			    <label for="password">Password :</label><input type="password" name="password"/><br/>
			    <input type="submit" value="Login"/>
			</g:form>
		</div>
	</body>
</html>

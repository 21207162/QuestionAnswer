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
		<g:if test="${flash.authenticationFailure}">
			Login failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
		</g:if>
		<auth:form authAction="login" success="[controller:'admin', action:'index']" error="[controller:'admin', action:'loginError']">
		    User: <g:textField name="login"/><br/>
		    Password: <input type="password" name="password"/><br/>
		    <input type="submit" value="Log in"/>
		</auth:form>
	</body>
</html>

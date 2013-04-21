<%@ page import="questionanswer.Answer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-answer" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" controller="Question" action="show" id="${questionInstance.id}">Show Question</g:link></li>
			</ul>
		</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${answerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${answerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<p class="signin button">
					<input name="create" class="save" type="submit" value="Create"/> 
				</p>
			</g:form>
		</div>
	</body>
</html>

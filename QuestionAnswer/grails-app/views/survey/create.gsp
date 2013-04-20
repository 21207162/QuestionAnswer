<%@ page import="questionanswer.Survey" %>
<%@ page import="questionanswer.Enum_state_survey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-survey" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
			<p style="margin:10px;">Here you can create a new survey. <br>Please select the question which you want to reference, and choose if the survey is opened or closed.</p>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${surveyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${surveyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:hiddenField name="open" value="${Enum_state_survey.CLOSED}" />
					<g:render template="form"/>
				</fieldset>
				<p class="signin button">
					<input name="create" class="save" type="submit" value="Create"/> 
				</p>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="questionanswer.Survey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-survey" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<a href="${createLink(controller:'Question', action:'show', id:surveyInstance.id)}" ><< Go to survey details</a>
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
			<g:form method="post" >
				<g:hiddenField name="id" value="${surveyInstance?.id}" />
				<g:hiddenField name="version" value="${surveyInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<div class="access_button">
					<input class="access" type="submit" onclick="return confirm('Are you sure?');" value="Update" name="_action_update"/>
					<input class="access" type="submit" onclick="return confirm('Are you sure?');" value="Delete" name="_action_delete" action="delete"/>	
				</div>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="questionanswer.Survey" %>
<%@ page import="questionanswer.Enum_state_survey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-survey" class="content scaffold-show" role="main">
			<h1>Survey details (<g:if test="${ surveyInstance.open == Enum_state_survey.OPENED }"> Opened </g:if>
			<g:else><g:if test="${ surveyInstance.open == Enum_state_survey.CLOSED }"> Closed </g:if>
			<g:else>Over</g:else>
			</g:else>)</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
			<ol class="property-list survey">
			
				<g:if test="${surveyInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="survey.question.label" default="Question" /></span>
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${surveyInstance?.question?.id}">${surveyInstance?.question?.encodeAsHTML()}</g:link></span>				
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${surveyInstance?.id}" />
					<g:link class="edit" action="edit" id="${surveyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:if test="${ surveyInstance.open != Enum_state_survey.OVER }">
						<g:actionSubmit class="submit" action="submit" value="Submit"/>
					</g:if>
					<g:actionSubmit class="close" action="close" value="Close"/>
					<div class="access_button"> 
						<a class="access" href="${createLink(controller:'Survey', action:'close')}">Close survey</a>
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

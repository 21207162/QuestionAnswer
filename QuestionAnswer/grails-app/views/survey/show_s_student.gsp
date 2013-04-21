
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
			<a href="${createLink(controller:'Survey', action:'student_view')}" ><< Go to survey list</a>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list survey">
			
				<g:if test="${surveyInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="survey.question.label" default="Question" /></span>
						<span class="property-value" aria-labelledby="question-label">${surveyInstance?.question?.encodeAsHTML()}</span>				
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${surveyInstance?.id}" />
					<div class="access_button">
						<a class="access" href="${createLink(controller:'Survey', action:'stats_student', id:surveyInstance?.id)}">Go to results</a>
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

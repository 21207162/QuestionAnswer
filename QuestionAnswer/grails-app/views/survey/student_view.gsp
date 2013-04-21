
<%@ page import="questionanswer.Survey" %>
<%@ page import="questionanswer.Enum_state_survey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-survey" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<p style="margin: 10px;">Welcome on survey page.
			Here, you have access to all the available survey. To participate, select a survey and vote for an answer.
			Be careful, you only have one try, GOOD LUCK !</p>
			<table>
				<thead>
					<tr>
						<th><g:message code="survey.question.label" default="Available surveys" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
					<g:if test="${surveyInstance.open != Enum_state_survey.CLOSED}">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>
								<g:if test="${surveyInstance.open == Enum_state_survey.OVER}">
									<g:link controller="Survey" action="show_s_student" params="[survey: surveyInstance.id]" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "question")}</g:link>
								</g:if>
								<g:else>
									<g:link controller="question" action="show_q_student" params="[survey: surveyInstance.id]" id="${surveyInstance.question.id}">${fieldValue(bean: surveyInstance, field: "question")}</g:link>
								</g:else>
								<span>(${surveyInstance.open})</span>
							</td>
						</tr>
					</g:if>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>

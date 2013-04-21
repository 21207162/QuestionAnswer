<%@ page import="questionanswer.Survey" %>
<%@ page import="questionanswer.Enum_state_survey" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    </head>
	<body>
		<h1>Administration surveys</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		<p style="margin: 10px;">Welcome on survey administration page.
			Here, you can create new questions with answer and submit a question
			to a survey. When you close a survey, you have access to statistics
			about this question, correct and wrong answers.</p>
		<table>
			<thead>
				<tr>
					<th><g:message code="survey.question.label" default="Surveys" /></th>
					<g:sortableColumn property="open"
						title="${message(code: 'survey.open.label', default: 'Open')}" />
	
				</tr>
			</thead>
			<tbody>
				<g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							<g:link action="show" id="${surveyInstance.id}"> ${fieldValue(bean: surveyInstance, field: "question")}</g:link>
						</td>
						<td>
							<g:if test="${ surveyInstance.open == Enum_state_survey.OPENED }"> Opened </g:if>
							<g:else>
								<g:if test="${ surveyInstance.open == Enum_state_survey.CLOSED }"> Closed </g:if>
								<g:else>OVER</g:else>
							</g:else>
						</td>			
					</tr>
				</g:each>
			</tbody>
		</table>
		<br>
		<fieldset class="buttons">
			<div class="access_button">
				<a class="access" href="${createLink(controller:'Survey', action:'create')}">Create Survey</a> 
				<a class="access" href="${createLink(controller:'Question', action:'create')}">Create Question</a>
			</div>
		</fieldset>
		<div class="pagination">
			<g:paginate total="${surveyInstanceTotal}" />
		</div>
	</body>
</html>

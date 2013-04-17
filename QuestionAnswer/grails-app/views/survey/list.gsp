
<%@ page import="questionanswer.Survey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-survey" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="Question" action="create"><g:message code="default.new.label" args="['Question']" /></g:link></li>
			</ul>
		</div>
		<div id="list-survey" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<h1>Administration surveys</h1>
			<p style="margin:10px;">Welcome on survey administration page. Here, you can create new qusetions with answer and submit a question to a survey.
			When you close a survey, you have access to statistics about this question, correct and wrong answers.</p>
			<table>
				<thead>
					<tr>
					<th><g:message code="survey.question.label" default="Surveys" /></th>
						<g:sortableColumn property="open" title="${message(code: 'survey.open.label', default: 'Open')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "question")}</g:link></td>
						<td><g:if test="${ surveyInstance.open }"> Opened </g:if><g:else> Closed </g:else></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${surveyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

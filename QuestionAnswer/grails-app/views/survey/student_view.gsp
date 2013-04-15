
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
			</ul>
		</div>
		<div id="list-survey" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="survey.question.label" default="Question" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
					<g:if test="${fieldValue(bean: surveyInstance, field: "open") == 'true'}">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:link controller="question" action="show_q_student" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "question")}</g:link></td>
						</tr>
					</g:if>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>

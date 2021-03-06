
<%@ page import="questionanswer.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<a href="${createLink(controller:'Survey', action:'list')}" ><< Back to survey list</a>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<p style="margin: 10px;">Welcome on question list page.
			Here, you can create new questions with answers.</p>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'question.title.label', default: 'Title')}" />
					
						<th><g:message code="question.author.label" default="Author" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: questionInstance, field: "author")}</td>
					
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
				<g:paginate total="${questionInstanceTotal}" />
			</div>
			</div>
	</body>
</html>


<%@ page import="questionanswer.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="question.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${questionInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="question.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label">${questionInstance?.author?.encodeAsHTML()}</span>
					
				</li><br>
				</g:if>
				<g:if test="${questionInstance?.answers}">
				<table>
					<thead>
						<tr>
							<th><g:message code="survey.question.label" default="Answer" /></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${questionInstance.answers}" var="a">
							<tr>
								<td style="width:80%">
									<div class="property-div-value">${a?.encodeAsHTML()}</div>
								</td>
								<td style="width:20%">
									<g:form controller="Survey" action="vote" method="post"  params="[s:params.surv, survey: survey, answer: a, qid: questionid]">
										<g:submitButton name="vote" value="${message(code: 'Vote', default: 'Vote')}" />
									</g:form>
								</td>			
							</tr>
						</g:each>
					</tbody>
				</table>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="questionanswer.Answer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-answer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<a href="${createLink(controller:'Survey', action:'list')}" ><< Go to survey list</a>
			<a style="float:right" href="${createLink(controller:'Question', action:'list')}" >Go to question list >></a>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list answer">
				<g:if test="${answerInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="answer.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${answerInstance?.question?.id}">${answerInstance?.question?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${answerInstance?.answer}">
				<li class="fieldcontain">
					<span id="answer-label" class="property-label"><g:message code="answer.answer.label" default="Answer" /></span>
					
						<span class="property-value" aria-labelledby="answer-label"><g:fieldValue bean="${answerInstance}" field="answer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.right}">
				<li class="fieldcontain">
					<span id="right-label" class="property-label"><g:message code="answer.right.label" default="Right" /></span>
					
						<span class="property-value" aria-labelledby="right-label"><g:formatBoolean boolean="${answerInstance?.right}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${answerInstance?.id}" />
					<div class="access_button">
						<a class="access" href="${createLink(controller:'Answer', action:'list')}" >Answer List</a>
						<a class="access" href="${createLink(controller:'Answer', action:'edit', id:AnswerInstance.id)}" >Edit</a>
						<input class="access" type="submit" onclick="return confirm('Are you sure?');" value="Delete" name="_action_delete">
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


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
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="user" action="show" id="${questionInstance?.author?.id}">${questionInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${questionInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
					
						<g:each in="${questionInstance.answers}" var="a">
						<span class="property-value" aria-labelledby="answers-label"></span><br/>
							<div class="property-div-value">${a?.encodeAsHTML()}</div>
							<div class="property-div-form">
								<g:form controller="Survey" action="vote" method="post"  params="[s:params.surv, survey: survey, answer: a, qid: questionid]">
									<g:submitButton name="vote" class="vote" value="${message(code: 'Vote for this answer', default: 'Vote for this answer')}" />
								</g:form>
							</div>
						<div class="property-div-stop"></div>
						</g:each>					
				</li>
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

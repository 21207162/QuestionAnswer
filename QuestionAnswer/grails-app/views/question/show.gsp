
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
			<a href="${createLink(controller:'Question', action:'list')}" ><< Go to question list</a>
			<a style="float:right" href="${createLink(controller:'Survey', action:'list')}" >Go to survey list >></a>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="question.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${questionInstance}" field="title"/> ?</span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="question.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label">${questionInstance?.author?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
					
						<g:each in="${questionInstance.answers}" var="a">
							<g:if test="${a?.right == true}">
								<span class="property-value" aria-labelledby="answers-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link> <img src="${resource(dir: 'images/skin', file: 'icone-validee.png')}" alt="right"/></span>
							</g:if>
							<g:else>
								<span class="property-value" aria-labelledby="answers-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
							</g:else>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<div class="access_button">
						<a class="access" href="${createLink(controller:'Question', action:'edit', id:questionInstance?.id)}" >Edit</a>
						<input class="access" type="submit" onclick="return confirm('Are you sure?');" value="Delete" name="_action_delete">
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

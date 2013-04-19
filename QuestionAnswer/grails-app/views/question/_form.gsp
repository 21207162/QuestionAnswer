<%@ page import="questionanswer.Question" %>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="question.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${questionInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="question.author.label" default="Author" />
		
	</label>
	<span>${questionanswer.User.findByName(session.user)}</span>
	<g:hiddenField name="author.id" value="${questionanswer.User.findByName(session.user).id}" />
</div>


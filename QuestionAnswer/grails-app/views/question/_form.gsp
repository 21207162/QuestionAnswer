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
	<g:select id="author" name="author.id" from="${questionanswer.User.list()}" optionKey="id" value="${questionInstance?.author?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>


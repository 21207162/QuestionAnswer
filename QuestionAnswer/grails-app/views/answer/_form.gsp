<%@ page import="questionanswer.Answer" %>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="answer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<span>${questionInstance}</span>
	<g:hiddenField name="question.id" value="${questionInstance.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'answer', 'error')} ">
	<label for="answer">
		<g:message code="answer.answer.label" default="Answer" />
		
	</label>
	<g:textField name="answer" value="${answerInstance?.answer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'right', 'error')} ">
	<label for="right">
		<g:message code="answer.right.label" default="Right" />
		
	</label>
	<g:checkBox name="right" value="${answerInstance?.right}" />
</div>


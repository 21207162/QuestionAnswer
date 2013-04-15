<%@ page import="questionanswer.Survey" %>



<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'open', 'error')} ">
	<label for="open">
		<g:message code="survey.open.label" default="Open" />
		
	</label>
	<g:checkBox name="open" value="${surveyInstance?.open}" />
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="survey.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${questionanswer.Question.list()}" optionKey="id" required="" value="${surveyInstance?.question?.id}" class="many-to-one"/>
</div>


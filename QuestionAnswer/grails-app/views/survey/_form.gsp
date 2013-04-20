<%@ page import="questionanswer.Survey" %>



<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="survey.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${questionanswer.Question.list()}" optionKey="id" required="" value="${surveyInstance?.question?.id}" class="many-to-one"/>
</div>


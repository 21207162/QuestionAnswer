<%@ page import="questionanswer.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="profile.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${profileInstance?.status}"/>
</div>


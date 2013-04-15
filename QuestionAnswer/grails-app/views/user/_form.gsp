<%@ page import="questionanswer.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'forename', 'error')} required">
	<label for="forename">
		<g:message code="user.forename.label" default="Forename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="forename" required="" value="${userInstance?.forename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="user.profile.label" default="Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile" name="profile.id" from="${questionanswer.Profile.list()}" optionKey="id" required="" value="${userInstance?.profile?.id}" class="many-to-one"/>
</div>


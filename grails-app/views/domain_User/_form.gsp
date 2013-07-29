<%@ page import="cbis.Domain_User" %>



<div class="fieldcontain ${hasErrors(bean: domain_UserInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="domain_User.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${domain_UserInstance?.content}"/>
</div>


<%@ page import="cbis.Ad" %>



<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="ad.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${adInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="ad.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${adInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="ad.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${adInstance?.title}"/>
</div>


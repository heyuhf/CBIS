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

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'deadline', 'error')} required">
	<label for="deadline">
		<g:message code="ad.deadline.label" default="Deadline" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="deadline" precision="day"  value="${adInstance?.deadline}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'hasEnd', 'error')} ">
	<label for="hasEnd">
		<g:message code="ad.hasEnd.label" default="Has End" />
		
	</label>
	<g:checkBox name="hasEnd" value="${adInstance?.hasEnd}" />
</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'shop', 'error')} required">
	<label for="shop">
		<g:message code="ad.shop.label" default="Shop" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shop" name="shop.id" from="${cbis.Shop.list()}" optionKey="id" required="" value="${adInstance?.shop?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="ad.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${adInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="ad.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${cbis.User.list()}" optionKey="id" required="" value="${adInstance?.user?.id}" class="many-to-one"/>
</div>


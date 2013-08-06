<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
    <div class="index">广告管理-》添加广告</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${adInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${adInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
                                  
                                  <div class="fieldcontain ${hasErrors(bean: adInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="ad.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${adInstance?.title}"/>
</div>
                                  
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


				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="提交" />
				</fieldset>
			</g:form>
  </body>
</html>

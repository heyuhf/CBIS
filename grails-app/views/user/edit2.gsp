<%@ page import="cbis.User" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
	</head>
	<body>
		<div class="frame_account">
                  <div class="index"><g:link action="frame_account" >账号管理</g:link>-》修改密码</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
                                  
			<div class="">
                        <label for="password0">原密码</label>
                        <input type="password" name="password0" value="">
                        </div>		

<div>
	<label for="password">新密码</label>
	
        <input type="password" name="password" required="">
</div>

<div>
	<label for="password2">重复新密码</label>
	
        <input type="password" name="password2" required="">
</div>






	


				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="updatepassword" value="提交" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

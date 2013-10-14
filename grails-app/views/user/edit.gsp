<%@ page import="cbis.User" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
	</head>
	<body>
          <div class="frame_account">
                  <div class="index"><g:link class="index" action="frame_account">账号管理</g:link>-》修改联系方式</div>
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
                                  
                                <div>
                                <label for="userName">
                                <g:message code="user.userName.label" default="当前用户：" />
                                </label>&nbsp;${userInstance?.userName}
                                </div>



<div>
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div>
	<label for="phoneNumber">
		<g:message code="user.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" pattern="${userInstance.constraints.phoneNumber.matches}" required="" value="${userInstance?.phoneNumber}"/>
</div>


	


				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="提交" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

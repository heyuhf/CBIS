<%@ page import="cbis.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" maxlength="10" required="" value="${userInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="30" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phoneNumber', 'error')} required">
	<label for="phoneNumber">
		<g:message code="user.phoneNumber.label" default="Phone Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phoneNumber" pattern="${userInstance.constraints.phoneNumber.matches}" required="" value="${userInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'shops', 'error')} ">
	<label for="shops">
		<g:message code="user.shops.label" default="Shops" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.shops?}" var="s">
    <li><g:link controller="shop" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="shop" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'shop.label', default: 'Shop')])}</g:link>
</li>
</ul>

</div>


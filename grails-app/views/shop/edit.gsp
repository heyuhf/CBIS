<%@ page import="cbis.Shop" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
	</head>
	<body>
		<div id="edit-shop" class="content scaffold-edit" role="main">
                  <div class="index">店铺管理-》店铺列表-》编辑店铺</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${shopInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${shopInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${shopInstance?.id}" />
				<g:hiddenField name="version" value="${shopInstance?.version}" />
				<fieldset class="form">
					
                                  
                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'shopName', 'error')} required">
	<label for="shopName">
		<g:message code="shop.shopName.label" default="Shop Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="shopName" maxlength="20" required="" value="${shopInstance?.shopName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="shop.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" maxlength="200" required="" value="${shopInstance?.address}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="shop.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${shopInstance?.description}"/>
</div>



</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'shopLogoUrl', 'error')} ">
	<label for="shopLogoUrl">
		<g:message code="shop.shopLogoUrl.label" default="Shop Logo Url" />
		
	</label>
	<g:textField name="shopLogoUrl" value="${shopInstance?.shopLogoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'shopTags', 'error')} ">
	<label for="shopTags">
		<g:message code="shop.shopTags.label" default="Shop Tags" />
		
	</label>
	<g:select name="shopTags" from="${cbis.ShopTag.list()}" multiple="multiple" optionKey="id" size="5" value="${shopInstance?.shopTags*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="shop.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${cbis.User.list()}" optionKey="id" required="" value="${shopInstance?.user?.id}" class="many-to-one"/>
</div>
                                  
                                  
                                  
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="提交" />
					<g:actionSubmit class="delete" action="delete" value="删除" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '删除店铺将会删除店铺内所有商品，继续？')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

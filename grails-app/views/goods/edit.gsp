<%@ page import="cbis.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
	</head>
	<body>
		
		<div id="edit-goods" class="content scaffold-edit" role="main">
                  <div class="index">商品管理-》编辑商品</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${goodsInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${goodsInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${goodsInstance?.id}" />
				<g:hiddenField name="version" value="${goodsInstance?.version}" />
				<fieldset class="form">
					
                                  
                                  
                                  <div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsName', 'error')} required">
	<label for="goodsName">
		<g:message code="goods.goodsName.label" default="Goods Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="goodsName" maxlength="10" required="" value="${goodsInstance?.goodsName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="goods.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: goodsInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="goods.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${goodsInstance?.description}"/>
</div>





<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsPicUrls', 'error')} ">
	<label for="goodsPicUrls">
		<g:message code="goods.goodsPicUrls.label" default="Goods Pic Urls" />
		
	</label>
	<g:textField name="goodsPicUrls" value="${goodsInstance?.goodsPicUrls}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'shop', 'error')} required">
	<label for="shop">
		<g:message code="goods.shop.label" default="Shop" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shop" name="shop.id" from="${cbis.Shop.list()}" optionKey="id" required="" value="${goodsInstance?.shop?.id}" class="many-to-one"/>
</div>


                                  
                                  
                                  
                                  
                                  
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="提交" />
					<g:actionSubmit class="delete" action="delete" value="删除" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

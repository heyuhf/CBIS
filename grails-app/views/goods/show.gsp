
<%@ page import="cbis.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="show-goods" class="content scaffold-show" role="main">
                  <div class="index">商品展示</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul>
			
				<g:if test="${goodsInstance?.goodsName}">
				<li class="fieldcontain">
					<span id="goodsName-label" class="property-label">商品名称</span>
                                        <span class="property-value" aria-labelledby="goodsName-label"><g:fieldValue bean="${goodsInstance}" field="goodsName"/></span>
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label">商品价格</span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${goodsInstance}" field="price"/></span>
					
				</li>
				</g:if>
                                
                                 <g:if test="${goodsInstance?.goodsPicUrls}">
				<li class="fieldcontain">
					<span id="goodsPicUrls-label" class="property-label">商品图片</span>
					
						<span class="property-value" aria-labelledby="goodsPicUrls-label"><g:fieldValue bean="${goodsInstance}" field="goodsPicUrls"/></span>
					
				</li>
				</g:if>
                          
				<g:if test="${goodsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="goods.description.label" default="商品描述" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${goodsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.onsalePrice}">
				<li class="fieldcontain">
					<span id="onsalePrice-label" class="property-label"><g:message code="goods.onsalePrice.label" default="Onsale Price" /></span>
					
						<span class="property-value" aria-labelledby="onsalePrice-label"><g:fieldValue bean="${goodsInstance}" field="onsalePrice"/></span>
					
				</li>
				</g:if>
			
				
			
				
			
			
			</ul>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${goodsInstance?.id}" />
					<g:link class="edit" action="edit" id="${goodsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

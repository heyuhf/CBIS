
<%@ page import="cbis.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-goods" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-goods" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list goods">
			
				<g:if test="${goodsInstance?.goodName}">
				<li class="fieldcontain">
					<span id="goodName-label" class="property-label"><g:message code="goods.goodName.label" default="Good Name" /></span>
					
						<span class="property-value" aria-labelledby="goodName-label"><g:fieldValue bean="${goodsInstance}" field="goodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="goods.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${goodsInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="goods.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${goodsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.onsalePrice}">
				<li class="fieldcontain">
					<span id="onsalePrice-label" class="property-label"><g:message code="goods.onsalePrice.label" default="Onsale Price" /></span>
					
						<span class="property-value" aria-labelledby="onsalePrice-label"><g:fieldValue bean="${goodsInstance}" field="onsalePrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.onsale}">
				<li class="fieldcontain">
					<span id="onsale-label" class="property-label"><g:message code="goods.onsale.label" default="Onsale" /></span>
					
						<span class="property-value" aria-labelledby="onsale-label"><g:fieldValue bean="${goodsInstance}" field="onsale"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.goodPicUrls}">
				<li class="fieldcontain">
					<span id="goodPicUrls-label" class="property-label"><g:message code="goods.goodPicUrls.label" default="Good Pic Urls" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.shop}">
				<li class="fieldcontain">
					<span id="shop-label" class="property-label"><g:message code="goods.shop.label" default="Shop" /></span>
					
						<span class="property-value" aria-labelledby="shop-label"><g:link controller="shop" action="show" id="${goodsInstance?.shop?.id}">${goodsInstance?.shop?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="goods.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${goodsInstance?.user?.id}">${goodsInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
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


<%@ page import="cbis.Shop" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'shop.label', default: 'Shop')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
	</head>
	<body>
		<div class="index">
			店铺管理-》店铺查看
		</div>
		<div id="show-shop" class="content scaffold-show" role="main">
			<h1>店铺状态</h1>
			<g:if test="${flash.message}">
                          <div class="message" role="status">${flash.message}</div>
			</g:if>
                        <div class="shopLogo"><img src="../../${shopInstance?.shopLogoUrl}" height="175" width="175"/></div>
			<ul class="property-list shop">
			
				<g:if test="${shopInstance?.shopName}">
				<li class="fieldcontain">
					<span id="shopName-label" class="property-label"><g:message code="shop.shopName.label" default="店铺名" /></span>
					
						<span class="property-value" aria-labelledby="shopName-label"><g:fieldValue bean="${shopInstance}" field="shopName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="shop.address.label" default="店铺地址" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${shopInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.ads}">
				<li class="fieldcontain">
					<span id="ads-label" class="property-label">店铺广告列表：</span>
					
						<g:each in="${shopInstance.ads}" var="a">
                                                  <div><span class="property-value" aria-labelledby="ads-label"><g:link controller="ad" action="show" id="${a.id}">${a?.title}</g:link></span></div>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="shop.description.label" default="店铺介绍" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${shopInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.goods}">
				<li class="fieldcontain">
					<span id="goods-label" class="property-label"><g:message code="shop.goods.label" default="Goods" /></span>
					
						<g:each in="${shopInstance.goods}" var="g">
						<span class="property-value" aria-labelledby="goods-label"><g:link controller="goods" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${shopInstance?.shopTags}">
				<li class="fieldcontain">
					<span id="shopTags-label" class="property-label"><g:message code="shop.shopTags.label" default="店铺标签" /></span>
					
						<g:each in="${shopInstance.shopTags}" var="s">
						<span class="property-value" aria-labelledby="shopTags-label"><g:link controller="shopTag" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
                                
			
			</ul>
			
		</div>
	</body>
</html>

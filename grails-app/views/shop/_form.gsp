<%@ page import="cbis.Shop" %>



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

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'ads', 'error')} ">
	<label for="ads">
		<g:message code="shop.ads.label" default="Ads" />
		
	</label>
	<g:select name="ads" from="${cbis.Ad.list()}" multiple="multiple" optionKey="id" size="5" value="${shopInstance?.ads*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="shop.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${shopInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'goods', 'error')} ">
	<label for="goods">
		<g:message code="shop.goods.label" default="Goods" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shopInstance?.goods?}" var="g">
    <li><g:link controller="goods" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="goods" action="create" params="['shop.id': shopInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'goods.label', default: 'Goods')])}</g:link>
</li>
</ul>

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


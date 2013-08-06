<%@ page import="cbis.Goods" %>



<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodName', 'error')} required">
	<label for="goodName">
		<g:message code="goods.goodName.label" default="Good Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="goodName" maxlength="10" required="" value="${goodsInstance?.goodName}"/>
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

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'onsalePrice', 'error')} required">
	<label for="onsalePrice">
		<g:message code="goods.onsalePrice.label" default="Onsale Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="onsalePrice" value="${fieldValue(bean: goodsInstance, field: 'onsalePrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'onsale', 'error')} required">
	<label for="onsale">
		<g:message code="goods.onsale.label" default="Onsale" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="onsale" required="" value="${goodsInstance?.onsale}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsPicUrls', 'error')} ">
	<label for="goodsPicUrls">
		<g:message code="goods.goodsPicUrls.label" default="Goods Pic Urls" />
		
	</label>
	<g:textField name="goodsPicUrls" value="${goodsInstance?.goodsPicUrls}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsTags', 'error')} ">
	<label for="goodsTags">
		<g:message code="goods.goodsTags.label" default="Goods Tags" />
		
	</label>
	<g:select name="goodsTags" from="${cbis.GoodsTag.list()}" multiple="multiple" optionKey="id" size="5" value="${goodsInstance?.goodsTags*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'shop', 'error')} required">
	<label for="shop">
		<g:message code="goods.shop.label" default="Shop" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shop" name="shop.id" from="${cbis.Shop.list()}" optionKey="id" required="" value="${goodsInstance?.shop?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="goods.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${cbis.User.list()}" optionKey="id" required="" value="${goodsInstance?.user?.id}" class="many-to-one"/>
</div>


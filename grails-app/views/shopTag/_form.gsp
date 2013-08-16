<%@ page import="cbis.ShopTag" %>



<div class="fieldcontain ${hasErrors(bean: shopTagInstance, field: 'shops', 'error')} ">
	<label for="shops">
		<g:message code="shopTag.shops.label" default="Shops" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: shopTagInstance, field: 'tagName', 'error')} ">
	<label for="tagName">
		<g:message code="shopTag.tagName.label" default="Tag Name" />
		
	</label>
	<g:textField name="tagName" value="${shopTagInstance?.tagName}"/>
</div>


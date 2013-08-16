
<%@ page import="cbis.ShopTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shopTag.label', default: 'ShopTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shopTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-shopTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shopTag">
			
				<g:if test="${shopTagInstance?.shops}">
				<li class="fieldcontain">
					<span id="shops-label" class="property-label"><g:message code="shopTag.shops.label" default="Shops" /></span>
					
						<g:each in="${shopTagInstance.shops}" var="s">
						<span class="property-value" aria-labelledby="shops-label"><g:link controller="shop" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${shopTagInstance?.tagName}">
				<li class="fieldcontain">
					<span id="tagName-label" class="property-label"><g:message code="shopTag.tagName.label" default="Tag Name" /></span>
					
						<span class="property-value" aria-labelledby="tagName-label"><g:fieldValue bean="${shopTagInstance}" field="tagName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${shopTagInstance?.id}" />
					<g:link class="edit" action="edit" id="${shopTagInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

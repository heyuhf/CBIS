
<%@ page import="cbis.Ad" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
	</head>
	<body>
		
		<div id="show-ad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ad">
			
                          <g:if test="${adInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="ad.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${adInstance}" field="title"/></span>
					
				</li>
				</g:if>
                          
                          
				<g:if test="${adInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="ad.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${adInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="ad.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${adInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${adInstance?.shop}">
				<li class="fieldcontain">
					<span id="shop-label" class="property-label"><g:message code="ad.shop.label" default="Shop" /></span>
					
						<span class="property-value" aria-labelledby="shop-label"><g:link controller="shop" action="show" id="${adInstance?.shop?.id}">${adInstance?.shop?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${adInstance?.id}" />
					<g:link class="edit" action="edit" id="${adInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

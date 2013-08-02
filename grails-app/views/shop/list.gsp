
<%@ page import="cbis.Shop" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shop.label', default: 'Shop')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shop" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shop" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="shopName" title="${message(code: 'shop.shopName.label', default: 'Shop Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'shop.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'shop.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="shopLogoUrl" title="${message(code: 'shop.shopLogoUrl.label', default: 'Shop Logo Url')}" />
					
						<th><g:message code="shop.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shopInstanceList}" status="i" var="shopInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shopInstance.id}">${fieldValue(bean: shopInstance, field: "shopName")}</g:link></td>
					
						<td>${fieldValue(bean: shopInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: shopInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: shopInstance, field: "shopLogoUrl")}</td>
					
						<td>${fieldValue(bean: shopInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shopInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

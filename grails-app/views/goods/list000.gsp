
<%@ page import="cbis.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-goods" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-goods" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="goodName" title="${message(code: 'goods.goodName.label', default: 'Good Name')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'goods.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'goods.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="onsalePrice" title="${message(code: 'goods.onsalePrice.label', default: 'Onsale Price')}" />
					
						<g:sortableColumn property="onsale" title="${message(code: 'goods.onsale.label', default: 'Onsale')}" />
					
						<g:sortableColumn property="goodsPicUrls" title="${message(code: 'goods.goodsPicUrls.label', default: 'Goods Pic Urls')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${goodsInstance.id}">${fieldValue(bean: goodsInstance, field: "goodName")}</g:link></td>
					
						<td>${fieldValue(bean: goodsInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "onsalePrice")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "onsale")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "goodsPicUrls")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${goodsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

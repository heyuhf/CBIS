
<%@ page import="cbis.Ad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="content" title="${message(code: 'ad.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'ad.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="deadline" title="${message(code: 'ad.deadline.label', default: 'Deadline')}" />
					
						<g:sortableColumn property="hasEnd" title="${message(code: 'ad.hasEnd.label', default: 'Has End')}" />
					
						<th><g:message code="ad.shop.label" default="Shop" /></th>
					
						<g:sortableColumn property="title" title="${message(code: 'ad.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adInstanceList}" status="i" var="adInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "content")}</g:link></td>
					
						<td><g:formatDate date="${adInstance.date}" /></td>
					
						<td><g:formatDate date="${adInstance.deadline}" /></td>
					
						<td><g:formatBoolean boolean="${adInstance.hasEnd}" /></td>
					
						<td>${fieldValue(bean: adInstance, field: "shop")}</td>
					
						<td>${fieldValue(bean: adInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

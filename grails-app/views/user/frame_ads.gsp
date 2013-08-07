<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
    <div class="index">广告管理-》广告列表</div>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="content" title="${message(code: 'ad.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'ad.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'ad.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adInstanceList}" status="i" var="adInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="ad" action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "content")}</g:link></td>
					
						<td><g:formatDate date="${adInstance.date}" /></td>
					
						<td>${fieldValue(bean: adInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adInstanceTotal}" />
			</div>
  </body>
</html>

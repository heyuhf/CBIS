<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
    <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
  </head>
  <body>
    <div class="index">广告管理-》广告列表</div>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
                                          <g:sortableColumn property="title" title="${message(code: 'ad.title.label', default: 'Title')}" />
                                          
                                          <g:sortableColumn property="shop" title="${message(code: 'ad.content.label', default: 'shop')}" />
						<g:sortableColumn property="content" title="${message(code: 'ad.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'ad.date.label', default: 'Date')}" />
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adInstanceList}" status="i" var="adInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                          <td><g:link controller="ad" action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "title")}</g:link></td>
					<td>${fieldValue(bean: adInstance, field: "shop")}</td>
						<td>${fieldValue(bean: adInstance, field: "content")}</td>
					
						<td><g:formatDate format="yyyy-MM-dd HH:mm:ss"  date="${adInstance.date}" /></td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adInstanceTotal}" />
			</div>
  
  
    <g:form action="frame_ads" >
	<div>只看店铺<g:select id="shop" name="shopid" from="${shopInstanceList}" optionKey="id" value=""></g:select>
				
	<g:submitButton name="create" class="save" value="确定" />
	</g:form>

  </div>
  
  
  </body>
</html>

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
    <div class="index">商品管理-》商品列表</div>
      <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
      </g:if>
        <table class="tablelist">
				<thead>
					<tr>
					
						<g:sortableColumn property="goodsName" title="${message(code: 'goods.goodName.label', default: 'Goods Name')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'goods.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'goods.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="onsalePrice" title="${message(code: 'goods.onsalePrice.label', default: 'Onsale Price')}" />
					
						<g:sortableColumn property="onsale" title="${message(code: 'goods.onsale.label', default: 'Onsale')}" />
					
						<g:sortableColumn property="goodsPicUrls" title="${message(code: 'goods.goodPicUrls.label', default: 'Goods Pic Urls')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="goods" action="show" id="${goodsInstance.id}">${fieldValue(bean: goodsInstance, field: "goodsName")}</g:link></td>
					
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
  </body>
</html>

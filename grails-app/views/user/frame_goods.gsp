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
      
        <table class="tablelist">
				<thead>
					<tr>
					
						<g:sortableColumn property="goodsName" title="${message(code: 'goods.goodName.label', default: '商品名称')}" style="width:100px"/>
					
						<g:sortableColumn property="price" title="${message(code: 'goods.price.label', default: '价格')}" style="width:100px"/>
					
						<g:sortableColumn property="description" title="${message(code: 'goods.description.label', default: '所属店铺')}" style="width:100px"/>
					
						
					
						<g:sortableColumn property="onsale" title="${message(code: 'goods.onsale.label', default: '促销与否')}" />
					
						<g:sortableColumn property="goodsPicUrls" title="${message(code: 'goods.goodPicUrls.label', default: '商品图片')}" style="width:120px"/>
                                                
                                                <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="shoplist_tr">
					
                                          <td class="tablelist_td"><g:link controller="goods" action="show" id="${goodsInstance.id}">${fieldValue(bean: goodsInstance, field: "goodsName")}</g:link></td>
					
						<td class="tablelist_td">
<%if(goodsInstance.onsale=="false"){%>${fieldValue(bean: goodsInstance, field: "price")} 元/${goodsInstance.unit}<%}else if(goodsInstance.onsale=="true"){%>促${fieldValue(bean: goodsInstance, field: "onsalePrice")}元/${goodsInstance.unit}<%}else{%>${fieldValue(bean: goodsInstance, field: "price")}元/${goodsInstance.unit}<%}%>
</td>
					
						<td class="tablelist_td">${goodsInstance.shop.shopName}</td>
					
						
					
						<td class="tablelist_td">
<%if(goodsInstance.onsale=="false"){%>未促销<%}else{%>促销中<%}%></td>
					
                                                <td class="tablelist_td"><img src="../${fieldValue(bean: goodsInstance, field: "goodsPicUrls")}" height="40px"/></td>
					<td class="tablelist_td">
                                        <g:link controller="goods" action="onsale" id="${goodsInstance.id}">设置促销</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${goodsInstanceTotal}" />
			</div>
  </body>
</html>

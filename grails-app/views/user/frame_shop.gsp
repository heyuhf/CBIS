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
    
    <div class="index">店铺管理-》店铺列表</div>
    
    
    <table>
      <thead>
        <tr>
          <g:sortableColumn property="shopName" title="店铺名" style="width: 100px" />
          
          <g:sortableColumn property="address" title="${message(code: 'shop.address.label', default: '店铺地址')}" style="width: 100px" />
					
          <g:sortableColumn property="description" title="描述" style="width: 100px"/>
					
          <g:sortableColumn property="shopLogoUrl" title="图标" style="width: 100px" />
					
          <th>操作</th>
					
         </tr>
	</thead>
	<tbody>
          <g:each in="${shopInstanceList}" status="i" var="shopInstance">
            <tr class="shoplist_tr">
					
              <td style="text-align: center;"><g:link controller="shop" action="show" id="${shopInstance.id}">${fieldValue(bean: shopInstance, field: "shopName")}</g:link></td>
					
              <td style="text-align: center;">${fieldValue(bean: shopInstance, field: "address")}</td>
          
              <td style="text-align: center;">${fieldValue(bean: shopInstance, field: "description")}</td>
					
              <td style="text-align: center;"><img src="../${fieldValue(bean: shopInstance, field: "shopLogoUrl")}" height="40px" /></td>
              
              <td style="text-align: center;"><g:link controller="shop" action="edit" id="${shopInstance.id}">编辑</g:link>/<g:link controller="shop" action="deleteshop" id="${shopInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '删除店铺将会删除店铺内所有商品，继续？')}');">删除</g:link></td>
					
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
	<g:paginate total="${shopInstanceTotal}" />
      </div>
  
  
    
  </body>
</html>

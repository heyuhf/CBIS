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
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    
    <table>
      <thead>
        <tr>
          <g:sortableColumn property="shopName" title="店铺名" />
          
          <g:sortableColumn property="address" title="${message(code: 'shop.address.label', default: '店铺地址')}" />
					
          <g:sortableColumn property="description" title="描述" />
					
          <g:sortableColumn property="shopLogoUrl" title="图标" />
					
          <th>操作</th>
					
         </tr>
	</thead>
	<tbody>
          <g:each in="${shopInstanceList}" status="i" var="shopInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
              <td><g:link controller="shop" action="show" id="${shopInstance.id}">${fieldValue(bean: shopInstance, field: "shopName")}</g:link></td>
					
              <td>${fieldValue(bean: shopInstance, field: "address")}</td>
          
              <td>${fieldValue(bean: shopInstance, field: "description")}</td>
					
              <td>${fieldValue(bean: shopInstance, field: "shopLogoUrl")}</td>
              
              <td><g:link controller="shop" action="edit" id="${shopInstance.id}">编辑</g:link>/<g:link controller="shop" action="edit" id="${shopInstance.id}">删除</g:link></td>
					
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
	<g:paginate total="${shopInstanceTotal}" />
      </div>
  
  
    
  </body>
</html>

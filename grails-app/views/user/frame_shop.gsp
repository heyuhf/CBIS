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
    
    <div class="index">店铺管理-》店铺列表</div>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    
    <table>
      <thead>
        <tr>
          <g:sortableColumn property="shopName" title="店铺名" />
          
          <g:sortableColumn property="address" title="${message(code: 'shop.address.label', default: 'Address')}" />
					
          <g:sortableColumn property="description" title="描述" />
					
          <g:sortableColumn property="shopLogoUrl" title="图标" />
					
          <th>操作</th>
					
         </tr>
	</thead>
	<tbody>
          <g:each in="${shopInstanceList}" status="i" var="shopInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
              <td><g:link action="show" id="${shopInstance.id}">${fieldValue(bean: shopInstance, field: "shopName")}</g:link></td>
					
              
          
              <td>${fieldValue(bean: shopInstance, field: "description")}</td>
					
              <td>${fieldValue(bean: shopInstance, field: "shopLogoUrl")}</td>
              
              <td>编辑/删除</td>
					
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
	<g:paginate total="${shopInstanceTotal}" />
      </div>
  
  
    
  </body>
</html>

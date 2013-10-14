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
					
                                          <g:sortableColumn property="title" title="${message(code: 'ad.title.label', default: '标题')}" style="width: 100px" />
                                          
                                          <g:sortableColumn property="shop" title="${message(code: 'ad.content.label', default: '店铺')}" style="width: 100px"/>
						
					
						<g:sortableColumn property="date" title="${message(code: 'ad.date.label', default: '发布时间')}" style="width: 100px"/>
					
					<th>操作</th>	
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adInstanceList}" status="i" var="adInstance">
					<tr class="shoplist_tr">
                                          
                                          <td><g:link controller="ad" action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "title")}</g:link></td>
					<td>${fieldValue(bean: adInstance, field: "shop")}</td>
						
					
						<td><g:formatDate format="yyyy-MM-dd HH:mm:ss"  date="${adInstance.date}" /></td>
					
						<td style="text-align: center;"><g:link controller="ad" action="edit" id="${adInstance.id}">编辑</g:link>/<g:link controller="ad" action="deletead" id="${adInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '删除广告，继续？')}');">删除</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adInstanceTotal}" />
			</div>
  
  
    <g:form action="frame_ads" class="normal_form" >
	只看店铺<g:select id="shop" name="shopid" from="${shopInstanceList}" optionKey="id" value=""></g:select>
				
	<g:submitButton name="submit" class="" value="确定" />
	</g:form>

  </div>
  
  
  </body>
</html>

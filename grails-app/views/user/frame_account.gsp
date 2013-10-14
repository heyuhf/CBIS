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
    <div class="frame_account">
    <div class="index">账号管理</div>
    
			
			<ul class="">
			
				<g:if test="${userInstance?.userName}">
				<li>
					<span>用户账号</span>
					<span><g:fieldValue bean="${userInstance}" field="userName"/></span>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${userInstance?.email}">
				<li>
					<span>电子邮箱</span>
					<span><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.phoneNumber}">
				<li>
					<span>联系电话</span>
					<span><g:fieldValue bean="${userInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				
			
			</ul>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}">修改账号信息</g:link>
                                        <g:link class="edit" action="edit2" id="${userInstance?.id}">修改密码</g:link>
				</fieldset>
			</g:form>
     </div>
  </body>
</html>

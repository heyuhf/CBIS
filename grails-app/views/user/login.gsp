<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>社区商业信息服务发布平台</title>
    <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
  </head>
  <body>
    <div id="wrap">
      <div class="nav" role="navigation">
        <ul>
          <li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
          <li><a class="home" href="${createLink(uri: '/')}">注册</a></li>                      
        </ul>
      </div>
    
      <div class="content">
        <h1>登陆</h1>
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div class="login_box">
          <g:form  controller="main" action="authenticate">
            <div class="login_input">
             <label for="userName">
               <g:message code="user.userName.label" default="User Name" />
             </label>
              
             <g:textField class="textbox" name="userName" maxlength="20"  required="" value="${userInstance?.userName}"/>
            </div>
            <div class="login_input">
              <label for="password">
               <g:message code="user.password.label" default="Password" />
             </label>

             <g:textField class="textbox" name="password" maxlength="20" required="" value="${userInstance?.password}"/>
            </div>
            
            <g:submitButton name="login" class="login_button" value="登陆" />

          </g:form>
          <hr/>
          <input type="button" class="login_button" value="注册"/>
          
        </div>
        
        
        
      </div>
      
      
      <div id="bottom">
        <hr/>
        <ul>
          <li>帮助</li>
          <li>版权声明</li>
          <li>联系我们</li>
          
        </ul>
      </div>
      
    </div>
  </body>
</html>

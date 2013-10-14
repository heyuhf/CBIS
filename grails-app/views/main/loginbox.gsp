

<html>
  <head>
    <title>社区商业信息服务发布平台</title>
    <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
          
          $("#username_box").focus(function(){
              $("#username_box").val("");
              $("#username_box").css("color","black");
          });    
          
          $("#username_box").blur(function(){
              if($("#username_box").val()==""){
                $("#username_box").val("请输入用户名");
                $("#username_box").css("color","gray");
              }
              
          });  
          
          $("#password_box").focus(function(){
              $("#password_box").val("");
              $("#password_label").html("");
              $("#password_box").css("color","black");
              
          });    
          
          $("#password_box").blur(function(){
              if($("#password_box").val()==""){
                $("#password_label").html("请输入密码");
                $("#password_box").css("color","gray");
              }
              
          });
          
          
          
      
        });
        
        
    </script>
    
  </head>
  <body>
    <div id="wrap">   
          
        
        
        
        <div class="login_box">
          <g:if test="${flash.message}">
          <div>${flash.message}</div>
          </g:if>
          <g:form  controller="main" action="authenticate2">
            <div class="login_input">
             
              
             <g:textField class="textbox username" id="username_box" name="userName" maxlength="20"  required="" value="请输入用户名"/>
            </div>
            <div class="login_input">
              
              <input type="password" name="password" class="textbox password" id="password_box" maxlength="20"   value=""/>
              <label class="password_label" id="password_label" for="password_box">请输入密码</label>
            </div>
            
            <g:submitButton name="login" class="login_button" value="登陆" />

          </g:form>
          
          <input type="button" class="login_button" value="注册"/>
          
        </div>
        
      
    </div>
  </body>
</html>

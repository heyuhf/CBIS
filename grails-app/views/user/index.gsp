<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html;charset=UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>用户首页</title>
      <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
      
      <script type="text/javascript" language="javascript">
        function iFrameHeight() { 
          var ifm= document.getElementById("iframepage"); 
          var height = ifm.contentWindow.document.documentElement.scrollHeight; 
          ifm.height = height;
        } 

      </script>
  </head>
  <body>
    <div id="wrap">
      <!--   导航   -->
      <div class="nav">
        <ul>
          <li><a href="#">Home</a></li>
          
          <li><a href="#">退出登陆</a></li>
        </ul>
      </div>
      <!--   导航部分结束   -->
      
      <!--   内容部分   -->
      <div id="content">
        <h1>商家管理首页</h1>
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id="content_left">
          <div class="list_title">用户功能列表页</div>
          <div class="list_content">
            <ul>
              <li><a href="frame_index" target="content_right">首页</a></li>
              <li><a href="frame_account" target="content_right">账号管理</a></li>
              <li><span style="cursor: pointer;"><img src="/CBIS/images/add.png"/></span><a href="frame_shop" target="content_right">店铺管理</a></li>
              <li><a href="frame_shop" target="content_right">店铺列表</a></li>
              <li><a href="frame_addshop" target="content_right">添加店铺</a></li>
              <li><span style="cursor: pointer;"><img src="/CBIS/images/add.png"/></span><a href="frame_goods" target="content_right">商品管理</a></li>
              <li><a href="frame_addgoods" target="content_right">添加商品</a></li>
              <li><span style="cursor: pointer;"><img src="/CBIS/images/add.png"/></span>广告管理</li>
              <li><a href="frame_ads" target="content_right">广告列表</a></li>
              <li><a href="frame_addad" target="content_right">添加广告</a></li>
              
            </ul>
          </div>
        
        
        
        </div>
        <div id="content_right">
          <iframe id="iframepage" name="content_right" src="frame_index" width="672"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" onLoad="iFrameHeight()">
          </iframe>
        
        
        </div>
      </div>
      
      
      <div class="clear"></div>
      <div id="bottom">
        <hr/>
        <ul>
          <li>帮助 |</li>
          <li>版权声明 |</li>
          <li>联系我们</li>
          
        </ul>
      </div>
    </div>
  </body>
</html>

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
      <script type="text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
      <script type="text/javascript" language="javascript">
        function iFrameHeight() { 
          var ifm= document.getElementById("iframepage"); 
          var height = ifm.contentWindow.document.documentElement.scrollHeight; 
          ifm.height = height;
          
          $("#content").css("height",height+60);
        } 
        
        function showli(classname){
        
          
          
          if($('.'+classname).is(":hidden")){
            $('.'+classname).show();  
            $('.add_plus_'+classname).attr("src","/CBIS/images/plus.png");
          }else{
            $('.'+classname).hide();
            $('.add_plus_'+classname).attr("src","/CBIS/images/add.png");
          }
        
        }
        $(document).ready(function(){
          $('.cli').hide();
            $('.fli').attr("src","/CBIS/images/add.png");
          
        });

      </script>
  </head>
  <body>
    <div id="wrap">
      <!--   头部   -->
      <div class="top">
        <div class="top_wrap">
          <div class="logo_name">商业信息服务发布平台</div>
          <div class="top_search">
            <input name="search" type="text" class="search_box"/>
            <input type="button"  value="搜索"/>
          </div>
        </div>
      </div>
      
      
      <!--   导航   -->
      <div class="nav">
        <ul>
          <li><a href="/CBIS/user/index">Home</a></li>
          
          <li><g:link controller="main" action="logout">退出登陆</g:link></li>
        </ul>
      </div>
      <!--   导航部分结束   -->
      
      <!--   内容部分   -->
      <div class="content" id="content">
        <div class="content_top"></div>
        
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id="content_left">
          <div class="content_top_title"></div>
          
          <div class="list_content">
            <ul>
              <li class="li_first"><a href="frame_account" target="content_right" onclick="showli('account_li')">账号管理</a><span  style="cursor: pointer;" onclick="showli('account_li')"><img class="add_plus_account_li fli" src="/CBIS/images/plus.png"/></span></li>
              <li class="account_li cli"><a href="edit" target="content_right">修改账号信息</a></li>
              <li class="account_li cli"><a href="edit2" target="content_right">修改密码</a></li>
              <li class="li_first"><a href="frame_shop" target="content_right" onclick="showli('shop_li')">店铺管理</a><span style="cursor: pointer;" onclick="showli('shop_li')"><img class="add_plus_shop_li fli" src="/CBIS/images/plus.png"/></span></li>
              <li class="shop_li cli"><a href="frame_shop" target="content_right">店铺列表</a></li>
              <li class="shop_li cli"><a href="frame_addshop" target="content_right">添加店铺</a></li>
              <li><a href="frame_goods" target="content_right" onclick="showli('goods_li')">商品管理</a><span style="cursor: pointer;" onclick="showli('goods_li')"><img class="add_plus_goods_li fli"  src="/CBIS/images/plus.png"/></span></li>
              <li class="goods_li cli"><a href="frame_goods" target="content_right">商品列表</a></li>
              <li class="goods_li cli"><a href="frame_addgoods" target="content_right">添加商品</a></li>
              <li class="li_first"><span style="cursor: pointer;" onclick="showli('ad_li')">广告管理</span><span style="cursor: pointer;" onclick="showli('ad_li')"><img class="add_plus_ad_li fli" src="/CBIS/images/plus.png"/></span></li>
              <li  class="ad_li cli"><a href="frame_ads" target="content_right">广告列表</a></li>
              <li  class="ad_li cli"><a href="frame_addad" target="content_right">添加广告</a></li>
              
            </ul>
          </div>
        
        
        
        </div>
        <div id="content_right">
          <iframe id="iframepage" name="content_right" src="frame_index" width="672"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" onLoad="iFrameHeight()">
          </iframe>
        
        
        </div>
      </div>
      
      
      <div class="clear"></div>
      <div style="clear:both;"></div>
      <div class="bottom">
        
        <ul>
          <li>帮助 |</li>
          <li>版权声明 |</li>
          <li>联系我们</li>
          
        </ul>
      </div>
    </div>
  </body>
</html>

<%@ page import="cbis.Shop" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
    <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
    <script type="text/javascript"  src="../js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        //alert("ss");
      });
      function uploadShopLogo(){
        //alert($("#localShopLogo").val());
      }

      
    </script>
    
    
  </head>
  <body>
    <div class="frame_addshop">
    <div class="index">店铺管理-》添加店铺</div>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:form controller="shop" action="save" enctype="multipart/form-data">
      <fieldset>
      <div class="">
        <label for="shopName">店铺名</label>
        <g:textField name="shopName" maxlength="20" required="" value=""/>
      </div>
      <div class="">
        <label for="shopLogo">店铺图片</label>
        <div id="divShopLogo"><img id="imgShopLogo" src="../images/shopLogo.jpg" height="175" width="175"/></div>
        <div class="shopLogoButton"><input id="localShopLogo" type="file" name="shopLogo" onchange="uploadShopLogo()"/></div>
      </div>
      <div class="">
        <label for="address">店铺地址</label>
        <g:textField name="address" maxlength="20" required="" value=""/>
      </div>
        
      <div class="">
        <label for="shoptags">店铺标签</label>
        <g:textField name="shoptags" maxlength="20" required="" value=""/>
      </div>
        
      <div class="">
        <label for="description">店铺描述</label>
        <g:textField name="description" maxlength="20" value=""/>
      </div>
      </fieldset>
      <fieldset>
      <g:submitButton name="create" class="save" value="提交" />
      </fieldset>
    </g:form>
  
  
  
  
    </div>
  </body>
</html>

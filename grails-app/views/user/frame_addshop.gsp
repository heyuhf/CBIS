<%@ page import="cbis.Shop" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
    <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
    <ckeditor:resources/>
    <script type="text/javascript"  src="../js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
       $(document).ready(function(){
                    $(".tagsInputbox").focus(function(){
                      $(".tagsInputbox").val("");
                      $(".tagsInputbox").css("color","black");
                    });
                  });
{}
    </script>
    
    
  </head>
  <body>
    <div class="frame_addshop" style="height: 850px;">
    <div class="index">店铺管理-》添加店铺</div>
    
    
    <g:form controller="shop" action="save" enctype="multipart/form-data">
      <fieldset>
      <div class="addshop">
        <label for="shopName">店铺名</label>
        <g:textField name="shopName" maxlength="20" required="" value=""/>
      </div>
      <div class="addshop">
        <label for="shopLogo">店铺Logo</label>
        <input id="localShopLogo" type="file" name="shopLogo"/>
      </div>
      <div class="addshop">
        <label for="address">店铺地址</label>
        <g:textField name="address" maxlength="20" required="" value=""/>
      </div>
        
      <div class="addshop">
        <label for="shoptags">店铺标签</label>
        
        <input name="shoptags" type="text" class="tagsInputbox" style="width: 250px;color: gray;" value="多个标签请用中文或者英文逗号分隔" />
      </div>
        
      <div class="addshop">
        <label for="description">店铺描述</label>
        
        <ckeditor:editor name="description" height="300px" width="100%">
        </ckeditor:editor>
      </div>
      </fieldset>
      <fieldset>
      <g:submitButton name="create" class="save" value="提交" />
      </fieldset>
    </g:form>
    
  
  
  
    </div>
  </body>
</html>

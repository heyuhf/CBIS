
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
                
                <script type="text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
      <script type="text/javascript" language="javascript">
function addShopTags(){
                    
                    $("#addShopTagsDiv").html("<input type=\"text\"  id=\"inputdata\" name=\"addShopTagsInput\"/>");
                    $("#buttonAdd").html("<input type=\"button\" name=\"submitAdd\" value=\"确定\" onClick=\"ajaxAdd()\"/>");
                  }
                
                function ajaxAdd(){
                  
                 var stringdata=$("#inputdata").val();
                
                  htmlobj=$.ajax({
                    type:"post",
                    url:"/CBIS/ajax/test",
                    data:"name="+stringdata+"&shopid=${shopInstance.id}",
                    dataType:"text",
                    success:function(msg){
                      $("<span>"+msg+"</span>").insertBefore("#addShopTagsDiv");
                    }
                  });
                   
                }
                
                function deltag(tagid,tagnum,shopid){
                    //$("#tag_"+tagnum).remove();
                    $.post("/CBIS/Ajax/delshoptag",
                      {
                        tagid:tagid,
                        shopid:shopid
                      },
                      function(msg){
                        $("#tag_"+tagnum).remove();
                      }).error(function(){alert("error");});
                }
                
                


      </script>
                
	</head>
	<body>
		<div>
                  <div class="index">店铺管理-》店铺列表-》编辑店铺</div>
			
			<g:hasErrors bean="${shopInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${shopInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post"  enctype="multipart/form-data">
                          
                          
                          
				<g:hiddenField name="id" value="${shopInstance?.id}" />
				<g:hiddenField name="version" value="${shopInstance?.version}" />
				<fieldset>
					
                                  
                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'shopName', 'error')} required">
	<label for="shopName">店铺名</label>
	<g:textField name="shopName" maxlength="20" required="" value="${shopInstance?.shopName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'address', 'error')} required">
	<label for="address">地址</label>
	<g:textField name="address" maxlength="200" required="" value="${shopInstance?.address}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="shop.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${shopInstance?.description}"/>
</div>



</div>

<div>
	<label for="shopLogo">店铺Logo图片</label>
        <input id="shopLogo" type="file" name="shopLogo"/>
</div>


          <div class="">
            <span>店铺标签</span>
            <g:each in="${shopInstance.shopTags}" var="s" status="i">
                                                  
                                                  <span id="tag_${i}">${s?.tagName}<a href="javascript:void(0)" class="tagclose" onclick="deltag(${s?.id},${i},${shopInstance.id})" id="tagclose_${i}">&nbsp;&nbsp;</a>,</span>
						</g:each>
                                        <span id="addShopTagsDiv"></span>
                                        <span id="buttonAdd">
                                          <input type="button" onclick="addShopTags()" value="添加"/></span>	
            
          </div>
                                  
                                  
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="提交" />
					<g:actionSubmit class="delete" action="delete" value="删除" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '删除店铺将会删除店铺内所有商品，继续？')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="cbis.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
                <script type="text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
                <script type="text/javascript">
                  function addGoodsTags(){
                    $("#addGoodsTagsDiv").html("<input type=\"text\"  id=\"inputdata\" name=\"addGoodsTagsInput\"/>");
                    $("#buttonAdd").html("<input type=\"button\" name=\"submitAdd\" value=\"确定\" onClick=\"ajaxAdd()\"/>");
                  }
                  
                 function ajaxAdd(){
                  
                  var stringdata=$("#inputdata").val();
                
                  htmlobj=$.ajax({
                    type:"post",
                    url:"/CBIS/ajax/addgoodstags",
                    data:"name="+stringdata+"&goodsid=${goodsInstance.id}",
                    dataType:"text",
                    success:function(msg){
                      
                      var obj = JSON.parse(msg);
                      var i=0;
                      for(i=0;i<obj.tags.length;i++){
                        $("<span id=\"tag_"+obj.tags[i].tagid+"\">"+obj.tags[i].tagName+"<a href=\"javascript:void(0)\" class=\"tagclose\" onclick=\"deltag("+obj.tags[i].tagid+","+obj.tags[i].tagid+","+${goodsInstance.id}+")\">&nbsp;&nbsp;</a>，</span>").insertBefore("#addGoodsTagsDiv");
                        
                      }
                      $("input[name='addGoodsTagsInput']").val("");
                      
                      
                      
                    }
                  });
                   
                }
                
                function deltag(tagid,tagnum,goodsid){
                    //$("#tag_"+tagnum).remove();
                    $.post("/CBIS/Ajax/delgoodstag",
                      {
                        tagid:tagid,
                        goodsid:goodsid
                      },
                      function(msg){
                        $("#tag_"+tagnum).remove();
                      }).error(function(){alert("error");});
                }
                  
                </script>
	</head>
	<body>
		
          <div class="frame_account">
                  <div class="index">商品管理-》商品信息</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul>
			
				<g:if test="${goodsInstance?.goodsName}">
				<li class="fieldcontain">
					<span id="goodsName-label" class="property-label">商品名称</span>
                                        <span class="property-value" aria-labelledby="goodsName-label"><g:fieldValue bean="${goodsInstance}" field="goodsName"/></span>
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label">商品价格</span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${goodsInstance}" field="price"/></span>
					
				</li>
				</g:if>
                                
                                 <g:if test="${goodsInstance?.goodsPicUrls}">
				<li class="fieldcontain">
					<span id="goodsPicUrls-label" class="property-label">商品图片</span>
                                        
						
                                                
				</li>
                                <img src="../../${goodsInstance.goodsPicUrls}" height="400px" width="500px"/>
				</g:if>
                                
                               
				<li class="fieldcontain">
					<span id="" class="">商品标签</span>
					
						<g:each in="${goodsInstance.goodsTags}" var="s" status="i">
                                                  
                                                  <span id="tag_${i}" class="">${s?.tagName}<a href="javascript:void(0)" class="tagclose" onclick="deltag(${s?.id},${i},${goodsInstance.id})" id="tagclose_${i}">&nbsp;&nbsp;</a>,</span>
						</g:each>
                                        <span id="addGoodsTagsDiv"></span>
                                        <span id="buttonAdd"><a href="#" onclick="addGoodsTags()">添加</a></span>
                                        
					
				</li>
				
                          
                          
				<g:if test="${goodsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="goods.description.label" default="商品描述" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${goodsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				
                               
			<li class="fieldcontain">
					<span id="onsalePrice-label" class="property-label"><g:message code="goods.onsalePrice.label" default="促销状态" /></span>
					
						<span class="property-value" aria-labelledby="onsalePrice-label">
                                                  <%if(goodsInstance.onsale=="false"){%>未促销<%}else{%>促销中<%}%>
                                                 </span>
					
				</li>
				
			
				<li class="fieldcontain">
					<span id="onsalePrice-label" class="property-label"><g:message code="goods.onsalePrice.label" default="促销方式" /></span>
					
						<span class="property-value" aria-labelledby="onsalePrice-label">
                                                  <%if(goodsInstance.onsale=="true"){%>促销价:<g:fieldValue bean="${goodsInstance}" field="onsalePrice"/><%}else if(goodsInstance.onsale!="false"){%>${goodsInstance.onsale}<%}%>
                                                  </span>
					
				</li>
			
			
			</ul>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${goodsInstance?.id}" />
					<g:link class="edit" action="edit" id="${goodsInstance?.id}">编辑</g:link>
					<g:actionSubmit class="delete" action="delete" value="删除" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
                   <div style="height: 50px;"></div>
		</div>
	</body>
</html>

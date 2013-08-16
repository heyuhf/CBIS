
<%@ page import="cbis.Shop" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'shop.label', default: 'Shop')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
               <script type="text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
                <script type="text/javascript">
                  
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
                
                </script>
                
	</head>
	<body>
		<div class="index">
			店铺管理-》<g:link controller="user" action="frame_shop">店铺列表</g:link>-》${shopInstance.shopName}
		</div>
		<div id="show-shop" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
                          <div class="message" role="status">${flash.message}</div>
			</g:if>
                        <div class="shopLogo"><img src="../../${shopInstance?.shopLogoUrl}" height="175" width="175"/></div>
			<ul class="property-list shop">
			
				<g:if test="${shopInstance?.shopName}">
				<li class="fieldcontain">
					<span id="shopName-label" class="property-label"><g:message code="shop.shopName.label" default="店铺名" /></span>
					
						<span class="property-value" aria-labelledby="shopName-label"><g:fieldValue bean="${shopInstance}" field="shopName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="shop.address.label" default="店铺地址" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${shopInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.ads}">
				<li class="fieldcontain">
					<span id="ads-label" class="property-label">店铺广告列表：</span>
					
						<g:each in="${shopInstance.ads}" var="a">
                                                  <div><span class="property-value" aria-labelledby="ads-label"><g:link controller="ad" action="show" id="${a.id}">${a?.title}</g:link></span></div>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="shop.description.label" default="店铺介绍" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${shopInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.goods}">
				<li class="fieldcontain">
					<span id="goods-label" class="property-label"><g:message code="shop.goods.label" default="Goods" /></span>
					
						<g:each in="${shopInstance.goods}" var="g">
						<span class="property-value" aria-labelledby="goods-label"><g:link controller="goods" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${shopInstance?.shopTags}">
				<li class="fieldcontain">
					<span id="shopTags-label" class="property-label"><g:message code="shop.shopTags.label" default="店铺标签" /></span>
					
						<g:each in="${shopInstance.shopTags}" var="s" status="i">
                                                  
                                                  <span class="">${s?.tagName},</span>
						</g:each>
                                        <span id="addShopTagsDiv"></span>
                                        <span id="buttonAdd">
                                          <input type="button" onclick="addShopTags()" value="添加"/></span>
                                        
                                        
                                        
                                        
                                        
                                        
					
				</li>
				</g:if>
                                
			
			</ul>
			
		</div>
	</body>
</html>

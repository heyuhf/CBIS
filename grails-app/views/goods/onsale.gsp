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
    <div class="index">商品管理-》商品打折</div>
    <h1>打折设置</h1>
    
    <ul>
			
				<g:if test="${goodsInstance?.goodsName}">
				<li class="fieldcontain">
					<span id="goodsName-label" class="property-label">商品名称</span>
                                        <span class="property-value" aria-labelledby="goodsName-label"><g:fieldValue bean="${goodsInstance}" field="goodsName"/></span>
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label">商品原价</span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${goodsInstance}" field="price"/></span>
					
				</li>
				</g:if>
                                
                                 <g:if test="${goodsInstance?.goodsPicUrls}">
				<li class="fieldcontain">
					<span id="goodsPicUrls-label" class="property-label">商品图片</span>
                                        
						
                                                
				</li>
                                <img src="../../${goodsInstance.goodsPicUrls}" height="400px" width="500px"/>
				</g:if>
                                
                               
				
				
                          
                          
				<g:if test="${goodsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="goods.description.label" default="商品描述" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${goodsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:form controller="goods" action="count">
				<li class="fieldcontain">
                                  <g:hiddenField name="id" value="${goodsInstance?.id}" />
					<span id="onsalePrice-label" class="property-label"><g:message code="goods.onsalePrice.label" default="促销价格" /></span>
                                        <g:field name="onsalePrice" value="${fieldValue(bean: goodsInstance, field: 'onsalePrice')}" required=""/>
                                        <g:submitButton name="create" class="save" value="确定" />
                                        
						
					
				</li>
				</g:form>
                                <g:form controller="goods" action="count">
				<li class="fieldcontain">
                                  <g:hiddenField name="id" value="${goodsInstance?.id}" />
					<span id="onsalePrice-label" class="property-label"><g:message code="goods.onsalePrice.label" default="其他促销方式促销" /></span>
                                        <%if(goodsInstance.onsale=="true"||goodsInstance.onsale=="false"){%><g:field name="onsaleOp" value="请输入促销方式，如“买一送一”" required=""/><%}else{%>
                                        <g:field name="onsaleOp" value="${fieldValue(bean: goodsInstance, field: 'onsale')}" required=""/><%}%>
                                        <g:submitButton name="create" class="save" value="确定" />
                                        
						
					
				</li>
				</g:form>
                               
			
				
			
				
			
			
			</ul>
    </div>
  </body>
</html>

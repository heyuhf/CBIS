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
    <div class="index">商品管理-》添加商品</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${goodsInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${goodsInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="goods" action="save"  enctype="multipart/form-data">
                          <fieldset class="form">
                            <div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsName', 'error')} required">
                              <label for="goodsName">
                              <g:message code="goods.goodsName.label" default="商品名称" />
                              </label>
                              <g:textField name="goodsName" maxlength="20" required="" value="${goodsInstance?.goodsName}"/>
                            </div>

                            <div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'price', 'error')} required">
                              <label for="price">
                                <g:message code="goods.price.label" default="价格" />
                              </label>
                              <g:field name="price" value="${fieldValue(bean: goodsInstance, field: 'price')}" required=""/>
                            </div>

                            <div class="">
                              <label for="unit">
                                <g:message code="goods.unit.label" default="单位" />
                              </label>
                              <g:select name="unit" from="${unitlist}" required="" value="${goodsInstance?.shop?.id}" class="many-to-one"/>
                            </div>
                            
                                  
                            <div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodPicUrls', 'error')} required">
                            <label for="goodsPicUrls">
                              <g:message code="goods.goodsPicUrls.label" default="商品图片" />
                            </label>
                            <input type="file" name="goodsPic"/>
                            </div>
                            
                            <div class="">
                              <label for="goodsTags">标签</label>
                              <input name="goodsTags" type="text" />
                            </div>
                                  
<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="goods.description.label" default="商品描述" />
		
	</label>
	<g:textField name="description" value="${goodsInstance?.description}"/>
</div>












				</fieldset>
                          
                          <fieldset>
                            <div >将商品添加到以下店铺</div>
                            <g:each in="${shopInstanceList}" status="i" var="shopInstance">
                              <div><label>${shopInstance.shopName}</label>
                                <input type="checkbox" name="shopsCheck" value="${shopInstance.id}">
                              </div>
                            </g:each>
                            
                            
                          </fieldset>
                          
                          
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="提交" />
				</fieldset>
			</g:form>
  </body>
</html>

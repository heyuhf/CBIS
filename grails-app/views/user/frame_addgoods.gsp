<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    
    <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
    <ckeditor:resources/>
    
    <script type="text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
                <script type="text/javascript">
                  $(document).ready(function(){
                    $("#goodsTagsInputbox").focus(function(){
                      $("#goodsTagsInputbox").val("");
                      $("#goodsTagsInputbox").css("color","black");
                    });
                  });

                </script>
    
  </head>
  <body><div class="frame_addgoods">
    <div class="index">商品管理-》添加商品</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${goodsInstance}">
			<ul>
				<g:eachError bean="${goodsInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="goods" action="save"  enctype="multipart/form-data">
                          <fieldset class="form">
                            <div class="addshop">
                              <label for="goodsName" class="addgoodslabel">
                              <g:message code="goods.goodsName.label" default="商品名称" />
                              </label>
                              <g:textField name="goodsName" maxlength="20" required="" value="${goodsInstance?.goodsName}"/>
                            </div>

                            <div class="addshop">
                              <label for="price"  class="addgoodslabel">
                                <g:message code="goods.price.label" default="价格" />
                              </label>
                              <g:field name="price" value="${fieldValue(bean: goodsInstance, field: 'price')}" required=""/>
                            </div>

                            <div class="addshop">
                              <label for="unit" class="addgoodslabel">
                                <g:message code="goods.unit.label" default="单位" />
                              </label>
                              元每<g:select name="unit" from="${unitlist}" required="" value="${goodsInstance?.shop?.id}" class="many-to-one"/>
                            </div>
                            
                                  
                            <div class="addshop">
                            <label for="goodsPicUrls" class="addgoodslabel">
                              <g:message code="goods.goodsPicUrls.label" default="商品图片" />
                            </label>
                            <input type="file" name="goodsPic"/>
                            </div>
                            
                            <div class="addshop">
                              <label for="goodsTags" class="addgoodslabel">标签</label>
                              <input name="goodsTags" type="text" id="goodsTagsInputbox" style="width: 250px;color: gray;" value="多个标签请用中文或者英文逗号分隔" />
                            </div>
                                  
<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'description', 'error')} ">
	<label for="description" class="addgoodslabel">
		<g:message code="goods.description.label" default="商品描述" />
		
	</label>
	
        <ckeditor:editor name="description" height="300px" width="100%">
        </ckeditor:editor>
        
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
    <div style="height:470px;"></div>
    </div>
  </body>
</html>

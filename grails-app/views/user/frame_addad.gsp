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
    <ckeditor:resources/>

    <script type="text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
    <script type="text/javascript" language="javascript">
      $(document).ready(function(){
        $("#limit_unit").change(function(){
          
          if($("#limit_unit").val()==5)
            {$("#limit_num").hide();}
          else{
            $("#limit_num").show();
          }
       });
      });

       
    </script>
  </head>
  <body>
    <div class="addad">
    <div class="index">广告管理-》添加广告</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${adInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${adInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="ad" action="save" >
				<fieldset class="form">
                                  
                                  <div class="fieldcontain ${hasErrors(bean: adInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="ad.title.label" default="标题" />
	</label>
	<g:textField name="title" value="${adInstance?.title}"/>
        </div>
                                  
        <div class="">
                                  <label for="limit">广告有效时间</label>
                                  <select name="limit_num" id="limit_num">
                                    <option value ="1">1</option>
                                    <option value ="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                  </select>
                                  <select name="limit_unit" id="limit_unit">
                                    <option value ="1">天</option>
                                    <option value ="2">星期</option>
                                    <option value="3">月</option>
                                    <option value="4">年</option>
                                    <option value="5">长期有效</option>
                                  </select>

                                  
                                </div>   
                                  
                                  
                                  
                                  
                                  <div class="fieldcontain ${hasErrors(bean: adInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="ad.content.label" default="内容" />
		
	</label>
	
        <ckeditor:editor name="content" height="300px" width="100%">
        </ckeditor:editor>
                                    
</div>



<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'shop', 'error')} required">
	<label for="shop">
		<g:message code="ad.shop.label" default="所属店铺" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shop" name="shop.id" from="${cbis.Shop.list()}" optionKey="id" required="" value="${adInstance?.shop?.id}" class="many-to-one"/>
</div>




				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="提交" />
				</fieldset>
                          <div  style="height:450px;"></div>
			</g:form>
    </div>
  </body>
</html>

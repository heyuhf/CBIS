<%@ page import="cbis.Ad" %>
<!DOCTYPE html>
<html>
	<head>
		
		<g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		
		
		<div>
			<g:hasErrors bean="${adInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${adInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${adInstance?.id}" />
				<g:hiddenField name="version" value="${adInstance?.version}" />
				<fieldset class="form">
					
                                  <div class="fieldcontain ${hasErrors(bean: adInstance, field: 'title', 'error')} ">
                                  <label for="title">广告标题</label>
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
		<g:message code="ad.content.label" default="Content" />
		
	</label>
	
        <ckeditor:editor name="content" height="300px" width="100%">${adInstance?.content}
        </ckeditor:editor>
</div>

                                  
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: '提交')}" />
					
				</fieldset>
                                 <div  style="height:470px;"></div>
			</g:form>
		</div>
	</body>
</html>

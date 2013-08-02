<%@ page import="cbis.Shop" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shop.label', default: 'Shop')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
                <script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
                <script type="text/javascript">
                  $(document).ready(function(){
                    
                  });
                  
                  function uploadLogo(){
                    alert($("#uploadlogo").val());
                    $("#picLogo").html("<img src="+$("#uploadlogo").val()+">");
                  }
                  
                </script>
                
	</head>
	<body>
		<a href="#create-shop" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-shop" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${shopInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${shopInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
				
                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'shopName', 'error')} required">
                                  <label for="shopName">
                                  <g:message code="shop.shopName.label" default="Shop Name" />
                                  <span class="required-indicator">*</span>
                                  </label>
                                  <g:textField name="shopName" maxlength="20" required="" value="${shopInstance?.shopName}"/>
                                  </div>

                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'address', 'error')} required">
                                  <label for="address">
                                  <g:message code="shop.address.label" default="Address" />
                                  <span class="required-indicator">*</span>
                                  </label>
                                  <g:textField name="address" maxlength="200" required="" value="${shopInstance?.address}"/>
                                  </div>

                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'ads', 'error')} ">
                                  <label for="ads">
                                  <g:message code="shop.ads.label" default="Ads" />
		
                                  </label>
                                  <g:select name="ads" from="${cbis.Ad.list()}" multiple="multiple" optionKey="id" size="5" value="${shopInstance?.ads*.id}" class="many-to-many"/>
                                  </div>

                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'description', 'error')} ">
                                  <label for="description">
                                  <g:message code="shop.description.label" default="Description" />
		
                                  </label>
                                  <g:textField name="description" value="${shopInstance?.description}"/>
                                  </div>

                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'goods', 'error')} ">
                                  <label for="goods">
                                  <g:message code="shop.goods.label" default="Goods" />
		
                                  </label>
	
                                  <ul class="one-to-many">
                                  <g:each in="${shopInstance?.goods?}" var="g">
                                  <li><g:link controller="goods" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                                  </g:each>
                                  <li class="add">
                                  <g:link controller="goods" action="create" params="['shop.id': shopInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'goods.label', default: 'Goods')])}</g:link>
                                  </li>
                                  </ul>

                                  </div>

                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'shopLogoUrl', 'error')} ">
                                  <label for="shopLogoUrl">
                                  <g:message code="shop.shopLogoUrl.label" default="Shop Logo Url" />
		
                                  </label>
                                  <g:textField name="shopLogoUrl" value="${shopInstance?.shopLogoUrl}"/>
                                  </div>

                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'shopTags', 'error')} ">
                                  <label for="shopTags">
                                  <g:message code="shop.shopTags.label" default="Shop Tags" />
		
                                  </label>
                                  <g:select name="shopTags" from="${cbis.ShopTag.list()}" multiple="multiple" optionKey="id" size="5" value="${shopInstance?.shopTags*.id}" class="many-to-many"/>
                                  </div>

                                  <div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'user', 'error')} required">
                                  <label for="user">
                                  <g:message code="shop.user.label" default="User" />
                                  <span class="required-indicator">*</span>
                                  </label>
                                  <g:select id="user" name="user.id" from="${cbis.User.list()}" optionKey="id" required="" value="${shopInstance?.user?.id}" class="many-to-one"/>
                                  </div>
                                  
                                  
                                  <div id="picLogo">
                                    
                                  </div>
                                  <div>
                                    <input type="file" id="uploadlogo" name="uploadlogo" onchange="uploadLogo()"/>
                                  </div>
                                  
                                  
                                  
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

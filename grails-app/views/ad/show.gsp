
<%@ page import="cbis.Ad" %>
<!DOCTYPE html>
<html>
	<head>
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <link rel="stylesheet" href="/CBIS/css/style.css" type="text/css">
	</head>
	<body>
		
		<div class="frame_account">
			<ul>
			
                          <g:if test="${adInstance?.title}">
				<li class="fieldcontain">
					<span>标题</span><span><g:fieldValue bean="${adInstance}" field="title"/></span>
				</li>
				</g:if>
                          
                          <g:if test="${adInstance?.date}">
				<li class="fieldcontain">
					<span>发布时间</span><span class="property-value" aria-labelledby="date-label"><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${adInstance?.date}" /></span>
					
				</li>
				</g:if>
                          
				<g:if test="${adInstance?.content}">
				<li class="fieldcontain">
					<div>广告内容</div>
                                        <div>${adInstance?.content}</span>
                                        </div>
				</li>
				</g:if>
			
				
                          
                                <g:if test="${adInstance?.deadline}">
				<li class="fieldcontain">
					<span>失效时间</span><span class="property-value" aria-labelledby="date-label"><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${adInstance?.deadline}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${adInstance?.shop}">
				<li class="fieldcontain">
					<span>所属店铺</span><span class="property-value" aria-labelledby="shop-label"><g:link controller="shop" action="show" id="${adInstance?.shop?.id}">${adInstance?.shop?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				
			
			</ul>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${adInstance?.id}" />
					<g:link class="edit" controller="ad" action="edit" id="${adInstance?.id}">编辑</g:link>
					
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

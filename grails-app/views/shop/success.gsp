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
    <div class="index">
			店铺管理-》<g:link controller="user" action="frame_addshop">添加店铺</g:link>-》${flash?.shopname}
		</div>
    <h1>添加成功！</h1>
    <div ><g:link action="show" id="${shopInstance.id}">查看店铺</g:link></div>
    <div ><g:link controller="user" action="frame_addshop">继续添加店铺</g:link></div>
  </body>
</html>

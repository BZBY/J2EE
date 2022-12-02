<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="scheme" value="${pageContext.request.scheme}" />
<c:set var="serverName" value="${pageContext.request.serverName}" />
<c:set var="serverPort" value="${pageContext.request.serverPort}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="basePath" value="${scheme}://${serverName}:${serverPort}${contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${basePath}/css/list.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/buttons.css" />
<meta charset="UTF-8">
<title>个人信息</title>

</head>
<body>
<div style="display: flex;  justify-content: center; align-items: center;" class="box1">
		<div id="form-div" style="width: 40%;">
			<form method="post" action="${basePath}/lesson/updateUserInfo">
				<h2 style="text-align: center;">个人信息</h2>
				<label for="loginname" >登录名称</label> 
				 <input type="text" name="loginname" value="${user.loginname}" readonly="readonly" />
				  
				<label for="username">用户昵称</label> 
				<input type="text" name="username" value="${user.username}"/>
				
				<label for="password">登录密码</label> 
				<input type="password"  name="password"/>
				
				<label for="repw">登录密码</label> 
				<input type="password"  name="comfirmPassword"/>
				
				<label for="phone">联系方式</label> 
				 <input type="text" value="${user.phone}" name="phone"/>

				<c:set var="existLoginname" value="${existLoginname}" />
				<c:if test="${existLoginname != null}">
					<p style="color: black;">${existLoginname}
					<p>
				</c:if>

				<c:set var="emptyLoginname" value="${emptyLoginname}" />
				<c:if test="${emptyLoginname != null}">
					<p style="color: black;">${emptyLoginname}
					<p>
				</c:if>

				<c:set var="emptyUsername" value="${emptyUsername}" />
				<c:if test="${emptyUsername != null}">
					<p style="color: black;">${emptyUsername}
					<p>
				</c:if>

				<c:set var="passwordError" value="${passwordError}" />
				<c:if test="${passwordError != null}">
					<p style="color: black;">${passwordError}
					<p>
				</c:if>

				<c:set var="emptyPhone" value="${emptyPhone}" />
				<c:if test="${emptyPhone != null}">
					<p style="color: black;">${emptyPhone}
					<p>
				</c:if>

				<div style="display: flex;  justify-content: center; align-items: center;">
					<div>
						<input type="submit" value="修改">
					</div>
				</div>
				</form>
		</div>
		<br>
        
</div>
	 <span class="message">反馈信息</span>
    <span class="message_${result.code}">${result.msg}</span>
		   
</body>

</html>
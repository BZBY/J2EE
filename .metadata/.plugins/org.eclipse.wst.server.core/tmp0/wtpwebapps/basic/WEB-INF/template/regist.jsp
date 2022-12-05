<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="scheme" value="${pageContext.request.scheme}" />
<c:set var="serverName" value="${pageContext.request.serverName}" />
<c:set var="serverPort" value="${pageContext.request.serverPort}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="basePath" value="${scheme}://${serverName}:${serverPort}${contextPath}" />
<c:set var="basePath" value="${scheme}://${serverName}:${serverPort}${contextPath}" />
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + 
                                      request.getServerName() + ":" +
                                      request.getServerPort() + path;
%>   

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册</title>
    <!-- 引入外部CSS文件 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/regist.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
</head>

<body>
    <form class="login-form" action="${basePath}/lesson/regist" method="POST">
        <h1>用户登录</h1>
        <h4>登录名称：<input type="text" name="loginname" value="${userView.loginname}"></h4>
       <h4>用户名称： <input type="text" name="username" value="${userView.username}"></h4>
        <h4>登录密码：<input type="password" name="password"></h4>
        <h4>密码确认：<input type="password" name="comfirmPassword"></h4>
       <h4> 联系方式：<input type="text" name="phone" value="${userView.phone}"></h4>

		<c:set var="existLoginname" value="${existLoginname}"/>
		<c:if test="${existLoginname != null}">
	       <p style="color: white;">${existLoginname}<p>
	    </c:if>

		<c:set var="emptyLoginname" value="${emptyLoginname}"/>
		<c:if test="${emptyLoginname != null}">
	       <p style="color: white;">${emptyLoginname}<p>
	    </c:if>
	    
	    <c:set var="emptyUsername" value="${emptyUsername}"/>
		<c:if test="${emptyUsername != null}">
	       <p style="color: white;">${emptyUsername}<p>
	    </c:if>
	    
	    <c:set var="passwordError" value="${passwordError}"/>
		<c:if test="${passwordError != null}">
	       <p style="color: white;">${passwordError}<p>
	    </c:if>
	    
	    <c:set var="emptyPhone" value="${emptyPhone}"/>
		<c:if test="${emptyPhone != null}">
	       <p style="color: white;">${emptyPhone}<p>
	    </c:if>

        <input type="submit" value="注 册">
        <input type="button" value="返 回" onclick="goBack()"><br>
        <span class="message">反馈信息</span>
    	<span class="message_${result.code}">${result.msg}</span>
    </form>
</body>
<script>
	var baseUrl = "${basePath}/lesson/";  
	function goBack() {
	    window.history.back()
	 }
	function saveSubmit(action){
        dataForm.action = baseUrl+action;
        dataForm.submit();
    }

</script>
</html>
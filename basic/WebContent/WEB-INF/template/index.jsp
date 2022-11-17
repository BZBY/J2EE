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
    <title>首页</title>
    <!-- 引入外部CSS文件 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css" />
</head>

<body>
    <form class="login-form" action="${basePath}/lesson/login" method="POST">
        <h1>用户登录</h1>
        <input type="text" name="loginname" placeholder="用户名...">
        <input type="password" name="password" placeholder="密码...">
        <input type="submit" value="登 录">
        <input type="button" value="注 册" onclick="myFunction()"><br>
        <span class="message">反馈信息</span>
    	<span class="message_${result.code}">${result.msg}</span>
    </form>
    
</body>
<script>
    function myFunction() {
    	window.open('${basePath}/lesson/toRegist', "_self");
    }
    
</script>
</html>
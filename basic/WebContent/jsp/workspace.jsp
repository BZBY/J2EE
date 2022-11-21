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
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../css/workspace.css" rel="stylesheet" type="text/css"></link>
</head>
<style>
	#test {
		position : absolute;
	width : 100%;
	height : 100%;
		background-color: #ffffff;
		text-align: center;

		vertical-align: middle;
	}
	
*{		/* CSS Reset */
	margin : 0;
	padding : 0;
}
</style>
<body>
	<div id="test">你好
	</div>
</body>
</html>
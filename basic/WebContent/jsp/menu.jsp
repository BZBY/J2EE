<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="scheme" value="${pageContext.request.scheme}" />
<c:set var="serverName" value="${pageContext.request.serverName}" />
<c:set var="serverPort" value="${pageContext.request.serverPort}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="basePath"
	value="${scheme}://${serverName}:${serverPort}${contextPath}" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #98cec9;
	border: none;
	color: #111111;
	text-align: center;
	font-size: 18px;
	padding: 8px;
	width: 120px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	vertical-align: middle;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}


#container {
		position : absolute;
	width : 100%;
	height : 100%;
	background-color: #ffffff;
	text-align: center;
	}
	
*{		/* CSS Reset */
	margin : 0;
	padding : 0;
}
</style>
<body>
<div id="container">
	<a href="../lesson/list" target="work">
		<button class="button">
			<span>信息查询</span>
		</button>
	</a>
	<br>
	<a href="../lesson/list" target="work">
		<button class="button">
			<span>信息查询</span>
		</button>
	</a>
	<br>
</div>
</body>
</html>
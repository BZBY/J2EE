<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>fxw首页</title>
	</head>
    <base href="<%=basePath%>">
	<frameset rows="70,*" cols="*" framespacing="0" frameborder="no" border="0">
  		<frame src="jsp/banner.jsp" id="banner" name="banner" scrolling="NO" noresize />
  		<frameset rows="*" cols="170,*" framespacing="0" frameborder="no" border="0" id="mainframe" >
    	<frame src="jsp/menu.jsp" name="menu" id="menu"/>
    	<frame src="jsp/workspace.jsp" name="work" id="work"/>
  </frameset>
</frameset>
	<noframes>
	</noframes>

</html>
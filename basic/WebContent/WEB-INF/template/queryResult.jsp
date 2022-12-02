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
<link rel="stylesheet" type="text/css" href="${basePath}/css/list.css">
<title>Insert title here</title>

</head>
<body>
<c:set var="pagesize" value="4" scope="page" />
  <!--记录数 --><c:set var="number" value="${len}" scope="page" />
  <!-- 计算分页数 --><c:set var="pagenumber" value="${(number+pagesize-1)/pagesize}" /> 
<table>
        <tr>
            <th>ID</th>
            <th>登录名称</th>
            <th>用户名称</th>
            <th>登录密码</th>
            <th>联系方式</th>
            <th>操作</th>
        </tr>
       
           <c:forEach var="user" items="${result.data}"
           begin="${param.start}" end="${param.start+pagesize-1}">
	            <tr>
	                <td>${user.id}</td>
	                <td>${user.loginname}</td>
	                <td>${user.username}</td>
	                <td>${user.password}</td>
	                <td>${user.phone}</td>
	                <td>
	                    <button onclick='loadData(${user.id})'>编辑</button>
	                    <button onclick='deleteData(${user.id})'>删除</button>
	                </td>
	            </tr>
            </c:forEach>
     
    </table>
    <span class="message">反馈信息</span>
    <span class="message_${result.code}">${result.msg}</span>
    <input type="button" value="查询" class="btDisplay1"/>
    <input type="button" value="添加" onclick="saveSubmit('add')" />
	<!--分页  -->
	<c:choose>
		<c:when test="${param.start>0}">
			<a href="${basePath}/lesson/cutPageList?start=${param.start-pagesize}">上一页</a>
		</c:when>
		<c:otherwise>
         上一页
   </c:otherwise>
	</c:choose>


	<c:choose>
		<c:when test="${param.start+pagesize<number}">
			<a href="${basePath}/lesson/cutPageList?start=${param.start+pagesize}">下一页</a>
		</c:when>
		<c:otherwise>
         下一页
   </c:otherwise>
	</c:choose>

	<!-- 显示记录数 -->
	共
	<font color="red">${number}</font>条记录

	<!-- 显示分页数 -->
	共
	<fmt:parseNumber type="number" value="${pagenumber}" integerOnly="true" />
	页
</body>
</html>
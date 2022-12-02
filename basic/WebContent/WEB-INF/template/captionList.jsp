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
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${basePath}/css/list.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	var baseUrl = "${basePath}/user/";   
	function loadData(id){
	    dataForm.id.value = id;       
	    dataForm.action = baseUrl+"list";
	    dataForm.submit();
	}
	function saveSubmit(action){
	    dataForm.action = baseUrl+action;
	    dataForm.submit();
	}
	function deleteData(id){
	    if(confirm("是否确实删除本记录？")){
	    dataForm.id.value = id;       
	    dataForm.action = baseUrl+"delete";
	    dataForm.submit();
	    }
	}
	
	function change(tableName){
		location.href="${basePath}/lesson/systemTable?tableName=" + tableName;
	}
	
	function noNext() {
		alert("没有下一页啦！")
	}
	function noBefore() {
		alert("没有上一页啦！")
	}
</script>
<body>
<c:set var="pagesize" target="page" value="${pageSize}" scope="page"/>
  <!--记录数 --><c:set var="number" value="${len}" scope="page" />
  <!-- 计算分页数 --><c:set var="pagenumber" value="${(number+pagesize-1)/pagesize}" />

	<br>
	<table>
		<tr>
			<th>ID</th>
            <th>代码</th>
            <th>标题</th>
            <!-- <th>登录密码</th>
            <th>联系方式</th> -->
            <th>操作</th>
		</tr>
		<!--判断是否有信息  -->
		<!-- 如果类别为空  otherwise -->

		<c:forEach var="UserView" items="${result.data}" begin="${param.start}"
			end="${param.start+pagesize-1}">
			<tr>
				<td>${UserView.id}</td>
				<td>${UserView.loginname}</td>
				<td>${UserView.username}</td>
				<td>${UserView.caption}</td>

				<td>
					<button class="btDisplay2" onclick="loadData(${systemTable.id})">编辑</button>
					<button onclick='deleteData(${user.id})'>删除</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>

	<div style="display: flex;  justify-content: center; align-items: center;">
		<!--分页  -->
		<c:choose>
			<c:when test="${param.start>0}">
				<a href="${basePath}/lesson/updatePageCapacity3?start=${param.start-pagesize}">上一页</a>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="noBefore()">上一页</a>
			</c:otherwise>
		</c:choose>
		<a href="#">${(param.start+pagesize)/pagesize}</a>

		<c:choose>
			<c:when test="${param.start+pagesize<number}">
				<a href="${basePath}/lesson/updatePageCapacity3?start=${param.start+pagesize}">下一页</a>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="noNext()">下一页</a>
			</c:otherwise>
		</c:choose>

		<div class="dropdown">
			<button class="dropbtn">页容量</button>
			<div class="dropdown-content">
				<a href="${basePath}/lesson/captionList?pageSize=1">1</a> <a
					href="${basePath}/lesson/captionList?pageSize=2">2</a> <a
					href="${basePath}/lesson/captionList?pageSize=5">5</a> <a
					href="${basePath}/lesson/captionList?pageSize=10">10</a>
			</div>
		</div>
		<br>
		
	</div>


	<div style="display: flex;  flex-direction: row-reverse;">
	<span class="message_${result.code}">${result.msg}</span>
		<span class="message">反馈信息</span> 
		
	</div>
</body>
</html>
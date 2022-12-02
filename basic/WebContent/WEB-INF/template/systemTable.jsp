<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<script type="text/javascript" src="${basePath}/js/jquery.min.js"></script>
<script>
	$(document).ready(function(e) {
		$('.box3').hide();
	});
    var baseUrl = "${basePath}/lesson/";   
    function loadData(id){
        dataForm.id.value = id;       
        dataForm.action = baseUrl+"list";
        dataForm.submit();
    }
    function saveSubmit(action){
    	if (action == "updateSystemtable") {
    		dataForm.action = baseUrl+action;
            dataForm.submit();
    	}
    	if (action == "addSystemTable") {
    		dataForm.action = baseUrl+action;
            dataForm.submit();
    	}
        
    }
    function deleteData(id){
        if(confirm("是否确实删除本记录？")){
        dataForm2.id.value = id;       
        dataForm2.action = baseUrl+"deleteSystemTable";
        dataForm2.submit();
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
<style type="text/css">

input[type=text], select {
  width: 13%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
</style>

<title>Insert title here</title>
</head>
<body>

<div  class="box3">
	<form:form name="dataForm2" modelAttribute="systemTable" method="post" action="${basePath}/lesson/deleteSystemTable">
			 <form:input type="hidden" path="id"/>
       code：<form:input path="code" name="code" />
        caption：<form:input path="caption" name="caption"/>
        <input type="button" value="更新" onclick="saveSubmit('update')" />
        <input type="button" value="添加" onclick="saveSubmit('add')" />
    </form:form>
</div>

<div style="display: flex;  justify-content: center; align-items: center;" class="box1">
		<div id="form-div" style="width: 100%">
			<form:form name="dataForm" modelAttribute="tableInfo" method="post"	action="${basePath}/lesson/add">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统表：<form:select path="tableName" items="${tableList}" cssClass="base select"  onchange="change(this.value)">
			</form:select>
			        代码：<input type="text"  name="code"/>
			        标题：<input  type="text"  name="caption"/>
				<input type="button" value="更新" onclick="saveSubmit('updateSystemtable')" />
				<input type="button" value="添加" onclick="saveSubmit('addSystemTable')" />
			</form:form>
		</div>
</div>
<c:set var="codeEmpty" value="${codeEmpty}" />
<c:if test="${codeEmpty != null}">
	<p style="color: black;">${codeEmpty}
	<p>
</c:if>

<c:set var="captionEmpty" value="${captionEmpty}" />
<c:if test="${captionEmpty != null}">
	<p style="color: black;">${captionEmpty}
	<p>
</c:if>

<c:set var="codesame" value="${codesame}" />
<c:if test="${emptyUsername != null}">
	<p style="color: black;">${codesame}
	<p>
</c:if>
   

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

		<c:forEach var="systemTable" items="${result.data}" begin="${param.start}"
			end="${param.start+pagesize-1}">
			<tr>
				<td>${systemTable.id}</td>
				<td>${systemTable.code}</td>
				<td>${systemTable.caption}</td>
				<%-- <td>${user.password}</td>
				<td>${user.phone}</td> --%>
				<td>
					<button onclick='deleteData(${systemTable.id})'>删除</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>

	<div style="display: flex;  justify-content: center; align-items: center;">
		<!--分页  -->
		<c:choose>
			<c:when test="${param.start>0}">
				<a href="${basePath}/lesson/updatePageCapacity2?start=${param.start-pagesize}">上一页</a>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="noBefore()">上一页</a>
			</c:otherwise>
		</c:choose>
		<a href="#">${(param.start+pagesize)/pagesize}</a>

		<c:choose>
			<c:when test="${param.start+pagesize<number}">
				<a href="${basePath}/lesson/updatePageCapacity2?start=${param.start+pagesize}">下一页</a>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="noNext()">下一页</a>
			</c:otherwise>
		</c:choose>

		<%-- <form:form style="display: inline;" modelAttribute="pageInfo" method="post" action="${basePath}/lesson/list?pageSize=${pageInfo.capacity}" target="_blank">
	页容量:
	<form:select path="capacity" items="${pageList}" cssClass="base select" onchange="change(this.value)"></form:select>
	</form:form> --%>
		<div class="dropdown">
			<button class="dropbtn">页容量</button>
			<div class="dropdown-content">
				<a href="${basePath}/lesson/systemTable?pageSize=1">1</a> <a
					href="${basePath}/lesson/systemTable?pageSize=2">2</a> <a
					href="${basePath}/lesson/systemTable?pageSize=5">5</a> <a
					href="${basePath}/lesson/systemTable?pageSize=10">10</a>
			</div>
		</div>
		<br>
		
	</div>
       <%-- <!-- 显示记录数 -->
		查询到<font color="red">${number}</font>条x记录
 --%>
		<%-- <!-- 显示分页数 -->
		共
		<fmt:parseNumber type="number" value="${pagenumber}"
			integerOnly="true" />
		页 --%>

	<div style="display: flex;  flex-direction: row-reverse;">
	<span class="message_${result.code}">${result.msg}</span>
		<span class="message">反馈信息</span> 
		
	</div>
</body>
</html>
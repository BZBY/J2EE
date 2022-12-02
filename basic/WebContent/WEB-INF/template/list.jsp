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

<link rel="stylesheet" type="text/css" href="${basePath}/css/list.css">


<meta charset="UTF-8">
<title>用户管理</title>
<script type="text/javascript" src="${basePath}/js/jquery.min.js"></script>
<script>
/* 
	box1 查询
	box2 更新
	box3 添加
*/
	var flag = ${flag}
	
	$(document).ready(function(e) {
		if (flag != true) {
			$('.box2').hide();
		}
			
		$('.box1').hide();
		$('.box3').hide();
		$('.box4').hide();
		
	    $(".btDisplay1").click(function(e) {    	
            $(".box1").show().addClass("show");
	    });
	    $(".btCancel1").click(function(e) {
    		$(".box1").hide().removeClass("show");
	    });
	    
	    $(".btDisplay2").click(function(e) {
	    	flag = true
            $(".box2").show().addClass("show");
	    });
	    $(".btCancel2").click(function(e) {
    		$(".box2").hide().removeClass("show");
	    });
	    
	    $(".btDisplay4").click(function(e) {
            $(".box4").show().addClass("show");
	    });
	    $(".btCancel4").click(function(e) {
    		$(".box4").hide().removeClass("show");
	    });
	    
	    
         var pwList = document.getElementById('pw');
         var pwL1=pwList.childNodes.item(0);
         var pwL2=pwL1.childNodes;
         
         for(var i=0;i<lis.length;i++){ 
        	 pwL2.item(i).innerHTML="******";
        }

	});
    var baseUrl = "${basePath}/lesson/";   
    function loadData(id){
    	dataForm2.id.value = id;       
    	dataForm2.action = baseUrl+"list";
    	dataForm2.submit();
    }
    function deleteData(id){
        if(confirm("是否确实删除本记录？")){
	        dataForm.id.value = id;       
	        dataForm.action = baseUrl+"delete";
	        dataForm.submit();
        }
    }
    function saveSubmit(action){
    	if (action == "update") {
    		var username = $("#upusername").val();
        	var password = $("#uppassword").val();
        	var repw = $("#uprepw").val();
        	var phone = $("#upphone").val();
    		var b = true;
	    	if (username == "") {
	    		var info = "❌ 用户昵称不能为空   "
	    		document.getElementById('txt1').innerText=info;
	    		b = false;
	    	}
	    	if (password != repw) {
	    		var info = "❌ 两次密码必须一致  "
	        	document.getElementById('txt2').innerText=info;
	    		b = false;
	    	}
	    	if (phone == "") {
	    		var info = "❌ 电话不得为空  "
	            document.getElementById('txt3').innerText=info;
	    		b = false;
	    	}
	    	if (b == true) {
	    		dataForm2.action = baseUrl+action;
	    		dataForm2.submit();
	    	}  
    	}
    	if (action == "add") {
    		var loginname = $("#adloginname").val();
    		var username = $("#adusername").val();
        	var password = $("#adpassword").val();
        	var repw = $("#adrepw").val();
        	var phone = $("#adphone").val();
    		var b = true;
    		if (loginname == "") {
	    		var info = "❌ 登录名称不能为空   "
	    		document.getElementById('txt4').innerText=info;
	    		b = false;
	    	}
    		if (username == "") {
	    		var info = "❌ 用户昵称不能为空   "
	    		document.getElementById('txt5').innerText=info;
	    		b = false;
	    	}
	    	if (password != repw) {
	    		var info = "❌ 两次密码必须一致  "
	        	document.getElementById('txt6').innerText=info;
	    		b = false;
	    	}
	    	if (phone == "") {
	    		var info = "❌ 电话不得为空  "
	            document.getElementById('txt7').innerText=info;
	    		b = false;
	    	}
	    	if (b == true) {
	    		dataForm4.action = baseUrl+action;
	    		dataForm4.submit();
	    	}
    	}
    }
    function change(v){
    	location.href="${basePath}/lesson/list?pageSize=" + v;
   }

    function noNext() {
    	alert("没有下一页啦！")
    }
    function noBefore() {
    	alert("没有上一页啦！")
    }
    function getPageVal() {
    	var pageVal = document.getElementById('pageNumber').getAttribute("value");
    	var obj = document.getElementById('pageNumber');
    	var pageNumber = pageVal + 1;
    	alert(pageVal)
    	obj.innerHTML=pageNumber;
    }
   
</script>
</head>
<body>
<div style="display: flex;  justify-content: center; align-items: center;" class="box1">
		<div id="form-div" style="width: 39%;">
			<form method="post" action="${basePath}/lesson/fuzzyQuery">
				<h2 style="text-align: center;">信息查询</h2>
				<label for="loginname">登录名称</label> 
				<input type="text" id="fname" name="loginname" placeholder="Your loginname.."> 
				<label for="username">用户昵称</label> 
				<input type="text" id="lname" name="username" placeholder="Your username..">
				<label for="username">电话</label> 
				<input type="text" id="phonr" name="phone" placeholder="Your phone..">
				<!-- <label for="country">Country</label> 
				<select id="country" name="country">
					<option value="australia">Australia</option>
					<option value="canada">China</option>
					<option value="usa">USA</option>
				</select>  -->
				<div style="display: flex;  justify-content: center; align-items: center;">
					<div>
						<input type="submit" value="Submit">
					</div>
					<div>
						<input type="button" value="Cancel" class="btCancel1" />
					</div>
				</div>
				</form>
		</div>
		<%-- <form method="post" action="${basePath}/lesson/fuzzyQuery">
		<span>信息查询</span><br>
	        登录名称：<input name="loginname"/><br>
	        用户昵称：<input name="username" /><br>
	        联系方式：<input name="phone"/><br>
	        <input type="submit" value="查询" />
	        <input type="button" value="取消" class="btCancel1" />
	 </form>	 --%>
</div>

<div style="display: flex; justify-content: center; align-items: center;" class="box2">

	<div id="form-div">
		<form:form name="dataForm2" modelAttribute="user" method="post" action="${basePath}/lesson/update">
			<h2 style="text-align: center;">信息录入</h2>
		   <form:input type="hidden" path="id"/>
		        登录名称：<form:input path="loginname" readonly="true"/>
		        用户昵称：<form:input path="username" id="upusername"/> <br>
		        登录密码: <form:input path="password" type="password" id="uppassword"/>
		        密码确认: <input id="uprepw" type="password"/><br>
		        联系方式：<form:input path="phone" id="upphone"/>
		        <div style="display: flex;  justify-content: center; align-items: center;">
					<div>
						<input type="button" value="保存" onclick="saveSubmit('update')">
					</div>
					<div>
						<input type="button" value="取消"  class="btCancel2" />
					</div>
				</div>
		       <!--  <input type="button" value="保存" onclick="saveSubmit('update')" />
		        <input type="button" value="取消"  class="btCancel2"/> -->
		 </form:form>
		 <span id="txt1"></span>
		 <span id="txt2"></span>
		 <span id="txt3"></span>
	 </div>
</div>

 
 
<div  class="box3">
	<form:form name="dataForm" modelAttribute="user" method="post" action="${basePath}/lesson/add">
        ID：<form:input path="id" readonly="true"/>
        用户名：<form:input path="username" />
        密码：<form:input path="password" />
        <input type="button" value="更新" onclick="saveSubmit('update')" />
        <input type="button" value="添加" onclick="saveSubmit('add')" />
    </form:form>
</div>

<div style="display: flex; justify-content: center; align-items: center;" class="box4">

	<form:form name="dataForm4" modelAttribute="user" method="post" action="${basePath}/lesson/add">
	<h2 style="text-align: center;">添加信息</h2>
	   <form:input type="hidden" path="id"/>
	         登录名称：<form:input path="loginname" id="adloginname" placeholder="Your loginname.."/>
	        用户昵称：<form:input path="username" id="adusername" placeholder="Your username.."/> <br>
	        登录密码: <form:input path="password" type="password" id="adpassword" placeholder="Your password.."/>
	        密码确认: <input id="adrepw" type="password" placeholder="Your password again.."/><br>
	        联系方式：<form:input path="phone" id="adphone" placeholder="Your phone.."/><br>
	        <div style="display: flex;  justify-content: center; align-items: center;">
					<div>
						<input type="button" value="添加" onclick="saveSubmit('add')">
					</div>
					<div>
						<input type="button" value="取消"  class="btCancel4" />
					</div>
				</div>
	        <!-- <input type="button" value="添加" onclick="saveSubmit('add')" />
	        <input type="button" value="取消"  class="btCancel4"/> -->
	 </form:form>	
	 
	 <span id="txt4"></span>
	 <span id="txt5"></span>
	 <span id="txt6"></span>
	 <span id="txt7"></span>
</div>

<c:set var="pagesize" target="page" value="${pageSize}" scope="page"/>
  <!--记录数 --><c:set var="number" value="${len}" scope="page" />
  <!-- 计算分页数 --><c:set var="pagenumber" value="${(number+pagesize-1)/pagesize}" />

	<div class="flex-container">
		<div>
			<button id="div_button1"  class="btDisplay1">查询</button>
		</div>
		<div>
		<button id="div_button1" class="btDisplay4">添加</button>
		</div>
	</div>

	<br>
	<table>
		<tr>
			<th>ID</th>
            <th>登录名称</th>
            <th>用户名称</th>
            <th>登录密码</th>
            <th>联系方式</th>
            <th>操作</th>
		</tr>
		<!--判断是否有信息  -->
		<!-- 如果类别为空  otherwise -->

		<c:forEach var="user" items="${result.data}" begin="${param.start}"
			end="${param.start+pagesize-1}">
			<tr>
				<td>${user.id}</td>
				<td>${user.loginname}</td>
				<td>${user.username}</td>
				<td id="pw">${user.password}</td>
				<td id="phone">${user.phone}</td>
				<td>
					<button class="btDisplay2" onclick="loadData(${user.id})">编辑</button>
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
				<a
					href="${basePath}/lesson/updatePageCapacity?start=${param.start-pagesize}&state=before">上一页</a>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="noBefore()">上一页</a>
			</c:otherwise>
		</c:choose>
		<%-- <a href="#">${(param.start+pagesize)/pagesize}</a> --%>
		<button id="pageNumber" value="${pageVal}">${pageVal}</button>
		<c:choose>
			<c:when test="${param.start+pagesize<number}">
				<a
					href="${basePath}/lesson/updatePageCapacity?start=${param.start+pagesize}&state=next">下一页</a>
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
				<a href="${basePath}/lesson/list?pageSize=1">1</a> <a
					href="${basePath}/lesson/list?pageSize=2">2</a> <a
					href="${basePath}/lesson/list?pageSize=5">5</a> <a
					href="${basePath}/lesson/list?pageSize=10">10</a>
			</div>
		</div>
		<br>
		
	</div>
       <%-- <!-- 显示记录数 -->
		查询到<font color="red">${number}</font>条记录
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<c:set var="scheme" value="${pageContext.request.scheme}" />
<c:set var="serverName" value="${pageContext.request.serverName}" />
<c:set var="serverPort" value="${pageContext.request.serverPort}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="basePath"
	value="${scheme}://${serverName}:${serverPort}${contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="${basePath}/js/jquery.min.js"></script>
<script>
	$(document).ready(function(e) {
		$('.box3').hide();
	});
	var baseUrl = "${basePath}/lesson/";
	function loadData(id) {
		dataForm.id.value = id;
		dataForm.action = baseUrl + "list";
		dataForm.submit();
	}
	function saveSubmit(action) {
		if (action == "updateSystemtable") {
			dataForm.action = baseUrl + action;
			dataForm.submit();
		}
		if (action == "addSystemTable") {
			dataForm.action = baseUrl + action;
			dataForm.submit();
		}

	}
	function deleteData(id) {
		if (confirm("是否确实删除本记录？")) {
			dataForm2.id.value = id;
			dataForm2.action = baseUrl + "deleteSystemTable";
			dataForm2.submit();
		}
	}

	function change(tableName) {
		location.href = "${basePath}/lesson/systemTable?tableName=" + tableName;
	}
	function changeChaoXiang(ChaoXiangList) {
		location.href = "${basePath}/lesson/inforControlSearch?ChaoXiangList=" + tableName;
	}
	function noNext() {
		alert("没有下一页啦！")
	}
	function noBefore() {
		alert("没有上一页啦！")
	}
</script>

<style >

.table{
	display:inline;

	float:left;
}

.table tr{
display:inline;
	float:left;
}
.input-container {
    display: flex;
    width: 250px;
    border: 1px solid #a9a9a9;
    justify-content: space-between;
}
.input-container input:focus, .input-container input:active {
    outline: none;
}
.input-container input {
    border: none;
}


span {
  border: 1px solid red;
  padding: 2px;
  font-size: 0px;
  display: inline-block;
  background: white;
}

.inputS,
.buttonS {
  display: inline-block;
  margin: 0px;
  font-size: 12px;
  background: white;
  border-style: none;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<div class="box3">
		<form:form name="dataForm2" modelAttribute="systemTable" method="post"
			action="${basePath}/lesson/informationControl">
			<form:input type="hidden" path="id" />
       code：<form:input path="code" name="code" />
        caption：<form:input path="caption" name="caption" />
			<input type="button" value="更新" onclick="saveSubmit('update')" />
			<input type="button" value="添加" onclick="saveSubmit('add')" />
		</form:form>
	</div>

	<div
		style="display: flex; justify-content: center; align-items: center;"
		class="box1">
		<div id="form-div" style="width: 100%">
			<form:form name="dataForm" modelAttribute="tableInfo" method="post"
				action="${basePath}/lesson/add">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统表：<form:select path="tableName"
					items="${tableList}" cssClass="base select"
					onchange="change(this.value)">
				</form:select>
			        代码：<input type="text" name="code" />
			        标题：<input type="text" name="caption" />
				<input type="button" value="更新"
					onclick="saveSubmit('updateSystemtable')" />
				<input type="button" value="添加"
					onclick="saveSubmit('addSystemTable')" />
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


	<c:set var="pagesize" target="page" value="${pageSize}" scope="page" />
	<!--记录数 -->
	<c:set var="number" value="${len}" scope="page" />
	<!-- 计算分页数 -->
	<c:set var="pagenumber" value="${(number+pagesize-1)/pagesize}" />

	<br>
	<div class="mainFin">
		<form action="informationControl.jsp" method="post">
		<table>
			
			<tr>
				<td>注册编号 <input type="text" placeholder="请输入编号" name="ICScode">
				
				
				房源标题 <input type="text" placeholder="请输入标题" name="ICStitle">
				</td>
			<tr>
			
			
			<tr>
				<td>房型
				
				
				<input type="text" value=0 name="houseShi" style=" width:2%;">
				
				<!-- 
				<table cellspacing="0" cellpadding="0" style="display:inline; position: relative;top:-2x;left:-5%;z-index: 10;">

					<tr style="padding:0px;"><td><button type=button  onClick="javascript:this.form.houseShi.value++;" style="height:20px;">
					
					<img style="height:100%;" src="../images/upS.png"></button>
    </td></tr>
					<tr><td><button type=button onClick="javascript:this.form.houseShi.value++;" style="height:20px;">
  					<img  style="height:100%;" src="../images/downS.png"  ></button>
   </td></tr>
				</table>
				 -->
				 
				室
				
				<input type="text" value=0 name="houseShi" style=" width:2%;">
				<!--
				
				<table cellspacing="0" cellpadding="0" style="display:inline; position: relative;top:-1px;left:-5%;z-index: 10;">

					<tr style="padding:0px;"><td><button type=button  onClick="javascript:this.form.houseShi.value++;" style="height:20px;">
					
					<img style="height:100%;" src="../images/upS.png"></button>
    </td></tr>
					<tr><td><button type=button onClick="javascript:this.form.houseShi.value++;" style="height:20px;">
  					<img  style="height:100%;" src="../images/downS.png"  ></button>
   </td></tr>
   
   
   
				</table>
				-->
				
				厅
				
				<input type="text" value=0 name="houseShi" style=" width:2%;">
				
				<!--
				<table cellspacing="0" cellpadding="0" style="display:inline; position: relative;top:-1px;left:-5%;z-index: 10;">

					<tr style="padding:0px;"><td><button type=button  onClick="javascript:this.form.houseShi.value++;" style="height:20px;">
					
					<img style="height:100%;" src="../images/upS.png"></button>
    </td></tr>
					<tr><td><button type=button onClick="javascript:this.form.houseShi.value++;" style="height:20px;">
  					<img  style="height:100%;" src="../images/downS.png"  ></button>
   </td></tr>
   
   
  
				</table> -->
				
				卫
				
				
				<input type="text" value=0 name="houseShi" style=" width:2%;">
				
				
				
				|
				 面积<input type="text" value=0.0 name="houseShi" style=" width:8%;">
				 
				|
				  朝向
				 
<select class="form-control" name="classId" style="display:inline;">
    <option selected="selected">请选择</option>
    <%
        String username="root";
        String password="123456"; 
        String url="jdbc:mysql://localhost:3306/j2ee?serverTimezone=UTC";
        Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
        Connection conn= DriverManager.getConnection(url,username,password);
        String strSql="select * from t_towardall";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(strSql);
        while(rs.next()){ //循环遍历输出
            //值获取从索引1开始 比如 1 是id 2 是 name 在这里就是显示name 把 id 用来传参
            out.print("<option value="+rs.getString(1)+">"+rs.getString(2)+"</option>");
        }
       
    %>
</select>

                
                
                
                建造年份： <input type="text" value=0 name="houseShi" style=" width:2%;">
				
                

				 </td>
				
			</tr>
			
			<tr><td>
			
			楼层：<input type="text" value=0 name="houseShi" style=" width:2%;">
				
			总楼层：<input type="text" value=0 name="houseShi" style=" width:2%;">
				
			
			|
			
			所属区：
			
<select class="form-control" name="classId" style="display:inline;">
    <option selected="selected">请选择</option>
    <%
    
    String username1="root";
    String password1="123456"; 
    String url1="jdbc:mysql://localhost:3306/j2ee?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
    Connection conn1= DriverManager.getConnection(url1,username1,password1);
  
    	Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
        String strSql2="select * from t_areabelong";
        Statement stmt2=conn1.createStatement();
        ResultSet rs2=stmt.executeQuery(strSql2);
        while(rs2.next()){ //循环遍历输出
            //值获取从索引1开始 比如 1 是id 2 是 name 在这里就是显示name 把 id 用来传参
            out.print("<option value="+rs2.getString(1)+">"+rs2.getString(2)+"</option>");
        }
        
    %>
</select>
		
		
		价格：	<input type="text" value=0.0 name="houseShi" style=" width:2%;">万元
				|
				
				
				装修：
				
				<select class="form-control" name="classId" style="display:inline;">
    <option selected="selected">请选择</option>
    <%
    
    String username3="root";
    String password3="123456"; 
    String url3="jdbc:mysql://localhost:3306/j2ee?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
    Connection conn3= DriverManager.getConnection(url3,username1,password3);
  
    	Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
        String strSql3="select * from t_areabelong";
        Statement stmt3=conn1.createStatement();
        ResultSet rs3=stmt.executeQuery(strSql3);
        while(rs3.next()){ //循环遍历输出
            //值获取从索引1开始 比如 1 是id 2 是 name 在这里就是显示name 把 id 用来传参
            out.print("<option value="+rs3.getString(1)+">"+rs3.getString(2)+"</option>");
        }
        
    %>
</select>
				
				<td>
				
			</tr>
	


			
			
			<tr>
			<td>
					物业：			
				<select class="form-control" name="classId" style="display:inline;">
    <option selected="selected">请选择</option>
    <%
    
    String username13="root";
    String password13="123456"; 
    String url13="jdbc:mysql://localhost:3306/j2ee?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
    Connection conn13= DriverManager.getConnection(url3,username1,password3);
  
    	Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
        String strSql13="select * from t_areabelong";
        Statement stmt13=conn1.createStatement();
        ResultSet rs13=stmt.executeQuery(strSql13);
        while(rs13.next()){ //循环遍历输出
            //值获取从索引1开始 比如 1 是id 2 是 name 在这里就是显示name 把 id 用来传参
            out.print("<option value="+rs13.getString(1)+">"+rs13.getString(2)+"</option>");
        }
        
    %>
</select>
			|
			产权：
			
							<select class="form-control" name="classId" style="display:inline;">
    <option selected="selected">请选择</option>
    <%
    
    String username37="root";
    String password37="123456"; 
    String url37="jdbc:mysql://localhost:3306/j2ee?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
    Connection conn37= DriverManager.getConnection(url37,username37,password37);
  
    	Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
        String strSql37="select * from t_areabelong";
        Statement stmt37=conn1.createStatement();
        ResultSet rs37=stmt.executeQuery(strSql37);
        while(rs37.next()){ //循环遍历输出
            //值获取从索引1开始 比如 1 是id 2 是 name 在这里就是显示name 把 id 用来传参
            out.print("<option value="+rs37.getString(1)+">"+rs37.getString(2)+"</option>");
        }
        
    %>
</select>


			|
			售房人：
			
							<select class="form-control" name="classId" style="display:inline;">
    <option selected="selected">请选择</option>
    <%
    
    String username4="root";
    String password4="123456"; 
    String url4="jdbc:mysql://localhost:3306/j2ee?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
    Connection conn4= DriverManager.getConnection(url4,username4,password4);
  
    	Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
        String strSql4="select * from t_areabelong";
        Statement stmt4=conn4.createStatement();
        ResultSet rs4=stmt.executeQuery(strSql4);
        while(rs4.next()){ //循环遍历输出
            //值获取从索引1开始 比如 1 是id 2 是 name 在这里就是显示name 把 id 用来传参
            out.print("<option value="+rs4.getString(1)+">"+rs4.getString(2)+"</option>");
        }
        
    %>
</select>



			|
			状态：
			
							<select class="form-control" name="classId" style="display:inline;">
    <option selected="selected">请选择</option>
    <%
    
    String username33="root";
    String password33="123456"; 
    String url33="jdbc:mysql://localhost:3306/j2ee?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
    Connection conn33= DriverManager.getConnection(url33,username33,password33);
  
    	Class.forName("com.mysql.jdbc.Driver");//填写driverclass mysql8以上 com.mysql.cj.jdbc.Driver
        String strSql33="select * from t_status";
        Statement stmt33=conn1.createStatement();
        ResultSet rs33=stmt.executeQuery(strSql33);
        while(rs33.next()){ //循环遍历输出
            //值获取从索引1开始 比如 1 是id 2 是 name 在这里就是显示name 把 id 用来传参
            out.print("<option value="+rs33.getString(1)+">"+rs33.getString(2)+"</option>");
        }
        
    %>
</select>
			
			
			</td>
			
			</tr>
			<p>
				<input type="number" placeholder="请输入年龄" name="age">
			</p>
			<p>
				<input type="checkbox" name="ah" value="打篮球">A <input
					type="checkbox" name="ah" value="打游戏">B <input
					type="checkbox" name="ah" value="睡觉">C <input
					type="checkbox" name="ah" value="吃饭">D
			</p>
			
			
			
			
			
			
			<p>
				<button>登录</button>
			</p>
		




	</table>
	
	</form>
	</div>
	
	
	<br>

	<div
		style="display: flex; justify-content: center; align-items: center;">
		<!--分页  -->
		<c:choose>
			<c:when test="${param.start>0}">
				<a
					href="${basePath}/lesson/updatePageCapacity2?start=${param.start-pagesize}">上一页</a>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="noBefore()">上一页</a>
			</c:otherwise>
		</c:choose>
		<a href="#">${(param.start+pagesize)/pagesize}</a>

		<c:choose>
			<c:when test="${param.start+pagesize<number}">
				<a
					href="${basePath}/lesson/updatePageCapacity2?start=${param.start+pagesize}">下一页</a>
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

	<div style="display: flex; flex-direction: row-reverse;">
		<span class="message_${result.code}">${result.msg}</span> <span
			class="message">反馈信息</span>

	</div>
</body>
</html>
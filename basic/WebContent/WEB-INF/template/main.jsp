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
		<meta charset="utf-8">
		<title>北京四合院</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="../css/page.css" />
		<link href="../plugins/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="../plugins/css/icons.min.css" rel="stylesheet" type="text/css" />
		</head>
	<body>
		<div class="page" id="app">
			<div class="nav-left" v-show="navLeftFlag" ref="navLeft">
				<div class="LogoName">
					北 京 四 合 院
				</div>
				<div class="navDiv">
					<div class="navName">导航</div>
					<div class="nav-list">
						<ul>
							<li class="nav-tab a_active waves-effect">
								<a href="${basePath}/lesson/list" class="li-a active" target="iframe"><i class='bx bx-home-smile'></i> 用户信息查询
									<span class="badge badge-pill badge-primary float-right">3</span>
								</a>
							</li>
							<li class="nav-tab">
								<a href="${basePath}/lesson/userInfo" class="li-a" target="iframe"><i class='bx bx-edit'></i> 个人信息</a>
							</li>
							<!-- <li class="nav-tab nav-ul">
								<a href="javascript:void[0]" class="li-a" target="iframe"><i class='bx bx-layer'></i> 设备管理
									<i class='bx bx-chevron-right' style="float: right;"></i></a>
								<div class="nav-box">
									<a href="html/device/2-1.html" class="li-a-a" target="iframe">当前能耗</a>
								</div>
							</li> -->
							<li class="nav-tab nav-ul">
								<a href="${basePath}/lesson/systemTable" class="li-a" target="iframe"><i class='bx bx-cog'></i> 系统表管理</a>
								
							</li>
							<li class="nav-tab nav-ul">
								<a href="${basePath}/lesson/captionList" class="li-a" target="iframe"><i class='bx bx-cog'></i> 权限管理</a>
									
							</li>
							
							
							<li class="nav-tab nav-ul">
								<a href="${basePath}/lesson/inforControlSearch" class="li-a" target="iframe"><i class='bx bx-cog'></i> 信息管理</a>
									
							</li>
						
							
							
							<li class="nav-tab nav-ul">
								<a href="${basePath}/lesson/exit" class="li-a" onclick="return exit()"><i class='bx bx-edit'></i> 退出</a>

							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="nav-right" ref="navRight">
				<div class="nav-top">
					<button type="button" class="btn btn-primary btn-sm hiddenBtn" style="line-height: 10px;" @click="isShowLeft">
						<i class="bx bx-grid-alt" style="font-size: 16px;"></i>
					</button>
					<!-- <button type="button" class="btn btn-primary btn-sm showBtn" style="line-height: 10px; display: none;" onclick="showNavRight">
						<i class="bx bx-expand" style="font-size: 16px;"></i>
					</button> -->
					
					&nbsp;&nbsp;&nbsp;
					<span style="font-size: 17px">${user.username}</span>
					&nbsp;&nbsp;&nbsp;
					<c:forEach var="userView" items="${userViewList}">
						&nbsp;&nbsp;<span>${userView.caption}</span>
					</c:forEach>
					<!-- <span id="mes-span"> 章浩宇 0204315 | 章浩宇 0204315 | 章浩宇 0204315 |</span>
					<span id="mes-span" style="color:blue;">| 章浩宇 0204315 |</span>
					<span id="mes-span">小组信息：</span> -->
				</div>
				<div class="content-page" ref="cPage">
					<iframe name="iframe" width="100%" height="100%" frameborder="0" src="${basePath}/lesson/list"></iframe>
				</div>
			</div>
		</div>
		<script src="../js/vue.min.js"></script>
		<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		
		<script type="text/javascript">
		function exit() {
			return confirm("确定要退出登录吗？");
		}
			$(function() {
				let navflag = false;
				$('.nav-tab').click(function() {
					$(this).siblings().each(function() {
						$(this).removeClass('a_active');
						// $(this).removeClass('a_active');
						$(this).find('.nav-box').css('height', '0')
						//关闭右侧箭头
						if ($(this).attr('class').indexOf('nav-ul') != -1) {
							$(this).find('.bx-chevron-right').css('transform', 'rotateZ(0deg)')
							$(this).find('.bx-chevron-right').css('transition', 'all .5s')
							$(this).removeClass('nav-show')
							// $(this).find('div').removeClass('nav-box')
						}
					})
					//当前选中
					$(this).addClass('a_active')
					$(this).find('.li-a').addClass('active')
					// 打开右侧箭头
					$(this).find('.bx-chevron-right').css('transform', 'rotateZ(90deg)')
					$(this).find('.bx-chevron-right').css('transition', 'all .5s')
					$(this).addClass('nav-show')
					// $(this).find('div').addClass('nav-box')
				})
				/* 二级菜单a点击事件 */
				$(".li-a-a").click(function() {
					$(".li-a-a").each(function() {
						$(this).removeClass('active-li-a');
					})
					$(this).addClass('active-li-a');
				})

			})
			const vue = new Vue({
				el: '#app',
				data: {
					navLeftFlag: true
				},
				methods: {
					isShowLeft() {
						if (this.navLeftFlag ) {
							this.$refs.navRight.style.paddingLeft = '0px'
							this.$refs.cPage.style.left = '0px';
							this.navLeftFlag = false;
							// this.$refs.navLeft.style.width = '0px';
							// setTimeout(()=>{
							// 	this.navLeftFlag = false;
							// },200)
						} else {
							this.$refs.navRight.style.paddingLeft = '240px';
							this.$refs.cPage.style.left = '240px';
							this.navLeftFlag = true;
							// this.$refs.navLeft.style.width = '240px';
							// setTimeout(()=>{
							// 	this.navLeftFlag = true;
							// },200)
						}
					}
				}
			}			)
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="scheme" value="${pageContext.request.scheme}" />
<c:set var="serverName" value="${pageContext.request.serverName}" />
<c:set var="serverPort" value="${pageContext.request.serverPort}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="basePath" value="${scheme}://${serverName}:${serverPort}${contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>普通用户登录后页面</title>


    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-size: 12px;
            font-family: "微软雅黑";
            color: #666;
        }

        a {
            text-decoration: none;
        }

        ul li {
            list-style: none;
        }

        .tz_content {
            width: 100%;
            background: #282828;
        }

        /*t_left start*/
        .tz_content .t_left {
            width: 200px;
            height: 800px;
            background: #282828;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 2;
        }



        .tz_content .t_left .l_nav {
            width: 100%;
            border-bottom: 1px solid #414141;
        }

        .tz_content .t_left .l_nav ul li {
            border-bottom: 1px solid #000000;
            line-height: 52px;
            border-top: 1px solid #414141;
        }

        .tz_content .t_left .l_nav ul li a {
            display: block;
            padding-left: 30px;
        }

        .tz_content .t_left .l_nav ul li a:hover {
            background: #28b779;
        }

        .tz_content .t_left .l_nav ul .active a {
            background: #28b779;
        }

        .tz_content .t_left .l_nav ul li a i {
            width: 16px;
            height: 16px;
            display: block;
            float: left;
            margin-top: 20px;
        }


        .tz_content .t_left .l_nav ul li a span {
            font-size: 14px;
            color: #fff;
            padding-left: 10px;
        }

        /*end t_left*/

        /*t_header start*/
        .tz_content .t_header {
            width: 100%;
            height: 56px;
            background: #2f3437;
            position: relative;
            z-index: 1;
        }

        /*h_nav start*/
        .tz_content .t_header .h_nav a {
            height: 56px;
            margin-left: 200px;
            float: left;
        }


        .tz_content .t_header .h_nav ul li a i {
            display: block;
            width: 18px;
            height: 17px;
            margin: 3px auto;
        }

        .tz_content .t_header .h_nav ul li .h_sel {
            color: #fff;
        }



        .tz_content .t_header .h_nav ul li a .h_icon1 {
            background-position: 0 -25px;
        }


        /*end h_nav*/

        /*h_info start*/
        .tz_content .t_header .h_info {
            height: 56px;
            position: absolute;
            top: 0;
            right: 10px;
        }

        .tz_content .t_header .h_info .h_user {
            line-height: 56px;
            color: #fff;
            float: left;
        }

        .tz_content .t_header .h_info .h_out {
            width: 50px;
            height: 30px;
            background: #28b779;
            margin: 13px 5px 0 10px;
            float: right;
        }

        .tz_content .t_header .h_info .h_out a {
            display: block;
            line-height: 30px;
            color: #fff;
            padding-left: 10px;
        }

        .tz_content .t_header .h_info .h_out a i {
            width: 14px;
            height: 14px;
            display: block;
            float: left;
            margin: 6px 8px;
        }

        /*end h_info*/

        /*end header*/

        .tz_content .t_right {
            height: 1500px;
            background: #f3f4f5;
            margin-left: 200px;
        }

        /*r_location start*/
        .tz_content .t_right .r_location {
            height: 51px;
            background: #e5e5e5;
            border-bottom: 1px solid #ccc;
            line-height: 51px;
        }

        .tz_content .t_right .r_location a {
            color: #000000;
        }

        /*end r_location*/


        /* 还有table */


        /*清除浮动*/
        .clear {
            clear: both;
        }
    </style>

</head>

<body>


    <div class="tz_content">

        <!--t_left start-->
        <div class="t_left">

            <div class="l_nav">
                <ul>
                    <li class="active">
                        <a href="">
                            <i class="icon_1"></i>
                            <span>房信网</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="icon_1"></i>
                            <span>信息查询</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="icon_2"></i>
                            <span>信息发布</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="icon_3"></i>
                            <span>个人信息</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="icon_4"></i>
                            <span>安全退出</span>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
        <!--t_left end-->

        <!--t_header start-->
        <div class="t_header">
            <!--h_nav start-->
            <div class="h_nav">
                <ul>
                    <li>
                        <a href="#" class="h_sel">
                            <i class="h_icon1"></i>
                            <span>gjy 【普通用户】</span>
                        </a>
                    </li>

                </ul>
            </div>
            <!--end h_nav-->

            <!--h_info start-->
            <div class="h_info">
                <div class="h_user">小组信息：zhy 1234567 sxy 1234567 arg1234567 gjy1234567</div>
                <div class="h_out">
                    <a href="#">
                        <span>退出</span>

                    </a>
                </div>
            </div>
            <!--end h_info-->

        </div>
        <!--end t_header-->
        <!--t_right start-->
        <div class="t_right">

            <!--r_location start-->
            <div class="r_location">
                <p>您当前所在位置：<a href="#">首页</a> > <a href="#">普通用户登录界面</a></p>
            </div>
            <!--end r_location-->



        </div>
        <!--end t_right-->

    </div>


</body>

</html>
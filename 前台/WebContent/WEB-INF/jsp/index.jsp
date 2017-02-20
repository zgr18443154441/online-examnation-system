<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<base href="<%=basePath%>"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Flat UI - Free Bootstrap Framework and Theme</title>
  <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

  <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

  <!-- Loading Bootstrap -->
  <link href="Flat-UI-master/dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Loading Flat UI -->
  <link href="Flat-UI-master/dist/css/flat-ui.css" rel="stylesheet">
  <link href="Flat-UI-master/docs/assets/css/demo.css" rel="stylesheet">

  <link rel="shortcut icon" href="Flat-UI-master/img/favicon.ico">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
  <!--[if lt IE 9]>
    <script src="Flat-UI-master/dist/js/vendor/html5shiv.js"></script>
    <script src="Flat-UI-master/dist/js/vendor/respond.min.js"></script>
  <![endif]-->
</head>
<body>
	<style>
      body {
        padding-top: 70px;
      }
    </style>

    <!-- Static navbar -->
    <jsp:include page="/WEB-INF/jsp/surrounding/top_main.jsp"></jsp:include>


    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron" style="min-height: 400px">
        <h2 style="float: left;">欢迎登陆四海学员考试系统&nbsp;&nbsp;&nbsp;</h2>
       	<div style="margin-top: 10px;">
			<img src="Flat-UI-master/img/icons/svg/pencils.svg" height="90px;" alt="Pensils">
		</div>
        <br><br>
        <p>今天是${map.year}年${map.month}月${map.day}日${map.week}，
    		<c:if test="${map.state==1}">上午好</c:if>
        	<c:if test="${map.state==2}">下午好</c:if>
        	<c:if test="${map.state==3}">晚上好</c:if>
        	&nbsp;&nbsp;<span class="fui-github"></span>
        </p>
        <p>
        	<c:if test="${state==1}">
        		修改成功！
        	</c:if>
        </p>
        <div class="demo-type-example">
			<p class="lead"><span class="fui-info-circle"></span>&nbsp;&nbsp;近期公告：</p>
   		</div>
   		<c:forEach items="${map.bussiness}" var="b">
   			<div class="demo-type-example">
		        <blockquote>
		          <p>${b.content}</p>
		          <small>${b.built_date}</small>
		        </blockquote>
	   		</div>
   		</c:forEach>
      </div>

    </div> <!-- /container -->
	
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>

	<script src="Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="Flat-UI-master/dist/js/vendor/video.js"></script>
    <script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <script src="Flat-UI-master/docs/assets/js/application.js"></script>

    <script>
      videojs.options.flash.swf = "Flat-UI-master/dist/js/vendors/video-js.swf"
    </script>
  </body>
</html>
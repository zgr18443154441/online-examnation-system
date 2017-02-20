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
    <jsp:include page="/WEB-INF/jsp/surrounding/top_exam.jsp"></jsp:include>


    <div class="container" style="min-height: 500px">
		<c:forEach items="${examnations}" var="e">
			<div class="jumbotron">
		        <h1>${e.title}</h1>
		        <p>考试时间：${e.text_date} &nbsp;&nbsp;&nbsp; ${e.start_time}——${e.end_time}</p>
		        <p>状态:
		        	<c:if test="${e.state==1}">未开始</c:if>
		        	<c:if test="${e.state==2}">进行中</c:if>
		        	<c:if test="${e.state==3}">批改中</c:if>
		        	<c:if test="${e.state==4}">已结束</c:if>
		        	<c:if test="${e.state==5}">已过期</c:if>
		        </p>
		        <p>
		        	<c:if test="${e.state==2}">
		          		<a class="btn btn-lg btn-primary" href="examnation/to_text?id=${e.id}" role="button">开始考试 &raquo;</a>
		        	</c:if>
		        	<c:if test="${e.state==4}">
		          		<a class="btn btn-lg btn-primary" href="examnation/to_record?id=${e.id}" role="button">查看试卷 &raquo;</a>
		        	</c:if>
		        </p>
		    </div>
		</c:forEach>
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
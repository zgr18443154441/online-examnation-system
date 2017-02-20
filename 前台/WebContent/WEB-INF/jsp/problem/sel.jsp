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
    <jsp:include page="/WEB-INF/jsp/surrounding/top_query.jsp"></jsp:include>


    <div class="container" style="min-height: 500px">

    	<!-- Main component for a primary marketing message or call to action -->
		<c:forEach items="${problems}" var="p">
			<div class="jumbotron">
				<div class="demo-type-example">
			 		<h3>${p.consult_date}</h3>
					<p class="lead">问题：${p.consult}</p>
					<p><small>相关课程：<c:if test="${p.about==''}">无</c:if>${p.about}</small></p>
				</div>
				<div class="demo-type-example">
				    <c:if test="${p.reply==null}">
				    	<blockquote>
				    	<p>未答复</p>
				    	</blockquote>
				    </c:if>
				    <c:if test="${p.reply!=null}">
					<h3>答复:</h3>
				    	<blockquote>
				    	<p>${p.reply}</p>
				    	<small>
				    		<c:forEach items="${teachers}" var="t">
				    			<c:if test="${t.id==p.teacher_id}">${t.NAME}</c:if>
				    		</c:forEach>
				    	，${p.reply_date}</small>
				    	</blockquote>
				    </c:if>
				</div>
				<a href="problem/delete?id=${p.id}"><button class="btn btn-lg btn-primary" type="submit">删除 &raquo;</button></a>
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
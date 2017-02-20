<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Loading Bootstrap -->
<link href="Flat-UI-master/dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Loading Flat UI -->
<link href="Flat-UI-master/dist/css/flat-ui.css" rel="stylesheet">
<link href="Flat-UI-master/docs/assets/css/demo.css" rel="stylesheet">

<link rel="shortcut icon" href="Flat-UI-master/img/favicon.ico">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="dist/js/vendor/html5shiv.js"></script>
  <script src="dist/js/vendor/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div class="container">
		<div class="login" style="margin-top: 50px;">
		  <div class="login-screen" style="padding: 123px 199px 33px 306px;">
		    <div class="login-icon">
		      <img src="Flat-UI-master/img/login/logo1.png" width="400px"/>
		    </div>
		   	<div class="login-form" style="height: 200px">
		   		<p style="color:#7f8c8d;font-size: 20px;font-style: italic;">申请将在一到两个工作日内进行审核，请耐心等待。</p>
		    </div>
		  </div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>

	<script src="Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
	<script src="Flat-UI-master/dist/js/vendor/video.js"></script>
	<script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
	<script src="Flat-UI-master/docs/assets/js/application.js"></script>
</body>
</html>
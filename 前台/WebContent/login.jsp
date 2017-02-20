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
		  <div class="login-screen" style="padding: 70px 199px 33px 306px;">
		    <div class="login-icon">
		      <img src="Flat-UI-master/img/login/logo1.png" width="400px"/>
		    </div>
		   <form role="form" action="user/login" method="post">
		   	<div class="login-form">
		      <div class="form-group">
		        <input type="text" class="form-control login-field" value="" placeholder="请输入账号" name="account" />
		        <label class="login-field-icon fui-user" for="login-name"></label>
		      </div>
		
		      <div class="form-group">
		        <input type="password" class="form-control login-field" value="" placeholder="请输入密码" name="password" />
		        <label class="login-field-icon fui-lock" for="login-pass"></label>
		      </div>
		      
		      <div class="form-group">
		        <img src="plugins/vcode/vcode.jsp" alt="看不清,换一张" id="codeImg" style="margin-right:5px;margin-bottom: -3px;cursor:pointer" onclick="random();"/>
		      </div>
		      
		      <div class="form-group">
		        <input class="form-control" placeholder="验证码" name="rand" type="text">
		      </div>
			  <button class="btn btn-primary btn-lg btn-block" type="submit">登录</button>
		      <a class="login-link" href="user/to_register">申请一个新的账号？</a>
		    </div>
		   </form>		    
		  </div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>

	<script src="Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
	<script src="Flat-UI-master/dist/js/vendor/video.js"></script>
	<script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
	<script src="Flat-UI-master/docs/assets/js/application.js"></script>
	<script type="text/javascript">
	function random() {
		document.getElementById("codeImg").setAttribute("src","plugins/vcode/vcode.jsp?time="+Math.random());
	}
	</script>
</body>
</html>
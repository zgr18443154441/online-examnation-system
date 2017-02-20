<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
		  <div class="login-screen"  style="padding: 20px 199px 33px 306px;">
		    <div class="login-icon">
		      <img src="Flat-UI-master/img/login/logo1.png" width="400px"/>
		    </div>
		   <form action="user/login" method="post">
		   	<div class="login-form">
		      <div class="form-group ">
		        <input type="text" class="form-control login-field" value="" placeholder="请输入账号 . . . " name="account" />
		        <label class="login-field-icon fui-user" for="login-name"></label>
		      </div>
		
		      <div class="form-group">
		        <input type="password" class="form-control login-field" value="" placeholder="请输入密码 . . ." name="password" />
		        <label class="login-field-icon fui-lock" for="login-pass"></label>
		      </div>
		       
		      <div class="form-group">
		        <img src="plugins/vcode/vcode.jsp" alt="看不清,换一张" id="codeImg" style="margin-right:5px;margin-bottom: -3px;cursor:pointer" onclick="random();"/>
		      </div>
		      
		      <div class="form-group">
		        <input id="rand" class="form-control login-field" placeholder="验证码" name="rand" type="text">
                <font id="randError" color="red"></font>
		      </div>
			  <button class="btn btn-primary btn-lg btn-block" type="submit">登录</button><br>
			  	<span class="fui-info-circle" style="color: #666;float: left;">&nbsp;</span>
			  	<span class="help-block" style="color: #c33">
			      	<c:if test="${message=='validate'}">验证码有误</c:if>
			      	<c:if test="${message=='error'}">账号或密码有误</c:if>
					<c:if test="${message=='1'}">账号审核中……</c:if>
					<c:if test="${message=='0'}">该账号暂无登录权限</c:if>
					<c:if test="${message=='4'}">账号审核未通过</c:if>
				</span>
				<a class="login-link" href="user/to_register">申请一个新的账号？</a>
		    </div>
		   </form>		    
		  </div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>

	<script src="Flat-UI-masterdist/dist/js/vendor/jquery.min.js"></script>
	<script src="Flat-UI-masterdist/dist/js/vendor/video.js"></script>
	<script src="Flat-UI-masterdist/dist/js/flat-ui.min.js"></script>
	<script src="Flat-UI-masterdist/docs/assets/js/application.js"></script>
	<script type="text/javascript">
	function random() {
		document.getElementById("codeImg").setAttribute("src","plugins/vcode/vcode.jsp?time="+Math.random());
	}
	</script>
</body>
</html>
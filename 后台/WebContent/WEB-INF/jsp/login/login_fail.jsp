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
	<title>Realm - Login</title>
	<link rel="shortcut icon" href="assets/ico/favicon.html">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    <link rel="Favicon Icon" href="favicon.ico">
</head>
<body>
	<div id="wrap">
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span12">
          	<div class="row-fluid">
				<div class="widget container-narrow">
					<div class="widget-header">
						<i class="icon-user"></i>
						<h5>登录后台</h5>
					</div>  
					<div class="widget-body clearfix" style="padding:25px;">
		      			<form action="user/login" method="post">
		      				<div style="padding:10px 0">
		      					<a style="" href="http://localhost:8080/school/login.jsp" class="btn btn-large btn-block btn-primary">四海兴唐学员考试系统前台</a>
		      				</div>
		      				<div class="divider">
		      					<span style="color:#955;font-size: 15px">
		      						<c:if test="${message=='validate'}">验证码有误</c:if>
		      						<c:if test="${message=='error'}">账号或密码有误</c:if>
		      						<c:if test="${message=='1'}">账号审核中，请耐心等待</c:if>
		      						<c:if test="${message=='0'}">该账号暂无登录权限</c:if>
		      						<c:if test="${message=='4'}">账号审核未通过</c:if>
		      					</span>
		      				</div>
							<div class="control-group">
								<div class="controls">
									<input name="account" class="btn-block error" type="text" id="inputEmail" placeholder="账号">
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<input name="password" class="btn-block error" type="password" id="inputPassword" placeholder="密码">
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<img src="plugins/vcode/vcode.jsp" alt="看不清,换一张" id="codeImg" style="margin-right:5px;margin-bottom: -3px;cursor:pointer" onclick="random();"/>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									 <input class="form-control" placeholder="验证码" name="rand" type="text">
								</div>
							</div>
							 <div class="control-group">
								<div class="controls clearfix">
									<label style="width:auto" class="checkbox pull-left">
										<input type="checkbox"> 记住我
									</label>
								</div>
							</div>					
							<button type="submit" class="btn pull-right">登录</button>
		      			</form>
					</div>  
				</div>  
      			<div style="text-align:center">
      				<p style="font-size: 10px"><em>提示：账号认证将在一般会在一到两个工作日内完成。</em></p>
      			</div>
        	</div><!--/row-fluid-->
        </div><!--/span10-->
      </div><!--/row-fluid-->
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->

   <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="assets/js/raphael-min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src='assets/js/sparkline.js'></script>
    <script type="text/javascript" src='assets/js/morris.min.js'></script>
    <script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.masonry.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.imagesloaded.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.facybox.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.alertify.min.js"></script> 
    <script type="text/javascript" src="assets/js/jquery.knob.js"></script>
    <script type='text/javascript' src='assets/js/fullcalendar.min.js'></script>
    <script type='text/javascript' src='assets/js/jquery.gritter.min.js'></script>
    <script type="text/javascript" src="assets/js/realm.js"></script>
    <script type="text/javascript">
    function random() {
		document.getElementById("codeImg").setAttribute("src","plugins/vcode/vcode.jsp?time="+Math.random());
	}
    </script>
</body>
</html>
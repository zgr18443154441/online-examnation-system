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
	<title>Realm - Login</title>
	<link rel="shortcut icon" href="assets/ico/favicon.html">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    <link rel="Favicon Icon" href="favicon.ico">
    <link href="assets/css/colorpicker.css" rel="stylesheet">
    <link href="assets/css/datepicker.css" rel="stylesheet">
    <link href="assets/css/timepicker.css" rel="stylesheet">
    <link href="assets/css/select2.css" rel="stylesheet">
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
		      					<hr class="pull-left"><span>or</span><hr class="pull-right">
		      				</div>
							<div class="control-group">
								<div class="controls">
									<input name="account" class="btn-block" type="text" id="inputEmail" placeholder="账号">
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<input name="password" class="btn-block" type="password" id="inputPassword" placeholder="密码">
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
      				<p>还未申请？ <a href="register.jsp">申请一个新账户</a></p>
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
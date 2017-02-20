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
	<title>Realm - REgister</title>
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
						<i class="icon-edit"></i>
						<h5>教师账号申请</h5>
					</div>  
					<div class="widget-body clearfix" style="padding:25px;">
						<form action="user/add" method="post">
		      				<div style="padding:10px 0">
		      					<a style="" href="http://localhost:8080/school/login.jsp" class="btn btn-large btn-block btn-primary">四海兴唐学员考试系统前台</a>
		      				</div>
		      				<div class="divider">
		      					<hr class="pull-left"><span>or</span><hr class="pull-right">
		      				</div>

							<div class="control-group ">
								<label for="form_email">姓名:</label>
								<div class="controls"><input class="btn-block" type="text" name="NAME" id="name" onblur="built_account(this);"></div>
							</div>	
							
							<div class="control-group ">
								<label for="form_username">用户名:</label>
								<div class="controls"><input class="btn-block" type="text" name="account" id="account"></div>
							</div>

							<div class="control-group ">
								<label for="form_password">密码:</label>
								<div class="controls"><input class="btn-block" type="password" name="password" id="form_password"></div>
							</div>
							
							<div class="control-group ">
								性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								男&nbsp;&nbsp;<input class="btn" type="radio" name="sex" checked="checked" value="1">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								女&nbsp;&nbsp;<input class="btn" type="radio" name="sex" value="0">
							</div>	
							<div class="control-group ">
								权限:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								教师&nbsp;&nbsp;<input class="btn" type="radio" name="user_type" checked="checked" value="1">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								管理员&nbsp;&nbsp;<input class="btn" type="radio" name="user_type" value="2">
							</div>	
							
							<br><br>	
								<div style="text-align: center;">
								<button type="submit" class="btn btn-large">确认</button>&nbsp;&nbsp;
								<button type="reset" class="btn btn-large">清空</button>
							</div>
						</form>
					</div>  
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
    function built_account(obj){
		var name = $(obj).val();
		$.post("user/built_account",{"name":name},function(account){
			$("#account").val(account);
		})
	}
    </script>
</body>
</html>
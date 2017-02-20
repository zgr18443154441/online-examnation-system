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
		  <div class="login-screen" style="padding: 50px 199px 33px 306px;">
		    <div class="login-icon">
		      <img src="Flat-UI-master/img/login/logo.png" width="400px"/>
		    </div>
		   <form role="form" action="user/register" method="post" onsubmit="return check();">
		   	<div class="login-form">
		      <div class="form-group">
		        <input id="real_name" type="text" class="form-control login-field" placeholder="请输入真实姓名" name="NAME" onblur="built_account(this);"/>
		        <label class="login-field-icon fui-tag" for="login-tag"></label>
		      </div>
		      
		      <div class="form-group">
		        <input id="account" type="text" class="form-control login-field" placeholder="请输入新账号" name="account" />
		        <label class="login-field-icon fui-user" for="login-name"></label>
		      </div>
		
		      <div class="form-group">
		        <input id="password" type="password" class="form-control login-field" placeholder="请输入新密码" name="password" />
		        <label class="login-field-icon fui-lock" for="login-pass" onclick="check_password(this);"></label>
		      </div>
		      
		      <div class="form-group">
		        <input type="checkbox" checked data-toggle="switch" name="sex_message" data-on-text="男" data-off-text="女" id="switch-10" />
		      </div>
		      
		      	<div class="form-group">
	              <select id="group_id" data-toggle="select" class="form-control select select-default" name="group_id">
	                <option value="">请选择所在班级</option>
	                <c:forEach items="${groups}" var="g">
	                	<option value="${g.id}">${g.NAME}</option>
	                </c:forEach>
	              </select>
	            </div>
			  <div style="text-align: center;">
			  	<button class="btn btn-info btn-wide" type="submit">提交</button>
			  	<button class="btn btn-default btn-wide" type="reset">清空</button>
			  </div>
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
		function check_password(obj){
			if($(obj).attr("class")=="login-field-icon fui-lock"){
				$(obj).attr("class","login-field-icon fui-eye");
				$(obj).prev().attr("type","text");
			}else{
				$(obj).attr("class","login-field-icon fui-lock");
				$(obj).prev().attr("type","password");
			}
		}
		function check(){
			if($("#real_name").val()==""){alert("姓名不能为空");return false;}
			if($("#account").val()==""){alert("账号不能为空");return false;}
			if($("#password").val()==""){alert("密码不能为空");return false;}
			if($("#group_id").val()==""){alert("所在班级不能为空");return false;}
			return true;
		}
		function built_account(obj){
			var name = $(obj).val();
			$.post("user/built_account",{"name":name},function(account){
				$("#account").val(account);
			})
		}
	</script>
</body>
</html>
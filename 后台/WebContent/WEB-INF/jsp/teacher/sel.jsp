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
<title>Realm - Dashboard</title>
<link rel="shortcut icon" href="assets/ico/favicon.html">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    
    <link rel="Favicon Icon" href="favicon.ico">
</head>
<body>
	<div id="wrap">
    <!-- 顶栏 -->
    <jsp:include page="/WEB-INF/jsp/surrounding/top.jsp"></jsp:include>

    <div class="container-fluid">
     
     <!-- 侧栏 -->
     <jsp:include page="/WEB-INF/jsp/surrounding/manager_side.jsp"></jsp:include>

      <!-- Main window -->
      <div class="main_container" id="users_page">
		<div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>用户管理<span class="divider">/</span></li>
            <li class="active">教师管理</li>
          </ul>
          <h2 class="heading">教师信息</h2>
        </div> <!-- /row-fluid -->

        <div class="row-fluid">
          <div class="widget widget-padding span8">
            <div class="widget-header">
              <i class="icon-user"></i>
              <h5>教师表</h5>
            </div>  
            <div class="widget-body">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>照片</th>
                    <th>注册日期</th>
                    <th>权限</th>
                    <th>状态</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${checked}" var="c">
                  	<tr>
	                    <td>${c.NAME}</td>
	                    <td>
	                    	<c:if test="${c.sex==1}">男</c:if>
		                  	<c:if test="${c.sex==0}">女</c:if>
	                    </td>
	                    <td>
	                    	<img alt="未上传" src="upload/${c.photo}">
	                    </td>
	                    <td>${c.register_date}</td>
	                    <td>
	                    	<c:if test="${c.user_type==1}">教师</c:if>
		                  	<c:if test="${c.user_type==2}">管理员</c:if>
	                    </td>
	                    <td>
	                    	<c:if test="${c.state==2}"><span class="label label-success">启用中</span></c:if>
	                    	<c:if test="${c.state==0}"><span class="label">停用中</span></c:if>
	                    </td>
	                    <td>
	                      <div class="btn-group">
	                        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
	                        	操作
	                          <span class="caret"></span>
	                        </a>
	                        <ul class="dropdown-menu pull-right">
	                          <c:if test="${c.state==2}">
	                          	<li><a href="user/remove_right?teacher_id=${c.id}"><i class="icon-envelope"></i> 停用</a></li>
	                          </c:if>
	                          <c:if test="${c.state==0}">
	                          	<li><a href="user/recover_right?teacher_id=${c.id}"><i class="icon-edit"></i> 启用</a></li>
	                          </c:if>
	                        </ul>
	                      </div>
	                    </td>
	                </tr>
                  </c:forEach>
                </tbody>
              </table>
              <br><br>
            </div> <!-- /widget-body -->
          </div> <!-- /widget -->
          <div class="widget widget-padding span4">
            <div class="widget-header">
              <i class="icon-calendar"></i>
              <h5>教师申请</h5>
            </div>  
            <div class="widget-body">
              <table class="table">
                <thead>
                  
                <tr>
                  <th>姓名</th>
                  <th>性别</th>
                  <th>申请时间</th>
                  <th>申请权限</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>
	             	<c:forEach items="${unchecked}" var="u">
	             		<tr>
			                <td>${u.NAME}</td>
			                <td>
			                	<c:if test="${u.sex==1}">男</c:if>
		                  		<c:if test="${u.sex==0}">女</c:if>
			                </td>
			                <td>${u.apply_date}</td>
			                <td>
			                	<c:if test="${u.user_type==1}">教师</c:if>
		                  		<c:if test="${u.user_type==2}">管理员</c:if>
			                </td>
			                <td>
			                	<input type="hidden" value="${u.id}">
				                <button class="btn btn-success btn-small" onclick="accept(this);"><i class="icon-ok"></i></button>
				                <button class="btn btn-danger btn-small" onclick="refuse(this);"><i class="icon-remove"></i></button>  
			                </td>
		                </tr> 
	             	</c:forEach>
                </tbody>
              </table>
              <br><br>
            </div>
          </div>
        </div> <!-- /row-fluid -->
      </div>
      <!-- /Main window -->
      
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
    <script type="text/javascript" src="assets/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript">
		function accept(obj){
			var id = $(obj).prev().val();
			$.post("user/accept",{"id":id},null);
			$(obj).parent().html("通过");
		}
		function refuse(obj){
			var id = $(obj).prev().prev().val();
			$.post("user/refuse",{"id":id},null);
			$(obj).parent().html("拒绝");
		}
	</script>
</body>
</html>
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
     <c:if test="${user_type==1}">
     	<jsp:include page="/WEB-INF/jsp/surrounding/teacher_side.jsp"></jsp:include>
     </c:if>
     <c:if test="${user_type==2}">
     	<jsp:include page="/WEB-INF/jsp/surrounding/manager_side.jsp"></jsp:include>
     </c:if>

      <!-- Main window -->
      <div class="main_container" id="users_page">

        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>用户管理<span class="divider">/</span></li>
            <li class="active">学生管理</li>
          </ul>
          <h2 class="heading">学员信息</h2>
        </div> <!-- /row-fluid -->

        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-group"></i>
              <h5>学生表</h5>
            </div>  
            <div class="widget-body" style="min-height: 250px;">
              <table class="table table-striped table-bordered dataTable">
                <thead>
                  <tr>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>班级</th>
                    <th>照片</th>
                    <th>状态</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${students}" var="s">
	                  <tr>
		                  <td>${s.NAME}</td>
		                  <td>
		                  	<c:if test="${s.sex==1}">男</c:if>
		                  	<c:if test="${s.sex==0}">女</c:if>
		                  </td>
		                  <td>
		                  	<c:forEach items="${groups}" var="g">
		                  		<c:if test="${g.id==s.group_id}">${g.NAME}</c:if>
		                  	</c:forEach>
		                  </td>
		                  <td>
		                  	<img alt="未上传" src="upload/${s.photo}">
		                  </td>
		                  <td>
		                  	<c:if test="${s.state==2}"><span class="label label-success">已审核</span></c:if>
		                  	<c:if test="${s.state==1}"><span class="label">未审核</span></c:if>
		                  </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
	             <div class="btn-group pull-right">
	             	<br><br>
	             	 <c:if test="${page.index-1>=3}">
	              	<a href="user/page?index=${page.index-3}"><button type="button" class="btn">&nbsp;<i class=" icon-double-angle-left"></i></button></a>
	              </c:if>
	              <c:if test="${page.index-1>=1}">
	              	<a href="user/page?index=${page.index-1}"><button type="button" class="btn">&nbsp;<i class="icon-chevron-left"></i></button></a>
	              </c:if>
	              <a><button class="btn" disabled="disabled">${page.index}</button></a>
	              <c:if test="${page.index+1<=page.all}">
	              	<a href="user/page?index=${page.index+1}"><button type="button" class="btn"><i class=" icon-chevron-right"></i>&nbsp;</button></a>
	              </c:if>
	              <c:if test="${page.index+3<=page.all}">
	              	<a href="user/page?index=${page.index+3}"><button type="button" class="btn"><i class="  icon-double-angle-right"></i>&nbsp;</button></a>
	           		</c:if>
	           	</div>
	           	<br>
	           	<br>
	           	<br>
            </div> <!-- /widget-body -->
          </div> <!-- /widget -->
        </div> <!-- /row-fluid -->

      </div>
      <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->


    <!-- example modal -->
    <div id="example_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Support Ticket</h3>
      </div>
      <div class="modal-body">
        <p>Here you can view and manage this support ticket.</p>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
      </div>
    </div> 

    <!-- example modal -->
    <div id="example_modal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Example Modal</h3>
      </div>
      <div class="modal-body">
        <p>Here you can write more information about the object you clicked</p>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
      </div>
    </div> 



    <!-- task_modal modal -->
    <div id="task_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Task info example</h3>
      </div>
      <div class="modal-body">
        <div class="clearfix">
          <img src="assets/img/avatars/11.jpg" class="img-circle" style="float: left; width: 65px; margin-right: 20px;">
           <h3 style="margin:0">John</h3>
           <p class="muted">Marketing</p>
        </div>
        <hr>
        <h5>Task</h5>
        <p>Create a marketing plan for the new campaign</p>
        <h5>status&nbsp;&nbsp;<small>60%</small></h5>
        <div class="progress">
          <div class="bar" style="width: 60%;"></div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div> 



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
</body>
</html>
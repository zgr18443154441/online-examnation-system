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
     <jsp:include page="/WEB-INF/jsp/surrounding/teacher_side.jsp"></jsp:include>

      <!-- Main window -->
      <div class="main_container" id="tasks_page">
        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>用户管理<span class="divider">/</span></li>
            <li class="active">班级管理</li>
          </ul>
          <h2 class="heading">班级信息</h2>
        </div>

		<c:forEach items="${groups}" var="g">
			<div class="widget widget-padding span12">
	          <div class="widget-header">
	            <i class="icon-group"></i>
	            <h5>${g.NAME}（${g.student_number}人）</h5>
	            <div class="widget-buttons">
	                <a href="javascript:void(0)" class="collapse" data-collapsed="false"><i data-title="Collapse" class="icon-chevron-up"></i></a>
	            </div>
	          </div>
	          <div class="widget-body clearfix" id="widget-tasks">
	            <div class="widget-tasks-statistics">
	            	<c:forEach items="${g.students}" var="s">
		              <div class="userstats clearfix" style="margin-top: 25px;">
		                  <a href="javascript:void(0)" data-toggle="modal" data-target="#${s.id}">
		                  <c:if test="${photo==null}"><img src="assets/img/people.jpg" class="image"></c:if>
						  <c:if test="${photo!=null}"><img src="upload/${photo}" class="image"></c:if>
		                  <div class="widget">
		                    <input class="knob" data-width="75" data-height="75" data-displayInput=false data-readOnly=true data-thickness=".1" value="100">   
		                  </div>
		                  <p>${s.NAME}</p>
		                </a>
		              </div>
	            	</c:forEach>
		        </div>
	          </div>
	        </div>
		</c:forEach>        
        
      </div>
      <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->


    <!-- 学生模态框 -->
    <c:forEach items="${groups}" var="g">
    	<c:forEach items="${g.students}" var="s">
    		<div id="${s.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		        <h3 id="myModalLabel">${s.NAME}
		        	<c:if test="${s.sex==0}">（女）</c:if>
		        	<c:if test="${s.sex==1}">（男）</c:if>
		        </h3>
		      </div>
		      <div class="modal-body">
		        <p>申请日期：${s.apply_date}</p>
		        <p>注册日期：${s.register_date}</p>
		      </div>
		      <div class="modal-footer">
		        <c:if test="${s.state==0}">
		        <button class="btn" data-dismiss="modal" aria-hidden="true">已删除</button>
		        </c:if>
		        <c:if test="${s.state==2}">
		        <a href="user/delete_student?id=${s.id}"><button class="btn">删除</button></a>
		        </c:if>
		        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		      </div>
		    </div> 
    	</c:forEach>
    </c:forEach>


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
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
            <li class="active">课程管理</li>
          </ul>
        </div> <!-- /row-fluid -->

          <div class="row-fluid">

            <div class="widget widget-padding span6">
              <div class="widget-header">
                <i class="icon-table"></i>
                <h5>课程</h5>
                <div class="widget-buttons">
                </div>
              </div>
              <div class="widget-body" style="height: 100px;">
              	<div class="row-fluid" style="margin-bottom:15px;">
                  <a class="btn btn-box span3" href="book/to_add?type=1" data-bubble="2"><i class="icon-plus"></i><span>增加</span></a>
                  <c:if test="${message.course==1}">
                  	  <a class="btn btn-box span3" href="book/to_sel?type=1" data-bubble="2"><i class="icon-eye-open"></i><span>查看</span></a>
	                  <a class="btn btn-box span3" href="book/to_manage_sel?type=1&style=1" data-bubble="2"><i class=" icon-edit"></i><span>修改</span></a>
	                  <a class="btn btn-box span3" href="book/to_manage_sel?type=1&style=2" data-bubble="2"><i class="icon-trash"></i><span>删除</span></a>
                  </c:if>
              	</div>	
              </div><!--/widget-body-->
            </div><!-- /widget -->
            
			<c:if test="${message.course==1}">
	            <div class="widget widget-padding span6">
	              <div class="widget-header">
	                <i class=" icon-th-large"></i>
	                <h5>学期</h5>
	                <div class="widget-buttons">
	                </div>
	              </div>
	              <div class="widget-body" style="height: 100px;">
	              	<div class="row-fluid" style="margin-bottom:15px;">
	                  <a class="btn btn-box span3" href="book/to_add?type=2" data-bubble="2"><i class="icon-plus"></i><span>增加</span></a>
	                  <c:if test="${message.phase==1}">
	                  	  <a class="btn btn-box span3" href="book/to_sel?type=2" data-bubble="2"><i class="icon-eye-open"></i><span>查看</span></a>
		                  <a class="btn btn-box span3" href="book/to_manage_sel?type=2&style=1" data-bubble="2"><i class=" icon-edit"></i><span>修改</span></a>
		                  <a class="btn btn-box span3" href="book/to_manage_sel?type=2&style=2" data-bubble="2"><i class="icon-trash"></i><span>删除</span></a>
	                  </c:if>
	              	</div>	
	              </div><!--/widget-body-->
	            </div><!-- /widget -->
			</c:if>
          </div><!-- /row-fluid -->
          
          
          <div class="row-fluid">
			<c:if test="${message.phase==1}">
	            <div class="widget widget-padding span6">
	              <div class="widget-header">
	                <i class="icon-th"></i>
	                <h5>章节</h5>
	                <div class="widget-buttons">
	                </div>
	              </div>
	              <div class="widget-body" style="height: 100px;">
	              	<div class="row-fluid" style="margin-bottom:15px;">
	                  <a class="btn btn-box span3" href="book/to_add?type=3" data-bubble="2"><i class="icon-plus"></i><span>增加</span></a>
	                  <c:if test="${message.chapter1==1}">
	                  	  <a class="btn btn-box span3" href="book/to_sel?type=3" data-bubble="2"><i class="icon-eye-open"></i><span>查看</span></a>
		                  <a class="btn btn-box span3" href="book/to_manage_sel?type=3&style=1" data-bubble="2"><i class=" icon-edit"></i><span>修改</span></a>
		                  <a class="btn btn-box span3" href="book/to_manage_sel?type=3&style=2" data-bubble="2"><i class="icon-trash"></i><span>删除</span></a>
	                  </c:if>
	              	</div>	
	              </div><!--/widget-body-->
	            </div><!-- /widget -->
            </c:if>
			<c:if test="${message.chapter1==1}">
	            <div class="widget widget-padding span6">
	              <div class="widget-header">
	                <i class="icon-th-list"></i>
	                <h5>小节</h5>
	                <div class="widget-buttons">
	                </div>
	              </div>
	              <div class="widget-body" style="height: 100px;">
	              	<div class="row-fluid" style="margin-bottom:15px;">
	                  <a class="btn btn-box span3" href="book/to_add?type=4" data-bubble="2"><i class="icon-plus"></i><span>增加</span></a>
	                  <c:if test="${message.chapter2==1}">
	                  	  <a class="btn btn-box span3" href="book/to_sel?type=4" data-bubble="2"><i class="icon-eye-open"></i><span>查看</span></a>
		                  <a class="btn btn-box span3" href="book/to_manage_sel?type=4&style=1" data-bubble="2"><i class=" icon-edit"></i><span>修改</span></a>
		                  <a class="btn btn-box span3" href="book/to_manage_sel?type=4&style=2" data-bubble="2"><i class="icon-trash"></i><span>删除</span></a>
	                  </c:if>
	              	</div>	
	              </div><!--/widget-body-->
	            </div><!-- /widget -->
			</c:if>
          </div><!-- /row-fluid -->

      
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
</body>
</html>
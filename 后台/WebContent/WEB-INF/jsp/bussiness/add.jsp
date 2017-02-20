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
    <link href="assets/css/colorpicker.css" rel="stylesheet">
    <link href="assets/css/datepicker.css" rel="stylesheet">
    <link href="assets/css/timepicker.css" rel="stylesheet">
    <link href="assets/css/select2.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
    <!-- 顶栏 -->
    <jsp:include page="/WEB-INF/jsp/surrounding/top.jsp"></jsp:include>

    <div class="container-fluid">
     
    <!-- 侧栏 -->
   	<jsp:include page="/WEB-INF/jsp/surrounding/teacher_side.jsp"></jsp:include>

      <!-- Main window -->
      <div class="main_container" id="forms_page">
        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>班级管理<span class="divider">/</span></li>
            <li class="active">发布公告</li>
          </ul>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-file"></i><h5>发布新的公告</h5>
            </div>
           <form class="form-horizontal" action="bussiness/add" method="post">
           	<input type="hidden" name="teacher_id" value="${id}">
            <div class="widget-body">
              <div class="widget-forms clearfix">
	              <div class="control-group">
	                <label class="control-label">公告内容</label>
	                <div class="controls">
	                  <div class="controls">
                        <textarea class="editor" style="width:700px;height:300px;" name="content"></textarea>
                      </div>
	                </div>
	              </div>
	              <div class="control-group">
                    <label class="control-label">适用班级</label>
                    <div class="controls">
                      <c:forEach items="${groups}" var="g">
						  <label class="checkbox">
						  <input type="checkbox" name="groups" value="${g.id}">
						    ${g.NAME}
						  </label>
                      </c:forEach>
                    </div>
                  </div>
	          </div>
	        </div>  
            <div class="widget-footer">
               <button class="btn btn-primary" type="submit">确定</button>
               <button class="btn" type="reset">清空</button>
            </div>
          </form>
        </div>
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
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/simple.js"></script>
    <script type="text/javascript" src="assets/js/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-timepicker.js"></script>
    
</body>
</html>
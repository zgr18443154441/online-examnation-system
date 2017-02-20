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
    <div class="main_container" id="users_page">
	<div class="row-fluid">
        <ul class="breadcrumb">
          <li>主页<span class="divider">/</span></li>
          <li>考试管理<span class="divider">/</span></li>
          <li class="active">试卷档案</li>
        </ul>
        <h2 class="heading">查看试卷</h2>
      </div> <!-- /row-fluid -->
        
        <div class="row-fluid">
          <div class="widget widget-padding span12" >
            <div class="widget-header">
              <i class="icon-user"></i>
              <h5>试卷表</h5>
            </div>  
            <div class="widget-body" style="min-height: 150px;">
			   	<table class="table table-striped table-bordered dataTable">
			     <thead>
			       <tr>
			         <th>标题</th>
			         <th>总分</th>
			         <th>单选题</th>
			         <th>多选题</th>
			         <th>判断题</th>
			         <th>填空题</th>
			         <th>简答题</th>
			         <th>编程题</th>
			         <th>考试日期</th>
			         <th>开始时间</th>
			         <th>结束时间</th>
			         <th>考试班级</th>
			         <th>操作</th>
			       </tr>
			     </thead>
			     <tbody id="chapter2_table">
			     	<c:forEach items="${examnations}" var="e">
			     		<tr>
				        <td>${e.title}</td>
				        <td>
				        	<c:forEach items="${sum_scores}" var="sum">
				        		<c:if test="${sum.key==e.id}">${sum.value}</c:if>
				        	</c:forEach>
				        </td>
				        <td>${e.single_choice_number}</td>
				        <td>${e.multiple_choice_number}</td>
				        <td>${e.judge_number}</td>
				        <td>${e.filling_blank_number}</td>
				        <td>${e.short_answer_number}</td>
				        <td>${e.programme_number}</td>
				        <td>${e.text_date}</td>
				        <td>${e.start_time}</td>
				        <td>${e.end_time}</td>
				        <td>
				        	<select tabindex="1" data-placeholder="Select here.." class="span12">
				        		<c:forEach items="${e.groups}" var="g">
	                           		<option value="${g.id}">${g.NAME}</option>
				        		</c:forEach>
	                        </select>
				        </td>
				           <td>
				            <div class="btn-group">
				             <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
				             	操作
				             	<span class="caret"></span>
				             </a>
				              <ul class="dropdown-menu pull-right">
				              	<li><a href="examnation/to_sel?id=${e.id}"><i class="icon-file-alt"></i>查看试卷</a></li>
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
</body>
</html>
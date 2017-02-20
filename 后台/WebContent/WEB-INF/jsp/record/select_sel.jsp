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
          <li class="active">考试记录</li>
        </ul>
        <h2 class="heading">试卷档案</h2>
      </div> <!-- /row-fluid -->
      
      <div class="row-fluid">
       <div class="widget widget-padding span8">
         <div class="widget-header">
           <i class="icon-file-alt"></i>
           <h5>试卷表</h5>
         </div>  
         <div class="widget-body" style="height: 290px;">
           <table class="table table-striped">
             <thead>
               <tr>
                 <th>试卷标题</th>
		         <th>考试日期</th>
		         <th>开始时间</th>
		         <th>结束时间</th>
		         <th>考试班级</th>
		         <th>应考人数</th>
		         <th>操作</th>
               </tr>
             </thead>
             <tbody>
               <c:forEach items="${examnations}" var="e">
	     		<tr>
		        <td>${e.title}</td>
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
		        	<c:forEach items="${e.groups}" var="g">
		        		<c:set value="${sum+g.student_number}" var="sum"></c:set>
		        	</c:forEach>
		        	${sum}
		        </td>
	           <td>
	            <div class="btn-group">
	             <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
	             	操作
	             	<span class="caret"></span>
	             </a>
	              <ul class="dropdown-menu pull-right">
	              	<li>
	              		<input type="hidden" value="${e.id}">
	              		<a href="javascript:void(0);" onclick="change_record(this);"><i class="icon-file-alt"></i>考试记录</a>
	              		<a href="javascript:void(0);" data-toggle="modal" data-target="#${e.id}"><i class="icon-bar-chart"></i>数据分析</a>
	              	</li>
	              </ul>
	            </div>
	           </td>
	      	</tr>
	     	</c:forEach>
           </tbody>
          </table>
        </div> <!-- /widget-body -->
       </div> <!-- /widget -->
       <div class="widget widget-padding span4">
         <div class="widget-header">
           <i class="icon-calendar"></i>
           <h5>考试记录</h5>
           <div class="widget-buttons">
               <a href="javascript:void(0);" data-title="Collapse" data-collapsed="false" class="collapse"><i class="icon-chevron-up"></i></a>
           </div>
         </div>  
         <div class="widget-body" style="height: 290px;">
           <table class="table">
             <thead>
	             <tr>
	               <th>姓名</th>
	               <th>总分</th>
	               <th>用时</th>
	               <th>操作</th>
	             </tr>
             </thead>
             <tbody id="record"></tbody>
           </table>
         </div>
       </div>
     </div> <!-- /row-fluid -->  
    </div>
    <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->

	<!-- 考试模态框 -->
    <c:forEach items="${examnations}" var="e">
   		<div id="${e.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        <h3 id="myModalLabel">数据分析</h3>
	      </div>
	      <div class="modal-body">
	        <p>最高分：${e.max_score}（
	        	<c:forEach items="${students}" var="s">
	        		<c:if test="${s.id==e.max_id}">${s.NAME}</c:if>
	        	</c:forEach>）
	        </p>
	        <p>最低分：${e.min_score}（
	        	<c:forEach items="${students}" var="s">
	        		<c:if test="${s.id==e.min_id}">${s.NAME}</c:if>
	        	</c:forEach>）
	        </p>
	        <p>平均分：${e.average_score}</p>
	      </div>
	      <div class="modal-footer">
	        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	      </div>
	    </div> 
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
    <script type="text/javascript">
    	function change_record(obj){
    		var id = $(obj).prev().val();
    		$.post("record/search_student_examnation",{"examnation_id":id},function(student_examnations){
   				$("#record").empty();
    			for(var i=0 ; i<student_examnations.length; i++){
    				$("#record").append("<tr><td>" + student_examnations[i].user.name + "</td><td>" + student_examnations[i].scores + "</td><td>" + student_examnations[i].time + "</td><td><a href='record/sel_record?examnation_id=" + id + "&student_id=" + student_examnations[i].student_id + "'><button class='btn btn-success btn-small'>查看试卷</button><a/></td></tr>");
    			}
    		})
    	}
    </script>
</body>
</html>
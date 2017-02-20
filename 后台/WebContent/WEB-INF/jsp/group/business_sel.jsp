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
            <li>主页 <span class="divider">/</span></li>
            <li>用户管理 <span class="divider">/</span></li>
            <li class="active">班级管理</li>
          </ul>
          <h2 class="heading">班级信息</h2>
        </div>

		<div class="row-fluid">
          <div class="widget span8">
            <div class="widget-header">
              <i class="icon-question-sign"></i>
              <h5>学生提问</h5>
            </div>
            <div class="widget-body clearfix" style="min-height: 200px">
              <div class="widget-tasks-assigned">
                <ul>
                  <c:forEach items="${problems}" var="p">
                  	<li class="priority-high-left">
	                   <a href="#" data-toggle="modal" data-target="#example_modal">
	                     <div class="content">
	                      <h5>
	                      	<c:forEach items="${students}" var="s">
	                      		<c:if test="${s.id==p.student_id}">
	                      			${s.NAME}
	                      		</c:if>
	                      	</c:forEach>
	                      </h5>
	                      <span>${p.consult}</span>
	                     </div>
	                     <ul class="rightboxes">
	                       <li>${p.consult_date}</li>
	                       <li>
	                       		<c:if test="${p.reply!=null}">
	                       			已回复
	                       		</c:if>
	                       		<c:if test="${p.reply==null}">
	                       			<input type="hidden" value="${p.id}">
	                       			<button class="btn btn-primary" type="button" onclick="reply(this);">回复</button>
	                       		</c:if>
	                       </li>
	                     </ul>
	                     <div class="info">
	                       <div class="date">${p.about}</div>
	                     </div>
	                   </a>
	                   <div class="progress">
	                     <div style="width: 100%;" class="bar"></div>
	                   </div>
	                </li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
            <div class="widget widget-padding span4">
              <div class="widget-header">
                <i class="icon-bar-chart"></i>
                <h5>学生申请</h5>
                <div class="widget-buttons">
	                <a href="javascript:void(0)" class="collapse" data-collapsed="false"><i data-title="Collapse" class="icon-chevron-up"></i></a>
	            </div>
              </div>
              <div class="widget-body clearfix" style="min-height: 200px" id="widget-tasks">
                <div class="widget-tasks-statistics">
                  <c:forEach items="${groups}" var="g">
                  	<c:forEach items="${g.students}" var="s">
                  	  <div class="userstats clearfix" style="margin-top: 25px;">
	                      <a href="javascript:void(0)" data-toggle="modal" data-target="#${s.id}">
	                      <img src="assets/img/people.jpg" class="image">
	                      <div class="widget">
	                        <input class="knob" data-width="75" data-height="75" data-displayInput=false data-readOnly=true data-thickness=".1" value="100">   
	                      </div>
	                      <p>${s.NAME}</p>
	                    </a>
	                  </div>
                  	</c:forEach>
                  </c:forEach>
                </div>
              </div>
            </div>
        </div>
		<div class="row-fluid" id="reply" style="display: none;">
            <div class="widget widget-padding span8">
	             <div class="widget-header">
	                <i class="icon-edit"></i>
	                <h5>答复提问</h5>
	                <div class="widget-buttons">
	                    <a href="javascript:void(0)" class="collapse" data-collapsed="false"><i data-title="Collapse" class="icon-chevron-up"></i></a>
	                </div>
	             </div>
	             <div class="widget-body clearfix" style="padding: 0;" id="widget-tasks">
	             	<div class="controls">
                      <textarea class="editor" style="width:832px;"></textarea>
                    </div>
	             </div>
	             <div class="widget-footer">
	               <button class="btn btn-primary" type="button" onclick="upload();">确定</button>
	               <button class="btn" type="reset">清空</button>
	             </div>
            </div>
        </div>
		        
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
		      </div>
		      <div class="modal-footer">
		        <a href="group/accept?id=${s.id}"><button class="btn btn-primary">通过</button></a>
		        <a href="group/refuse?id=${s.id}"><button class="btn btn-primary">拒绝</button></a>
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
    <script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/simple.js"></script>
    <script type="text/javascript" src="assets/js/select2.min.js"></script>
    <script type="text/javascript">
    var problem_id;
   	function reply(obj){
   		problem_id = $(obj).prev().val();
   		$("#reply").removeAttr("style");
   		$(obj).attr("disabled","disabled");
   	}
   	function upload(){
   		$.post("problem/reply",{"problem_id":problem_id,"reply":$(".editor").eq(0).val()},null)
   		$("#reply").attr("style","display: none;");
   	}
    </script>
</body>
</html>
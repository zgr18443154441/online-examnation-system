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
         <li>考试管理<span class="divider">/</span></li>
         <li class="active">考试记录</li>
       </ul>
       <h2 class="heading">
     	学生答卷      
       </h2>
     </div>
      
     <div class="row-fluid">
       <div class="widget span12" style="overflow:visible;">
             <a class="btn btn-box bubble bubble-danger span2 tips" data-title="bubble-danger" href="javascript:void(0);" data-bubble="${examnation.single_choice_number}" onclick="sc();"><i class="icon-cog"></i><span>单选题</span></a>
             <a class="btn btn-box bubble bubble-success span2 tips" data-title="bubble-success" href="javascript:void(0);" data-bubble="${examnation.multiple_choice_number}" onclick="mc();"><i class="icon-cogs"></i><span>多选题</span></a>
             <a class="btn btn-box bubble bubble-info span2 tips" data-title="bubble-info" href="javascript:void(0);" data-bubble="${examnation.judge_number}" onclick="j();"><i class="icon-check"></i><span>判断题</span></a>
             <a class="btn btn-box bubble bubble-danger span2 tips" data-title="bubble-danger" href="javascript:void(0);" data-bubble="${examnation.filling_blank_number}" onclick="fb();"><i class="icon-edit"></i><span>填空题</span></a>
             <a class="btn btn-box bubble bubble-success span2 tips" data-title="bubble-success" href="javascript:void(0);" data-bubble="${examnation.short_answer_number}" onclick="sa();"><i class="icon-comment"></i><span>简答题</span></a>
             <a class="btn btn-box bubble bubble-info span2 tips" data-title="bubble-info" href="javascript:void(0);" data-bubble="${examnation.programme_number}" onclick="p();"><i class="icon-laptop"></i><span>编程题</span></a>
       </div><!-- /widget -->
     </div><!-- /row-fluid -->
     <!-- 单选题 -->
  	 <div class="row-fluid" id="sc" style="display: none;">
		<div class="widget widget-padding span12">
			<div class="widget-header">
					<i class="icon-cog"></i>
					<h5>单选题<span style="font-size: 10px">（绿色为正确选项，方括号内为学生作答）</span></h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==1}">
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>
					.${q.content}&nbsp;&nbsp;&nbsp;</h5>
					<section class="row-fluid">
						<c:forEach items="${q.right_choice}" var="rc">
							<div class="span3">
					          <p>  
					            <span class="help-block" style="color: #595">
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==rc.id}">【</c:if></c:forEach>
					            	${rc.content}
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==rc.id}">】</c:if></c:forEach>
					            </span>
					          </p>			
							</div>
						</c:forEach>
						<c:forEach items="${q.wrong_choice}" var="wc">
							<div class="span3">
					          <p>  
					            <span class="help-block">
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==wc.id}">【</c:if></c:forEach>
					            	${wc.content}
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==wc.id}">】</c:if></c:forEach>
					            </span>
					          </p>			
							</div>
						</c:forEach>
					</section>
				</c:if>
			</c:forEach>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->  
	 <!-- 多选题 -->
  	 <div class="row-fluid" id="mc">
		<div class="widget widget-padding span12">
			<div class="widget-header">
					<i class="icon-cogs"></i>
					<h5>多选题<span style="font-size: 10px">（绿色为正确选项，方括号内为学生作答）</span></h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==2}">
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>
					.${q.content}&nbsp;&nbsp;&nbsp;</h5>
					<section class="row-fluid">
						<c:forEach items="${q.right_choice}" var="rc">
							<div class="span2">
					          <p>  
					            <span class="help-block" style="color: #595">
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==rc.id}">【</c:if></c:forEach>
					            	${rc.content}
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==rc.id}">】</c:if></c:forEach>
					            </span>
					          </p>			
							</div>
						</c:forEach>
						<c:forEach items="${q.wrong_choice}" var="wc">
							<div class="span2">
					          <p>  
					            <span class="help-block">
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==wc.id}">【</c:if></c:forEach>
					            	${wc.content}
					            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==wc.id}">】</c:if></c:forEach>
					            </span>
					          </p>			
							</div>
						</c:forEach>
					</section>
				</c:if>
			</c:forEach>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->     
	 <!-- 判断题 -->
  	 <div class="row-fluid" id="j">
		<div class="widget widget-padding span12">
			<div class="widget-header">
					<i class="icon-check"></i>
					<h5>判断题</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==3}">
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>
					.${q.content}&nbsp;&nbsp;&nbsp;</h5>
					<section class="row-fluid">
						<div class="span2">
				          <p>  
				            <span class="help-block">正确答案：
				            	<c:if test="${q.answer=='Y'}">正确</c:if>
				            	<c:if test="${q.answer=='N'}">错误</c:if>
				            </span>
				            <span class="help-block">学生答案：
				            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id}">
					            	<c:if test="${sas.answer=='Y'}">正确</c:if>
					            	<c:if test="${sas.answer=='N'}">错误</c:if>
				            	</c:if></c:forEach>
				            </span>
				          </p>			
						</div>
					</section>
				</c:if>
			</c:forEach>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->     
	 <!-- 简答题 -->
  	 <div class="row-fluid" id="sa">
		<div class="widget widget-padding span12">
			<div class="widget-header">
					<i class="icon-comment"></i>
					<h5>简答题</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==4}">
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>
					.${q.content}&nbsp;&nbsp;&nbsp;</h5>
					<section class="row-fluid">
						<div class="span12">
				          <p>  
				            <span class="help-block">参考答案：${q.answer}</span>
				            <span class="help-block">学生答案：<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id}">${sas.answer}</c:if></c:forEach></span>
				          </p>			
						</div>
					</section>
				</c:if>
			</c:forEach>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->     
	 <!-- 编程题 -->
  	 <div class="row-fluid" id="p">
		<div class="widget widget-padding span12">
			<div class="widget-header">
					<i class="icon-laptop"></i>
					<h5>编程题</h5>
			</div>  
			<div class="widget-body">
				<c:forEach items="${questions}" var="q">
					<c:if test="${q.TYPE==5}">
						<h5>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
							</c:forEach>
						.${q.content}&nbsp;&nbsp;&nbsp;</h5>
						<section class="row-fluid">
							<div class="span12">
					          <p>  
					            <span class="help-block">参考答案：${q.answer}</span>
					            <span class="help-block">学生答案：<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id}">${sas.answer}</c:if></c:forEach></span>
					          </p>			
							</div>
						</section>
					</c:if>
				</c:forEach>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->     
	 <!-- 填空题 -->
  	 <div class="row-fluid" id="fb">
		<div class="widget widget-padding span12">
			<div class="widget-header">
					<i class="icon-edit"></i>
					<h5>填空题（括号内为考生答案）</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==6}">
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>					
					.${q.content}&nbsp;&nbsp;&nbsp;</h5>
					<section class="row-fluid">
					    <span class="help-block">正确答案：</span>
						<c:forEach items="${q.filling_blank}" var="fb">
							<div class="span2">
					          <p>  
					            <span class="help-block">第${fb.location+1}空：${fb.content}（<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id}"><c:forEach items="${sas.fillings}" var="f"><c:if test="${fb.location==f.location}">${f.filling}</c:if></c:forEach></c:if></c:forEach>）</span>
					          </p>			
							</div>
						</c:forEach>
					</section>
				</c:if>
			</c:forEach>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->     
	
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

    <script type="text/javascript" src="assets/js/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		})
		function sc(){
			$("#sc").attr("style","display:");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
		function mc(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display:");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
		function j(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display:");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
		function sa(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display:");
			$("#p").attr("style","display: none;");
		}
		function p(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display:");
		}
		function fb(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display:");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
	</script>
</body>
</html>
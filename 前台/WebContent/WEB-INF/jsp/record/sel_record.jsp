<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<base href="<%=basePath%>"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Flat UI - Free Bootstrap Framework and Theme</title>
  <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

  <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

  <!-- Loading Bootstrap -->
  <link href="Flat-UI-master/dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Loading Flat UI -->
  <link href="Flat-UI-master/dist/css/flat-ui.css" rel="stylesheet">
  <link href="Flat-UI-master/docs/assets/css/demo.css" rel="stylesheet">

  <link rel="shortcut icon" href="Flat-UI-master/img/favicon.ico">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
  <!--[if lt IE 9]>
    <script src="Flat-UI-master/dist/js/vendor/html5shiv.js"></script>
    <script src="Flat-UI-master/dist/js/vendor/respond.min.js"></script>
  <![endif]-->
</head>
<body>
	<style>
      body {
        padding-top: 70px;
      }
    </style>

    <!-- Static navbar -->
    <jsp:include page="/WEB-INF/jsp/surrounding/top_exam.jsp"></jsp:include>


    <div class="demo-row typography-row">
	   	<div class="demo-content">
	   		<div class="demo-type-example">
	    		<h1>${examnation.title}</h1>
	   		</div>
	   		<div class="demo-type-example">
	    		<h4>考试时间:${examnation.text_date}（${examnation.start_time}——${examnation.end_time}）</h4>
	   		</div>
	   		<div class="demo-type-example">
	    		<h4>用时：${student_examnation.time}分钟</h4>
	   		</div>
	   		<div class="demo-type-example">
	    		<h4>得分/总分：${student_examnation.scores}/${examnation.scores}</h4>
	   		</div>
	   		<div class="demo-type-example">
	        <p><small><span class="fui-info-circle"></span>选择及判断题部分<span style="color: #c0392b;">红色字体</span>为正确选项，【】内为学生答题选项</small></p>
	   		</div>
	   		<c:forEach items="${questions}" var="q">
	   			<c:if test="${q.TYPE==1}">
	   				<div class="demo-type-example">
			    		<h6>Q
			    			<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
			    		：${q.content}</h6>
			   		</div>
			   		<div class="demo-type-example">
			        <p>
			        	<c:forEach items="${q.right_choice}" var="rc">
			        		<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==rc.id}">【</c:if></c:forEach>
			            	<span style="color: #c0392b;">${rc.content}</span>
			            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==rc.id}">】</c:if></c:forEach>
			        		&nbsp;&nbsp;&nbsp;&nbsp;
			        	</c:forEach>
			        	<c:forEach items="${q.wrong_choice}" var="wc">
			        		<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==wc.id}">【</c:if></c:forEach>
			            	${wc.content}
			            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.single_choice_id==wc.id}">】</c:if></c:forEach>
			        		&nbsp;&nbsp;&nbsp;&nbsp;
			        	</c:forEach>
			        </p>
			   		</div>
			   		<div class="demo-type-example">
			        <blockquote>
			          <p>${q.analysis}</p>
			        </blockquote>
			   		</div>
	   			</c:if>
	   		</c:forEach>
	   		<c:forEach items="${questions}" var="q">
	   			<c:if test="${q.TYPE==2}">
	   				<div class="demo-type-example">
			    		<h6>Q
			    			<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
			    		：${q.content}</h6>
			   		</div>
			   		<div class="demo-type-example">
			        <p>
			        	<c:forEach items="${q.right_choice}" var="rc">
			        		<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==rc.id}">【</c:if></c:forEach>
			            	<span style="color: #c0392b;">${rc.content}</span>
			            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==rc.id}">】</c:if></c:forEach>
			        		&nbsp;&nbsp;&nbsp;&nbsp;
			        	</c:forEach>
			        	<c:forEach items="${q.wrong_choice}" var="wc">
			        		<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==wc.id}">【</c:if></c:forEach>
			            	${wc.content}
			            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.multiple_choice_id==wc.id}">】</c:if></c:forEach>
			        		&nbsp;&nbsp;&nbsp;&nbsp;
			        	</c:forEach>
			        </p>
			   		</div>
			   		<div class="demo-type-example">
			        <blockquote>
			          <p>${q.analysis}</p>
			        </blockquote>
			   		</div>
	   			</c:if>
	   		</c:forEach>
	   		<c:forEach items="${questions}" var="q">
	   			<c:if test="${q.TYPE==3}">
	   				<div class="demo-type-example">
			    		<h6>Q
			    			<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
			    		：${q.content}</h6>
			   		</div>
			   		<div class="demo-type-example">
			        <p>
		        		<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.answer=='Y'}">【</c:if></c:forEach>
		            	<span <c:if test="${q.answer=='Y'}">style="color: #c0392b;"</c:if>>正确</span>
		            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.answer=='Y'}">】</c:if></c:forEach>
		        		<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.answer=='N'}">【</c:if></c:forEach>
		            	<span <c:if test="${q.answer=='N'}">style="color: #c0392b;"</c:if>>错误</span>
		            	<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id&&sas.answer=='N'}">】</c:if></c:forEach>
			        </p>
			   		</div>
			   		<div class="demo-type-example">
			        <blockquote>
			          <p>${q.analysis}</p>
			        </blockquote>
			   		</div>
	   			</c:if>
	   		</c:forEach>
	   		<div class="demo-type-example">
	        <p><small><span class="fui-info-circle"></span>填空题部分括号外为标准答案，括号内为学生答案</small></p>
	   		</div>
	   		<c:forEach items="${questions}" var="q">
	   			<c:if test="${q.TYPE==6}">
	   				<div class="demo-type-example">
			    		<h6>Q
			    			<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
			    		：${q.content}</h6>
			   		</div>
			   		<div class="demo-type-example">
			        <p>
			        	<c:forEach items="${q.filling_blank}" var="fb">
			        		第${fb.location+1}空：${fb.content}（<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id}"><c:forEach items="${sas.fillings}" var="f"><c:if test="${fb.location==f.location}">${f.filling}</c:if></c:forEach></c:if></c:forEach>）
			        		&nbsp;&nbsp;
			        	</c:forEach>
			        </p>
			   		</div>
			   		<div class="demo-type-example">
			        <blockquote>
			          <p>${q.analysis}</p>
			        </blockquote>
			   		</div>
	   			</c:if>
	   		</c:forEach>
	   		<c:forEach items="${questions}" var="q">
	   			<c:if test="${q.TYPE==4||q.TYPE==5}">
	   				<div class="demo-type-example">
			    		<h6>Q
			    			<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
			    		：${q.content}</h6>
			   		</div>
			   		<div class="demo-type-example">
						<p class="lead">参考答案：${q.answer}</p>
			   		</div>
			   		<div class="demo-type-example">
			        <p>学生答案：<c:forEach items="${student_answers}" var="sas"><c:if test="${sas.question_id==q.id}">${sas.answer}</c:if></c:forEach></p>
			   		</div>
			   		<div class="demo-type-example">
			        <blockquote>
			          <p>${q.analysis}</p>
			        </blockquote>
			   		</div>
	   			</c:if>
	   		</c:forEach>
	   </div><!-- /.demo-content-wide -->
   </div><!-- /.demo-row -->
	
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>

	<script src="Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="Flat-UI-master/dist/js/vendor/video.js"></script>
    <script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <script src="Flat-UI-master/docs/assets/js/application.js"></script>

    <script>
      videojs.options.flash.swf = "Flat-UI-master/dist/js/vendors/video-js.swf"
    </script>
  </body>
</html>
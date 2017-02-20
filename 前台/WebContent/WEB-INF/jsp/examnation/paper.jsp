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

    <div class="container">
   	  <div class="demo-headline">
        <h1 class="demo-logo">
          <div class="logo"></div>
          S&nbsp;H&nbsp;X&nbsp;T
          <small style="font-size: 35x;">${examnation.title}</small>
          <small class="col-xs-12" style="margin-top: 20px;">剩余时间：
          	<span id="hour"></span>小时
          	<span id="minute"></span>分
          	<span id="second"></span>秒
          </small>
        </h1>
      </div>
      
      <div class="container" style="min-height: 800px;">
		<form id="form1" role="form" action="record/finish" method="post" onsubmit="return upload();">
			<input type="hidden" id="examnation_id" name="examnation_id" value="${examnation.id}">
			<input type="hidden" id="time" name="time" value="${examnation.time}">
			<input type="hidden" id="student_id" name="student_id" value="${id}">
			<h3>单选题</h3>
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==1}">
					<div>
						<p>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
						：${q.content}</p>
						<img alt="配图" src="upload/${q.picture}">
						<c:forEach items="${q.show_choice}" var="sc">
				       		<div class="col-xs-12">
				       		  <label class="radio">
					            <input type="radio" name="${q.id}" id="optionsRadios1" value="${sc.id}" data-toggle="radio" onclick="single_choice(this);">
					            ${sc.sort}&nbsp;：&nbsp;${sc.content}
					          </label>
				        	</div>
			       		</c:forEach>
			    	</div>
				</c:if>
			</c:forEach>			
			<h3>多选题</h3>
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==2}">
					<div>
						<p>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
						：${q.content}</p>
						<img alt="配图" src="upload/${q.picture}">
						<c:forEach items="${q.show_choice}" var="sc">
				       		<div class="col-xs-12">
					          <label class="checkbox">
					            <input type="checkbox" name="${q.id}" value="${sc.id}" data-toggle="checkbox" onclick="multiple_choice(this);">
					            ${sc.sort}&nbsp;：&nbsp;${sc.content}
					          </label>
					        </div>
				       	</c:forEach>
			    	</div>
				</c:if>
			</c:forEach>			
			<h3>判断题</h3>
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==3}">
					<div>
						<p>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
						：${q.content}</p>
						<img alt="配图" src="upload/${q.picture}">
						<div class="col-xs-12">
			       		  <label class="radio">
				            <input type="radio" name="${q.id}" id="optionsRadios1" value="Y" data-toggle="radio" onclick="judge(this);">正确
				          </label>
			        	</div>
			       		<div class="col-xs-12">
			       		  <label class="radio">
				            <input type="radio" name="${q.id}" id="optionsRadios1" value="N" data-toggle="radio" onclick="judge(this);">错误
				          </label>
			        	</div>
			    	</div>
				</c:if>
			</c:forEach>			
			<h3>填空题</h3>
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==6}">
					<div>
						<p>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
						：${q.content}</p>
						<img alt="配图" src="upload/${q.picture}">
						<div class="col-xs-12">
				          <div class="tagsinput-primary">
				            <input id="input_tag" name="${q.id}" class="tagsinput" data-role="tagsinput" value="请在此输入框中按顺序输入要填的空"/>
				          </div>
				        </div>
			   		</div>
				</c:if>
			</c:forEach>			
			<h3>简答题</h3>
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==4}">
					<div>
						<p>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
						：${q.content}</p>
						<img alt="配图" src="upload/${q.picture}">
						<div class="col-xs-12">
			       		  <textarea class="editor" style="width:700px;height:300px;" name="${q.id}"></textarea>
			        	</div>
			    	</div>
				</c:if>
			</c:forEach>			
			<h3>编程题</h3>
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==5}">
					<div>
						<p>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
							</c:forEach>
						：${q.content}</p>
						<img alt="配图" src="upload/${q.picture}">
						<div class="col-xs-12">
			       		  <textarea class="editor" style="width:700px;height:300px;" name="${q.id}"></textarea>
			        	</div>
			    	</div>
				</c:if>
			</c:forEach>			
			<button style="margin-top: 30px;margin-left: 300px" type="submit" class="btn btn-hg btn-primary" onclick="return confirm('是否确定交卷');">
				交卷
			</button>
		 </form>
    	</div> <!-- /container -->
      	
    </div> <!-- /container -->
	<br><br><br><br>
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>
	<script src="Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="Flat-UI-master/dist/js/vendor/video.js"></script>
    <script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <script src="Flat-UI-master/docs/assets/js/application.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/simple.js"></script>
	<script type="text/javascript">
	var use_minute = 0;
	var hour = 0;
	var minute = 0;
	var second = 0;
	var t;
	var s;
	//初始化数据
	$(function(){
		second = parseInt($("#time").val())/1000;
		if(second>60){
			minute = parseInt(second/60);
			second = parseInt(second%60);
			if(minute>60){
				hour = parseInt(minute/60);
				minute = parseInt(minute%60);
			}
		}
		$("#hour").html(hour);
		$("#minute").html(minute);
		$("#second").html(second);
		jishi();
		jishi2();
	})
	//计时1
	function jishi2(){
		use_minute = use_minute + 1;
		s = setTimeout("jishi2()", 60000);
	}
	//计时2
	function jishi(){
		if(second<=0){
			if(minute<=0){
				if(hour<=0){
					finish();
				}
				hour = hour -  1;
				$("#hour").html(hour);
				minute = 59;
				$("#minute").html(minute);
				second = 59;
				$("#second").html(second);
			}else{
				minute = minute -  1;
				$("#minute").html(minute);
				second = 59;
				$("#second").html(second);
			}
		}else{
			second = second -  1;
			$("#second").html(second);
		}
		t=setTimeout("jishi()",1000);
	}
	//停止
	function finish(){
		clearTimeout(t);
		alert("考试时间已结束！");
		$("#form1").submit();
	}
	
	//传值
	var examnation_id = $("#examnation_id").val();
	var student_id = $("#student_id").val();
	function single_choice(obj){
		$.post("record/single_choice",{"student_id":student_id,"examnation_id":examnation_id,"question_id":$(obj).attr("name"),"choice_id":$(obj).val()},null)
	}
	function multiple_choice(obj){
		$.post("record/multiple_choice",{"student_id":student_id,"examnation_id":examnation_id,"question_id":$(obj).attr("name"),"choice_id":$(obj).val()},null)
	}
	function judge(obj){
		$.post("record/judge",{"student_id":student_id,"examnation_id":examnation_id,"question_id":$(obj).attr("name"),"judgement":$(obj).val()},null)
	}
	function upload(){
		$("#time").val(use_minute);
		for(var i=0; i<$(".tagsinput").length; i++){
			$.post("record/filling",{"student_id":student_id,"examnation_id":examnation_id,"question_id":$(".tagsinput").eq(i).attr("name"),"blanks":$(".tagsinput").eq(i).val()},null)
		}
		for(var i=0; i<$(".editor").length; i++){
			$.post("record/answer",{"student_id":student_id,"examnation_id":examnation_id,"question_id":$(".editor").eq(i).attr("name"),"answer":$(".editor").eq(i).val()},null)
		}
		alert("上传完成");
		return true;
	}
	
	</script>
  </body>
</html>
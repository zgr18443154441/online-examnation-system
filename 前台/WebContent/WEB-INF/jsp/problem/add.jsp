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
    <jsp:include page="/WEB-INF/jsp/surrounding/top_ask.jsp"></jsp:include>


    <div class="container" style="min-height: 800px;">
		<!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <form action="problem/add" method="post">
        	<h1>问题反馈</h1>
	        <p><small><span class="fui-info-circle"></span>可选择附带问题相关的课程章节</small></p>
		    <div class="row demo-row">
		    	<div class="col-xs-6">
		          <h3 class="demo-panel-title">课程</h3>
		          <select id="course" name="course" class="form-control select select-primary select-lg" data-toggle="select" onchange="search_phase(this);">
		            <option value="">【请选择】</option>
		          </select>
		          &nbsp;&nbsp;&nbsp;
		        </div>
		    	<div class="col-xs-6">
		          <h3 class="demo-panel-title">学期</h3>
		          <select id="phase" name="phase" class="form-control select select-primary select-lg" data-toggle="select" onchange="search_chapter1(this);">
		            <option value="">【请先选择所属课程】</option>
		          </select>
		          &nbsp;&nbsp;&nbsp;
		        </div>
		    </div>
		    <div class="row demo-row">
		    	<div class="col-xs-6">
		          <h3 class="demo-panel-title">章节</h3>
		          <select id="chapter1" name="chapter1" class="form-control select select-primary" data-toggle="select" onchange="search_chapter2(this);">
		            <option value="">【请先选择所属学期】</option>
		          </select>
		          &nbsp;&nbsp;&nbsp;
		        </div>
		    	<div class="col-xs-6">
		          <h3 class="demo-panel-title">小节</h3>
		          <select id="chapter2" name="chapter2" class="form-control select select-primary" data-toggle="select">
		            <option value="">【请先选择所属章节】</option>
		          </select>
		          &nbsp;&nbsp;&nbsp;
		        </div>
		    </div>
		    <div class="row demo-row">
		    	<h3 class="demo-panel-title">请输入问题：</h3>
			    <div class="col-xs-12">
			    	<textarea class="editor" style="width:700px;height:300px;" name="consult"></textarea>
		     	</div>
		    </div>
	       	<button class="btn btn-lg btn-primary" type="submit">提交问题 &raquo;</button>
        </form>
      </div>
    </div> <!-- /container -->
	
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>

	<script src="Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="Flat-UI-master/dist/js/vendor/video.js"></script>
    <script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <script src="Flat-UI-master/docs/assets/js/application.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/simple.js"></script>
    <script>
	    $(function(){
			var course = eval('${courses}');
			for(var i=0; i<course.length; i++){
				$("#course").append("<option value='" + course[i].id + "'>" + course[i].NAME + "</option>");
			}
		}) 
		
		function search_phase(obj){
			$.post("book/search",{"course_id":$(obj).val(),"type":2},function(phase){
				$("#phase").empty().append("<option value=''>【请先选择所属课程】</option>");
				for(var i=0; i<phase.length; i++){
	    			$("#phase").append("<option value='" + phase[i].id + "'>" + phase[i].name + "</option>");
	    		}
			})
		}
		
		function search_chapter1(obj){
			$.post("book/search",{"phase_id":$(obj).val(),"type":3},function(chapter1){
				$("#chapter1").empty().append("<option value=''>【请先选择所属学期】</option>");
				for(var i=0; i<chapter1.length; i++){
	    			$("#chapter1").append("<option value='" + chapter1[i].id + "'>" + chapter1[i].name + "</option>");
	    		}
			})
		}
		
		function search_chapter2(obj){
			$.post("book/search",{"parent_id":$(obj).val(),"type":4},function(chapter2){
				$("#chapter2").empty().append("<option value=''>【请先选择所属章节】</option>");
				for(var i=0; i<chapter2.length; i++){
	    			$("#chapter2").append("<option value='" + chapter2[i].id + "'>" + chapter2[i].name + "</option>");
	    		}
			})
		}
		
    </script>
  </body>
</html>
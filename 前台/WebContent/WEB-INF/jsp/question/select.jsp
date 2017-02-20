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
    <jsp:include page="/WEB-INF/jsp/surrounding/top_text.jsp"></jsp:include>


    <div class="container" style="min-height: 800px;">
		<!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>题型训练</h1>
        <div class="row demo-row">
	        <div class="col-xs-3">
	          <a href="question/type_text?TYPE=1" class="btn btn-block btn-lg btn-primary">单选题</a>
	        </div>
	        <div class="col-xs-3">
	          <a href="question/type_text?TYPE=2" class="btn btn-block btn-lg btn-warning">多选题</a>
	        </div>
	        <div class="col-xs-3">
	          <a href="question/type_text?TYPE=3" class="btn btn-block btn-lg btn-info">判断题</a>
	        </div>
	        <div class="col-xs-3">
	          <a href="question/type_text?TYPE=6" class="btn btn-block btn-lg btn-danger">填空题</a>
	        </div>
	    </div> <!-- /row -->
        <div class="row demo-row">
	        <div class="col-xs-3">
	          <a href="question/type_text?TYPE=4" class="btn btn-block btn-lg btn-success">简答题</a>
	        </div>
	        <div class="col-xs-3">
	          <a href="question/type_text?TYPE=5" class="btn btn-block btn-lg btn-inverse">编程题</a>
	        </div>
	    </div> <!-- /row -->
	    
        <h1>知识点巩固</h1>
	    <div class="row demo-row">
	    	<div class="col-xs-12">
	          <h3 class="demo-panel-title">课程</h3>
	          <select id="course" class="form-control select select-primary select-hg" data-toggle="select" onchange="search_phase(this);">
	            <option value="">【请选择】</option>
	          </select>
	          &nbsp;&nbsp;&nbsp;
	          <a href="question/book_text?id=&role=1" class="btn btn-inverse btn-hg" onclick="return check_href(this);">搜题</a>
	        </div>
	    </div>
	    <div class="row demo-row">
	    	<div class="col-xs-12">
	          <h3 class="demo-panel-title">学期</h3>
	          <select id="phase" class="form-control select select-primary select-lg" data-toggle="select" onchange="search_chapter1(this);">
	            <option value="">【请先选择所属课程】</option>
	          </select>
	          &nbsp;&nbsp;&nbsp;
	          <a href="question/book_text?id=&role=2" class="btn btn-inverse btn-lg" onclick="return check_href(this);">搜题</a>
	        </div>
	    </div>
	    <div class="row demo-row">
	    	<div class="col-xs-12">
	          <h3 class="demo-panel-title">章节</h3>
	          <select id="chapter1" class="form-control select select-primary" data-toggle="select" onchange="search_chapter2(this);">
	            <option value="">【请先选择所属学期】</option>
	          </select>
	          &nbsp;&nbsp;&nbsp;
	          <a href="question/book_text?id=&role=3" class="btn btn-inverse" onclick="return check_href(this);">搜题</a>
	        </div>
	    </div>
	    <div class="row demo-row">
	    	<div class="col-xs-12">
	          <h3 class="demo-panel-title">小节</h3>
	          <select id="chapter2" class="form-control select select-primary select-sm" data-toggle="select" onchange="change_chapter2(this);">
	            <option value="">【请先选择所属章节】</option>
	          </select>
	          &nbsp;&nbsp;&nbsp;
	          <a href="question/book_text?id=&role=4" class="btn btn-inverse btn-sm" onclick="return check_href(this);">搜题</a>
	        </div>
	    </div>
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
			$(obj).next().attr("href","question/book_text?id=" + $(obj).val() + "&role=1");
		}
		
		function search_chapter1(obj){
			$.post("book/search",{"phase_id":$(obj).val(),"type":3},function(chapter1){
				$("#chapter1").empty().append("<option value=''>【请先选择所属学期】</option>");
				for(var i=0; i<chapter1.length; i++){
	    			$("#chapter1").append("<option value='" + chapter1[i].id + "'>" + chapter1[i].name + "</option>");
	    		}
			})
			$(obj).next().attr("href","question/book_text?id=" + $(obj).val() + "&role=2");
		}
		
		function search_chapter2(obj){
			$.post("book/search",{"parent_id":$(obj).val(),"type":4},function(chapter2){
				$("#chapter2").empty().append("<option value=''>【请先选择所属章节】</option>");
				for(var i=0; i<chapter2.length; i++){
	    			$("#chapter2").append("<option value='" + chapter2[i].id + "'>" + chapter2[i].name + "</option>");
	    		}
			})
			$(obj).next().attr("href","question/book_text?id=" + $(obj).val() + "&role=3");
		}
		
		function change_chapter2(obj){
			$(obj).next().attr("href","question/book_text?id=" + $(obj).val() + "&role=4");
		}
		
		function check_href(obj){
			if($(obj).attr("href")=="question/book_text?id=&role=1"||$(obj).attr("href")=="question/book_text?id=&role=2"||$(obj).attr("href")=="question/book_text?id=&role=3"||$(obj).attr("href")=="question/book_text?id=&role=4"){
				return false;
			}else{
				return true;
			}
		}
    </script>
  </body>
</html>
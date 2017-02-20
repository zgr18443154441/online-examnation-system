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
		<form role="form" action="question/check" method="post" onsubmit="return check();">
			<input type="hidden" name="question_id" value="${question.id}">
			<input type="hidden" name="question_type" value="${question.TYPE}">
			<input type="hidden" name="text_style" value="${text_style}">
			<input type="hidden" name="TYPE" value="${TYPE}">
			<input type="hidden" name="id" value="${id}">
			<input id="role" type="hidden" name="role" value="${role}">
			<div class="jumbotron">
		        <h1>
		        	<c:if test="${question.TYPE==1}">单选题</c:if>
		        	<c:if test="${question.TYPE==2}">多选题</c:if>
		        	<c:if test="${question.TYPE==3}">判断题</c:if>
		        	<c:if test="${question.TYPE==4}">简答题</c:if>
		        	<c:if test="${question.TYPE==5}">编程题</c:if>
		        	<c:if test="${question.TYPE==6}">填空题</c:if>
		        </h1>
		        <p>题目：${question.content}</p>
		        <img alt="配图" src="upload/${question.picture}">
		        <c:if test="${question.TYPE==1}">
			   		<c:forEach items="${question.show_choice}" var="sc">
			       		<div class="col-xs-12">
			       		  <label class="radio">
				            <input type="radio" name="single_choice" id="optionsRadios1" value="${sc.id}" data-toggle="radio">
				            ${sc.sort}&nbsp;：&nbsp;${sc.content}
				          </label>
			        	</div>
			       	</c:forEach>
		        </c:if>
		        <c:if test="${question.TYPE==2}">
			   		<c:forEach items="${question.show_choice}" var="sc">
			       		<div class="col-xs-12">
				          <label class="checkbox">
				            <input type="checkbox" name="multiple_choice" value="${sc.id}" data-toggle="checkbox">
				            ${sc.sort}&nbsp;：&nbsp;${sc.content}
				          </label>
				        </div>
			       	</c:forEach>
		        </c:if>
		        <c:if test="${question.TYPE==3}">
		       		<div class="col-xs-12">
		       		  <label class="radio">
			            <input type="radio" name="judge" id="optionsRadios1" value="Y" data-toggle="radio">正确
			          </label>
		        	</div>
		       		<div class="col-xs-12">
		       		  <label class="radio">
			            <input type="radio" name="judge" id="optionsRadios1" value="N" data-toggle="radio">错误
			          </label>
		        	</div>
		        </c:if>
		        <c:if test="${question.TYPE==4||question.TYPE==5}">
		       		<div class="col-xs-12">
		       		  <textarea class="editor" style="width:700px;height:300px;" name="answer"></textarea>
		        	</div>
		        </c:if>
		        <c:if test="${question.TYPE==6}">
			   		<div class="col-xs-12">
			          <div class="tagsinput-primary">
			            <input id="input_tag" name="filling_blank" class="tagsinput" data-role="tagsinput" value="请在此输入框中按顺序输入要填的空" />
			          </div>
			        </div>
		        </c:if>
		        <p>
		          <button class="btn btn-lg btn-primary" type="submit">查看答案 &raquo;</button>
		        </p>
		     </div>
		</form>
    </div> <!-- /container -->
	
	<jsp:include page="/WEB-INF/jsp/surrounding/bottom.jsp"></jsp:include>

	<script src="Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="Flat-UI-master/dist/js/vendor/video.js"></script>
    <script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <script src="Flat-UI-master/docs/assets/js/application.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/simple.js"></script>
  </body>
</html>
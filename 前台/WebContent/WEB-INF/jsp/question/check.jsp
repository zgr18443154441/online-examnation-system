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
		<div class="jumbotron">
	        <h1>答案</h1>
	        <p>题目：${question.content}</p>
	        <img alt="配图" src="upload/${question.picture}">
	        <c:if test="${question.TYPE==1}">
		   		<c:forEach items="${question.show_choice}" var="sc">
		       		<div class="col-xs-12">
		       		  <label class="radio">
			            <input type="radio" readonly="readonly" id="optionsRadios1" <c:if test="${text_answer==sc.id}">checked="checked"</c:if> data-toggle="radio">
			            ${sc.sort}&nbsp;：&nbsp;${sc.content}&nbsp;&nbsp;<c:if test="${sc.isright==1}"><span class="fui-check-circle"></span></c:if>
			          </label>
		        	</div>
		       	</c:forEach>
	        </c:if>
	        <c:if test="${question.TYPE==2}">
		   		<c:forEach items="${question.show_choice}" var="sc">
		       		<div class="col-xs-12">
			          <label class="checkbox">
		            	<input type="checkbox" readonly="readonly" 
				          	<c:forEach items="${text_answer}" var="ta">
			            		<c:if test="${ta==sc.id}">checked="checked"</c:if> 
				          	</c:forEach>
		            	data-toggle="checkbox">
			            ${sc.sort}&nbsp;：&nbsp;${sc.content}&nbsp;&nbsp;<c:if test="${sc.isright==1}"><span class="fui-check-circle"></span></c:if>
			          </label>
			        </div>
		       	</c:forEach>
	        </c:if>
	        <c:if test="${question.TYPE==3}">
	       		<div class="col-xs-12">
	       		  <label class="radio">
		            <input type="radio" id="optionsRadios1" data-toggle="radio" <c:if test="${text_answer==sc.id}">checked="checked"</c:if> readonly="readonly">正确<c:if test="${question.answer=='Y'}"><span class="fui-check"></span></c:if>
		          </label>
	        	</div>
	       		<div class="col-xs-12">
	       		  <label class="radio">
		            <input type="radio" id="optionsRadios1" data-toggle="radio" <c:if test="${text_answer==sc.id}">checked="checked"</c:if> readonly="readonly">错误<c:if test="${question.answer=='N'}"><span class="fui-check"></span></c:if>
		          </label>
	        	</div>
	        </c:if>
	        <c:if test="${question.TYPE==4||question.TYPE==5}">
	       		<p>回答：${text_answer}</p>
	       		<p>参考答案：${question.answer}</p>
	        </c:if>
	        <c:if test="${question.TYPE==6}">
		   		<p>回答：
		   			<c:forEach items="${text_answer}" var="ta">
		   				${ta}&nbsp;&nbsp;
		   			</c:forEach>
		   		</p>
		   		<p>正确答案：
		   			<c:forEach items="${question.filling_blank}" var="fb">
		   				${fb.content}&nbsp;&nbsp;
		   			</c:forEach>
		   		</p>
	        </c:if>
	        <p style="font-size: 12px;">本题出自小节（
	        	<c:forEach items="${courses}" var="c">
		        	<c:if test="${c.id==question.course}">
		        		${c.NAME}
		        	</c:if>
		        </c:forEach>
	        -
	        	<c:forEach items="${phases}" var="p">
		        	<c:if test="${p.id==question.phase}">
		        		${p.NAME}
		        	</c:if>
		        </c:forEach>
	        -
	        	<c:forEach items="${chapters1}" var="ch1">
		        	<c:if test="${ch1.id==question.chapter1}">
		        		${ch1.NAME}
		        	</c:if>
		        </c:forEach>
	        -
	        	<c:forEach items="${chapters2}" var="ch2">
		        	<c:if test="${ch2.id==question.chapter2}">
		        		${ch2.NAME}
		        	</c:if>
		        </c:forEach>
	        	）</p>
	        <p>
	        	<c:if test="${text_style=='random_text'}">
					<a class="btn btn-lg btn-primary" href="question/random_text">再来一题&raquo;</a>
	        	</c:if>
	        	<c:if test="${text_style=='type_text'}">
					<a class="btn btn-lg btn-primary" href="question/type_text?TYPE=${TYPE}">再来一题&raquo;</a>
	        	</c:if>
	        	<c:if test="${text_style=='book_text'}">
					<a class="btn btn-lg btn-primary" href="question/book_text?id=${id}&role=${role}">再来一题&raquo;</a>
	        	</c:if>
	        </p>
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
  </body>
</html>
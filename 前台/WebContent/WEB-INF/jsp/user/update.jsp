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
    <jsp:include page="/WEB-INF/jsp/surrounding/top_none.jsp"></jsp:include>


    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron" style="min-height: 400px">
        <h2>个人信息修改</h2>
        <br>
        <form role="form" action="user/update" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${id}" name="id">
           <div class="form-group">
             <label for="exampleInputEmail1">账号</label>
             <input type="text" class="form-control" id="exampleInputEmail1" name="account" value="${user.account}">
           </div>
           <div class="form-group">
             <label for="exampleInputPassword1">密码</label>
             <input type="text" class="form-control" id="exampleInputPassword1" name="password" value="${user.password}">
           </div>
           <div class="form-group">
             <label for="exampleInputFile"></label>
             <img alt="照片" src="upload/${user.photo}">
             <input type="file" id="exampleInputFile" height="300px" name="photo_file">
             <p style="font-size: 15px" class="help-block">（请尽量上传宽高接近的照片）</p>
           </div>
           <select data-toggle="select" class="form-control select select-default mrs mbm" name="group_id">
	        <c:forEach items="${groups}" var="g">
	        	<option value="${g.id}" <c:if test="${g.id==user.group_id}">selected="selected"</c:if>>${g.NAME}</option>
	        </c:forEach>
		   </select>
		   <br><br>
           <div class="row">
		        <div class="col-md-12">
		          <p style="text-align: center;">
		            <button type="submit" class="btn btn-info">提交</button>
		            <button type="reset" class="btn btn-danger">清空</button>
		          </p>
		        </div>
		      </div>
         </form>
      </div>

    </div> <!-- /container -->
	
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
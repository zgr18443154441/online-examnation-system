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
    <link href="assets/css/jquery.dataTables.css" rel="stylesheet">
    
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
        <form action="examnation/select" method="post" onsubmit="return check_number();">
        	
        	<!-- 原版本功能
        	<input id="single_choice_number" type="hidden" value="${examnation.single_choice_number}">
        	<input id="multiple_choice_number" type="hidden" value="${examnation.multiple_choice_number}">
        	<input id="judge_number" type="hidden" value="${examnation.judge_number}">
        	<input id="short_answer_number" type="hidden" value="${examnation.short_answer_number}">
        	<input id="programme_number" type="hidden" value="${examnation.programme_number}">
        	<input id="filling_blank_number" type="hidden" value="${examnation.filling_blank_number}">
        	 -->
        	
        	<input name="examnation_id" type="hidden" value="${examnation.id}">
	        <div class="row-fluid">
	          <ul class="breadcrumb">
	            <li>主页<span class="divider">/</span></li>
	            <li>考试管理<span class="divider">/</span></li>
	            <li class="active">自主选题</li>
	          </ul>
	          <h2 class="heading">
	              	试题库
	              	<div class="btn-group pull-right">
		              <button type="submit" class="btn"><i class="icon-download-alt"></i>提交</button>
		              &nbsp;&nbsp;&nbsp;
		              <a href="examnation/delete?id=${examnation.id}"><button type="button" class="btn"><i class="icon-trash"></i>撤销</button></a>
		            </div>
	          </h2>
	        </div> <!-- /row-fluid -->

        	<!-- 单选题 -->
        	<div class="row-fluid">
	          <div class="widget widget-padding span12">
	            <div class="widget-header">
	              <i class="icon-cog"></i>
	              <h5>单择题&nbsp;（已选择<span id="sc_number">0</span>道题）</h5>
	            </div>  
	            <div class="widget-body">
	              <table id="sc_table" class="table table-striped table-bordered dataTable">
	                <thead>
	                  <tr>
	                    <th>题目</th>
	                    <th>出题人</th>
	                    <th>所属课程</th>
	                    <th>所属学期</th>
	                    <th>所属章节</th>
	                    <th>所属小节</th>
	                    <th>使用次数</th>
	                    <th>正确率</th>
	                    <th>难度</th>
	                    <th>选题栏</th>
	                    <th>操作</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach items="${single_choices}" var="q">
		                  <tr>
			                  <td>${q.con_sub}</td>
			                  <td>
			                  	<c:forEach items="${user}" var="u">
			                  		<c:if test="${u.id==q.teacher_id}">
				                  		${u.NAME}
				                  	</c:if>
			                  	</c:forEach>
			                  	<c:if test="${q.teacher_id==null}">管理员</c:if>
			                  </td>
			                  <td>
			                  	<c:forEach items="${courses}" var="co">
			                  		<c:if test="${q.course==co.id}">${co.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${phases}" var="ph">
			                  		<c:if test="${q.phase==ph.id}">${ph.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters1}" var="ch1">
			                  		<c:if test="${q.chapter1==ch1.id}">${ch1.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters2}" var="ch2">
			                  		<c:if test="${q.chapter2==ch2.id}">${ch2.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>${q.use_times}</td>
			                  <td>
			                  	<c:if test="${q.right_percent==0.0}">无法统计</c:if>
			                  	<c:if test="${q.right_percent!=0.0}">${q.right_percent}%</c:if>
			                  </td>
			                  <td>
			                  	<c:if test="${q.LEVEL==0}">无法评定</c:if>
			                  	<c:if test="${q.LEVEL!=0}">
				                  	<c:forEach begin="1" end="${q.LEVEL}">
				                  		<i class="icon-star-empty"></i>
				                  	</c:forEach>
			                  	</c:if>
			                  </td>
			                  <td>
			                  	<input type="checkbox" name="single_choices" value="${q.id}">
			                  </td>
			                  <td>
				                  <div class="btn-group">
					                  <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					                    	选项
					                  	<span class="caret"></span>
					                  </a>
					                  <ul class="dropdown-menu pull-right">
						                  <li><a href="#"  data-toggle="modal" data-target="#task_modal${q.id}"><i class="icon-search"></i>查看详细内容</a></li>
					                  </ul>
				                  </div>
			                  </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	              <br><br>
	            </div> <!-- /widget-body -->
	          </div> <!-- /widget -->
	        </div> <!-- /row-fluid -->
        	<br><br>
        	<!-- 多选题 -->
        	<div class="row-fluid">
	          <div class="widget widget-padding span12">
	            <div class="widget-header">
	              <i class="icon-cogs"></i>
	              <h5>多选题&nbsp;（已选择<span id="mc_number">0</span>道题）</h5>
	            </div>  
	            <div class="widget-body">
	              <table id="mc_table" class="table table-striped table-bordered dataTable">
	                <thead>
	                  <tr>
	                    <th>题目</th>
	                    <th>出题人</th>
	                    <th>所属课程</th>
	                    <th>所属学期</th>
	                    <th>所属章节</th>
	                    <th>所属小节</th>
	                    <th>使用次数</th>
	                    <th>正确率</th>
	                    <th>难度</th>
	                    <th>选题栏</th>
	                    <th>操作</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach items="${multiple_choices}" var="q">
		                  <tr>
			                  <td>${q.con_sub}</td>
			                  <td>
			                  	<c:forEach items="${user}" var="u">
			                  		<c:if test="${u.id==q.teacher_id}">
				                  		${u.NAME}
				                  	</c:if>
			                  	</c:forEach>
			                  	<c:if test="${q.teacher_id==null}">管理员</c:if>
			                  </td>
			                  <td>
			                  	<c:forEach items="${courses}" var="co">
			                  		<c:if test="${q.course==co.id}">${co.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${phases}" var="ph">
			                  		<c:if test="${q.phase==ph.id}">${ph.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters1}" var="ch1">
			                  		<c:if test="${q.chapter1==ch1.id}">${ch1.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters2}" var="ch2">
			                  		<c:if test="${q.chapter2==ch2.id}">${ch2.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>${q.use_times}</td>
			                  <td>
			                  	<c:if test="${q.right_percent==0.0}">无法统计</c:if>
			                  	<c:if test="${q.right_percent!=0.0}">${q.right_percent}%</c:if>
			                  </td>
			                  <td>
			                  	<c:if test="${q.LEVEL==0}">无法评定</c:if>
			                  	<c:if test="${q.LEVEL!=0}">
				                  	<c:forEach begin="1" end="${q.LEVEL}">
				                  		<i class="icon-star-empty"></i>
				                  	</c:forEach>
			                  	</c:if>
			                  </td>
			                  <td><input type="checkbox" name="multiple_choices" value="${q.id}"></td>
			                  <td>
				                  <div class="btn-group">
					                  <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					                    	选项
					                  	<span class="caret"></span>
					                  </a>
					                  <ul class="dropdown-menu pull-right">
						                  <li><a href="#"  data-toggle="modal" data-target="#task_modal${q.id}"><i class="icon-search"></i>查看详细内容</a></li>
					                  </ul>
				                  </div>
			                  </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	              <br><br>
	            </div> <!-- /widget-body -->
	          </div> <!-- /widget -->
	        </div> <!-- /row-fluid -->
        	<br><br>
        	<!-- 判断题 -->
        	<div class="row-fluid">
	          <div class="widget widget-padding span12">
	            <div class="widget-header">
	              <i class="icon-check"></i>
	              <h5>判断题&nbsp;（已选择<span id="ju_number">0</span>道题）</h5>
	            </div>  
	            <div class="widget-body">
	              <table id="ju_table" class="table table-striped table-bordered dataTable">
	                <thead>
	                  <tr>
	                    <th>题目</th>
	                    <th>出题人</th>
	                    <th>所属课程</th>
	                    <th>所属学期</th>
	                    <th>所属章节</th>
	                    <th>所属小节</th>
	                    <th>使用次数</th>
	                    <th>正确率</th>
	                    <th>难度</th>
	                    <th>选题栏</th>
	                    <th>操作</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach items="${judgements}" var="q">
		                  <tr>
			                  <td>${q.con_sub}</td>
			                  <td>
			                  	<c:forEach items="${user}" var="u">
			                  		<c:if test="${u.id==q.teacher_id}">
				                  		${u.NAME}
				                  	</c:if>
			                  	</c:forEach>
			                  	<c:if test="${q.teacher_id==null}">管理员</c:if>
			                  </td>
			                  <td>
			                  	<c:forEach items="${courses}" var="co">
			                  		<c:if test="${q.course==co.id}">${co.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${phases}" var="ph">
			                  		<c:if test="${q.phase==ph.id}">${ph.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters1}" var="ch1">
			                  		<c:if test="${q.chapter1==ch1.id}">${ch1.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters2}" var="ch2">
			                  		<c:if test="${q.chapter2==ch2.id}">${ch2.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>${q.use_times}</td>
			                  <td>
			                  	<c:if test="${q.right_percent==0.0}">无法统计</c:if>
			                  	<c:if test="${q.right_percent!=0.0}">${q.right_percent}%</c:if>
			                  </td>
			                  <td>
			                  	<c:if test="${q.LEVEL==0}">无法评定</c:if>
			                  	<c:if test="${q.LEVEL!=0}">
				                  	<c:forEach begin="1" end="${q.LEVEL}">
				                  		<i class="icon-star-empty"></i>
				                  	</c:forEach>
			                  	</c:if>
			                  </td>
			                  <td><input type="checkbox" name="judgements" value="${q.id}"></td>
			                  <td>
				                  <div class="btn-group">
					                  <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					                    	选项
					                  	<span class="caret"></span>
					                  </a>
					                  <ul class="dropdown-menu pull-right">
						                  <li><a href="#"  data-toggle="modal" data-target="#task_modal${q.id}"><i class="icon-search"></i>查看详细内容</a></li>
					                  </ul>
				                  </div>
			                  </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	              <br><br>
	            </div> <!-- /widget-body -->
	          </div> <!-- /widget -->
	        </div> <!-- /row-fluid -->
        	<br><br>
        	<!-- 填空题 -->
        	<div class="row-fluid">
	          <div class="widget widget-padding span12">
	            <div class="widget-header">
	              <i class="icon-edit"></i>
	              <h5>填空题&nbsp;（已选择<span id="fb_number">0</span>道题）</h5>
	            </div>  
	            <div class="widget-body">
	              <table id="fb_table" class="table table-striped table-bordered dataTable">
	                <thead>
	                  <tr>
	                    <th>题目</th>
	                    <th>出题人</th>
	                    <th>所属课程</th>
	                    <th>所属学期</th>
	                    <th>所属章节</th>
	                    <th>所属小节</th>
	                    <th>使用次数</th>
	                    <th>正确率</th>
	                    <th>难度</th>
	                    <th>选题栏</th>
	                    <th>操作</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach items="${filling_blanks}" var="q">
		                  <tr>
			                  <td>${q.con_sub}</td>
			                  <td>
			                  	<c:forEach items="${user}" var="u">
			                  		<c:if test="${u.id==q.teacher_id}">
				                  		${u.NAME}
				                  	</c:if>
			                  	</c:forEach>
			                  	<c:if test="${q.teacher_id==null}">管理员</c:if>
			                  </td>
			                  <td>
			                  	<c:forEach items="${courses}" var="co">
			                  		<c:if test="${q.course==co.id}">${co.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${phases}" var="ph">
			                  		<c:if test="${q.phase==ph.id}">${ph.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters1}" var="ch1">
			                  		<c:if test="${q.chapter1==ch1.id}">${ch1.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters2}" var="ch2">
			                  		<c:if test="${q.chapter2==ch2.id}">${ch2.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>${q.use_times}</td>
			                  <td>
			                  	<c:if test="${q.right_percent==0.0}">无法统计</c:if>
			                  	<c:if test="${q.right_percent!=0.0}">${q.right_percent}%</c:if>
			                  </td>
			                  <td>
			                  	<c:if test="${q.LEVEL==0}">无法评定</c:if>
			                  	<c:if test="${q.LEVEL!=0}">
				                  	<c:forEach begin="1" end="${q.LEVEL}">
				                  		<i class="icon-star-empty"></i>
				                  	</c:forEach>
			                  	</c:if>
			                  </td>
			                  <td><input type="checkbox" name="filling_blanks" value="${q.id}"></td>
			                  <td>
				                  <div class="btn-group">
					                  <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					                    	选项
					                  	<span class="caret"></span>
					                  </a>
					                  <ul class="dropdown-menu pull-right">
						                  <li><a href="#"  data-toggle="modal" data-target="#task_modal${q.id}"><i class="icon-search"></i>查看详细内容</a></li>
					                  </ul>
				                  </div>
			                  </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	              <br><br>
	            </div> <!-- /widget-body -->
	          </div> <!-- /widget -->
	        </div> <!-- /row-fluid -->
        	<br><br>
        	<!-- 简答题 -->
        	<div class="row-fluid">
	          <div class="widget widget-padding span12">
	            <div class="widget-header">
	              <i class="icon-comment"></i>
	              <h5>简答题&nbsp;（已选择<span id="sa_number">0</span>道题）</h5>
	            </div>  
	            <div class="widget-body">
	              <table id="sa_table" class="table table-striped table-bordered dataTable">
	                <thead>
	                  <tr>
	                    <th>题目</th>
	                    <th>出题人</th>
	                    <th>所属课程</th>
	                    <th>所属学期</th>
	                    <th>所属章节</th>
	                    <th>所属小节</th>
	                    <th>使用次数</th>
	                    <th>正确率</th>
	                    <th>难度</th>
	                    <th>选题栏</th>
	                    <th>操作</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach items="${short_answers}" var="q">
		                  <tr>
			                  <td>${q.con_sub}</td>
			                  <td>
			                  	<c:forEach items="${user}" var="u">
			                  		<c:if test="${u.id==q.teacher_id}">
				                  		${u.NAME}
				                  	</c:if>
			                  	</c:forEach>
			                  	<c:if test="${q.teacher_id==null}">管理员</c:if>
			                  </td>
			                  <td>
			                  	<c:forEach items="${courses}" var="co">
			                  		<c:if test="${q.course==co.id}">${co.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${phases}" var="ph">
			                  		<c:if test="${q.phase==ph.id}">${ph.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters1}" var="ch1">
			                  		<c:if test="${q.chapter1==ch1.id}">${ch1.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters2}" var="ch2">
			                  		<c:if test="${q.chapter2==ch2.id}">${ch2.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>${q.use_times}</td>
			                  <td>
			                  	<c:if test="${q.right_percent==0.0}">无法统计</c:if>
			                  	<c:if test="${q.right_percent!=0.0}">${q.right_percent}%</c:if>
			                  </td>
			                  <td>
			                  	<c:if test="${q.LEVEL==0}">无法评定</c:if>
			                  	<c:if test="${q.LEVEL!=0}">
				                  	<c:forEach begin="1" end="${q.LEVEL}">
				                  		<i class="icon-star-empty"></i>
				                  	</c:forEach>
			                  	</c:if>
			                  </td>
			                  <td><input type="checkbox" name="short_answers" value="${q.id}"></td>
			                  <td>
				                  <div class="btn-group">
					                  <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					                    	选项
					                  	<span class="caret"></span>
					                  </a>
					                  <ul class="dropdown-menu pull-right">
						                  <li><a href="#"  data-toggle="modal" data-target="#task_modal${q.id}"><i class="icon-search"></i>查看详细内容</a></li>
					                  </ul>
				                  </div>
			                  </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	              <br><br>
	            </div> <!-- /widget-body -->
	          </div> <!-- /widget -->
	        </div> <!-- /row-fluid -->
        	<br><br>
        	<!-- 编程题 -->
        	<div class="row-fluid">
	          <div class="widget widget-padding span12">
	            <div class="widget-header">
	              <i class="icon-laptop"></i>
	              <h5>编程题&nbsp;（已选择<span id="pr_number">0</span>道题）</h5>
	            </div>  
	            <div class="widget-body">
	              <table id="pr_table" class="table table-striped table-bordered dataTable">
	                <thead>
	                  <tr>
	                    <th>题目</th>
	                    <th>出题人</th>
	                    <th>所属课程</th>
	                    <th>所属学期</th>
	                    <th>所属章节</th>
	                    <th>所属小节</th>
	                    <th>使用次数</th>
	                    <th>正确率</th>
	                    <th>难度</th>
	                    <th>选题栏</th>
	                    <th>操作</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach items="${programmes}" var="q">
		                  <tr>
			                  <td>${q.con_sub}</td>
			                  <td>
			                  	<c:forEach items="${user}" var="u">
			                  		<c:if test="${u.id==q.teacher_id}">
				                  		${u.NAME}
				                  	</c:if>
			                  	</c:forEach>
			                  	<c:if test="${q.teacher_id==null}">管理员</c:if>
			                  </td>
			                  <td>
			                  	<c:forEach items="${courses}" var="co">
			                  		<c:if test="${q.course==co.id}">${co.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${phases}" var="ph">
			                  		<c:if test="${q.phase==ph.id}">${ph.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters1}" var="ch1">
			                  		<c:if test="${q.chapter1==ch1.id}">${ch1.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>
			                  	<c:forEach items="${chapters2}" var="ch2">
			                  		<c:if test="${q.chapter2==ch2.id}">${ch2.NAME}</c:if>
			                  	</c:forEach>
			                  </td>
			                  <td>${q.use_times}</td>
			                  <td>
			                  	<c:if test="${q.right_percent==0.0}">无法统计</c:if>
			                  	<c:if test="${q.right_percent!=0.0}">${q.right_percent}%</c:if>
			                  </td>
			                  <td>
			                  	<c:if test="${q.LEVEL==0}">无法评定</c:if>
			                  	<c:if test="${q.LEVEL!=0}">
				                  	<c:forEach begin="1" end="${q.LEVEL}">
				                  		<i class="icon-star-empty"></i>
				                  	</c:forEach>
			                  	</c:if>
			                  </td>
			                  <td><input type="checkbox" name="programmes" value="${q.id}"></td>
			                  <td>
				                  <div class="btn-group">
					                  <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					                    	选项
					                  	<span class="caret"></span>
					                  </a>
					                  <ul class="dropdown-menu pull-right">
						                  <li><a href="#"  data-toggle="modal" data-target="#task_modal${q.id}"><i class="icon-search"></i>查看详细内容</a></li>
					                  </ul>
				                  </div>
			                  </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	              <br><br>
	            </div> <!-- /widget-body -->
	          </div> <!-- /widget -->
	        </div> <!-- /row-fluid -->
        </form>

      </div>
      <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->



	<!-- 1单选，2多选，3判断，4简答，5编程, 6填空 -->

    <!-- 题目信息模态框 -->
    <!-- 判断题 -->
	<c:forEach items="${judgements}" var="q">
		<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">题目信息</h3>
		  </div>
		  <div class="modal-body">
		    <div class="widget-alerts clearfix">
		      <form class="form-horizontal">
		        <div class="control-group">
		          <label class="control-label">题目</label>
		          <div class="controls">
		            <div class="alert">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.content}<br>
		              <img alt="配图" src="upload/${q.picture}">
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">正确答案</label>
		          <div class="controls">
		            <div class="alert alert-success">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              <strong>
		              	<c:if test="${q.answer=='Y'}"><i class="icon-ok"></i></c:if>
		             		<c:if test="${q.answer=='N'}"><i class="icon-remove"></i></c:if> 
		              </strong> 
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">解析</label>
		          <div class="controls">
		            <div class="alert alert-info">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.analysis} 
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
		  </div>
		  <div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		  </div>
		</div> 
	</c:forEach>
   	<!-- 选择题 -->
	<c:forEach items="${single_choices}" var="q">
		<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">题目信息</h3>
		  </div>
		  <div class="modal-body">
		    <div class="widget-alerts clearfix">
		      <form class="form-horizontal">
		        <div class="control-group">
		          <label class="control-label">题目</label>
		          <div class="controls">
		            <div class="alert">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.content}<br>
		              <img alt="配图" src="upload/${q.picture}">
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">正确选项</label>
		          <div class="controls">
		            <div class="alert alert-success">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              <c:forEach items="${q.right_choice}" var="rc">
		              	${rc.content}<br>
		              </c:forEach>
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">错误选项</label>
		          <div class="controls">
		            <div class="alert alert-error">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              <c:forEach items="${q.wrong_choice}" var="wc">
		              	${wc.content}<br>
		              </c:forEach>
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">解析</label>
		          <div class="controls">
		            <div class="alert alert-info">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.analysis} 
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
		  </div>
		  <div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		  </div>
		</div> 
	</c:forEach>
	<c:forEach items="${multiple_choices}" var="q">
		<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">题目信息</h3>
		  </div>
		  <div class="modal-body">
		    <div class="widget-alerts clearfix">
		      <form class="form-horizontal">
		        <div class="control-group">
		          <label class="control-label">题目</label>
		          <div class="controls">
		            <div class="alert">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.content}<br>
		              <img alt="配图" src="upload/${q.picture}">
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">正确选项</label>
		          <div class="controls">
		            <div class="alert alert-success">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              <c:forEach items="${q.right_choice}" var="rc">
		              	${rc.content}<br>
		              </c:forEach>
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">错误选项</label>
		          <div class="controls">
		            <div class="alert alert-error">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              <c:forEach items="${q.wrong_choice}" var="wc">
		              	${wc.content}<br>
		              </c:forEach>
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">解析</label>
		          <div class="controls">
		            <div class="alert alert-info">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.analysis} 
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
		  </div>
		  <div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		  </div>
		</div> 
	</c:forEach>
   	<!-- 填空题 -->
	<c:forEach items="${filling_blanks}" var="q">
		<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">题目信息</h3>
		  </div>
		  <div class="modal-body">
		    <div class="widget-alerts clearfix">
		      <form class="form-horizontal">
		        <div class="control-group">
		          <label class="control-label">题目</label>
		          <div class="controls">
		            <div class="alert">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.content}
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">正确答案</label>
		          <div class="controls">
		            <div class="alert alert-success">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              <c:forEach items="${q.filling_blank}" var="fb">
		              	第${fb.location+1}空：${fb.content}<br>
		              </c:forEach>
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">解析</label>
		          <div class="controls">
		            <div class="alert alert-info">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.analysis} 
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
		  </div>
		  <div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		  </div>
		</div> 
	</c:forEach>
   	<!-- 简答编程题 -->
	<c:forEach items="${short_answers}" var="q">
		<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">题目信息</h3>
		  </div>
		  <div class="modal-body">
		    <div class="widget-alerts clearfix">
		      <form class="form-horizontal">
		        <div class="control-group">
		          <label class="control-label">题目</label>
		          <div class="controls">
		            <div class="alert">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.content}
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">参考答案</label>
		          <div class="controls">
		            <div class="alert alert-success">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.answer}
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">解析</label>
		          <div class="controls">
		            <div class="alert alert-info">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.analysis} 
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
		  </div>
		  <div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		  </div>
		</div> 
	</c:forEach>
	<c:forEach items="${programmes}" var="q">
		<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">题目信息</h3>
		  </div>
		  <div class="modal-body">
		    <div class="widget-alerts clearfix">
		      <form class="form-horizontal">
		        <div class="control-group">
		          <label class="control-label">题目</label>
		          <div class="controls">
		            <div class="alert">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.content}
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">参考答案</label>
		          <div class="controls">
		            <div class="alert alert-success">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.answer}
		            </div>
		          </div>
		        </div>
		        <div class="control-group">
		          <label class="control-label">解析</label>
		          <div class="controls">
		            <div class="alert alert-info">
		              <button type="button" class="close" data-dismiss="alert">&times;</button>
		              ${q.analysis} 
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
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
    <script type="text/javascript" src="assets/js/colResizable-1.5.min.js"></script>
    <script type="text/javascript">
    
    	$(document).ready(function(){
    		$('.table').DataTable({
				"language":{
					"sProcessing":   "处理中...",
					"sLengthMenu":   "每页 _MENU_ 项",
					"sZeroRecords":  "没有匹配结果",
					"sInfo":         "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
					"sInfoEmpty":    "当前显示第 0 至 0 项，共 0 项",
					"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix":  "",
					"sSearch":       "搜索:",
					"sUrl":          "",
					"sEmptyTable":     "表中数据为空",
					"sLoadingRecords": "载入中...",
					"sInfoThousands":  ",",
					"oPaginate": {
						"sFirst":    "首页",
						"sPrevious": "上页",
						"sNext":     "下页",
						"sLast":     "末页",
						"sJump":     "跳转"
					},
					"oAria": {
						"sSortAscending":  ": 以升序排列此列",
						"sSortDescending": ": 以降序排列此列"
					}
	             },
	             "columnDefs": [
                   { "width": "12%", "targets": 0 },
                   { "width": "8%", "targets": 1 },
                   { "width": "12%", "targets": 2 },
                   { "width": "12%", "targets": 3 },
                   { "width": "12%", "targets": 4 },
                   { "width": "12%", "targets": 5 },
                   { "width": "6%", "targets": 6 },
                   { "width": "8%", "targets": 7 },
                   { "width": "8%", "targets": 8 },
                   { "width": "4%", "targets": 9 },
                   { "width": "6%", "targets": 10 },
                 ],
	             autoWidth: false,	//自动调整列宽
                 stripeClasses: ["odd", "even"],//为奇偶行加上样式，兼容不支持CSS伪类的场合
                 order: [],			//取消默认排序查询,否则复选框一列会出现小箭头
                 processing: false,	//隐藏加载提示,自行处理
                 serverSide: false,	//禁用服务器端分页
                 searching: true,	//启用原生搜索
    		});
    		
    		//使用col插件实现表格头宽度拖拽
    		//$(".table").colResizable();
    		
    		//行点击事件
    		$('.table').on("click","tr",function() {
    			//alert($(this).parent().parent().attr("id"));
    			if($(this).find("input[type='checkbox']").prop("checked")==true){
    				var id = ($(this).parent().parent().attr("id")).substr(0,2)+"_number";
    				$(this).find("input[type='checkbox']").attr("checked",false);
    				$("#"+id).html(parseInt($("#"+id).html(), 10)-1);
    			}else{
    				$(this).find("input[type='checkbox']").attr("checked",true);
    				var id = ($(this).parent().parent().attr("id")).substr(0,2)+"_number";
    				$("#"+id).html(parseInt($("#"+id).html(), 10)+1);
    			}
    	    });
    	});
    	
    	//提交表单确认
    	function check_number(){
    		var sc = $("#sc_number").html();
    		var mc = $("#mc_number").html();
    		var ju = $("#ju_number").html();
    		var fb = $("#fb_number").html();
    		var sa = $("#sa_number").html();
    		var pr = $("#pr_number").html();
    		if(confirm("题目数如下：单选题" + sc + "道，多选题" + mc + "道，判断题" + ju + "道，填空题" + fb + "道，简答题" + sa + "道，编程题" + pr + "道，是否确定生成试卷？")){
    			return true;
    		}else{
    			return false;
    		}
    	}
    
    	/**原版本功能
    	function check_question(){
    		if($("input[name='single_choices']:checked").length!=$("#single_choice_number").val()){
	    		alert("单选题数量有误，应为"+$("#single_choice_number").val()+"个");
	    		return false;
    		}
    		if($("input[name='multiple_choices']:checked").length!=$("#multiple_choice_number").val()){
	    		alert("多题数量有误，应为"+$("#multiple_choice_number").val()+"个");
	    		return false;
    		}
    		if($("input[name='judgements']:checked").length!=$("#judge_number").val()){
	    		alert("判断题数量有误，应为"+$("#judge_number").val()+"个");
	    		return false;
    		}
    		if($("input[name='short_answers']:checked").length!=$("#short_answer_number").val()){
	    		alert("简答题数量有误，应为"+$("#short_answer_number").val()+"个");
	    		return false;
    		}
    		if($("input[name='programmes']:checked").length!=$("#programme_number").val()){
	    		alert("编程题数量有误，应为"+$("#programme_number").val()+"个");
	    		return false;
    		}
    		if($("input[name='filling_blanks']:checked").length!=$("#filling_blank_number").val()){
	    		alert("填空题数量有误，应为"+$("#filling_blank_number").val()+"个");
	    		return false;
    		}
    		return true;
    	}*/
    	
    </script>
</body>
</html>
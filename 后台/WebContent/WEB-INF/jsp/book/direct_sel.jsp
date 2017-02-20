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
     <c:if test="${user_type==1}">
     	<jsp:include page="/WEB-INF/jsp/surrounding/teacher_side.jsp"></jsp:include>
     </c:if>
     <c:if test="${user_type==2}">
     	<jsp:include page="/WEB-INF/jsp/surrounding/manager_side.jsp"></jsp:include>
     </c:if>

      <!-- Main window -->
      <div class="main_container" id="users_page">
		<div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li class="active">课程管理</li>
          </ul>
          <h2 class="heading">
          	<c:if test="${type==1}">查看课程</c:if>
           	<c:if test="${type==2}">查看学期</c:if>
           	<c:if test="${type==3}">查看章节</c:if>
           	<c:if test="${type==4}">查看小节</c:if>
          </h2>
        </div> <!-- /row-fluid -->
        
        <div class="row-fluid">
          <div class="widget widget-padding span12" >
            <div class="widget-header">
              <i class="icon-user"></i>
              <h5>
              	<c:if test="${type==1}">课程表</c:if>
            	<c:if test="${type==2}">学期表</c:if>
            	<c:if test="${type==3}">章节表</c:if>
            	<c:if test="${type==4}">小节表</c:if>
              </h5>
            </div>  
            <div class="widget-body" style="min-height: 150px;">
            
              <!-- 学期表 -->
              <c:if test="${type==2}">
			   	<table class="table table-striped">
			     <thead>
			       <tr>
			         <th>学期名</th>
			         <th>章节数目</th>
			         <th>题库数目</th>
			         <th>操作</th>
			         <th>排序</th>
			       </tr>
			     </thead>
			     <tbody id="phase_table">
			     	<c:forEach items="${phase}" var="ph">
				     	<tr>
					        <td>${ph.NAME}</td>
					        <td>${ph.chapter1_number}</td>
					        <td>${ph.question_number}</td>
				            <td>
					            <div class="btn-group">
					             <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					             	操作
					             	<span class="caret"></span>
					             </a>
					             <ul class="dropdown-menu pull-right">
					              <li><a href="book/direct_sel?id=${ph.id}&type=${type+1}"><i class="icon-envelope"></i>查看章节</a></li>
					             </ul>
					            </div>
				            </td>
				            <td>
				            	<input type="hidden" id="2" value="${ph.id}">
				           		<button class="btn btn-success btn-small" onclick="up(this);"><i class="icon-circle-arrow-up"></i></button>
				                <button class="btn btn-danger btn-small" onclick="down(this);"><i class="icon-circle-arrow-down"></i></button> 
				            </td>
				      	</tr>
			     	</c:forEach>
			     </tbody>
			   </table>
              </c:if>
              
              
              <!-- 章节表 -->
              <c:if test="${type==3}">
			   	<table class="table table-striped">
			     <thead>
			       <tr>
			         <th>章节名</th>
			         <th>小节数目</th>
			         <th>题库数目</th>
			         <th>操作</th>
			         <th>排序</th>
			       </tr>
			     </thead>
			     <tbody id="chapter1_table">
			     	<c:forEach items="${chapter1}" var="ch1">
			     		<tr>
					        <td>${ch1.NAME}</td>
					        <td>${ch1.son_number}</td>
					        <td>${ch1.question_number}</td>
				           <td>
				            <div class="btn-group">
				             <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
				             	操作
				             	<span class="caret"></span>
				             </a>
				             <ul class="dropdown-menu pull-right">
				              <li><a href="book/direct_sel?id=${ch1.id}&type=${type+1}"><i class="icon-envelope"></i>查看小节</a></li>
				             </ul>
				            </div>
				           </td>
				         <td>
			            	<input type="hidden" id="3" value="${ch1.id}">
			           		<button class="btn btn-success btn-small" onclick="up(this);"><i class="icon-circle-arrow-up"></i></button>
			                <button class="btn btn-danger btn-small" onclick="down(this);"><i class="icon-circle-arrow-down"></i></button> 
			            </td>
				      </tr>
			     	</c:forEach>
			     </tbody>
			   </table>
              </c:if>
              
              
              <!-- 小节表 -->
              <c:if test="${type==4}">
			   	<table class="table table-striped">
			     <thead>
			       <tr>
			         <th>小节名</th>
			         <th>题库数目</th>
			         <th>操作</th>
			         <th>排序</th>
			       </tr>
			     </thead>
			     <tbody id="chapter2_table">
			     	<c:forEach items="${chapter2}" var="ch2">
			     		<tr>
				        	<td>${ch2.NAME}</td>
				        	<td>${ch2.question_number}</td>
				            <td>
					            <div class="btn-group">
					             <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
					             	操作
					             	<span class="caret"></span>
					             </a>
					              <ul class="dropdown-menu pull-right">
					              	<li><a href="question/serch_chapter2?chapter2=${ch2.id}"><i class="icon-envelope"></i>查看题库</a></li>
					              </ul>
					            </div>
				            </td>
				            <td>
				            	<input type="hidden" id="4" value="${ch2.id}">
				           		<button class="btn btn-success btn-small" onclick="up(this);"><i class="icon-circle-arrow-up"></i></button>
				                <button class="btn btn-danger btn-small" onclick="down(this);"><i class="icon-circle-arrow-down"></i></button> 
			            	</td>
				      	</tr>
			     	</c:forEach>
			     </tbody>
			   </table>
              </c:if>
              
              <br><br>
            </div> <!-- /widget-body -->
          </div> <!-- /widget -->
        </div> <!-- /row-fluid -->
      </div>
      <!-- /Main window -->
      
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
    <script type="text/javascript" src="assets/js/jquery.slimscroll.min.js"></script>
    <script type="text/javascript">
    	function up(obj){
    		var type = $(obj).prev().attr("id");
    		var id = $(obj).prev().val();
    		$.post("book/up",{"type":type,"id":id},function(){
    			window.location.reload();
    		})
    	}
    	function down(obj){
    		var type = $(obj).prev().prev().attr("id");
    		var id = $(obj).prev().prev().val();
    		$.post("book/down",{"type":type,"id":id},function(){
    			window.location.reload();
    		})
    	}
    </script>
</body>
</html>
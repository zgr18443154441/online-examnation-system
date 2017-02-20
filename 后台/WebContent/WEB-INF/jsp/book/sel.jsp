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
            <li><a href="#">主页</a> <span class="divider">/</span></li>
            <li class="active">课程管理</li>
          </ul>
          <h2 class="heading">查看课程 </h2>
        </div> <!-- /row-fluid -->
        
		<c:if test="${type!=1}">
		 <div class="row-fluid">
	       <div class="widget widget-padding span12">
	         <div class="widget-header">
	      	  <i class="icon-th-list"></i><h5>目录查询</h5>
	         </div>
	         <div class="widget-body">
	           <div class="widget-forms clearfix">
	           
	             <!-- 查询学期 -->
	             <c:if test="${type==2}">
	             	  <div class="control-group">
	                  <label class="control-label">所属课程</label>
	                    <div class="controls">
	                      <select  tabindex="1" data-placeholder="Select here.." class="span5 course" name="course_id" onchange="change_phase(this);">
	                      	<option value="">【请选择】</option>
	                      </select>
	                   </div>
	                </div>
	             </c:if>
	             
	             <!-- 查询章节 -->
	             <c:if test="${type==3}">
	             	<div class="control-group">
	                  <label class="control-label">所属课程</label>
	                    <div class="controls">
	                      <select tabindex="1" data-placeholder="Select here.." class="span5 course" name="course_id" onchange="phase(this);">
	                      	<option value="">【请选择】</option>
	                      </select>
	                   </div>
	                </div>
	             	  <div class="control-group">
	                  <label class="control-label">所属学期</label>
	                    <div class="controls">
	                      <select tabindex="1" data-placeholder="Select here.." class="span5 phase" name="phase_id"  onchange="change_chapter1(this);">
	                      	<option value="">【请先选择所属课程】</option>
	                      </select>
	                   </div>
	                </div>
	             </c:if>
	             
	             <!-- 查询小节 -->
	             <c:if test="${type==4}">
	             	  <div class="control-group">
	                  <label class="control-label">所属课程</label>
	                    <div class="controls">
	                      <select tabindex="1" data-placeholder="Select here.." class="span5 course" name="course_id" onchange="phase(this);">
	                      	<option value="">【请选择】</option>
	                      </select>
	                   </div>
	                </div>
	             	  <div class="control-group">
	                  <label class="control-label">所属学期</label>
	                    <div class="controls">
	                      <select tabindex="1" data-placeholder="Select here.." class="span5 phase" name="phase_id" onchange="chapter(this);">
	                      	<option value="">【请先选择所属课程】</option>
	                      </select>
	                   </div>
	                </div>
	             	  <div class="control-group">
	                  <label class="control-label">所属章节</label>
	                    <div class="controls">
	                      <select tabindex="1" data-placeholder="Select here.." class="span5 chapter1" name="parent_id" onchange="change_chapter2(this);">
	                      	<option value="">【请先选择所属学期】</option>
	                      </select>
	                   </div>
	                </div>
	             </c:if>
	           </div>
	         </div>
	       </div>
	     </div>  
		</c:if>
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
            
              <!-- 课程表 -->
              <c:if test="${type==1}">
			   	<table class="table table-striped">
			     <thead>
			       <tr>
			         <th>课程名</th>
			         <th>学期数目</th>
			         <th>题库数目</th>
			         <th>操作</th>
			       </tr>
			     </thead>
			     <tbody>
			     	<c:forEach items="${course}" var="co">
			     		<tr>
			        <td>${co.NAME}</td>
			        <td>${co.phase_number}</td>
			        <td>${co.question_number}</td>
			           <td>
			            <div class="btn-group">
			             <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
			             	操作
			             	<span class="caret"></span>
			             </a>
			             <ul class="dropdown-menu pull-right">
			              <li><a href="book/direct_sel?id=${co.id}&type=${type+1}"><i class="icon-envelope"></i>查看学期</a></li>
			             </ul>
			            </div>
			           </td>
			      	</tr>
			     	</c:forEach>
			     </tbody>
			   </table>
              </c:if>
              
              
              <!-- 学期表 -->
              <c:if test="${type==2}">
			   	<table class="table table-striped">
			     <thead>
			       <tr>
			         <th>学期名</th>
			         <th>章节数目</th>
			         <th>题库数目</th>
			         <th>操作</th>
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
		$(function(){
			if('${type}'!=1){
				var course = eval('${course}');
				for(var i=0; i<course.length; i++){
					$(".course").append("<option value='" + course[i].id + "'>" + course[i].NAME + "</option>");
				}
			}
		})
		
		function phase(obj){
			$.post("book/search",{"course_id":$(obj).val(),"type":2},function(phase){
				$(".phase").empty().append("<option value=''>【请先选择所属课程】</option>");
				for(var i=0; i<phase.length; i++){
	    			$(".phase").append("<option value='" + phase[i].id + "'>" + phase[i].name + "</option>");
	    		}
			})
		}
		
		function chapter(obj){
			$.post("book/search",{"phase_id":$(obj).val(),"type":3},function(chapter1){
				$(".chapter1").empty().append("<option value=''>【请先选择所属学期】</option>");
				for(var i=0; i<chapter1.length; i++){
	    			$(".chapter1").append("<option value='" + chapter1[i].id + "'>" + chapter1[i].name + "</option>");
	    		}
			})
		}
		
		function change_phase(obj){
			$.post("book/search",{"course_id":$(obj).val(),"type":2},function(phase){
				$("#phase_table").empty();
				for(var i=0; i<phase.length; i++){
	    			$("#phase_table").append("<tr><td>" + phase[i].name + "</td><td>" + phase[i].chapter1_number + "</td><td>" + phase[i].question_number + "</td><td><div class='btn-group'><a class='btn btn-small dropdown-toggle' data-toggle='dropdown' href='#'>操作<span class='caret'></span></a><ul class='dropdown-menu pull-right'><li><a href='book/direct_sel?id=" + phase[i].id + "&type=${type+1}'><i class='icon-envelope'></i>查看章节</a></li></ul></div></td></tr>");
	    		}
			})
		}
		
		function change_chapter1(obj){
			$.post("book/search",{"phase_id":$(obj).val(),"type":3},function(chapter1){
				$("#chapter1_table").empty();
				for(var i=0; i<chapter1.length; i++){
	    			$("#chapter1_table").append("<tr><td>" + chapter1[i].name + "</td><td>" + chapter1[i].son_number + "</td><td>" + chapter1[i].question_number + "</td><td><div class='btn-group'><a class='btn btn-small dropdown-toggle' data-toggle='dropdown' href='#'>操作<span class='caret'></span></a><ul class='dropdown-menu pull-right'><li><a href='book/direct_sel?id=" + chapter1[i].id + "&type=${type+1}'><i class='icon-envelope'></i>查看小节</a></li></ul></div></td></tr>");
	    		}
			})
		}
		
		function change_chapter2(obj){
			$.post("book/search",{"parent_id":$(obj).val(),"type":4},function(chapter2){
				$("#chapter2_table").empty();
				for(var i=0; i<chapter2.length; i++){
	    			$("#chapter2_table").append("<tr><td>" + chapter2[i].name + "</td><td>" + chapter2[i].question_number + "</td><td><div class='btn-group'><a class='btn btn-small dropdown-toggle' data-toggle='dropdown' href='#'>操作<span class='caret'></span></a><ul class='dropdown-menu pull-right'><li><a href='question/serch_chapter2?chapter2=" + chapter2[i].id + "'><i class='icon-envelope'></i>查看题库</a></li></ul></div></td></tr>");
	    		}
			})
		}
	</script>
</body>
</html>
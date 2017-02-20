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
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    <link rel="Favicon Icon" href="favicon.ico">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href="assets/css/colorpicker.css" rel="stylesheet">
    <link href="assets/css/datepicker.css" rel="stylesheet">
    <link href="assets/css/timepicker.css" rel="stylesheet">
    <link href="assets/css/select2.css" rel="stylesheet">
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
      <div class="main_container" id="forms_page">
        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>题库管理<span class="divider">/</span></li>
            <li class="active">${question_type.NAME}</li>
          </ul>
          <h2 class="heading">添加新题 </h2>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-cog"></i><h5>新的${question_type.NAME}</h5>
            </div>
            
                <form class="form-horizontal" action="question/add" method="post" enctype="multipart/form-data">
                <input type="hidden" name="teacher_id" value="${id}"/>
                <div class="widget-body">
              	 <div class="widget-forms clearfix">
                  <input type="hidden" name="TYPE" value="${question_type.id}">
                  <div class="control-group">
                    <label class="control-label">所属课程</label>
                      <div class="controls">
                        <select tabindex="1" data-placeholder="Select here.." name="course" class="span3 course" onchange="search_phase(this);">
                           <option value="">【请选择】</option>
                        </select>
                        <select tabindex="1" data-placeholder="Select here.." name="phase" class="span3 phase" onchange="search_chapter1(this);">
                           <option value="">【请先选择所属课程】</option>
                        </select>
                        <select tabindex="1" data-placeholder="Select here.." name="chapter1" class="span3 chapter1" onchange="search_chapter2(this);">
                           <option value="">【请先选择所属学期】</option>
                        </select>
                        <select tabindex="1" data-placeholder="Select here.." name="chapter2" class="span3 chapter2">
                           <option value="">【请先选择所属章节】</option>
                        </select>
                     </div>
                  </div>
               	  <div class="control-group">
                    <label class="control-label">题目</label>
                      <div class="controls">
                        <textarea class="editor" style="width:700px;height:300px;" name="content"></textarea>
                      </div>
                  </div>
               	  <div class="control-group">
                    <label class="control-label">配图</label>
                      <div class="controls">
                        <input type="file" name="picture_file"/>
                      </div>
                  </div>
               	  
                  <c:if test="${question_type.id==1}">
	                  <div class="control-group">
	                    <label class="control-label"></label>
	                    <div class="controls">
	                      <input class="span7 success" type="text" name="right" placeholder="请输入正确选项...">
	                    </div>
	                  </div>
                  </c:if>
                  <c:if test="${question_type.id==2}">
                  	  <div class="control-group">
	                    <label class="control-label"></label>
	                      <div class="controls">
	                         <button type="button" onclick="add_right();" class="btn btn-warning">点击添加正确选项</button>
	                      </div>
	                  </div>
	                  <div id="right_choice" class="control-group">
	                    <label class="control-label"></label>
	                    <div class="controls">
	                      <input class="span7 success" type="text" name="right" placeholder="请输入正确选项...">
	                      <button type="button" onclick="minus_choice(this);" class="btn btn-focused">&nbsp;<i class="icon-minus-sign">&nbsp;</i></button>
	                    </div>
	                  </div>
                  </c:if>
                  <div class="control-group">
                    <label class="control-label"></label>
                      <div class="controls">
                         <button type="button" onclick="add_wrong();" class="btn btn-danger">点击添加错误选项</button>
                      </div>
                  </div>
                  <div id="wrong_choice" class="control-group">
                    <label class="control-label"></label>
                    <div class="controls">
                      <input class="span7 error" type="text" name="wrong" placeholder="请输入错误选项...">
                      <button type="button" onclick="minus_choice(this);" class="btn btn-focused">&nbsp;<i class="icon-minus-sign">&nbsp;</i></button>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">解析</label>
                      <div class="controls">
                        <textarea class="editor" style="width:700px;height:300px;" name="analysis"></textarea>
                      </div>
                  </div>
              </div>
            </div>
            <div class="widget-footer">
               <button class="btn btn-primary" type="submit">确定</button>
               <button class="btn" type="reset">清空</button>
            </div>
           </form>
          </div>
        </div>  

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
    <script type="text/javascript" src="assets/js/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-timepicker.js"></script>
    <script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/simple.js"></script>
	<script type="text/javascript">
		$(function(){
			var course = eval('${course}');
			for(var i=0; i<course.length; i++){
				$(".course").append("<option value='" + course[i].id + "'>" + course[i].NAME + "</option>");
			}
		}) 
		
		function search_phase(obj){
			$.post("book/search",{"course_id":$(obj).val(),"type":2},function(phase){
				$(".phase").empty().append("<option value=''>【请先选择所属课程】</option>");
				for(var i=0; i<phase.length; i++){
	    			$(".phase").append("<option value='" + phase[i].id + "'>" + phase[i].name + "</option>");
	    		}
			})
		}
		
		function search_chapter1(obj){
			$.post("book/search",{"phase_id":$(obj).val(),"type":3},function(chapter1){
				$(".chapter1").empty().append("<option value=''>【请先选择所属学期】</option>");
				for(var i=0; i<chapter1.length; i++){
	    			$(".chapter1").append("<option value='" + chapter1[i].id + "'>" + chapter1[i].name + "</option>");
	    		}
			})
		}
		
		function search_chapter2(obj){
			$.post("book/search",{"parent_id":$(obj).val(),"type":4},function(chapter2){
				$(".chapter2").empty().append("<option value=''>【请先选择所属章节】</option>");
				for(var i=0; i<chapter2.length; i++){
	    			$(".chapter2").append("<option value='" + chapter2[i].id + "'>" + chapter2[i].name + "</option>");
	    		}
			})
		}
		
		function add_right(){
			$("#right_choice").append("<br><label class='control-label'></label><div class='controls'><input class='span7 success' type='text' name='right' placeholder='请输入正确选项...'>&nbsp;<button type='button' onclick='minus_choice(this);' class='btn btn-focused'>&nbsp;<i class='icon-minus-sign'>&nbsp;</i></button></div>");
		}
		
		function add_wrong(){
			$("#wrong_choice").append("<br><label class='control-label'></label><div class='controls'><input class='span7 error' type='text' name='wrong' placeholder='请输入错误选项...'>&nbsp;<button type='button' onclick='minus_choice(this);' class='btn btn-focused'>&nbsp;<i class='icon-minus-sign'>&nbsp;</i></button></div>");
		}
		
		function minus_choice(obj){
			$(obj).parent().prev().prev().remove();
			$(obj).parent().prev().remove();
			$(obj).parent().remove();
		}
	</script>
</body>
</html>
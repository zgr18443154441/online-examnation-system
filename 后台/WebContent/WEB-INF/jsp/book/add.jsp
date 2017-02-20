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
<title>Insert title here</title>
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
     <jsp:include page="/WEB-INF/jsp/surrounding/manager_side.jsp"></jsp:include>

      <!-- Main window -->
      <div class="main_container" id="forms_page">
        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>课程管理<span class="divider">/</span></li>
            <li class="active">
            	<c:if test="${type==1}">添加课程</c:if>
            	<c:if test="${type==2}">添加学期</c:if>
            	<c:if test="${type==3}">添加章节</c:if>
            	<c:if test="${type==4}">添加小节</c:if>
            </li>
          </ul>
          <h2 class="heading">添加</h2>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
           	  <c:if test="${type==1}"><i class="icon-table"></i><h5>新的课程</h5></c:if>
         	  <c:if test="${type==2}"><i class="icon-th-large"></i><h5>新的学期</h5></c:if>
         	  <c:if test="${type==3}"><i class="icon-th"></i><h5>新的章节</h5></c:if>
         	  <c:if test="${type==4}"><i class="icon-th-list"></i><h5>新的小节</h5></c:if>
            </div>
              
                <!-- 添加课程 -->
                <c:if test="${type==1}">
					<form class="form-horizontal" action="book/add">
						<div class="widget-body">
							<div class="widget-forms clearfix">
								<div class="control-group">
									<label class="control-label">课程名</label>
									<div class="controls">
										<input class="span5" type="text" name="NAME" placeholder="50字以内…">
										<input type="hidden" name="type" value="1">
									</div>
								</div>
							</div>
						</div>
						<div class="widget-footer">
							<button class="btn btn-primary" type="submit">确定</button>
							<button class="btn" type="reset">清空</button>
						</div>
					</form>
                </c:if>
                
                <!-- 添加学期 -->
                <c:if test="${type==2}">
	               	<form class="form-horizontal" action="book/add">
	               	    <div class="widget-body">
						 <div class="widget-forms clearfix">
						  <div class="control-group">
						     <label class="control-label">所属课程</label>
						       <div class="controls">
						         <select  tabindex="1" data-placeholder="Select here.." class="span5 course" name="course_id">
						         	<option value="">【请选择】</option>
						         </select>
						     </div>
						  </div>
						  <div class="control-group">
						     <label class="control-label">学期名</label>
						     <div class="controls">
						       <input class="span5" type="text" name="NAME" placeholder="50字以内…">
						        <input type="hidden" name="type" value="2">
						     </div>
						   </div>
						 </div>
						</div>
						<div class="widget-footer">
						  <button class="btn btn-primary" type="submit">确定</button>
						  <button class="btn" type="reset">清空</button>
						</div>
	                </form>
                </c:if>
                
                <!-- 添加章节 -->
                <c:if test="${type==3}">
                	<form class="form-horizontal" action="book/add">
	                	<div class="widget-body">
						 <div class="widget-forms clearfix">
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
		                        <select tabindex="1" data-placeholder="Select here.." class="span5 phase" name="phase_id">
		                        	<option value="">【请先选择所属课程】</option>
		                        </select>
		                     </div>
		                  </div>
		                  <div class="control-group">
		                    <label class="control-label">章节名</label>
		                    <div class="controls">
		                      <input class="span5" type="text" name="NAME" placeholder="50字以内…">
		                       <input type="hidden" name="type" value="3">
		                    </div>
		                  </div>
		                  </div>
		                  </div>
		                  <div class="widget-footer">
			                <button class="btn btn-primary" type="submit">确定</button>
			                <button class="btn" type="reset">清空</button>
			              </div>
	                </form>
                </c:if>
                
                <!-- 添加小节 -->
                <c:if test="${type==4}">
                	<form class="form-horizontal" action="book/add">
                		<div class="widget-body">
							<div class="widget-forms clearfix">
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
		                        <select tabindex="1" data-placeholder="Select here.." class="span5 chapter1" name="parent_id">
		                        	<option value="">【请先选择所属学期】</option>
		                        </select>
		                     </div>
		                  </div>
		                  <div class="control-group">
		                    <label class="control-label">小节名</label>
		                    <div class="controls">
		                      <input class="span5" type="text" name="NAME" placeholder="50字以内…">
		                       <input type="hidden" name="type" value="4">
		                    </div>
		                  </div>
		                  </div>
		                  </div>
		                  <div class="widget-footer">
			                <button class="btn btn-primary" type="submit">确定</button>
			                <button class="btn" type="reset">清空</button>
			              </div>
	                </form>
                </c:if>
            
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
    </script>
</body>
</html>
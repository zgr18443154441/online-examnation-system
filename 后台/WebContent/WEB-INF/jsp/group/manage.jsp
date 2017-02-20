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
            <li>主页 <span class="divider">/</span></li>
            <li>用户管理 <span class="divider">/</span></li>
            <li>班级管理 <span class="divider">/</span></li>
            <li class="active">更改班级</li>
          </ul>
         </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
           	  <i class="icon-group"></i>
           	  <h5>旧的班级</h5>
            </div>
            <form class="form-horizontal" action="group/update">
	            <div class="widget-body">
	              <div class="widget-forms clearfix">
               	  <div class="control-group">
                    <label class="control-label">选择班级</label>
                      <div class="controls">
                        <select  tabindex="1" data-placeholder="Select here.." class="span5" onchange="nochange(this);">
                        	<option value="">【请选择】</option>
			               	<c:forEach items="${groups}" var="g">
			               		<option value="${g.id}">${g.NAME}</option>
			               	</c:forEach>
		               </select>
		               <a href="javascript:void(0);"><button type="button" onclick="change(this);" class="btn btn-success">修改</button></a>
                     </div>
                  </div>
               	  <div class="control-group">
                    <label class="control-label">代课教师</label>
                      <div class="controls">
                        <select id="t"  tabindex="1" data-placeholder="Select here.." class="span5" name="teacher_id" disabled="disabled">
                        	<option value="">【请选择】</option>
                        	<c:forEach items="${teachers}" var="t">
                        		<option value="${t.id}">${t.NAME}</option>
                        	</c:forEach>
                        </select>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">班级名称</label>
                    <div class="controls">
                      <input id="g" class="span5" type="text" name="NAME" value="" placeholder="30字以内…" disabled="disabled">
                      <input id="h" type="hidden" name="id" value="">
                      <input type="hidden" name="state" value="1">
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
    <script type="text/javascript">
    	function change(obj){
    		var group_id = $(obj).parent().prev().val();
    		if(group_id!=""){
    			$("#h").attr("value",group_id);
        		$("#g").removeAttr("disabled ","disabled ");
        		$("#t").removeAttr("disabled ","disabled ")
    		}
    	}
    	function nochange(obj){
    		$("#h").attr("value","");
    		$("#g").attr("disabled","disabled");
    		$("#t").attr("disabled","disabled");
    		$("#a").attr("href","group/delete?id="+$(obj).val());
    	}
    </script>
</body>
</html>
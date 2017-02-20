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
     <jsp:include page="/WEB-INF/jsp/surrounding/manager_side.jsp"></jsp:include>

      <!-- Main window -->
      <div class="main_container" id="tasks_page">
        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>用户管理<span class="divider">/</span></li>
            <li class="active">班级管理</li>
          </ul>
          <h2 class="heading">
                	班级信息
                <div class="btn-group pull-right">
                  <a href="group/to_add"><button class="btn"><i class="icon-plus-sign"></i>&nbsp;添加</button></a>
                  <a href="group/to_manage"><button class="btn"><i class="icon-edit"></i>&nbsp;修改</button></a>
                </div>
          </h2>
        </div>

        <div class="row-fluid">
            <div class="pull-left">
                <c:forEach items="${groups}" var="g">
                	<div id="donut${g.id}" class="circle" style="height:200px; width:200px; background-color:white; border-radius:100px;" data-toggle="modal" data-target="#task_modal${g.id}"></div>
                	<strong>${g.NAME}</strong>
                </c:forEach>
            </div>
        </div>
      </div>
      <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->



    <!-- 班级模态框 -->
    <c:forEach items="${groups}" var="g">
    	<div id="task_modal${g.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        <h3 id="myModalLabel">${g.NAME}</h3>
	      </div>
	      <div class="modal-body">
	        <div class="clearfix">
	          <c:forEach items="${teachers}" var="t">
	          	<c:if test="${t.id==g.teacher_id}">
	          		<c:if test="${t.photo==null}"><img src="assets/img/people.jpg" class="img-circle" style="float: left; width: 65px; margin-right: 20px;"></c:if>
    				<c:if test="${t.photo!=null}"><img src="upload/${t.photo}" class="img-circle" style="float: left; width: 65px; margin-right: 20px;"></c:if>
	           		<h3 style="margin:0">${t.NAME}</h3>
	          	</c:if>
	          </c:forEach>
	           <p class="muted">代课教师</p>
	        </div>
	        <hr>
	        <h5>起止日期</h5>
	        <p>${g.start_date}~${g.end_date}</p>
	        <h5>近期动态：</h5>
	        <p>
	                （${g.bussiness.built_date}）${g.bussiness.content}
	        <p>
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
    <script type="text/javascript">
    	// check if you are on the tasks page
	    if($('#tasks_page').length > 0 ){
	
	        // init knob
	        $(".knob").knob({
	            draw : function () {}
	        });
			var groups = eval('${groups_Json}');
			for(var i=0;i<groups.length;i++){
				// draw donuts
		        Morris.Donut({
		          element: 'donut'+groups[i].id,
		          data: [
		            {label: "男生", value: groups[i].boy_number},
		            {label: "女生", value: groups[i].student_number-groups[i].boy_number}
		          ],
		          colors:['#6FB3CE','#F79999']
		        });
			}	        
	    }
    </script>
</body>
</html>
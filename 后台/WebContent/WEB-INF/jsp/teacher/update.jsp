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
      <div class="main_container" id="forms_page">
        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li class="active">个人信息</li>
          </ul>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-cog"></i>
              <h5>修改个人信息</h5>
            </div>
           <form class="form-horizontal" action="user/update" method="post" enctype="multipart/form-data">
           	<input name="id" value="${user.id}" type="hidden" >
           	<input name="state" value="${user.state}" type="hidden" >
            <div class="widget-body">
              <div class="widget-forms clearfix">
	              <div class="control-group">
	                <label class="control-label">账号</label>
	                <div class="controls">
	                  <input class="span7" name="account"  value="${user.account}" type="text" >
	                </div>
	              </div>
	              <div class="control-group">
	                <label class="control-label">密码</label>
	                <div class="controls">
	                  <input class="span7" name="PASSWORD"  value="${user.password}" type="text" >
	                </div>
	              </div>
	              <div class="control-group">
	                <label class="control-label">照片</label>
	                <div class="controls">
	                	<img alt="暂未上传" src="upload/${user.photo}" height="10px">
	                </div>
	              </div>
	              <div class="control-group">
	                <label class="control-label">更改照片</label>
	                <div class="controls">
	                	<input type="file" name="photo_file"/>
	                </div>
	              </div>
	              <div class="control-group">
	                <label class="control-label">申请日期</label>
	                <div class="controls">
	                  <input class="span7" disabled name="apply_date" value="${user.apply_date}" type="text" >
	                </div>
	              </div>
	              <div class="control-group">
	                <label class="control-label">注册日期</label>
	                <div class="controls">
	                  <input class="span7" disabled name="register_date" value="${user.register_date}" type="text" >
	                </div>
	              </div>
	              <div class="control-group">
                    <label class="control-label">所带班级</label>
                      <div class="controls">
                        <select tabindex="1" data-placeholder="Select here.." class="span7">
                        	<c:forEach items="${group}" var="g">
                        		<c:if test="${g.teacher_id==user.id}">
                           			<option>${g.NAME}（${g.student_number}人）</option>
                        		</c:if>
                        	</c:forEach>
                        </select>
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
</body>
</html>
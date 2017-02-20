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
	<input type="hidden" id="year" value="${map.year}">
	<input type="hidden" id="month" value="${map.month}">
	<input type="hidden" id="day" value="${map.day}">
	<input type="hidden" id="week" value="${map.week}">
	<input type="hidden" id="state" value="${map.state}">
	<input type="hidden" id="year" value="${map.year}">
 <!-- Main window -->
      <div class="main_container" id="gallery_page">
        <div class="row-fluid" style="margin-top: 25px">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-github-alt"></i>
              <h5>学员风采</h5>
            </div>  
            <div class="widget-body">
  				<div id="gallery-container">
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/1.jpg" rel="facybox"><img src="assets/img/gallery/1.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/2.jpg" rel="facybox"><img src="assets/img/gallery/2.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/3.jpg" rel="facybox"><img src="assets/img/gallery/3.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/4.jpg" rel="facybox"><img src="assets/img/gallery/4.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/5.jpg" rel="facybox"><img src="assets/img/gallery/5.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/6.jpg" rel="facybox"><img src="assets/img/gallery/6.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/7.jpg" rel="facybox"><img src="assets/img/gallery/7.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/8.jpg" rel="facybox"><img src="assets/img/gallery/8.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/9.jpg" rel="facybox"><img src="assets/img/gallery/9.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/10.jpg" rel="facybox"><img src="assets/img/gallery/10.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/11.jpg" rel="facybox"><img src="assets/img/gallery/11.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/12.jpg" rel="facybox"><img src="assets/img/gallery/12.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/13.jpg" rel="facybox"><img src="assets/img/gallery/13.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/14.jpg" rel="facybox"><img src="assets/img/gallery/14.jpg" alt=""></a>
  				  </div>
  				  <div class="gallery-item">
  				  	<a href="assets/img/gallery/15.jpg" rel="facybox"><img src="assets/img/gallery/15.jpg" alt=""></a>
  				  </div>
  				  <c:forEach items="${photos}" var="p">
	  				  <div class="gallery-item">
	  				  	<a href="javascript:void(0);" rel="facybox"><img src="http://localhost:8080/school/upload/${p.photo}" alt="${p.NAME}"></a>
	  				  </div>
  				  </c:forEach>
  				</div>
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
    //-----  Dashboard page -----//
    if($('#gallery_page').length > 0 ){
        // init knob
        $(".knob").knob();
      // activate slimscroll
      $('#widget-tasks').slimScroll({
        height: '170px'
      });
      $('.slimscroll').slimScroll({height:'310px'});
      // Welcome notification

      $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: '欢迎登陆四海学员考试系统后台',
        // (string | mandatory) the text inside the notification
        text: '今天是' + $("#year").val() + '年' + $("#month").val() + '月' + $("#day").val() + '日' + $("#week").val() + '，'+$("#state").val(),
        // (string | optional) the image to display on the left
        image: 'assets/img/house.png',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: true,
        // (int | optional) the time you want it to be alive for before fading out
        time: '',
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
      });


      // sparkline plugin
      $('.inlinesparkline').sparkline('html', {
        width:'100',
        height:'30',
        lineColor: '#42C1F7',
        fillColor: '#B3E6FC'
      });

      // draw charts
      redraw_dashboard_analytics();

    } 
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%> 
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner" style="height: 50px">
    <div class="container-fluid">
      <div class="logo" style="margin-top:-10px;"> 
        <img src="assets/img/logo.png" width="100px;">
      </div>
                 <a class="btn btn-navbar visible-phone" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
           <a class="btn btn-navbar slide_menu_left visible-tablet">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
      <div class="top-menu visible-desktop">
      	<ul class="pull-left">
      		<c:if test="${user_type==1}">
          		<li><a data-notification="${new_student_number}" href="group/business_sel"><i class="icon-user"></i>学员申请</a></li>
          		<li><a data-notification="${new_problem_number}" href="group/business_sel"><i class="icon-question-sign"></i>学生提问</a></li>
      		</c:if>
      		<c:if test="${user_type==2}">
          		<li><a data-notification="${new_teacher_number}" href="user/list"><i class="icon-user"></i>教师申请</a></li>
          		<li><a data-notification="${new_question_number}" href="question/new_question"><i class="icon-plus-sign"></i>新题申请</a></li>
      		</c:if>
        </ul>
        <ul class="pull-right">  
          <li><a href=user/exit><i class="icon-off"></i> 注销</a></li>
        </ul>
      </div>
      <div class="top-menu visible-phone visible-tablet">
        <ul class="pull-right">  
          <li><a title="link to View all Messages page, no popover in phone view or tablet" href="#"><i class="icon-envelope"></i></a></li>
          <li><a title="link to View all Notifications page, no popover in phone view or tablet" href="#"><i class="icon-globe"></i></a></li>
          <li><a href="login.html"><i class="icon-off"></i></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
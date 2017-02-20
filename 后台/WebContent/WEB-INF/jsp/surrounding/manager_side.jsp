<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%> 
<div class="sidebar-nav nav-collapse collapse">
  <div class="user_side clearfix">
    <c:if test="${photo==null}"><img src="assets/img/people.jpg"></c:if>
    <c:if test="${photo!=null}"><img src="upload/${photo}"></c:if>
    <h5>${name}</h5>
    <a href="user/to_update?id=${id}"><i class="icon-cog"></i> 设置</a>        
  </div>
  <div class="accordion" id="accordion2">
    <div class="accordion-group">
      <div class="accordion-heading">
        <a class="accordion-toggle active b_F79999" href="user/index"><i class="icon-home"></i> <span>主页</span></a>
      </div>
    </div>
    <div class="accordion-group">
      <div class="accordion-heading">
        <a class="accordion-toggle active b_F79999" href="book/manage"><i class="icon-book"></i> <span>课程管理</span></a>
      </div>
    </div>
    <div class="accordion-group">
      <div class="accordion-heading">
        <a class="accordion-toggle b_C3F7A7 collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse1"><i class="icon-inbox"></i> <span>题库管理</span></a>
      </div>
      <div id="collapse1" class="accordion-body collapse">
        <div class="accordion-inner">
          <a class="accordion-toggle" href="question/new_question"><i class="icon-signout"></i>&nbsp;&nbsp;&nbsp;新题申请</a>
          <a class="accordion-toggle" href="question/page?TYPE=1"><i class="icon-cog"></i>&nbsp;&nbsp;&nbsp;单选题</a>
          <a class="accordion-toggle" href="question/page?TYPE=2"><i class="icon-cogs"></i>&nbsp;&nbsp;&nbsp;多选题</a>
          <a class="accordion-toggle" href="question/page?TYPE=3"><i class="icon-check"></i>&nbsp;&nbsp;&nbsp;判断题</a>
          <a class="accordion-toggle" href="question/page?TYPE=4"><i class="icon-comment"></i>&nbsp;&nbsp;&nbsp;简答题</a>
          <a class="accordion-toggle" href="question/page?TYPE=5"><i class="icon-laptop"></i>&nbsp;&nbsp;&nbsp;编程题</a>
          <a class="accordion-toggle" href="question/page?TYPE=6"><i class="icon-edit"></i>&nbsp;&nbsp;&nbsp;填空题</a>
        </div>
      </div>
    </div>
    <div class="accordion-group">
      <div class="accordion-heading">
        <a class="accordion-toggle b_9FDDF6 collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse2"><i class="icon-group"></i> <span>用户管理</span></a>
      </div>
      <div id="collapse2" class="accordion-body collapse">
        <div class="accordion-inner">
          <a class="accordion-toggle" href="user/list"><i class="icon-user"></i> 教师管理</a>
          <a class="accordion-toggle" href="user/page"><i class="icon-github-alt"></i> 学生管理</a>
          <a class="accordion-toggle" href="group/list"><i class="icon-sitemap"></i> 班级管理</a>
        </div>
      </div>
    </div>
  </div>
</div>
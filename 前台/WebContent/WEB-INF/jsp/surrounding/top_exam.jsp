<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
 <div class="container">
   <div class="navbar-header">
     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
       <span class="sr-only">Toggle navigation</span>
     </button>
     <a class="navbar-brand" href="javascript:void(0);">SHXT</a>
   </div>
   <div class="navbar-collapse collapse">
     <ul class="nav navbar-nav">
       <li><a href="user/index">主页</a></li>
       <li class="active"><a href="examnation/list_group">考试</a></li>
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">训练<b class="caret"></b></a>
         <span class="dropdown-arrow"></span>
         <ul class="dropdown-menu">
           <li><a href="question/random_text">随机训练</a></li>
           <li><a href="question/select">精准训练</a></li>
         </ul>
       </li>
       <li><a href="problem/to_add">提问</a></li>
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">查询<b class="caret"></b></a>
         <span class="dropdown-arrow"></span>
         <ul class="dropdown-menu">
           <li><a href="record/all_examnation">历史成绩</a></li>
           <li class="divider"></li>
           <li><a href="problem/sel_reply">问题答复</a></li>
         </ul>
       </li>
     </ul>
     <ul class="nav navbar-nav navbar-right">
       <li class="active"><a href="user/to_update">${name}</a></li>
       <li><a href="user/exit">注销</a></li>
     </ul>
   </div><!--/.nav-collapse -->
  </div>
</div>
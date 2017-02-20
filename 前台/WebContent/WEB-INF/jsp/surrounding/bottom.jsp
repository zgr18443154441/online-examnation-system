<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%> 
<footer>
  <div class="container">
    <div class="row">
      <div class="col-xs-7">
        <h3 class="footer-title">四海兴唐教育考试系统</h3>
        <p>喜欢编程吗? 想从事IT行业吗？来四海兴唐试试吧！<br/>
          Android培训、Java培训、JavaEE培训、iOS培训、UI设计培训、PHP培训、C++培训、WEB前端培训、移动端WEB前端培训、Android培训一应俱全<br/>
          详情请访问: <a href="http://http://www.ccshxt.com/" target="_blank">http://www.ccshxt.com/</a>
        </p>

      </div> <!-- /col-xs-7 -->

      <div class="col-xs-5">
        <div class="footer-banner">
          <h3 class="footer-title">前往登录考试系统后台</h3>
          <ul>
            <li>出题考试&nbsp;/&nbsp;教师改卷&nbsp;/&nbsp;班级管理</li>
            <li>教师管理&nbsp;/&nbsp;学员管理</li>
          </ul>
                     网址：<a href="http://localhost:8080/school_back/login.jsp" target="_blank">school_back/login</a>
        </div>
      </div>
    </div>
  </div>
</footer>
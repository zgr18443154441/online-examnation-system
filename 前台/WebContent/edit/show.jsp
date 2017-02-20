<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>"/>
    
		<title>My JSP 'show.jsp' starting page</title>
    
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>    
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css"/>
		-->

	</head>
  
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String s = request.getParameter("content");
		%>	
		<%=s %>	
	</body>
</html>

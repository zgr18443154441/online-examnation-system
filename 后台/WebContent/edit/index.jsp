<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>"/>
    
		<title>My JSP 't1.jsp' starting page</title>
    
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>    
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css"/>
		-->

	</head>
  
	<body>
		<form action="show.jsp" method="post"  id="s">
			<textarea id="editor_id" style="width:700px;height:300px;" name="content"></textarea>
			<input type="submit" value="提交"/>
			<a href="javascript:sub();">js提交表单</a>
		</form>
		
		
		<script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
		<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
		<script charset="utf-8" src="plugins/kindeditor-4.1.4/simple.js"></script>
		
		<script type="text/javascript">
			function sub(){
				
				document.getElementById("s").submit();
			}
		</script>
	</body>
</html>

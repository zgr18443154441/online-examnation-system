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
   	 <jsp:include page="/WEB-INF/jsp/surrounding/teacher_side.jsp"></jsp:include>

      <!-- Main window -->
      <div class="main_container" id="users_page">

        <div class="row-fluid">
          <ul class="breadcrumb">
            <li>主页<span class="divider">/</span></li>
            <li>考试管理<span class="divider">/</span></li>
            <li class="active">替换试题</li>
          </ul>
          <h2 class="heading">试题库</h2>
        </div> <!-- /row-fluid -->

        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-group"></i>
              <h5>
              	<c:if test="${TYPE==1}">单选题表</c:if>
              	<c:if test="${TYPE==2}">多选题表</c:if>
              	<c:if test="${TYPE==3}">判断题表</c:if>
              	<c:if test="${TYPE==4}">简答题表</c:if>
              	<c:if test="${TYPE==5}">编程题表</c:if>
              	<c:if test="${TYPE==6}">填空题表</c:if>
              </h5>
            </div>  
            <div class="widget-body">
              <table class="table table-striped table-bordered dataTable">
                <thead>
                  <tr>
                    <th>出题人</th>
                    <th>题目</th>
                    <th>所属课程</th>
                    <th>所属学期</th>
                    <th>所属章节</th>
                    <th>所属小节</th>
                    <th>使用次数</th>
                    <th>正确率</th>
                    <th>难度</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${questions}" var="q">
	                  <tr>
		                  <td>
		                  	<c:forEach items="${user}" var="u">
		                  		<c:if test="${u.id==q.teacher_id}">
			                  		${u.NAME}
			                  	</c:if>
		                  	</c:forEach>
		                  	<c:if test="${q.teacher_id==null}">管理员</c:if>
		                  </td>
		                  <td>${q.con_sub}</td>
		                  <td>
		                  	<c:forEach items="${courses}" var="co">
		                  		<c:if test="${q.course==co.id}">${co.NAME}</c:if>
		                  	</c:forEach>
		                  </td>
		                  <td>
		                  	<c:forEach items="${phases}" var="ph">
		                  		<c:if test="${q.phase==ph.id}">${ph.NAME}</c:if>
		                  	</c:forEach>
		                  </td>
		                  <td>
		                  	<c:forEach items="${chapters1}" var="ch1">
		                  		<c:if test="${q.chapter1==ch1.id}">${ch1.NAME}</c:if>
		                  	</c:forEach>
		                  </td>
		                  <td>
		                  	<c:forEach items="${chapters2}" var="ch2">
		                  		<c:if test="${q.chapter2==ch2.id}">${ch2.NAME}</c:if>
		                  	</c:forEach>
		                  </td>
		                  <td>${q.use_times}</td>
		                  <td>
		                  	<c:if test="${q.right_percent==0.0}">无法统计</c:if>
		                  	<c:if test="${q.right_percent!=0.0}">${q.right_percent}%</c:if>
		                  </td>
		                  <td>
		                  	<c:if test="${q.LEVEL==0}">无法评定</c:if>
		                  	<c:if test="${q.LEVEL!=0}">
			                  	<c:forEach begin="1" end="${q.LEVEL}">
			                  		<i class="icon-star-empty"></i>
			                  	</c:forEach>
		                  	</c:if>
		                  </td>
		                  <td>
			                  <div class="btn-group">
				                  <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
				                    	选项
				                  	<span class="caret"></span>
				                  </a>
				                  <ul class="dropdown-menu pull-right">
					                  <li><a href="#"  data-toggle="modal" data-target="#task_modal${q.id}"><i class="icon-search"></i>查看详细内容</a></li>
					                  <li><a href="examnation/change?examnation_id=${examnation_id}&old_question_id=${old_question_id}&new_question_id=${q.id}"><i class=" icon-ok-sign"></i>替换</a></li>
				                  </ul>
			                  </div>
		                  </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
           	 <br><br><br>
            </div> <!-- /widget-body -->
          </div> <!-- /widget -->
        </div> <!-- /row-fluid -->

      </div>
      <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->



	<!-- 1单选，2多选，3判断，4简答，5编程, 6填空 -->

    <!-- 题目信息模态框 -->
    <c:forEach items="${questions}" var="q">
	    <!-- 判断题 -->
	   	<c:if test="${q.TYPE=='3' }">
	    	<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		        <h3 id="myModalLabel">题目信息</h3>
		      </div>
		      <div class="modal-body">
		        <div class="widget-alerts clearfix">
		          <form class="form-horizontal">
		            <div class="control-group">
		              <label class="control-label">题目</label>
		              <div class="controls">
		                <div class="alert">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.content}<br>
		                  <img alt="配图" src="upload/${q.picture}">
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">正确答案</label>
		              <div class="controls">
		                <div class="alert alert-success">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  <strong>
		                  	<c:if test="${q.answer=='Y'}"><i class="icon-ok"></i></c:if>
	                  		<c:if test="${q.answer=='N'}"><i class="icon-remove"></i></c:if> 
		                  </strong> 
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">解析</label>
		              <div class="controls">
		                <div class="alert alert-info">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.analysis} 
		                </div>
		              </div>
		            </div>
		          </form>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		      </div>
		    </div> 
   		</c:if>
	   	<!-- 选择题 -->
	   	<c:if test="${q.TYPE=='1'||q.TYPE=='2'}">
	    	<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		        <h3 id="myModalLabel">题目信息</h3>
		      </div>
		      <div class="modal-body">
		        <div class="widget-alerts clearfix">
		          <form class="form-horizontal">
		            <div class="control-group">
		              <label class="control-label">题目</label>
		              <div class="controls">
		                <div class="alert">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.content}<br>
		                  <img alt="配图" src="upload/${q.picture}">
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">正确选项</label>
		              <div class="controls">
		                <div class="alert alert-success">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  <c:forEach items="${q.right_choice}" var="rc">
		                  	${rc.content}<br>
		                  </c:forEach>
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">错误选项</label>
		              <div class="controls">
		                <div class="alert alert-error">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  <c:forEach items="${q.wrong_choice}" var="wc">
		                  	${wc.content}<br>
		                  </c:forEach>
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">解析</label>
		              <div class="controls">
		                <div class="alert alert-info">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.analysis} 
		                </div>
		              </div>
		            </div>
		          </form>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		      </div>
		    </div> 
   		</c:if>
	   	<!-- 填空题 -->
	   	<c:if test="${q.TYPE=='6'}">
	    	<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		        <h3 id="myModalLabel">题目信息</h3>
		      </div>
		      <div class="modal-body">
		        <div class="widget-alerts clearfix">
		          <form class="form-horizontal">
		            <div class="control-group">
		              <label class="control-label">题目</label>
		              <div class="controls">
		                <div class="alert">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.content}
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">正确答案</label>
		              <div class="controls">
		                <div class="alert alert-success">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  <c:forEach items="${q.filling_blank}" var="fb">
		                  	第${fb.location+1}空：${fb.content}<br>
		                  </c:forEach>
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">解析</label>
		              <div class="controls">
		                <div class="alert alert-info">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.analysis} 
		                </div>
		              </div>
		            </div>
		          </form>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		      </div>
		    </div> 
   		</c:if>
	   	<!-- 简答编程题 -->
	   	<c:if test="${q.TYPE=='4'||q.TYPE=='5'}">
	    	<div id="task_modal${q.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		        <h3 id="myModalLabel">题目信息</h3>
		      </div>
		      <div class="modal-body">
		        <div class="widget-alerts clearfix">
		          <form class="form-horizontal">
		            <div class="control-group">
		              <label class="control-label">题目</label>
		              <div class="controls">
		                <div class="alert">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.content}
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">参考答案</label>
		              <div class="controls">
		                <div class="alert alert-success">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.answer}
		                </div>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">解析</label>
		              <div class="controls">
		                <div class="alert alert-info">
		                  <button type="button" class="close" data-dismiss="alert">&times;</button>
		                  ${q.analysis} 
		                </div>
		              </div>
		            </div>
		          </form>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		      </div>
		    </div> 
   		</c:if>
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
</body>
</html>
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
          <li class="active">批改试卷</li>
        </ul>
        <h2 class="heading">
            	批改中(试卷份数：
            	<c:forEach items="${student_answers}" var="sas">
	        		<c:set value="${sum+1}" var="sum"></c:set>
	        	</c:forEach>
	        	<c:if test="${sum==null}">0</c:if>
	        	${sum})
        </h2>
      </div> <!-- /row-fluid -->
        <div class="row-fluid">
         <div class="widget widget-padding span6">
           <div class="widget-header">
             <i class="icon-flag"></i>
             <h5>试题及答案</h5>
           </div>  
           <div class="widget-body">
             <div class="widget-alerts clearfix">
               <form class="form-horizontal">
                 <c:forEach items="${questions}" var="q">
               		<c:if test="${q.TYPE==4||q.TYPE==5}">
               			<div class="control-group">
		                   <label class="control-label">Q
		                       	<c:forEach items="${sort}" var="s">
		                       		<c:if test="${s.question_id==q.id}">${s.sort}</c:if>
		                       	</c:forEach>.
		                   </label>
		                   <div class="controls">
		                     <div class="alert alert-success">
		                       <button type="button" class="close" data-dismiss="alert">&times;</button>${q.content} 
		                       <c:if test="${q.TYPE==4}">（${examnation.short_answer_score}分）</c:if>
		                       <c:if test="${q.TYPE==5}">（${examnation.programme_score}分）</c:if>
		                     </div>
		                   </div>
		                </div>
		                <div class="control-group">
		                   <label class="control-label">参考答案（解析）</label>
		                   <div class="controls">
		                     <div class="alert alert-info">
		                       <button type="button" class="close" data-dismiss="alert">&times;</button>
		                       ${q.answer} （${q.analysis}）
		                     </div>
		                   </div>
		                </div>
               		</c:if>
                 </c:forEach>
                 
               </form>
             </div>
           </div><!--/widget-body-->
         </div> <!-- /widget -->
         <div class="widget widget-padding span6">
           <div class="widget-header">
             <i class="icon-legal"></i>
             <h5>评价打分</h5>
             <div class="widget-buttons">
             	 <a href="javascript:void(0);" onclick="prev_paper();">上一份</a>
                 <a href="javascript:void(0);" onclick="next_paper();">下一份</a>
                 <a href="javascript:void(0);" onclick="finish();">完成</a>
             </div>
           </div>  
           <div class="widget-body">
             <div class="widget-alerts clearfix">
               <form id="skip" action="record/finish_value" class="form-horizontal" onsubmit="return upload();">
               	<input type="hidden" id="student_answers" value="${student_answers}">
               	<input type="hidden" name="examnation_id" id="examnation_id" value="${examnation.id}">
                <c:forEach items="${student_answers}" var="sas">
                	<div id="${sas[0].student_id}" class="student_id">
                		<c:forEach items="${sas}" var="sa">
                			<c:forEach items="${questions}" var="q">
                				<c:if test="${q.TYPE==4||q.TYPE==5}">
                					<c:forEach items="${sort}" var="s">
			                			<c:if test="${sa.question_id==s.question_id&&sa.question_id==q.id}">
			                				<div class="control-group">
							                   <label class="control-label">考生答案</label>
							                   <div class="controls">
							                     <div class="alert alert-success">
							                       <button type="button" class="close" data-dismiss="alert">&times;</button>
							                       ${sa.answer}
							                     </div>
							                   </div>
							                </div>
							                <div class="control-group">
							                   <label class="control-label">打分</label>
							                   <div class="controls">
							                     <div class="alert alert-info">
							                       <button type="button" class="close" data-dismiss="alert">&times;</button>
							                       <input id="${sa.student_id}" class="span7 scores" type="text" placeholder="请以左侧题目分数为上限">
							                     </div>
							                   </div>
							                </div>
			                			</c:if>
			                		</c:forEach>
                				</c:if>
                			</c:forEach>
                		</c:forEach>
                	</div>
                </c:forEach>
               </form>
             </div>
           </div><!--/widget-body-->
         </div> <!-- /widget -->
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
    <script type="text/javascript">
    var index = 0;
    var examnation_id;
    $(function(){
    	examnation_id = $("#examnation_id").val();
    	for(var i = 0 ; i<$(".student_id").length; i++){
    		$(".student_id").eq(i).attr("style","display: none;");
    	}
    	$(".student_id").eq(index).removeAttr("style");
    })
    function prev_paper(){
    	if(index==0){}else{
    		for(var i = 0 ; i<$(".student_id").length; i++){
        		$(".student_id").eq(i).attr("style","display: none;");
        	}
    		index--;
        	$(".student_id").eq(index).removeAttr("style");
    	}
    }
    function next_paper(){
    	if(index==($(".student_id").length-1)){}else{
    		for(var i = 0 ; i<$(".student_id").length; i++){
        		$(".student_id").eq(i).attr("style","display: none;");
        	}
    		index++;
        	$(".student_id").eq(index).removeAttr("style");
    	}
    }
    function finish(){
    	$("#skip").submit();
    }
    function upload(){
    	var all_score = true;
    	for(var i = 0; i <$(".scores").length; i++){
    		if($(".scores").eq(i).val()==""){
    			all_score = false;
    			break;
    		}
    	}
    	if(all_score){
    		for(var i = 0; i <$(".scores").length; i++){
    			$.post("record/finish_score",{"student_id":$(".scores").eq(i).attr("id"),"examnation_id":examnation_id,"score":$(".scores").eq(i).val()},null)
    		}
    		alert("已批改完成所有试卷");
    		return true;
    	}else{
    		alert("存在未打分项，无法提交成绩");
    		return false;
    	}
    }
    </script>
</body>
</html>
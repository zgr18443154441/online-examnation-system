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
    <link href="assets/css/colorpicker.css" rel="stylesheet">
    <link href="assets/css/datepicker.css" rel="stylesheet">
    <link href="assets/css/timepicker.css" rel="stylesheet">
    <link href="assets/css/select2.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
    <!-- 顶栏 -->
    <jsp:include page="/WEB-INF/jsp/surrounding/top.jsp"></jsp:include>

    <div class="container-fluid">
     
    <!-- 侧栏 -->
   	<jsp:include page="/WEB-INF/jsp/surrounding/teacher_side.jsp"></jsp:include>

    <!-- Main window -->
    <div class="main_container" id="forms_page">
     <div class="row-fluid">
       <ul class="breadcrumb">
         <li>主页<span class="divider">/</span></li>
         <li>考试管理<span class="divider">/</span></li>
         <li class="active">试卷检验</li>
       </ul>
       <h2 class="heading">
     	${examnation.title}（总分
     	<c:forEach items="${sort}" var="s">
     		<c:set value="${sum+s.score}" var="sum"></c:set>
     	</c:forEach>     
     		<span id="sum_score"><c:out value="${sum}"></c:out></span>）
       </h2>
     </div>
      
     <div class="row-fluid">
       <div class="widget span12" style="overflow:visible;">
             <a class="btn btn-box bubble bubble-danger span2 tips" data-title="bubble-danger" href="javascript:void(0);" data-bubble="${examnation.single_choice_number}" onclick="sc();"><i class="icon-cog"></i><span>单选题</span></a>
             <a class="btn btn-box bubble bubble-success span2 tips" data-title="bubble-success" href="javascript:void(0);" data-bubble="${examnation.multiple_choice_number}" onclick="mc();"><i class="icon-cogs"></i><span>多选题</span></a>
             <a class="btn btn-box bubble bubble-info span2 tips" data-title="bubble-info" href="javascript:void(0);" data-bubble="${examnation.judge_number}" onclick="j();"><i class="icon-check"></i><span>判断题</span></a>
             <a class="btn btn-box bubble bubble-danger span2 tips" data-title="bubble-danger" href="javascript:void(0);" data-bubble="${examnation.filling_blank_number}" onclick="fb();"><i class="icon-edit"></i><span>填空题</span></a>
             <a class="btn btn-box bubble bubble-success span2 tips" data-title="bubble-success" href="javascript:void(0);" data-bubble="${examnation.short_answer_number}" onclick="sa();"><i class="icon-comment"></i><span>简答题</span></a>
             <a class="btn btn-box bubble bubble-info span2 tips" data-title="bubble-info" href="javascript:void(0);" data-bubble="${examnation.programme_number}" onclick="p();"><i class="icon-laptop"></i><span>编程题</span></a>
       </div><!-- /widget -->
     </div><!-- /row-fluid -->
     
     <!-- 单选题 -->
  	 <div class="row-fluid" id="sc">
		<div class="widget widget-padding span12">
			<div class="widget-header">
				<i class="icon-cog"></i>
				<h5>单选题<span style="font-size: 10px">（绿色为正确选项）</span>
					<input type="hidden" value="1">
					<button class="btn btn-primary" type="button" onclick="scores_up(this);"><i class="icon-caret-up"></i></button>
					<button class="btn btn-primary" type="button" onclick="scores_down(this);"><i class="icon-caret-down"></i></button>
				</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==1}">
					<c:set value="${sc_number+1}" var="sc_number"></c:set>
					<h5>
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">Q${s.sort}.</c:if>
						</c:forEach>
						${q.content}&nbsp;
							<c:forEach items="${sort}" var="s">
								<c:if test="${q.id==s.question_id}">（<input type="hidden" value="${s.id}"><span>${s.score}</span>分）</c:if>
							</c:forEach>
						<button class="btn btn-primary sc_score_up" type="button" onclick="score_up(this);"><i class="icon-caret-up"></i></button>
						<button class="btn btn-primary sc_score_down" type="button" onclick="score_down(this);"><i class="icon-caret-down"></i></button>
						<a href="examnation/to_change?examnation_id=${examnation.id}&question_id=${q.id}&TYPE=${q.TYPE}"><button class="btn btn-primary" type="button"><i class="icon-retweet"></i></button></a>
					</h5>
					<section class="row-fluid">
						<c:forEach items="${q.right_choice}" var="rc">
							<div class="span3">
					          <p>  
					            <span class="help-block" style="color: #595">${rc.content}</span>
					          </p>			
							</div>
						</c:forEach>
						<c:forEach items="${q.wrong_choice}" var="wc">
							<div class="span3">
					          <p>  
					            <span class="help-block">${wc.content}</span>
					          </p>			
							</div>
						</c:forEach>
					</section>
				</c:if>
			</c:forEach>
			<c:if test="${sc_number==null}">
				<span class="help-block">本试卷暂无该题型</span>
			</c:if>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->  
	
	 <!-- 多选题 -->
  	 <div class="row-fluid" id="mc">
		<div class="widget widget-padding span12">
			<div class="widget-header">
				<i class="icon-cogs"></i>
				<h5>多选题<span style="font-size: 10px">（绿色为正确选项）</span>
					<input type="hidden" value="2">
					<button class="btn btn-primary" type="button" onclick="scores_up(this);"><i class="icon-caret-up"></i></button>
					<button class="btn btn-primary" type="button" onclick="scores_down(this);"><i class="icon-caret-down"></i></button>
				</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==2}">
					<c:set value="${mc_number+1}" var="mc_number"></c:set>
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>
						.${q.content}&nbsp;
							<c:forEach items="${sort}" var="s">
								<c:if test="${q.id==s.question_id}"><input type="hidden" value="${s.id}">（<span>${s.score}</span>分）</c:if>
							</c:forEach>
						<button class="btn btn-primary mc_score_up" type="button" onclick="score_up(this);"><i class="icon-caret-up"></i></button>
						<button class="btn btn-primary mc_score_down" type="button" onclick="score_down(this);"><i class="icon-caret-down"></i></button>
						<a href="examnation/to_change?examnation_id=${examnation.id}&question_id=${q.id}&TYPE=${q.TYPE}"><button class="btn btn-primary" type="button"><i class="icon-retweet"></i></button></a>
					</h5>
					<section class="row-fluid">
						<c:forEach items="${q.right_choice}" var="rc">
							<div class="span2">
					          <p>  
					            <span class="help-block" style="color: #595">${rc.content}</span>
					          </p>			
							</div>
						</c:forEach>
						<c:forEach items="${q.wrong_choice}" var="wc">
							<div class="span2">
					          <p>  
					            <span class="help-block">${wc.content}</span>
					          </p>			
							</div>
						</c:forEach>
					</section>
				</c:if>
			</c:forEach>
			<c:if test="${mc_number==null}">
				<span class="help-block">本试卷暂无该题型</span>
			</c:if>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->  
	   
	 <!-- 判断题 -->
  	 <div class="row-fluid" id="j">
		<div class="widget widget-padding span12">
			<div class="widget-header">
				<i class="icon-check"></i>
				<h5>判断题
					<input type="hidden" value="3">
					<button class="btn btn-primary" type="button" onclick="scores_up(this);"><i class="icon-caret-up"></i></button>
					<button class="btn btn-primary" type="button" onclick="scores_down(this);"><i class="icon-caret-down"></i></button>
				</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==3}">
					<c:set value="${j_number+1}" var="j_number"></c:set>
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>
						.${q.content}&nbsp;
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}"><input type="hidden" value="${s.id}">（<span>${s.score}</span>分）</c:if>
						</c:forEach>
						<button class="btn btn-primary j_score_up" type="button" onclick="score_up(this);"><i class="icon-caret-up"></i></button>
						<button class="btn btn-primary j_score_down" type="button" onclick="score_down(this);"><i class="icon-caret-down"></i></button>
						<a href="examnation/to_change?examnation_id=${examnation.id}&question_id=${q.id}&TYPE=${q.TYPE}"><button class="btn btn-primary" type="button"><i class="icon-retweet"></i></button></a>
					</h5>
					<section class="row-fluid">
						<div class="span2">
				          <p>  
				            <span class="help-block">答案：
				            	<c:if test="${q.answer=='Y'}">正确</c:if>
				            	<c:if test="${q.answer=='N'}">错误</c:if>
				            </span>
				          </p>			
						</div>
					</section>
				</c:if>
			</c:forEach>
			<c:if test="${j_number==null}">
				<span class="help-block">本试卷暂无该题型</span>
			</c:if>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->   
	  
	 <!-- 简答题 -->
  	 <div class="row-fluid" id="sa">
		<div class="widget widget-padding span12">
			<div class="widget-header">
				<i class="icon-comment"></i>
				<h5>简答题
					<input type="hidden" value="5">
					<button class="btn btn-primary" type="button" onclick="scores_up(this);"><i class="icon-caret-up"></i></button>
					<button class="btn btn-primary" type="button" onclick="scores_down(this);"><i class="icon-caret-down"></i></button>
				</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==4}">
					<c:set value="${sa_number+1}" var="sa_number"></c:set>
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>
						.${q.content}&nbsp;
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}"><input type="hidden" value="${s.id}">（<span>${s.score}</span>分）</c:if>
						</c:forEach>
						<button class="btn btn-primary sa_score_up" type="button" onclick="score_up(this);"><i class="icon-caret-up"></i></button>
						<button class="btn btn-primary sa_score_down" type="button" onclick="score_down(this);"><i class="icon-caret-down"></i></button>
						<a href="examnation/to_change?examnation_id=${examnation.id}&question_id=${q.id}&TYPE=${q.TYPE}"><button class="btn btn-primary" type="button"><i class="icon-retweet"></i></button></a>
					</h5>
					<section class="row-fluid">
						<div class="span12">
				          <p>  
				            <span class="help-block">参考答案：${q.answer}</span>
				          </p>			
						</div>
					</section>
				</c:if>
			</c:forEach>
			<c:if test="${sa_number==null}">
				<span class="help-block">本试卷暂无该题型</span>
			</c:if>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->   
	  
	 <!-- 编程题 -->
  	 <div class="row-fluid" id="p">
		<div class="widget widget-padding span12">
			<div class="widget-header">
				<i class="icon-laptop"></i>
				<h5>编程题
					<input type="hidden" value="6">
					<button class="btn btn-primary" type="button" onclick="scores_up(this);"><i class="icon-caret-up"></i></button>
					<button class="btn btn-primary" type="button" onclick="scores_down(this);"><i class="icon-caret-down"></i></button>
				</h5>
			</div>  
			<div class="widget-body">
				<c:forEach items="${questions}" var="q">
					<c:if test="${q.TYPE==5}">
						<c:set value="${p_number+1}" var="p_number"></c:set>
						<h5>Q
							<c:forEach items="${sort}" var="s">
								<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
							</c:forEach>
							.${q.content}&nbsp;
							<c:forEach items="${sort}" var="s">
								<c:if test="${q.id==s.question_id}"><input type="hidden" value="${s.id}">（<span>${s.score}</span>分）</c:if>
							</c:forEach>
							<button class="btn btn-primary p_score_up" type="button" onclick="score_up(this);"><i class="icon-caret-up"></i></button>
							<button class="btn btn-primary p_score_down" type="button" onclick="score_down(this);"><i class="icon-caret-down"></i></button>
							<a href="examnation/to_change?examnation_id=${examnation.id}&question_id=${q.id}&TYPE=${q.TYPE}"><button class="btn btn-primary" type="button"><i class="icon-retweet"></i></button></a>
						</h5>
						<section class="row-fluid">
							<div class="span12">
					          <p>  
					            <span class="help-block">参考答案：${q.answer}</span>
					          </p>			
							</div>
						</section>
					</c:if>
				</c:forEach>
				<c:if test="${p_number==null}">
					<span class="help-block">本试卷暂无该题型</span>
				</c:if>
			</div> 
		</div> 
	</div> <!-- /row-fluid -->    
	 
	 <!-- 填空题 -->
  	 <div class="row-fluid" id="fb">
		<div class="widget widget-padding span12">
			<div class="widget-header">
				<i class="icon-edit"></i>
				<h5>填空题
					<input type="hidden" value="4">
					<button class="btn btn-primary" type="button" onclick="scores_up(this);"><i class="icon-caret-up"></i></button>
					<button class="btn btn-primary" type="button" onclick="scores_down(this);"><i class="icon-caret-down"></i></button>
				</h5>
			</div>  
			<div class="widget-body">
			<c:forEach items="${questions}" var="q">
				<c:if test="${q.TYPE==6}">
					<c:set value="${fb_number+1}" var="fb_number"></c:set>
					<h5>Q
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}">${s.sort}</c:if>
						</c:forEach>					
						.${q.content}&nbsp;
						<c:forEach items="${sort}" var="s">
							<c:if test="${q.id==s.question_id}"><input type="hidden" value="${s.id}">（<span>${s.score}</span>分）</c:if>
						</c:forEach>
						<button class="btn btn-primary fb_score_up" type="button" onclick="score_up(this);"><i class="icon-caret-up"></i></button>
						<button class="btn btn-primary fb_score_down" type="button" onclick="score_down(this);"><i class="icon-caret-down"></i></button>
						<a href="examnation/to_change?examnation_id=${examnation.id}&question_id=${q.id}&TYPE=${q.TYPE}"><button class="btn btn-primary" type="button"><i class="icon-retweet"></i></button></a>
					</h5>
					<section class="row-fluid">
						<c:forEach items="${q.filling_blank}" var="fb">
							<div class="span2">
					          <p>  
					            <span class="help-block">第${fb.location+1}空：${fb.content}</span>
					          </p>			
							</div>
						</c:forEach>
					</section>
				</c:if>
			</c:forEach>
			<c:if test="${fb_number==null}">
				<span class="help-block">本试卷暂无该题型</span>
			</c:if>
		  </div> 
		</div> 
	</div> <!-- /row-fluid -->     
	
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->
    </div>

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

    <script type="text/javascript" src="assets/js/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		})
		function sc(){
			$("#sc").attr("style","display:");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
		function mc(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display:");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
		function j(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display:");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
		function sa(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display:");
			$("#p").attr("style","display: none;");
		}
		function p(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display: none;");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display:");
		}
		function fb(){
			$("#sc").attr("style","display: none;");
			$("#mc").attr("style","display: none;");
			$("#j").attr("style","display: none;");
			$("#fb").attr("style","display:");
			$("#sa").attr("style","display: none;");
			$("#p").attr("style","display: none;");
		}
		
		//单题加分
		function score_up(obj){
			var score = parseInt($(obj).prev().html(), 10);
			//题目加分
			$(obj).prev().html(score+1);
			//总分加分
			$("#sum_score").html(parseInt($("#sum_score").html(), 10)+1);
			//修改数据库
			$.post("examnation/score_up",{"id":$(obj).prev().prev().val()},null);
		}
		
		//单题减分
		function score_down(obj){
			var score = parseInt($(obj).prev().prev().html(), 10);
			if(score==1){
				alert("题目分数不能小于1分");
			}else{
				//题目减分
				$(obj).prev().prev().html(score-1);
				//总分减分
				$("#sum_score").html(parseInt($("#sum_score").html(), 10)-1);
				//修改数据库
				$.post("examnation/score_down",{"id":$(obj).prev().prev().prev().val()},null);
			}
		}
		
		//多题加分
		function scores_up(obj){
			var type = $(obj).prev().val();
			switch (type) {
			case "1":
				for(var i = 0 ; i < $(".sc_score_up").length; i++){
					$(".sc_score_up").eq(i).click();
				}
				break;
			case "2":
				for(var i = 0 ; i < $(".mc_score_up").length; i++){
					$(".mc_score_up").eq(i).click();
				}
				break;
			case "3":
				for(var i = 0 ; i < $(".j_score_up").length; i++){
					$(".j_score_up").eq(i).click();
				}
				break;
			case "4":
				for(var i = 0 ; i < $(".fb_score_up").length; i++){
					$(".fb_score_up").eq(i).click();
				}
				break;
			case "5":
				for(var i = 0 ; i < $(".sa_score_up").length; i++){
					$(".sa_score_up").eq(i).click();
				}
				break;
			case "6":
				for(var i = 0 ; i < $(".p_score_up").length; i++){
					$(".p_score_up").eq(i).click();
				}
				break;
			}
		}
		
		//多题减分
		function scores_down(obj){
			var type = $(obj).prev().prev().val();
			switch (type) {
			case "1":
				for(var i = 0 ; i < $(".sc_score_down").length; i++){
					$(".sc_score_down").eq(i).click();
				}
				break;
			case "2":
				for(var i = 0 ; i < $(".mc_score_down").length; i++){
					$(".mc_score_down").eq(i).click();
				}
				break;
			case "3":
				for(var i = 0 ; i < $(".j_score_down").length; i++){
					$(".j_score_down").eq(i).click();
				}
				break;
			case "4":
				for(var i = 0 ; i < $(".fb_score_down").length; i++){
					$(".fb_score_down").eq(i).click();
				}
				break;
			case "5":
				for(var i = 0 ; i < $(".sa_score_down").length; i++){
					$(".sa_score_down").eq(i).click();
				}
				break;
			case "6":
				for(var i = 0 ; i < $(".p_score_down").length; i++){
					$(".p_score_down").eq(i).click();
				}
				break;
			}
		}
	</script>
</body>
</html>
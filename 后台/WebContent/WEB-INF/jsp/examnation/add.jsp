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
            <li class="active">出题考试</li>
          </ul>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-file"></i><h5>建立新的试卷</h5>
            </div>
           <form class="form-horizontal" action="examnation/to_set" method="post" onsubmit="return check_param();">
           	<input type="hidden" name="teacher_id" value="${id}">
            <div class="widget-body">
              <div class="widget-forms clearfix">
	              <div class="control-group">
	                <label class="control-label">试卷标题</label>
	                <div class="controls">
	                  <input class="span5" id="title" name="title" type="text" >
	                </div>
	              </div>
	              <div class="control-group">
                    <label class="control-label">适用班级</label>
                    <div class="controls">
                      <c:forEach items="${group}" var="g">
						  <label class="checkbox">
						  <input type="checkbox" name="group_id" value="${g.id}">
						    ${g.NAME}
						  </label>
                      </c:forEach>
                    </div>
                  </div>
	              <div class="control-group">
                    <label class="control-label">考试日期</label>
                      <div class="controls">
                        <div class="input-append date datepicker" id="datepicker-years" data-date-format="yyyy-mm-dd" data-date="now">
                          <input id="text_date" name="text_date" readonly="readonly" size="10" type="text">
                          <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">开始时间</label>
                      <div class="controls">
                        <div class="input-append bootstrap-timepicker-component">
                          <input id="start_time" name="start_time" readonly="readonly" type="text" class="input-small timepicker-24hrs">
                          <span class="add-on">
                            <i class="icon-time"></i>
                          </span>
                        </div>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">结束时间</label>
                      <div class="controls">
                        <div class="input-append bootstrap-timepicker-component">
                          <input id="end_time" type="text" name="end_time" readonly="readonly" class="input-small timepicker-24hrs">
                          <span class="add-on">
                            <i class="icon-time"></i>
                          </span>
                        </div>
                      </div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label">生成方式</label>
                    <div class="controls">
                      <label class="radio">
                        <input id="rset" type="radio" name="set_style" value="1" onclick="random_set();">
                        	随机出题
							<span class="help-inline">【随机生成将按照设定题目数从题库中随机抽取相应数目题目组成试卷】</span>
                      </label> 
                      <label class="radio">
                        <input id="dset" type="radio" name="set_style" checked="checked" value="2" onclick="diy_set();">
                        	自主选题
							<span class="help-inline">【自主选择可以自由选题并设定题目分数】</span>
                      </label> 
                    </div>
                  </div>
                  
	              <div id="questions" style="display:none;">
	              		<div class="control-group">
		                    <label class="control-label">单选题</label>
		                      <div class="controls">
		                        <div class="input-append">
		                           <input name="single_choice_number" value="0" type="hidden">
		                           <input id="sc" class="span3" value="0" type="text" disabled="disabled"><span class="add-on">题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                           <input name="single_choice_score" value="5" type="hidden">
		                           <input class="span3" value="5" type="text" disabled="disabled"><span class="add-on" style="width: 50px">分/题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                        </div>
		                     </div>
		                  </div>
			              <div class="control-group">
		                    <label class="control-label">多选题</label>
		                      <div class="controls">
		                        <div class="input-append">
		                           <input name="multiple_choice_number" value="0" type="hidden">
		                           <input id="mc" class="span3" value="0" disabled="disabled" type="text" ><span class="add-on">题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                           <input name="multiple_choice_score" value="5" type="hidden">
		                           <input class="span3" value="5" disabled="disabled" type="text" ><span class="add-on" style="width: 50px">分/题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                        </div>
		                     </div>
		                  </div>
			              <div class="control-group">
		                    <label class="control-label">判断题</label>
		                      <div class="controls">
		                        <div class="input-append">
		                           <input name="judge_number" value="0" type="hidden">
		                           <input id="j" class="span3" value="0" disabled="disabled" type="text" ><span class="add-on">题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                           <input name="judge_score" value="5" type="hidden">
		                           <input class="span3" value="5" disabled="disabled" type="text" ><span class="add-on" style="width: 50px">分/题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                        </div>
		                     </div>
		                  </div>
			              <div class="control-group">
		                    <label class="control-label">填空题</label>
		                      <div class="controls">
		                        <div class="input-append">
		                           <input name="filling_blank_number" value="0" type="hidden">
		                           <input id="fb" class="span3" value="0" disabled="disabled" type="text" ><span class="add-on">题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                           <input name="filling_blank_score" value="5" type="hidden">
		                           <input class="span3" value="5" disabled="disabled" type="text" ><span class="add-on" style="width: 50px">分/题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                        </div>
		                     </div>
		                  </div>
			              <div class="control-group">
		                    <label class="control-label">简答题</label>
		                      <div class="controls">
		                        <div class="input-append">
		                           <input name="short_answer_number" value="0" type="hidden">
		                           <input id="sa" class="span3" value="0" disabled="disabled" type="text" ><span class="add-on">题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                           <input name="short_answer_score" value="10" type="hidden">
		                           <input class="span3" value="10" disabled="disabled" type="text" ><span class="add-on" style="width: 50px">分/题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                        </div>
		                     </div>
		                  </div>
			              <div class="control-group">
		                    <label class="control-label">编程题</label>
		                      <div class="controls">
		                        <div class="input-append">
		                           <input name="programme_number" value="0" type="hidden">
		                           <input id="p" class="span3" value="0" disabled="disabled" type="text" ><span class="add-on">题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                           <input name="programme_score" value="10" type="hidden">
		                           <input class="span3" value="10" disabled="disabled" type="text" ><span class="add-on" style="width: 50px">分/题</span>
		                           <button type="button" class="btn" onclick="up(this);">&nbsp;<i class="icon-chevron-up"></i>&nbsp;</button>
		                           <button type="button" class="btn" onclick="down(this);">&nbsp;<i class="icon-chevron-down"></i>&nbsp;</button>
		                        </div>
		                     </div>
		             	</div>
	              </div>
	              
	          </div>
	        </div>  
            <div class="widget-footer">
               <button class="btn btn-primary" type="submit">确定</button>
               <button class="btn" type="reset">清空</button>
            </div>
          </form>
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

    <script type="text/javascript" src="assets/js/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-timepicker.js"></script>
    <script type="text/javascript">
    
    	//获取题库数目
    	var single_choice;
    	var multiple_choice;
    	var judge;
    	var short_answer;
    	var programme;
    	var filling_blank;
		$(function(){
			$.post("question/type_count",{"TYPE":"1"},function(number){
				single_choice = number;
			})
			$.post("question/type_count",{"TYPE":"2"},function(number){
				multiple_choice = number;
			})
			$.post("question/type_count",{"TYPE":"3"},function(number){
				judge = number;
			})
			$.post("question/type_count",{"TYPE":"4"},function(number){
				short_answer = number;
			})
			$.post("question/type_count",{"TYPE":"5"},function(number){
				programme = number;
			})
			$.post("question/type_count",{"TYPE":"6"},function(number){
				filling_blank = number;
			})
		})  
		
		//限制题目数量上限
    	function up(obj){
    		switch ($(obj).prev().prev().attr("id")) {
			case "sc":
				if($(obj).prev().prev().val()==single_choice){
					alert("题目数量已达题库上限！");
					$(obj).attr("class","btn btn-inverse");
				}else{
					$(obj).prev().prev().val(parseInt($(obj).prev().prev().val())+1);
					$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())+1);
					$(obj).next().attr("class","btn");
				}
				break;
			case "mc":
				if($(obj).prev().prev().val()==multiple_choice){
					alert("题目数量已达题库上限！");
					$(obj).attr("class","btn btn-inverse");
				}else{
					$(obj).prev().prev().val(parseInt($(obj).prev().prev().val())+1);
					$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())+1);
					$(obj).next().attr("class","btn");
				}
				break;
			case "j":
				if($(obj).prev().prev().val()==judge){
					alert("题目数量已达题库上限！");
					$(obj).attr("class","btn btn-inverse");
				}else{
					$(obj).prev().prev().val(parseInt($(obj).prev().prev().val())+1);
					$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())+1);
					$(obj).next().attr("class","btn");
				}
				break;
			case "sa":
				if($(obj).prev().prev().val()==short_answer){
					alert("题目数量已达题库上限！");
					$(obj).attr("class","btn btn-inverse");
				}else{
					$(obj).prev().prev().val(parseInt($(obj).prev().prev().val())+1);
					$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())+1);
					$(obj).next().attr("class","btn");
				}
				break;
			case "p":
				if($(obj).prev().prev().val()==programme){
					alert("题目数量已达题库上限！");
					$(obj).attr("class","btn btn-inverse");
				}else{
					$(obj).prev().prev().val(parseInt($(obj).prev().prev().val())+1);
					$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())+1);
					$(obj).next().attr("class","btn");
				}
				break;
			case "fb":
				if($(obj).prev().prev().val()==filling_blank){
					alert("题目数量已达题库上限！");
					$(obj).attr("class","btn btn-inverse");
				}else{
					$(obj).prev().prev().val(parseInt($(obj).prev().prev().val())+1);
					$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())+1);
					$(obj).next().attr("class","btn");
				}
				break;
			default:
				$(obj).prev().prev().val(parseInt($(obj).prev().prev().val())+1);
				$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())+1);
				$(obj).next().attr("class","btn");
				break;
			}
    	}
		
		//限制题目数量下限
		function down(obj){
			if($(obj).prev().prev().prev().val()==0){
				$(obj).attr("class","btn btn-inverse");
			}else{
				$(obj).prev().prev().prev().val(parseInt($(obj).prev().prev().prev().val())-1);
				$(obj).prev().prev().prev().prev().val(parseInt($(obj).prev().prev().prev().prev().val())-1);
				$(obj).prev().attr("class","btn");
			}
		}
		
		//随机出题
		function random_set(){
			$("#questions").removeAttr("style");
		}
		
		//自主选题
		function diy_set(){
			$("#questions").attr("style","display: none;");
		}
		
		//检查信息设置缺漏
		function check_param(){
			if($("#title").val()==""){
				alert("试卷标题不能为空");
				return false;
			}
			if(!($("input[name='group_id']:checked").val())==true){
				alert("请至少选中一个班级");
				return false;
			}
			if($("#text_date").val()==""){
				alert("考试日期不能为空");
				return false;
			}
			if(Date.parse($("#text_date").val())<new Date().getTime()){
				alert("考试日期不能早于当前时间");
				return false;				
			}
			if($("#start_time").val()==""){
				alert("开始时间不能为空");
				return false;
			}
			if($("#end_time").val()==""){
				alert("结束时间不能为空");
				return false;
			}
			if($("#start_time").val()>$("#end_time").val()){
				alert("结束时间不能早于开始时间");
				return false;
			}
			if($("#rset").prop("checked")==true&&$("input[name='single_choice_number']").val()==0&&$("input[name='multiple_choice_number']").val()==0&&$("input[name='judge_number']").val()==0&&$("input[name='filling_blank_number']").val()==0&&$("input[name='short_answer_number']").val()==0&&$("input[name='programme_number']").val()==0){
				alert("请至少选择一道题作为考试题目");
				return false;
			}
			//自主命题下清空题目数
			if($("#dset").prop("checked")==true){
				$("input[name='single_choice_number']").val("0");
				$("input[name='multiple_choice_number']").val("0");
				$("input[name='judge_number']").val("0");
				$("input[name='filling_blank_number']").val("0");
				$("input[name='short_answer_number']").val("0");
				$("input[name='programme_number']").val("0");
			}
		}
    </script>
</body>
</html>
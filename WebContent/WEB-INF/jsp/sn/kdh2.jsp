<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href='/include/fullcalendar-3.9.0/fullcalendar.min.css' rel='stylesheet' />
<link href='/include/fullcalendar-3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/include/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='/include/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='/include/fullcalendar-3.9.0/lib/jquery.bpopup.min.js'></script>
<script src='/include/fullcalendar-3.9.0/fullcalendar.min.js?ver=1;'></script>
<script src='/include/fullcalendar-3.9.0/locale/ko.js'></script>
<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
      defaultDate: '2018-03-12',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: {
    	  url: '/schedulnotice/snlistajax.ssm',
    	  error:function(){
    		 alert("연결 실패에 >ㅁ<");
    	  }
      },
    eventClick: function(){
    	addSchedule()
	    	
    }
    });//풀캘린더 함수
    
    

    $('#calendarbutton').click(function(){
    		
    });
    
    
    
    
  });//레디펑션

  function addSchedule(){
	  var htmlsContents="";
	  <%String name="김동환";%>
	  htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>일정 제목</div><div style='width:60%;float:right'><input type='text'id='snTitle' value=''></div></div>";
	  htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>시작 날짜</div><div style='width:60%;float:right'><input type='text'id='snStartdate'  style='width:80px'></div></div>";
	  htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>마침 날짜</div><div style='width:60%;float:right'><input type='text'id='snEnddate'  style='width:80px'></div></div>";
	  htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>첨부 파일</div><div style='width:60%;float:right'><input type='file'id='snFile' style='width:80px'></div></div>";
	  htmlsContents += "<div style='width:100%; height:30px; text-align:center; margin-bottom:15px; margin-top:10px'><button onclick=\"javascript:saveSchedule();\">저장하기</button></div>";
	  openPopup("일정등록",htmlsContents,400);
  }
  
  function openPopup(subject,contents,widths){
	  $("#alert_subject").html(subject);
	  $("#alert_contents").html(contents);
	  openMessage('winAlert',widths)
  }
  
  function saveSchedule(){
	  alert("버튼이 눌린다");
	  var snTitle = $("#snTitle").val();
	  var snStartdate = $("#snStartdate").val();
	  var snEnddate = $("#snEnddate").val();
	  var snFile = $("#snFile").val();
	
	  if(!snTitle){
		  alert("일정을 입력 하세요!");
		  return false;
	  }
	  if(!snStartdate){
		  alert("시작 날짜를 입력해 주세요");
		  return false;
	  }
	  if(!snEnddate){
		  alert("마침 날짜를 입력해 주세요");
		  return false;
	  }
	  $.ajax({
		  type	:	'POST',
		  url 	:	"/schedulnotice/snwirteajax.ssm",
		  data	:	{snTitle : snTitle, snStartdate : snStartdate, snEnddate : snEnddate, snFile: snFile},
		  cache :	false,
		  async : 	false
	  })
	 .done(function(result){
		 alert("result>>>:"+ result);
		 if(result == "OK"){
			alert("정상 저장되었습니다.");
			closeMessage("winAlert");
			$('#calendar').fullCalendar("refetchEvents"); //이거는 아직 확인 안됌
		 }
	 });
  }
  
  function openMessage(IDS,widths){
	  $('#'+IDS).css("width",widths+"px");
	  $('#'+IDS).bPopup();
  }
  
  function closeMessage(IDS){
	  $('#'+IDS).bPopup().close();
  }
  
  
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>
<h1>학교일정 게시판</h1>
		<input type="button" id="calendarbutton" value="목록형">
		<input type="button" value="캘린더형" disabled>
  <div style ="max-width:900px; margin:0 auto; height:30px">
  	<div style="float:right">
  		<button onclick="javascript:addSchedule();">일정등록</button>
  	</div>
  </div>
  <div id='calendar'></div>

  <div class="box box-success" style="width:500px; display:none; background-color:white" id="winAlert">
  	<div class="box-header with-border" style="background-color:white; padding-left:15px">
  		<h3 class="box-title" id="alert_subject" style="background-color:white"></h3>
  	</div>
  	<div class="box-body" id="alert_contents" style="font-size:15px;background-color:white">
  	</div>
  </div>

</body>
</html>

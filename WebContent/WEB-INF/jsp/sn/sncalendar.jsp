<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<%request.setCharacterEncoding("EUC-KR"); %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 풀캘린더  api -->
<link href='/include/fullcalendar-4.4.0/packages/core/main.css' rel='stylesheet' />
<link href='/include/fullcalendar-4.4.0/packages/daygrid/main.css' rel='stylesheet' />
<link href='/include/fullcalendar-4.4.0/packages/timegrid/main.css' rel='stylesheet' />
<link href='/include/fullcalendar-4.4.0/packages/list/main.css' rel='stylesheet' />
<script src='/include/fullcalendar-4.4.0/packages/core/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/interaction/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/daygrid/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/timegrid/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/list/main.js'></script>

<!-- 비팝업  -->
<script src="/include/fullcalendar-4.4.0/packages/jquery.bpopup.min.js?ver=1;"></script>

<!-- 제이쿼리 -->
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js?"></script>


<script>
//풀캘린더와 데이터피커의 충돌로인한 오류 해결코드
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>
<script>

$(document).ready(function(){
	
	$("#snInsert").click(function(){
		$("#sninsertForm").attr('action','/schedulnotice/snInsert.ssm')
		.submit();
	});
	$("#snUpdate").click(function(){
		$("#snupdateForm").attr('action','/schedulnotice/snUpdate.ssm')
		.submit();
	});
	$("#snDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			$("#snupdateForm").attr('action','/schedulnotice/snDelete.ssm')
			.submit();
		}
	});
});	

//풀캘린더 함수
document.addEventListener('DOMContentLoaded', function() {
	
	var events = [];
	
	//데이터 불러와서 events 에 담기
	$.ajax({
		url:"/schedulnotice/snlistajax.ssm",							
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override":"post"
		},
		dataType:'json',							
		success:function(data){		
			$.each(data, function (i,snlist) {
                events.push({
                    title    : snlist.title,
                    start    : snlist.start,
                    end	     : snlist.end,
                    id	     : snlist.no
                });
            });
	
	//풀캘린더 사용
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
    	left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      locale: 'ko',
      defaultDate: '2020-03-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      buttonText :{
          today : '오늘',
          next : '다음달',
          prev : '이전달'
       },
      allday:true,// allow "more" link when too many events
     /*  events: [{
    	  title : "ㅋㅋㅋㅋ",
    	  start : "2020-03-06",
    	  end   : "2020-03-06",
    	  no	: "SN0001"
      }], */
      events : events,
      eventClick: function(info){
    	  sndatapicker();
    	  var title=info.event.title;
    	  var startdate=info.event.start;
    	  var enddate=info.event.end;
    	  var no=info.event.id;
    	  
    	  var syy = startdate.getFullYear();
    	  var smm = Number(startdate.getMonth()+1);
    	  if(smm<10){
    		  smm = "0"+smm
    	  }
    	  var sdd = Number(startdate.getDate());
		  if(sdd<10){
			  sdd = "0"+sdd
		  }
    	  startdate = syy+"-"+smm+"-"+sdd;
    	  
    	  var eyy = enddate.getFullYear();
    	  var emm = Number(enddate.getMonth()+1);
    	  if(emm<10){
    		  emm = "0"+emm
    	  }
    	  var edd = Number(enddate.getDate()-1);
		  if(edd<10){
			  edd = "0"+edd
		  }
		  enddate = eyy+"-"+emm+"-"+edd;
    	  alert(startdate);
    	  alert(enddate);
    	  
    	  $('#update_popup').bPopup();
    	  $('#snNo').val(no);
    	  $('#snTitle').val(title);
    	  $('#snStartdate').val(startdate);
    	  $('#snEnddate').val(enddate);
    	 
    	  
      },
      dateClick: function(info) {
    	  sndatapicker();
    	  
    	  var startdate=info.dateStr;
    	  alert(startdate);
    	  $('#insert_popup').bPopup();
    	  $('#snStartdate_').val(startdate);
		
      }
    });
	
    
    calendar.render();
		}
	});
  });
	
  function openPopup(subject,contents,widths){
	  $("#alert_subject").html(subject);
	  $("#alert_contents").html(contents);
	  openMessage('winAlert',widths)
  }
  
  
  function openMessage(IDS,widths){
	  $('#'+IDS).css("width",widths+"px");
	  $('#'+IDS).bPopup();
  }
  
  function closeMessage(IDS){
	  $('#'+IDS).bPopup().close();
  }
  
  function call_layer(actionName) {
	if('I'==actionName){
		$('#insert_popup').bPopup();
	}	
	if('U'==actionName){
		$('#update_popup').bPopup();
	}
};

	function sndatapicker(){
		$( ".snStartdate" ).datepicker({
		    dateFormat: 'yy.mm.dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년'
		  });
		$( ".snEnddate" ).datepicker({
		    dateFormat: 'yy.mm.dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년'
		  });
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
  .fc-row {
  	height : 108px;
  }
  .fc-widget-header {
  	height : 22px;
  	
  }
</style>

<style type="text/css">

.button_style {
	opacity: 5;
	display: none;
	position: relative;
	padding: 30px;
	background-color: #fff;
}

.layer_close {
	position: absolute;
	right: 3px;
	top: 1px;
	padding: 10px;
	cursor: pointer;
}
</style>
</head>
<body>
  <div style ="max-width:900px; margin:0 auto; height:30px">
  	<!-- <div style="float:right">
  		<input type="button" value="일정 등록" onclick="call_layer('I')">
  		<input type="button" value="일정 변경" onclick="call_layer('U')">
  	</div> -->
  </div>
  
  <div id="insert_popup" class="button_style">
		<span class="layer_close">닫기</span>
		<div class="aaaa_style">
			<form id="sninsertForm" autocomplete=off>
			<h2>일정 등록</h2>
				<table>
					<tr>
						<td>일정 제목</td>
						<td><input Type="text" name="snTitle"></td>
					</tr>
					<tr>
						<td>시작 날짜</td>
						<td><input Type="text" class="snStartdate" id="snStartdate_" name="snStartdate"></td>
					</tr>
					<tr>
						<td>마침 날짜</td>
						<td><input Type="text"  class="snEnddate" id="snEnddate_"name="snEnddate"></td>
					</tr>
					<tr>
						<td colspan="2"><input Type="button" id="snInsert" name="snInsert" value="일정 등록"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<div id="update_popup" class="button_style">
		<span class="layer_close">닫기</span>
		<div class="aaaa_style">
			<form id="snupdateForm" autocomplete=off>
			<input Type="hidden" id="snNo" name="snNo">
			<h2>일정 변경</h2>
				<table>
					<tr>
						<td>일정 제목</td>
						<td><input Type="text" id="snTitle" name="snTitle"></td>
					</tr>
					<tr>
						<td>시작 날짜</td>
						<td><input Type="text" id="snStartdate" class="snStartdate" name="snStartdate"></td>
					</tr>
					<tr>
						<td>마침 날짜</td>
						<td><input Type="text" id="snEnddate" class="snEnddate" name="snEnddate"></td>
					</tr>
					<tr>
						<td colspan="2"><input Type="button" id="snUpdate" value="일정 변경"></td>
						<td colspan="2"><input Type="button" id="snDelete" value="일정 삭제"></td>
					</tr>
					
				</table>
			</form>
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

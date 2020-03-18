<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%request.setCharacterEncoding("EUC-KR"); %>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?ver=1"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<!-- css와 카테고리js파일 -->
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=1">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css?ver=1">
	<script src="/common/ssmJs/goCategory.js?ver=1"></script>
	<script src="/common/ssmJs/index.js?ver=1"></script>
	
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
	<script src="/include/fullcalendar-4.4.0/packages/jquery.bpopup.min.js?ver=2;"></script>
	
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
		//글입력버튼
		$("#snInsert").click(function(){
			$("#sninsertForm").attr('action','/schedulnotice/snInsert.ssm')
			.submit();
		});
		//글수정버튼
		$("#snUpdate").click(function(){
			$("#snupdateForm").attr('action','/schedulnotice/snUpdate.ssm')
			.submit();
		});
		//글삭제버튼
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
					navLinks: true, 
					businessHours: true, 
					editable: true,
					selectable: true,
					buttonText :{
						today : '오늘',
						next : '다음달',
						prev : '이전달'
					},
					allday:true,
					
					events : events,//events는 아까 불러온 객체
					   
					//일정클릭시(글 수정,삭제)
					eventClick: function(info){
						sndatapicker();
						var title=info.event.title;
						var startdate=info.event.start;
						var enddate=info.event.end;
						var no=info.event.id;
						
						//startdate 와 enddate가 date객체라 yyyy-mm-dd형식으로 안되어있어  손으로 작업함
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
						
						//모달창띄우고 값넣기
						$('#update_popup').bPopup();
						$('#snNo').val(no);
						$('#snTitle').val(title);
						$('#snStartdate').val(startdate);
						$('#snEnddate').val(enddate);
							 
							  
					},
					//달력의 빈칸 클릭시 (글입력)
					dateClick: function(info) {
						alert("zz");
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
	
	<style>
		html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 4px;
			}
			
			table  {
				width : 500px;
				text-align : center;
				margin : auto;
			}
			
			.list
			{
				width : 500px;
				text-align : left;
				margin : auto;
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
	<!--  글입력모달창 -->
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
	
	<!-- 글수정 모달창 -->
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
	<div id="wrap">
			<header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
			<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
			<section>
				<div class="container">
	  
	<div id='calendar'></div>
	</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>

</body>
</html>

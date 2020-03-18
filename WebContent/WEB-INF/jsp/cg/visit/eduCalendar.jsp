<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<title>�湮��� ���� ����</title>
		
		<script src="/include/fullcalendar/main.min.js"></script>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="/include/fullcalendar/moment.min.js"></script>
		<script src="/include/fullcalendar/dayGrid/main.min.js"></script>
		<link href="/include/fullcalendar/main.css" rel="stylesheet"/>
		<link href="/include/fullcalendar/dayGrid/main.min.css" rel="stylesheet"/>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				$("#calendar").hide();
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					header : {
						  left:   '',
						  center: '',
						  right:  'today prev,next'
						},
					eventSources : 
						[{
		                	url : '/eduSchedule/esList.ssm',
		                	type : 'POST',
		                	dataType : 'JSON',
		                	success : function(data){
		                		
		                	},
		                	error : function(){
		                		alert("������");
		                	},
		                }],
					plugins: [ 'dayGrid' ],
					defaultView: 'dayGridWeek',
					contentHeight : 'auto',
					buttonText :{
						today : '�̹���',
						next : '������',
						prev : '������'
					},
					eventClick : function(info){
						var time = info.event.title;
						var id = info.event.id;
						var groupId = info.event.groupId;
						var start = moment(info.event.start).format('YYYY-MM-DD');
						console.log("(log)title : " + time);
						console.log("(log)id : " + id);
						console.log("(log)groupId : " + groupId);
						console.log("(log)start : " + start);
						esUpdate(time, id, groupId, start);
					},
					defaultDate : new Date(),
					weekends : false
					
					/* jquery ajax ���
					
					events : function(start, end, timezone, callback){
						$.ajax({
							url : '/eduSchedule/eduScheduleList.ssm',
							type : 'POST',
							dataType : 'JSON',
							success : function(data){
								var events = [];
								$.each(data, function(i, obj){
									events.push({
										title:obj.title,
										start:obj.start,
										textColor:obj.textColor,
										color:obj.color,
									});
								});
								callback(events);
							},
							error : function(){
								alert("������ ����");
							}
						});
					},
					*/
				}); 
				calendar.render();
				
				// ���ð�ǥ ����
				function esUpdate(time, id, groupId, start){
					
					console.log("(log)�������� ����");
					if(confirm("���õ� �ð��� ��㰡�� ���θ� �����մϴ�.")){
						console.log(time + "/ " +  id + "/ " + groupId + "/ " + start);
						$.ajax({
							url : '/eduSchedule/esUpdate.ssm',
							type : 'POST',
							headers : {
								"Content-Type":"application/json",
								"X-HTTP-Method-Override":"POST"
							},
							dataType:"text",
							data : JSON.stringify({
								esTime : time,
								esNo : id,
								ttNo : groupId,
								vrDate : start,
							}),
							error : function(){
								alert("��������");
							},
							success : function(result){
								if(result=="SUCCESS"){
									alert("������ �����Ǿ����ϴ�.");
									calendar.refetchEvents ();
								}
							}
						});
					} else {alert("���������� ��ҵǾ����ϴ�");}
				} // esUpdate()
			calendar.render();
			}); // ready()
		</script>
	</head>
	<style>
		html, body {
		  margin: 0;
		  padding: 0;
		  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		  font-size: 4px;
		}
		
		.fc-time { display: none; }
		
		#calendar {
		  max-width: 900px;
		  width : 500px;
		  margin: 40px auto;
		  
		}
	</style>
	<body>
	</body>
</html>


					
					
					
					
					
					
					
					
					
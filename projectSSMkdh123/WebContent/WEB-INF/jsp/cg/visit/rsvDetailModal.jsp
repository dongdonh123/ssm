<%@page import="ssm.cg.vo.Edu_ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>달모달</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="/include/fullcalendar/moment.min.js"></script>
		<script type="text/javascript">
			// 현재 날짜형식 설정
			var date = new Date();
			var today = moment(date).format('YYYY-MM-DD');
			
	        $(document).ready(function() {
	        	
	        	$("#vcUpdate").hide();
	        	
	        	// 상세보기
	        	$(".goDetail").click(function(){
					var vrNo = $(this).parents("tr").attr("vrNo");
					$("#vrNo").val(vrNo);
					console.log("(log)vrNo : " + vrNo);
					$.ajax({
						url : '/eduSchedule/esRsvDetail.ssm',
						type : 'POST',
						headers : {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType : 'JSON',
						data : JSON.stringify({
							vrNo : vrNo	
						}),
						success : function(data){
							
							var vrNo = data.vrNo;
							var ssNo = data.ssNo;
							var vrDate = data.vrDate;
							var vrField = data.vrField;
							var vrTime = data.vrTime;
							var vrStatus = data.vrStatus;
							var vrContents = data.vrContents;
							var vcComments = data.vcComments;
							
							$(".modalTr").children("#vNo").html(vrNo);
							$(".modalTr").children("#sNo").html(ssNo);
							$(".modalTr").children("#vrDate").html(vrDate);
							$(".modalTr").children("#vrField").html(vrField);
							$(".modalTr").children("#vrTime").html(vrTime);
							$(".modalTr").children("#vrStatus").html(vrStatus);
							$(".modalTr").children("#vrContents").html(vrContents);
							
							if(vrStatus == "04"){
								if(vcComments==null){
									$(".modalTr").children("#vrComments")
									.html("<textarea id='vcComments' name='vcComments' rows=3; style='width : 96%; border : 0;'></textarea>");
								} else {
									$(".modalTr").children("#vrComments").html(vcComments).css("color", "white");
								}
							} else {
								$(".modalTr").children("#vrComments").html("결과 작성 전입니다.").css("color", "red");
								
							}
							$("#myModal").show();
						},
						error :  function(){
							alert("에러");
						}
					});
				});
	        	
	     
	        	// 결과 저장
	        	$("#saveResult").click(function(){
	        		
		        	var ssNo = $(".modalTr").children("#sNo").html();
		        	var vrNo = $(".modalTr").children("#vNo").html();
		        	var vcComments = $("#vcComments").val();
		        	console.log(vrComments);
		        	console.log(ssNo);
		        	console.log(vrNo);
		        	$.ajax({
		        		url : "/vrComment/vcInsert.ssm",
		        		type : "post",
						headers : {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							vrNo : vrNo,	
							ssNo : ssNo,
							vcComments : vcComments
						}),
						success : function(result){
							if(result != null){
								alert("끝");
								$(".modalTr").children("#vrComments").html(result);
							} else {
								alert("변경안됨");
							}
						},
						error : function(){
							alert ("오류입니다. 관리자에게 문의하세요.");
						}
		        	});
	        	});
	        }); // ready
	        
	        // 수정양식 열기
	        function vcUpdateForm(){
	        	
	        	var vrDate = $(".modalTr").children("#vrDate").html();
	        	var vrStatus = $(".modalTr").children("#vrStatus").html();
	   			if(vrDate > today) {
	   				alert("상담일 이전입니다."); return
	   				}
	   			else {
	   				if(vrStatus == "04"){
	   					$(".modalTr").children("#vrComments")
						.html("<textarea id='vcComments' name='vcComments' rows=3; style='width : 96%; border : 0;'></textarea>");
			        	$("#vcUpdate").show();	
	   				} else {
	   					alert("상담 상태를 변경 후 작성하세요");
	   				}
	   			}
	        }
	        
	        // 상담 결과지 수정
			function vcUpdate(){
				
	        	var vrNo = $(".modalTr").children("#vNo").html();
	        	var vcComments = $("#vcComments").val();
	        	
	        	$.ajax({
	        		url : "/vrComment/vcUpdate.ssm",
	        		type : "post",
	        		headers : {
	        			"Content-Type":"application/json",
	        			"X-HTTP-Method-Override":"POST",
	        		},
	        		dataType : "text",
	        		data : JSON.stringify({
	        			vrNo : vrNo,
	        			vcComments : vcComments
	        		}),
	        		success : function(result){
	        			$(".modalTr").children("#vrComments").html(result);
	        		}
	        	});
	        }
			
	        // 상담 결과지 삭제
	        function vcDelete(){
	        	var vrDate = $(".modalTr").children("#vrDate").html();
	   			if(vrDate < today) {
	   				alert("상담일 이전입니다."); return
	   			}
	        }
	        
	        // 모달 팝업 닫기
	        function close_pop(flag) {
	             $("#myModal").hide();
	             $("#resultModal").hide();
	        }
		</script>
	    <style>
	    	/* 모달 배경 */
	        .modal {
	            display: none; 
	            position: fixed; 
	            z-index: 1; /* Sit on top */
	            left: 0;
	            top: 0;
	            width: 100%; /* 배경 채우기 */
	            height: 100%; /* 배경 채우기 */
	            overflow: auto; 
	            background-color: rgb(0,0,0);
	            background-color: rgba(0,0,0,0.4); 
	        }
	    
	       /* 모달 대화창 */
	        .modal-content {
	            background-color: #fefefe;
	            margin: 15% auto; 
	            padding: 20px;
	            border: 1px solid #888;
	            width: 40%;                         
	        }
	        
	        .modalTb table{
	        	width : 350px;
	        	/*border-collapse: collapse;*/
	        	margin : 20px auto;
	        	text-align : center;
	        }
	        
	        .modalTb th{
	        	width : 30px;
	        	background-color : #786C8D;
	        	color : white;
	        }
	         .modalTb td{
	        	width : 70px;
	        	background-color : #DDDDDD;
	        	color : white;
	        }
	        
	        .popBtn{
	        	font-size : 5pt; 
	        	border : 0; 
	        	background-color:#DDDDDD;
	        }
		</style>
	</head>
	<body>
		<div id="myModal" class="modal">
	    	<!-- Modal content -->
	      	<div class="modal-content">
	      		<p>학생 예약 상세보기</p>
	      		<hr/>
	      		<div class="modalTb">
	      			<form id="vrComment" name="vrComment">
	      				<input type="hidden" id="vrNo" name="vrNo"/>
			      		<table align="center"> 		
			      			<tr class="modalTr">
			      				<th>예약번호</th>
			      				<td id="vNo"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>상담일</th>
			      				<td id="vrDate"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>상담상태</th>
			      				<td id="vrStatus"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>학생번호</th>
			      				<td id="sNo"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>상담분야</th>
			      				<td id="vrField"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>상담시간</th>
			      				<td id="vrTime"></td>
			      			</tr>
			      			<tr class="modalTr" height="30px">
			      				<th>상담내용<br>(학생작성)</th>
			      				<td id="vrContents"></td>
			      			</tr>
				      		<tr class="modalTr" height="60px">
			      				<th>상담내용<br>(교사작성)</th>
			      				<td id="vrComments">
			      				</td>
			      			</tr>
			      		</table>
			      	</form>
		      	</div>
	            <div style="cursor:pointer;">
	            <hr/>
	                <input type="button" onClick="close_pop();" class="popBtn" value="닫기"/>
	                <input type="button" onClick="vcUpdateForm()" class="popBtn" value="수정"/>
	               	<input type="button" id= "vcUpdate" onClick="vcUpdate()" class="popBtn" value="수정저장"/>
	             	<input type="button" onClick="vcDelete()" class="popBtn" value="삭제"/>
	                <input type="button" id="saveResult" class="popBtn" value="저장"/>
	            </div>
	    	</div>
	    </div>
	</body>
</html>
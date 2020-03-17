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
		<title>�޸��</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="/include/fullcalendar/moment.min.js"></script>
		<script type="text/javascript">
			// ���� ��¥���� ����
			var date = new Date();
			var today = moment(date).format('YYYY-MM-DD');
			
	        $(document).ready(function() {
	        	
	        	$("#vcUpdate").hide();
	        	
	        	// �󼼺���
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
								$(".modalTr").children("#vrComments").html("��� �ۼ� ���Դϴ�.").css("color", "red");
								
							}
							$("#myModal").show();
						},
						error :  function(){
							alert("����");
						}
					});
				});
	        	
	     
	        	// ��� ����
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
								alert("��");
								$(".modalTr").children("#vrComments").html(result);
							} else {
								alert("����ȵ�");
							}
						},
						error : function(){
							alert ("�����Դϴ�. �����ڿ��� �����ϼ���.");
						}
		        	});
	        	});
	        }); // ready
	        
	        // ������� ����
	        function vcUpdateForm(){
	        	
	        	var vrDate = $(".modalTr").children("#vrDate").html();
	        	var vrStatus = $(".modalTr").children("#vrStatus").html();
	   			if(vrDate > today) {
	   				alert("����� �����Դϴ�."); return
	   				}
	   			else {
	   				if(vrStatus == "04"){
	   					$(".modalTr").children("#vrComments")
						.html("<textarea id='vcComments' name='vcComments' rows=3; style='width : 96%; border : 0;'></textarea>");
			        	$("#vcUpdate").show();	
	   				} else {
	   					alert("��� ���¸� ���� �� �ۼ��ϼ���");
	   				}
	   			}
	        }
	        
	        // ��� ����� ����
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
			
	        // ��� ����� ����
	        function vcDelete(){
	        	var vrDate = $(".modalTr").children("#vrDate").html();
	   			if(vrDate < today) {
	   				alert("����� �����Դϴ�."); return
	   			}
	        }
	        
	        // ��� �˾� �ݱ�
	        function close_pop(flag) {
	             $("#myModal").hide();
	             $("#resultModal").hide();
	        }
		</script>
	    <style>
	    	/* ��� ��� */
	        .modal {
	            display: none; 
	            position: fixed; 
	            z-index: 1; /* Sit on top */
	            left: 0;
	            top: 0;
	            width: 100%; /* ��� ä��� */
	            height: 100%; /* ��� ä��� */
	            overflow: auto; 
	            background-color: rgb(0,0,0);
	            background-color: rgba(0,0,0,0.4); 
	        }
	    
	       /* ��� ��ȭâ */
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
	      		<p>�л� ���� �󼼺���</p>
	      		<hr/>
	      		<div class="modalTb">
	      			<form id="vrComment" name="vrComment">
	      				<input type="hidden" id="vrNo" name="vrNo"/>
			      		<table align="center"> 		
			      			<tr class="modalTr">
			      				<th>�����ȣ</th>
			      				<td id="vNo"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>�����</th>
			      				<td id="vrDate"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>������</th>
			      				<td id="vrStatus"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>�л���ȣ</th>
			      				<td id="sNo"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>���о�</th>
			      				<td id="vrField"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>���ð�</th>
			      				<td id="vrTime"></td>
			      			</tr>
			      			<tr class="modalTr" height="30px">
			      				<th>��㳻��<br>(�л��ۼ�)</th>
			      				<td id="vrContents"></td>
			      			</tr>
				      		<tr class="modalTr" height="60px">
			      				<th>��㳻��<br>(�����ۼ�)</th>
			      				<td id="vrComments">
			      				</td>
			      			</tr>
			      		</table>
			      	</form>
		      	</div>
	            <div style="cursor:pointer;">
	            <hr/>
	                <input type="button" onClick="close_pop();" class="popBtn" value="�ݱ�"/>
	                <input type="button" onClick="vcUpdateForm()" class="popBtn" value="����"/>
	               	<input type="button" id= "vcUpdate" onClick="vcUpdate()" class="popBtn" value="��������"/>
	             	<input type="button" onClick="vcDelete()" class="popBtn" value="����"/>
	                <input type="button" id="saveResult" class="popBtn" value="����"/>
	            </div>
	    	</div>
	    </div>
	</body>
</html>
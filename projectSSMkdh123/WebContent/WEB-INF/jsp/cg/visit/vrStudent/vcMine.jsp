<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ssm.cg.vo.VisitCounsel_RsvVO"%>
<%@ page import = "java.util.ArrayList"%> 
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	Object obj1 = request.getAttribute("vcMineList");
	System.out.println("obj1 >>> : " +obj1);
	ArrayList<VisitCounsel_RsvVO> rsvList = (ArrayList<VisitCounsel_RsvVO>)obj1;
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		
		<script>
		$(document).ready(function() {     
		// 버튼 클릭시 Row 값 가져오기
			$(".btnDetail").click(function() {
			
				var str = ""
				var tdArr = new Array(); // 배열 선언
				var checkBtn = $(this);
				
				
				var tr = checkBtn.parent().parent();
				var td = tr.children();
				var conText = $(this).parents("tbody").children().eq(1).find('td:eq(0)').text();//내용 입력칸된 값
				console.log("conTitle: " +conText);
				console.log("클릭한 Row의 모든 데이터 : " + tr.text());
				
				var vrNo = td.eq(0).text();
				var ssName = td.eq(1).text();
				var ttAuthority = td.eq(2).text();
				var ttName = td.eq(3).text();
				var vrField = td.eq(4).text();
				var vrDate = td.eq(5).text();
				var vrStatus = td.eq(6).text();
				var vrContents = $(this).parents("tbody").children().eq(1).find('td:eq(0)').text();
				
				// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
				td.each(function(i) {
				tdArr.push(td.eq(i).text());
				});
				
				console.log("배열에 담긴 값 : " + tdArr);
				
				str += " * 클릭된 Row의 td값 = No. : <font color='red'>" + vrNo + "</font>" +
				 	    ", 아이디 : <font color='red'>" + ssName + "</font>" +
				 	    ", 이름 : <font color='red'>" + ttAuthority + "</font>" +
				 	    ", 이메일 : <font color='red'>" + ttName + "</font>";
				 	    $(".modalTr").children("#vNo").html(vrNo);
				$(".modalTr").children("#sNo").html(ssName);
				$(".modalTr").children("#vrDate").html(vrDate);
				$(".modalTr").children("#vrField").html(vrField);
				$(".modalTr").children("#ttName").html(ttName);
				$(".modalTr").children("#ttAuthority").html(ttAuthority);
				$(".modalTr").children("#vrStatus").html(vrStatus);
				$(".modalTr").children("#vrContents").html(vrContents);

				$('#myVrList').show();
			});
			 	
			$(".resultDetail").click(function() {
				var conText = $(this).parents("tbody").children().eq(1).find('td:eq(1)').text();//내용 입력칸된 값
				console.log("conText: " +conText);
				$(".modalTr").children("#vrComment").html(conText);
				$('#myVrResult').show();
			});
				 	
			$(".cancelBooking").click(function() {
				var vrNo = $(this).parents("tbody").children().eq(0).find('td:eq(0)').text();
				console.log("vrNo: " +vrNo);
				//var vrNo = $(this).parents("tr").attr("vrNo");
				alert("vrno" + vrNo);
				if(confirm("선택한 예약을 취소하시겠습니까?")){
					$.ajax({
						url:'/visitCounsel/'+vrNo+".ssm",
						type:'put',
						headers: {
							"Content-Type":"application/json",
								"X-HTTP-Method-Override":"PUT"},
						data:JSON.stringify({
							vrNo:vrNo		
						}),
						dataType:'text',
						success:function(result){
							console.log("result:" +result);
							if(result == 'SUCCESS'){
								alert("취소완료!!!");
								window.location.reload();
							}//if
						}//success
					});//ajax
				}//if		
			
			});
		});//ready
   
    
    
	    //팝업 Close 기능
	    function close_pop(flag) {
	         $('#myVrList').hide();
	         $('#myVrResult').hide();
	    }
    
		</script>
	
		</head>
		 <style>
		 	html, body {
				  margin: 10px;
				  padding: 10px;
				  
				  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
				  font-size: 15px;
				}
				
	
			#title{  margin: 20px;
				  padding: 20px;
			}
			
			#container{
			margin: 40px auto;
		        text-align: center;
	            z-index: 1; /* Sit on top */
	            left: 50;
	            top: 0;
	            width: 70%; /* Full width */
	            height: 100%; /* Full height */
	            overflow: auto; /* Enable scroll if needed */
	            
		    }
	             
	        /* The Close Button */
	        .close {
	            color: #aaa;
	            float: right;
	            font-size: 28px;
	            font-weight: bold;
	        }
	        .close:hover,
	        .close:focus {
	            color: black;
	            text-decoration: none;
	            cursor: pointer;
	        }
	
		 /* The Modal (background) */
	        .modal {
	            display: none; /* Hidden by default */
	            position: fixed; /* Stay in place */
	            z-index: 1; /* Sit on top */
	            left: 0;
	            top: 0;
	            width: 100%; /* Full width */
	            height: 100%; /* Full height */
	            overflow: auto; /* Enable scroll if needed */
	            background-color: rgb(0,0,0); /* Fallback color */
	            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	        }
	    
	        /* Modal Content/Box */
	        .modal-content {
	            background-color: #fefefe;
	            margin: 15% auto; /* 15% from the top and centered */
	            padding: 20px;
	            border: 1px solid #888;
	            width: 30%; /* Could be more or less, depending on screen size */                          
	        }
        
	 
		</style>
		<body>
		 <%@include file="/common/header.jsp"%>
			<div class="row">
			    
			    <br><br>
			  <div>
			    <div id="title">
			       <span> <h2> 내역</h2></span><br><br>
			    </div>
			    <table id="vrMineList" border="1">
			   		 <thead>
						<tr>
							<th>예약번호</th>
							<th>학생명</th>
							<th>교사유형</th>
							<th>교사명</th>		
							<th>상담분류</th>
							<th>방문일시</th>
							<th>신청일시</th>
							<th>신청현황</th>
							<th>상세보기</th>
	
						</tr>
					</thead>
	<%
						if(rsvList == null){
	%>
						<tbody>
							<tr><td colspan="7" align="center">예약이 없습니다.</td></tr>
	<%
					} else {
						for(int i = 0; i < rsvList.size(); i++){
							VisitCounsel_RsvVO vcMine = rsvList.get(i);
	%>
			         
			            <tr id="<%=vcMine.getVrNo()%>">
			                <td id="a"><%=vcMine.getVrNo()%></td>
			                <td id="b"><%=vcMine.getSmemberVO().getSsName() %></td>
			                <td id="c"><%=vcMine.getTmemberVO().getTtAuthority()%></td>		                
			                <td id="d"><%=vcMine.getTmemberVO().getTtName()%></td>
			                <td id="e"><%=vcMine.getVrField()%></td>
			                <td id="f"><%=vcMine.getVrDate() %> <%=vcMine.getVrTime() %></td>
			                <td id="g"><%=vcMine.getVrInsertdate()%></td>
							<td id="h"><%=vcMine.getVrStatus()%></td>
			           
			                <td>
			                <button class="btnDetail" >상세보기</button> &nbsp; 
			             <!--    <button class="btnDetail1" >상세1</button> -->
			             <%	if(vcMine.getVrStatus().equals("대기")||vcMine.getVrStatus().equals("승인"))	{     %>	           
			                <button class="cancelBooking" >예약취소</button>
	<%		    } %>	          <%	if(!vcMine.getVcCommentVO().getVcComments().equals("-"))	{     %>	           
			                <button class="resultDetail" >결과보기</button>
	<%		    } %>	
			                </td>
	
			            </tr>
			            <tr id="hidden" id="hidden" style="display:none;"><td><%=vcMine.getVrContents()%></td>
			            <td> <%=vcMine.getVcCommentVO().getVcComments() %></td></tr>
			            </tbody>
	
			       <% }
						}%>		  
			    </table>
	
					</div>	
						
			<!-- Modal -->
				 <div id="myVrList" class="modal"> 
					<div class="modal-content">
				       <!--   <h5 class="modal-title" id="myModalLabel">예약 상세보기</h5>-->
				      
				     <div class="modalTb">
				       <form id="vrMine" name="vrMine">
		      			
				        <table border="1" style="width:100%">
							<tr>
								<td colspan="3" align="center"><h4> 상세  </h4></td>
							</tr>
								<tr class="modalTr" style="display:none;">
				      				<th>예약번호</th>
				      				<td id="vNo"></td>
				      			</tr>
				      			<tr class="modalTr">
				      				<th>상담일</th>
				      				<td id="vrDate"></td>
				      			</tr>
								<tr class="modalTr">
				      				<th>교사유형</th>
				      				<td id="ttAuthority"></td>
				      			</tr>
			      				<tr class="modalTr">
				      				<th>교사명</th>
				      				<td id="ttName"> 선생님</td>
				      			</tr>
	
				      			<tr class="modalTr">
				      				<th>상담분야</th>
				      				<td id="vrField"></td>
				      			</tr>
		
				      			<tr class="modalTr" height="30px">
				      				<th>상담내용<br>(학생작성)</th>
				      				<td id="vrContents"></td>
				      			</tr>					
						</table>
				        </form>
				      </div>
				      <div class="modal-footer">
				       <input type="button" onClick="close_pop();" class="popBtn" value="닫기"/>
	
				      </div>
				      </div>
			  </div>
			  <!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
	
			<!--결과 Modal -->
				 <div id="myVrResult" class="modal"> 
					<div class="modal-content">
				       <!--   <h5 class="modal-title" id="myModalLabel">예약 상세보기</h5>-->
				      
				     <div class="modalTb">
				      
		      			
				        <table border="1" style="width:100%">
							<tr>
								<td colspan="3" align="center"><h4> 상세  </h4></td>
							</tr>
							<tr class="modalTr">
			      				<th>상담결과내용</th>
			      				<td id="vrComment"></td>
			      			</tr>		
						</table>
				        
				      </div>
				      <div class="modal-footer">
				       <input type="button" onClick="close_pop();" class="popBtn" value="닫기"/>
	
				      </div>
				      </div>
			  </div>
			  <!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
	
	<%-- 
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1">
	  Launch demo modal
	</button>
	 --%>
	<!-- Modal -->
	<%--
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	 --%>
	 
		</div>
	</body>
</html>
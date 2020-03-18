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
		// 獄動 適遣獣 Row 葵 亜閃神奄
			$(".btnDetail").click(function() {
			
				var str = ""
				var tdArr = new Array(); // 壕伸 識情
				var checkBtn = $(this);
				
				
				var tr = checkBtn.parent().parent();
				var td = tr.children();
				var conText = $(this).parents("tbody").children().eq(1).find('td:eq(0)').text();//鎧遂 脊径牒吉 葵
				console.log("conTitle: " +conText);
				console.log("適遣廃 Row税 乞窮 汽戚斗 : " + tr.text());
				
				var vrNo = td.eq(0).text();
				var ssName = td.eq(1).text();
				var ttAuthority = td.eq(2).text();
				var ttName = td.eq(3).text();
				var vrField = td.eq(4).text();
				var vrDate = td.eq(5).text();
				var vrStatus = td.eq(6).text();
				var vrContents = $(this).parents("tbody").children().eq(1).find('td:eq(0)').text();
				
				// 鋼差庚聖 戚遂背辞 壕伸拭 葵聖 眼焼 紫遂拝 呪 亀 赤陥.
				td.each(function(i) {
				tdArr.push(td.eq(i).text());
				});
				
				console.log("壕伸拭 眼延 葵 : " + tdArr);
				
				str += " * 適遣吉 Row税 td葵 = No. : <font color='red'>" + vrNo + "</font>" +
				 	    ", 焼戚巨 : <font color='red'>" + ssName + "</font>" +
				 	    ", 戚硯 : <font color='red'>" + ttAuthority + "</font>" +
				 	    ", 戚五析 : <font color='red'>" + ttName + "</font>";
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
				var conText = $(this).parents("tbody").children().eq(1).find('td:eq(1)').text();//鎧遂 脊径牒吉 葵
				console.log("conText: " +conText);
				$(".modalTr").children("#vrComment").html(conText);
				$('#myVrResult').show();
			});
				 	
			$(".cancelBooking").click(function() {
				var vrNo = $(this).parents("tbody").children().eq(0).find('td:eq(0)').text();
				console.log("vrNo: " +vrNo);
				//var vrNo = $(this).parents("tr").attr("vrNo");
				alert("vrno" + vrNo);
				if(confirm("識澱廃 森鉦聖 昼社馬獣畏柔艦猿?")){
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
								alert("昼社刃戟!!!");
								window.location.reload();
							}//if
						}//success
					});//ajax
				}//if		
			
			});
		});//ready
   
    
    
	    //橡穣 Close 奄管
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
			       <span> <h2> 鎧蝕</h2></span><br><br>
			    </div>
			    <table id="vrMineList" border="1">
			   		 <thead>
						<tr>
							<th>森鉦腰硲</th>
							<th>俳持誤</th>
							<th>嘘紫政莫</th>
							<th>嘘紫誤</th>		
							<th>雌眼歳嫌</th>
							<th>号庚析獣</th>
							<th>重短析獣</th>
							<th>重短薄伐</th>
							<th>雌室左奄</th>
	
						</tr>
					</thead>
	<%
						if(rsvList == null){
	%>
						<tbody>
							<tr><td colspan="7" align="center">森鉦戚 蒸柔艦陥.</td></tr>
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
			                <button class="btnDetail" >雌室左奄</button> &nbsp; 
			             <!--    <button class="btnDetail1" >雌室1</button> -->
			             <%	if(vcMine.getVrStatus().equals("企奄")||vcMine.getVrStatus().equals("渋昔"))	{     %>	           
			                <button class="cancelBooking" >森鉦昼社</button>
	<%		    } %>	          <%	if(!vcMine.getVcCommentVO().getVcComments().equals("-"))	{     %>	           
			                <button class="resultDetail" >衣引左奄</button>
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
				       <!--   <h5 class="modal-title" id="myModalLabel">森鉦 雌室左奄</h5>-->
				      
				     <div class="modalTb">
				       <form id="vrMine" name="vrMine">
		      			
				        <table border="1" style="width:100%">
							<tr>
								<td colspan="3" align="center"><h4> 雌室  </h4></td>
							</tr>
								<tr class="modalTr" style="display:none;">
				      				<th>森鉦腰硲</th>
				      				<td id="vNo"></td>
				      			</tr>
				      			<tr class="modalTr">
				      				<th>雌眼析</th>
				      				<td id="vrDate"></td>
				      			</tr>
								<tr class="modalTr">
				      				<th>嘘紫政莫</th>
				      				<td id="ttAuthority"></td>
				      			</tr>
			      				<tr class="modalTr">
				      				<th>嘘紫誤</th>
				      				<td id="ttName"> 識持還</td>
				      			</tr>
	
				      			<tr class="modalTr">
				      				<th>雌眼歳醤</th>
				      				<td id="vrField"></td>
				      			</tr>
		
				      			<tr class="modalTr" height="30px">
				      				<th>雌眼鎧遂<br>(俳持拙失)</th>
				      				<td id="vrContents"></td>
				      			</tr>					
						</table>
				        </form>
				      </div>
				      <div class="modal-footer">
				       <input type="button" onClick="close_pop();" class="popBtn" value="丸奄"/>
	
				      </div>
				      </div>
			  </div>
			  <!-- しししししししししししししししししししし -->
	
			<!--衣引 Modal -->
				 <div id="myVrResult" class="modal"> 
					<div class="modal-content">
				       <!--   <h5 class="modal-title" id="myModalLabel">森鉦 雌室左奄</h5>-->
				      
				     <div class="modalTb">
				      
		      			
				        <table border="1" style="width:100%">
							<tr>
								<td colspan="3" align="center"><h4> 雌室  </h4></td>
							</tr>
							<tr class="modalTr">
			      				<th>雌眼衣引鎧遂</th>
			      				<td id="vrComment"></td>
			      			</tr>		
						</table>
				        
				      </div>
				      <div class="modal-footer">
				       <input type="button" onClick="close_pop();" class="popBtn" value="丸奄"/>
	
				      </div>
				      </div>
			  </div>
			  <!-- しししししししししししししししししししし -->
	
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
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">／</span></button>
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
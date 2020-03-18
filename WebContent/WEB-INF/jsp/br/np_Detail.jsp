<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.br.vo.Non_ProgramVO" %>
<%@ page import="java.util.List"  %>
<%@ page import="java.util.Date"  %>
<%@ page import="java.text.SimpleDateFormat"%>
<%  request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	List list = null;
	Non_ProgramVO npvo =null;
	String date1="";
	String date2="";
	String date3="";
	String date4="";
	if(obj!=null){
		list = (List)obj;
		npvo = (Non_ProgramVO)list.get(0);
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpRsdate());
		date1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
		Date date11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpRedate());
		date2 = new SimpleDateFormat("yyyy-MM-dd").format(date11);
		Date date22 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpPsdate());
		date3 = new SimpleDateFormat("yyyy-MM-dd").format(date22);
		Date date33 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpPedate());
		date4 = new SimpleDateFormat("yyyy-MM-dd").format(date33);
	}
	
	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��������</title>
		<style type="text/css">
					  #modal {
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
					
					#modal h2 {
					  margin:0;   
					}
					
					#modal button {
					  display:inline-block;
					  width:100px;
					  margin-left:calc(100% - 100px - 10px);
					}
					
					#modal .modal_content {
					  width:700px;
					  margin:100px auto;
					  padding:20px 10px;
					  background:#fff;
					  border:2px solid #666;
					}
					
					#modal .modal_layer {
					  position:fixed;
					  top:0;
					  left:0;
					  width:100%;
					  height:100%;
					  background:rgba(0, 0, 0, 0.5);
					  z-index:-1;
					}   
		</style>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				alert("�������� ��������");
				$("#modal_open_btn").click(function() {
		 			alert("��");
		 		    $("#modal").fadeIn(300); // ���â �����ֱ�
		 		});
		 		  
		 		// ��� â �ȿ� �ִ� Ȯ�� ��ư�� �̺�Ʈ �ɱ�
		 		$("#modal_closd_btn").click(function() {
		 			alert("��");
		 			 $("#modal").fadeOut(300); // ���â �����ֱ�
		 		});	
				
		 		$("#insert").click(function(){
		 			alert("Ŭ��");
		 			$("#modalForm").attr("action","/non_Application/non_ApplicationInsert.ssm").submit();
		 		});
		 		
		 		$("#registrationList").click(function(){
		 			var npNo=
		 			location.href=""
		 		});
			});
			
			
			function goUpdate(npNo){
				location.href="/nonprogram/updateForm.ssm?npNo="+npNo;
			}
			function goDelete(npNo){
				location.href="/nonprogram/np_Delete.ssm?npNo="+npNo;
			}
			function applicationList(npNo){
				location.href="/non_Application/applicationList.ssm?npNo="+npNo;
			}
			
		</script>
	</head>
<body>
	<form id="detailForm" name="detailForm" encType="multipart/form-data" method="POST">
		<table border='3'>
				<tr>
					<td>���α׷� ����</td>
					<td><%=npvo.getNpTitle() %></td>
				</tr>
					<tr>
					<td>���α׷� ����</td>
					<td><%=npvo.getNpContents()%></td>
				</tr>
					<tr>
					<td>����</td>
					<td><%=npvo.getNpCenter() %></td>
				</tr>
					<tr>
					<td>������ ÷��</td>
					<td><img src="/npFile/<%=npvo.getNpImage()%>" width="400" height="400"></td>
				</tr>
					<tr>
					<td>��������</td>
					<td><%=date1 %>~<%=date2 %></td>
				</tr>
					<tr>
					<td>���α׷� ������</td>
					<td><%=date3 %>~<%=date4%></td>
				</tr>
					<tr>
					<td>��û���</td>
					<td><%=npvo.getNpObject() %></td>
				</tr>
					<tr>
					<td>�ο�����</td>
					<td><%=npvo.getNpPersonnel() %></td>
				</tr>
					<tr>
					<td>�ۼ���</td>
					<td><%=npvo.getTtNo() %></td>
				</tr>
					<tr>
					<td>���� ���</td>
					<td><%=npvo.getNpIo() %></td>
				</tr>
					<tr>
					<td>Ȱ�� ����</td>
					<td><%=npvo.getAcode()%></td>
				</tr>
				<tr>
				<td><a href="/nonprogram/downLoad.ssm?filename=<%=npvo.getNpFile()%>"><%=npvo.getNpFile()%></a></td>
				</tr>
				<tr>
				<td colspan='2' align='right'>
				<input type="button" id="teacherList" name="teacherList" value ="��û���" onclick="applicationList('<%=npvo.getNpNo()%>')">
				<input type="button" id="update" name="update" value="����" onclick="goUpdate('<%=npvo.getNpNo()%>')">
				<input type="button" id="delete" name="delete" value="����" onclick="goDelete('<%=npvo.getNpNo()%>')">
				</td>		
				</tr>
				
			</table>
		
		<input type="hidden" id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
	</form>
	
		<!--���â��  -->
	
	<div id="modal">
		<div class="modal_content">
		<form id = "modalForm" name= "modalForm" encType="multipart/form-data" method="post">
		<h2>��û�� �ۼ�</h2>
		<table border='2'>
			<tr>
				<td>�̸�</td>
				<td><input type="text" id="ssName" name="ssName" value="ee" readonly></td>
				<td>�̸���</td>
				<td><input type="text" id="ssEmail" name="ssEmail" value="ee" disabled></td>
			</tr>
			<tr>
				<td>��ȭ��ȣ</td>
				<td>010-2285-4579</td>
				<td>���� ���α׷���</td>
				<td>�����ζٱ⼱����ȸ</td>
			</tr>
			<tr>
			<td colspan='4'>���������� ���� ������ ������ ���� �������ּ���</td> 
			</tr>
			<tr><td>��û����</td>
				<td colspan='3'><input type="text" id="naContents" name="naContents" style="width:472px;height:250px;" ></td>
			</tr>
			<tr>
			<td colspan='4'><input type="file" id="naFile" name="naFile" ></td>
			</tr>
			<tr>
			<td colspan='4' align='right'><input type="button" id="insert" name="insert" value="��û">
			</tr>
		</table>
		<input type="hidden" id="npNo" name="npNo" value="<%=npvo.getNpNo() %>">
		<input type="hidden" id="ssNo" name="ssNo" value="S7180001">
				<input type="button" id="modal_closd_btn" name="modal_closd_btn" value="���â�ݱ�" >
		</form>
		</div>
	</div>
	
	<input type="button" id="modal_open_btn" name="modal_open_btn" value="��û�ϱ�"> 
</body>
</html>
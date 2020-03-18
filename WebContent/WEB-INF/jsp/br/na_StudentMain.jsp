<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_ApplicationVO" %>
<% 	request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	List list = null;
	Non_ApplicationVO navo = new Non_ApplicationVO();
	String naNo = "";
	if(obj != null){
		list = (List)obj;
		
	}


	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js""></script>
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
	<script type="text/javascript">
		$(function(){
			$("#cancel").hide();
			$("#naFile").hide();
			 $(".detail").click(function(){
				 //var ssNo=����ó���� �ۼ�
				 var ss = $(this).next();
				 var npNo = $(this).next().val();
				 var naNo = ss.next().val();

				 alert("������Ŭ��");
					$.ajax({
						type:"get",
						url:"/non_Application/non_ApplicationDetail.ssm",
						data:{"ssNo":"S7180001","npNo": npNo},	
						success: function(data){
						console.log(data);		
						$(".naNo2").val(data[0].naNo);
						$("#ssNo").val(data[0].ssNo);
						$("#ssEmail").val(data[0].ssEmail);
						$("#ssName").val(data[0].ssName);
						$("#npTitle").val(data[0].npTitle);
						$("#naContents").val(data[0].naContents);
						$("#naFile1").html(data[0].naFile);
						$("#naFile1").val(data[0].naFile);
						$("#modal").fadeIn(300); // ���â �����ֱ�
						},
						error : function(e){
							console.log(e);
						}
					});
				
			});
			// ��� â �ȿ� �ִ� Ȯ�� ��ư�� �̺�Ʈ �ɱ�
		 	$("#modal_closd_btn").click(function() {
		 	    $("#modal").fadeOut(300); // ���â �����ֱ�
				$("#ssNo").prop("readonly",true);
		 	});	
			$("#delete").click(function(){
				$("#modalForm").attr("encType","application/x-www-form-urlencoded").attr("action","/non_Application/non_ApplicationDelete.ssm").submit();
			});
			$("#update").click(function(){
				$("#naContents").prop("readonly",false);
				var EE = $("#update").val();
				if(EE == "�����ϱ�"){
					$("#update").val("�����ϱ�");
					$("#delete").hide();
					$("#cancel").show();
					$("#a").val($("#naContents").val());
					$("#naFile1").hide();
					$("#naFile").show();
					$("#naFile").value("naFile1");
				}else{
					$("#modalForm").attr("action","/non_Application/non_ApplicationUpdate.ssm").submit();
				}
			});
			$("#cancel").click(function(){
				$("#update").val("�����ϱ�");
				$("#delete").show();
				$("#cancel").hide();
				$("#naFile").hide();
				$("#naContents").val($("#a").val());
				$("#naContents").prop("readonly",true);
				$("#naFile1").show();
			});
			
			
			
		});
		function File(){
			var fileName = $("#naFile1").val();		
				alert(fileName);
				location.href="/non_Application/downLoad.ssm?fileName="+fileName;
			
		}
	</script>	
</head>
<body>
	
	<form>
		<table border='1' align='center'>
			<tr>
				<td>���α׷���</td>
				<td>��û��</td>
				<td>������Ȳ</td>
				<td>���</td>
			</tr>
		
			<%if(list==null&&list.size()==0){%>
				<tr>
				<td>��û�� ���α׷��� �����ϴ�</td>
				</tr>
				<%}else{
					for(int i=0;i<list.size();i++){
					navo=(Non_ApplicationVO)list.get(i);
					
					%>
				<tr>
					<td><%=navo.getNpTitle() %></td>
					<td><%=navo.getNaInsertdate() %></td>
					<td align="center">
					<%if(navo.getNaStatus().equals("01")) out.print("���");
					  if(navo.getNaStatus().equals("04")) out.print("�Ϸ�");
					  %>
					</td>
					<td>
						<input type="button" class="detail" id="detail" name = "detail" value="�󼼺���">
						<input type="hidden" class="npNo" id="npNo" name ="npNo" value=<%=navo.getNpNo() %>>
						<input type="hidden" class="naNo" id="naNo" name ="naNo" value=<%=navo.getNaNo() %>>
					</td>
				</tr>
			<%}} %>
		</table>
	</form>
	

	<div id="modal">
		<div class="modal_content">
		<form id = "modalForm" name="modalForm" encType="multipart/form-data" method="POST">
			<table border='2'>
				<tr>
				<td align='right'colspan='4'><input type="button" id="modal_closd_btn" name="modal_closd_btn" value = â�ݱ�></td>
				</tr>
				<tr>
					<td>�й�</td>
					<td><input type="text" id="ssNo" name="ssNo" readonly></td>
					<td>�̸���</td>
					<td><input type="text" id="ssEmail" name="ssEmail" readonly></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input type="text" id="ssName" name="ssNname" readonly></td>
					<td>���α׷�</td>
					<td><input type="text" id="npTitle" name="npTitle" readonly></td>
				</tr>
				<tr>
				<td>��û����</td>
				<td colspan ='3'><input type="text" id="naContents" name="naContents" readonly style="width:450px;height:250px;" ></td>
				</tr>
				<tr>
				<td>÷������</td>
				<td colspan='3'><a id="naFile1" href="javascript:File()"></a>
				<input type="file" id=naFile name="naFile">
				</td>
				<tr>
				<td colspan='4' align = 'right'>
				<input type="button" id="update" name="update" value = "�����ϱ�">
				<input type="button" id="delete" name="delete" value = "�����ϱ�">
				<input type="button" id="cancel" name="cancel" value = "�������">
				<input type="hidden" id="a" name="a">
				</td>
				</tr>
			</table>
			<input type="hidden" class="naNo2" id="naNo" name="naNo">
		</form>
		</div>
	</div>
</body>
</html>
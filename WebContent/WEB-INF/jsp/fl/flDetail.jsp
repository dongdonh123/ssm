<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>�� �� ����</title>
 	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		var butChk =0; //������ư�� ������ư�� �����ϱ� ���� ����
		$(function(){
			$("#pwdChk").hide();
			
			
			/*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
			$("#updateForm").click(function(){
				$("#pwdChk").show();
				$("#msg").text("�ۼ��� �Է��� �����ȣ�� �Է��� �ּ���").css("color","#000099");
				butChk=1;
			});
			
			$("#cancelBut").click(function(){
				$("#pwdChk").hide();
			});
			
			/*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
			$("#boardDelete").click(function(){
				$("#pwdChk").show();
				$("#msg").text("�ۼ��� �Է��� �����ȣ�� �Է��� �ּ���").css("color","#000099");
				butChk=2;
			});
			

			/* ��й�ȣ Ȯ�� ��ư Ŭ�� �� ó�� �̺�Ʈ*/
			$("#pwdBut").click(function(){
				pwdConfirm();
			});
			
			/* ��� ��ư Ŭ�� �� ó�� �̺�Ʈ */
			$("#boardList").click(function(){
				location.href="/noticeboard/nblist.ssm";
			});
			
		});//end of ���
		
		/* ��й�ȣ Ȯ�� ��ư Ŭ���� �������� ó�� �Լ�*/
		
		function pwdConfirm(){
			
				$.ajax({
					url:"/noticeboard/pwdConfirm.ssm",
					type:"POST",
					data:$("#pwcheckform").serialize(),
					error:function(){
						alert('�ý��� �����Դϴ� �����ڿ��� �����ϼ���');
					},
					success:function(resultData){
						var goUrl="";
						if(resultData ==0){
							$("#msg").text("�ۼ��� �Է��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color","red");
						}else if(resultData ==1){ //��ġ�� ���
							$("#msg").text("");
							if(butChk==1){
								goUrl="/noticeboard/nbupdateForm.ssm";
							}else if(butChk==2){
								goUrl="/noticeboard/nbDelete.ssm";
							}
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}
					}
				});	
				
		
		}	
	</script>
</head>
<body>
	<%
	NoticeBoardVO nvo =(NoticeBoardVO)request.getAttribute("nbdetail");
	%>
	<h3>�ۻ�</h3>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="nbNo" name="nbNo" value="<%=nvo.getNbNo() %>" />
		<input type="hidden" name="nbfile" value="<%=nvo.getNbFile() %>" />
	</form>
	
	<%-- ========================��й�ȣ Ȯ�� ��ư �� ��ư �߰� ���� ================================ --%>
	
	<%-- ======================�� ���� �����ֱ� ���� ========================================== --%>
	<div id="boardDetail">
		<table border="1">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="300px" />
				<col width="300px" />
				</colgroup>
			<tbody>
				<tr>
					<td>�ۼ���</td>
					<td><%=nvo.gettMembervo().getTtName() %></td>
					<td>�ۼ���:<%=nvo.getNbInsertdate() %></td>
					<td>������:<%=nvo.getNbUpdatedate() %></td>
				</tr>
				<tr>
					<td>����</td>
					<td colspan="3"><%=nvo.getNbTitle() %></td>
				</tr>
				<tr height="300px">
					<td>����</td>
					<td colspan="3" ><%=nvo.getNbContents() %></td>
				</tr>
				<tr>
					<td>÷������ ����</td>
					<td colspan="3">
						<img src=<%=nvo.getNbFile() %> border=0 width="320" height="400">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- ======================�� ���� �����ֱ� ���� ========================================== --%>
	<%--===============================��й�ȣ Ȯ�� ��ư �� ��ư �߰� ����======================== --%>
	<table id="boardPwdBut">
		<tr>
			<td>
				<div id="pwdChk">
					<form name="pwcheckform" id="pwcheckform">
						<input type="hidden" name="nbno" id="nbno" value="<%=nvo.getNbNo() %>" />
						<label for="ttpw" id="l_pwd">��й�ȣ : </label>
						<input type="password" name="nbNo" id="nbNo" />
						<input type="button" name="pwdBut" id="pwdBut" value="Ȯ��" />
						<input type="button" name="cancelBut" id="cancelBut" value="���" />
						
						<span id="msg"></span>
					</form>
				</div>
			</td>
			<td>
				<input type="button" value="����" id="updateForm">
				<input type="button" value="����" id="boardDelete">
				<input type="button" value="���" id="boardList">
			</td>
		</tr>
	</table>
</body>
</html>
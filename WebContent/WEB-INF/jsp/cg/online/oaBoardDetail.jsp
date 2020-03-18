<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import =  "ssm.cg.controller.OnlineApplication_BoardController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("EUC-KR");
	//String imagePath = request.getRealPath("uploadStorage");
	Object obj = request.getAttribute("oaDetailList");
	OnlineApplication_BoardVO oaVo = (OnlineApplication_BoardVO)obj;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Detail</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script>
			
			function oaListBtn(){
				alert("(log)������������");
				//location.href = document.referrer; 
				history.go(-1);	
			}
			function oaUpdateBtn(){
				alert("(log)�����Ϸ�");
				$("#oaDetailForm")
				.attr("action","/onlineApplication/oaUpdateForm.ssm")
				.submit();
			}
			function oaDeleteBtn(){
				if(confirm("���� �����Ͻðڽ��ϱ�?")){
					$("#oaDetailForm")
					.attr("action","/onlineApplication/oaBoardDelete.ssm")
					.submit();
				}
			}
			function wwo(){
				
				alert("���ϴٿ�ε�");
				var filePath = "";
				//var fileName = $("#oaFile").src();
				//var fileName = "�߾߾�";
				//alert(fileName);
				$("#oaDetailForm").attr({
					//"method":"post",
					"action":"/onlineApplication/oaFileDownload.ssm"
				});
				$("#oaDetailForm").submit();
				
				//location.href="/onlineApplication/oaFileDownload.ssm?filePath="+filePath+"&fileName"+fileName;
			}
		</script>
		<style>
		html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 4px;
			}
			
			table  {
				width : 1000px;
				text-align : center;
				margin : auto;
				border-collapse : collapse;
			}	
	</style>
	</head>
	<body>
		<div id="oaDetail">
			<div id="oaTitle"><h3>�¶��� ���</h3></div>
			<div id="updateBtn">
				<table>
					<tr>
						<td>
							<input type="button" onclick="oaUpdateBtn()" value="����">
							<input type="button" onclick="oaDeleteBtn()" value="����" />
							<input type="button" onclick="oaListBtn()" value="���"/>
						</td>
					</tr>
				</table>
			</div>
			<table border="1">
			<%
				if(oaVo == null){
			%>
				<tr><td>��ȸ�� �����߽��ϴ�.</td></tr>
			<%	
			} else {
			%>
				<tr>
					<td>��û��ȣ</td>
					<td><%=oaVo.getOaNo() %></td>
					<td>��û��</td>
					<td><%=oaVo.getOaInsertdate() %></td>
				</tr>
				<tr>
					<td>�ۼ���</td>
					<td colspan="4"><%=oaVo.getSsNo() %></td>
				</tr>
				<tr>
					<td>����</td>
					<td><%=oaVo.getTtNo() %></td>
					<td>���о�</td>
					<td><%=oaVo.getOaField() %></td>
				</tr>
				<tr>
					<td>����</td>
					<td colspan="3"><%=oaVo.getOaTitle() %></td>
				</tr>
				<tr>
					<td height="200px">��㳻��</td>
					<td colspan="3"><%=oaVo.getOaContents() %></td>
				</tr>
				<tr>
					<td>÷������</td>
					<td colspan="3">
					
					<%
						if(oaVo.getOaFile() == null) {
					%>
						÷�������� �����ϴ�.</td>
					<%
						} else {
					%>
						<p><%=oaVo.getOaFile() %>&nbsp;&nbsp;&nbsp;<a href="/onlineApplication/oaFileDownload.ssm?fileName=<%=oaVo.getOaFile()%>">�ٿ�ε�</a></p></td>
					<%		
						}
					%>
				</tr>
			<%
			}
			%>
			</table>
			<form id="oaDetailForm" name="oaDetailForm" method="POST">
				<input type="hidden" id="oaNo" name="oaNo" value=<%=oaVo.getOaNo() %> />
				<input type="hidden" id="ssNo" name="ssNo" value=<%=oaVo.getSsNo() %> />
			</form>
		</div>
		<%@include file="oaComment.jsp"%> 
	</body>
</html>
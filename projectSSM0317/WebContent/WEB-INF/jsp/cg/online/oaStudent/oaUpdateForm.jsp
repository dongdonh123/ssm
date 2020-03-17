<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.cg.controller.OnlineApplication_BoardController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>update</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script>
			function oaListBtn(){
				location.href = "/onlineApplication/oaBoardList.ssm";
			} // function()
			
			function oaUpdateBtn(){
				if(confirm("������ �����Ͻðڽ��ϱ�?")){
					$("#oaUpdateForm").attr("action","/onlineApplication/oaBoardUpdate.ssm")
					.submit();
				} // if
			} // function()
			

		</script>
	</head>
	<body>
		<div id="oaUpdate">
			<div id="boardTit"><h3>�¶��� ����û ����</h3></div>
			<form id="oaUpdateForm" name="oaUpdateForm">
				<table border="1">
				<%
					Object obj = request.getAttribute("oaUpdateList");
					OnlineApplication_BoardVO oaVo = (OnlineApplication_BoardVO)obj;	
					if(obj == null){
				%>
					<tr><td>���õ� ���� �����ϴ�. ������� ���ư�����.</td></tr>
				<%
					} else {
				%>
					<tr>
						<td>��û��ȣ</td>
						<td colspan="3"><input type="text" id=oaNo" name="oaNo" value=<%=oaVo.getOaNo()%> readOnly/></td>
					</tr>
					<tr>
						<td>�ۼ���</td>
						<td colspan="3"><input type="text" id="ssNo" name="ssNo" value=<%=oaVo.getSsNo()%> readOnly/></td>
					</tr>
					<tr>
						<td>���о�</td>
						<td>
				<%
							String oaField = oaVo.getOaField();
							System.out.println("(log)oaField : " + oaField);
				%>
							<input type="radio" name="oaField" value="CAC" <%if("CAC".equals(oaField)){%>checked<%}%> />����
							<input type="radio" name="oaField" value="LIC" <%if("LIC".equals(oaField)){%>checked<%}%> />��Ȱ
							<input type="radio" name="oaField" value="LEC" <%if("LEC".equals(oaField)){%>checked<%}%> />�н�
						</td>	
						<td>����</td>
						<td>
							<input type="text" id="ttNo" name="ttNo" value=<%=oaVo.getTtNo() %> />
						</td>
					</tr>
					<tr>
						<td>�������</td>
						<td colspan="3"><input type="text" id="oaTitle" name="oaTitle" value=<%=oaVo.getOaTitle() %>></td>
					</tr>
					<tr>
						<td>��㳻��</td>
						<td colspan="3"><textarea id="oaContents" name="oaContents" cols="50" rows="10"><%=oaVo.getOaContents() %></textarea></td>
					</tr>
					<tr>
						<td>÷������</td>
						<td colspan="3"><input type="file" id="oaFile" name="oaFile" /></td>
					</tr>	
				</table>
				<%
					}
				%>
			</form>
			<div id="btn">
				<input type="button" onclick="oaUpdateBtn()" value="����" />
				<input type="button" onclick="oaListBtn()" value="���" />
			</div>
		</div>
	</body>
</html>
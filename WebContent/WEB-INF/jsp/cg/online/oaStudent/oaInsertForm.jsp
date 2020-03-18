<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<title>Insert</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script>
			function oaListBtn(){
				location.href = "/onlineApplication/oaBoardList.ssm";
			} // function()
			
			function oaInsertBtn(){
				if(confirm("������ �����Ͻðڽ��ϱ�?")){
					$("#oaInsertForm").attr("action","/onlineApplication/oaBoardInsert.ssm")
					.submit();
				} // if
			} // function()
			
		</script>
	</head>
	<body>
		<div id="oaInsert">
			<form id="oaInsertForm" name="oaInsertForm" method="POST" enctype="multipart/form-data">
				<div id="boardTit"><h3>�¶��� ��� ��û</h3></div>
				<table>
					<tr>
						<td>����</td>
						<td>
							<input type="radio" name="ttNo" value="���ӱ���"/>���ӱ���
							<input type="radio" name="ttNo" value="��㱳��"/>��㱳��
						</td>
					</tr>
					<tr>
						<td>���о�</td>
						<td id="oaField">
							<input type="radio" name="oaField" value="CAC"/>����
							<input type="radio"	name="oaField" value="LIC"/>��Ȱ
							<input type="radio" name="oaField" value="LEC"/>�н�
						</td>
					</tr>
					<tr>
						<td>����</td>
						<td><input type="text" id="oaTitle" name="oaTitle"/></td>
					</tr>
					<tr>
						<td>��㳻��</td>
						<td><textarea id="oaContents" name="oaContents" cols="50" rows="10"></textarea></td>
					</tr>
					<tr>
						<td>÷������</td>
						<td><input type="file" id="oaFile" name="oaFile"></td>
					</tr>
				</table>
			</form>
			<div id="btn">
				<input type="button" onclick="oaInsertBtn()" value="����">
				<input type="button" onclick="oaListBtn()" value="���"/>
			</div>
			<!-- // div_btn -->
		</div>
		<!-- // div_oaInsert -->
	</body>
</html>
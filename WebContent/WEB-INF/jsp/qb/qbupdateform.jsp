<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
	    
	    	
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		$("#qbupdateform").attr('action','/qnaboard/qbupdate.ssm').submit();
	    	});
	    });
    </script>
</head>
<body>
	<%
	QnABoardVO qvo =(QnABoardVO)request.getAttribute("updateData");
	%>
	<form id="qbupdateform" name="qbupdateform">
		<table border="1">
			<tr>
				<td colspan="2">Q&A�Խ��� �ۼ����ϱ�<td>
			</tr>
			<tr>
				<td>������</td>
				<td><input type="text" id="qbTitle" name="qbTitle" value="<%=qvo.getQbTitle()%>"></td>
			</tr>
			<tr>
				<td>�۳���</td>
			<td><textarea name="qbContents" id="qbContents" rows="10" cols="50" ><%=qvo.getQbContents()%></textarea></td>
			</tr>
			<tr>
				<td>��б� ����</td>
				<td>
					<input type="radio" id="qbSecretyn" name="qbSecretyn" value="N">������
					<input type="radio" id="qbSecretyn" name="qbSecretyn" value="Y" checked>��б�
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="����">
					<input type="hidden" id ="qbNo" name="qbNo" value="<%=qvo.getQbNo()%>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String qbno= (String)request.getAttribute("QbNo");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	
		$("#submitbutton").click(function(){
			$("#pwcheckForm").attr('action','/qnaboard/qbPwcheck2.ssm')
			.submit();
		});
		
	});
	</script>
</head>
<body>
비밀글입니다 비밀번호를 입력하세요!
<div>
	<form id="pwcheckForm" name="pwcheckForm">
		<input type="text" id="qbPw" name="qbPw">
		<input type="button" id="submitbutton" name="submitbutton" value="보내기">
		<input type="hidden" id="qbNo" name="qbNo" value="<%=qbno%>">
	</form>
</div>
</body>
</html>
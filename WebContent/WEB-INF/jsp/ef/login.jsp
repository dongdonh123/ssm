<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("#submitbut").click(function(){
			
			$("#loginForm").attr('acttion','/eportfolio/teacherlogin.ssm')
			.submit();
		});
		
	});
	</script>
</head>
<body>
<h2>로그인페이지</h2>
<p>세션기능완료되면 삭제할것</p>
	<form id="loginForm" name="loginForm">
		<input Type="text" id="ttId" name="ttId">
		<input Type="text" id="ttPw" name="ttPw">
		<input Type="button" id="submitbut" name="submitbut" value="입력">
	</form>
</body>
</html>
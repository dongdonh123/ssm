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
			pwdConfirm();
		});
		
	});
	
	function pwdConfirm(){
		
		$.ajax({
			url:"/eportfolio/teacherlogin.ssm",
			type:"POST",
			data:$("#loginForm").serialize(),
			error:function(){
				alert('시스템 오류입니다 관리자에게 문의하세요');
			},
			success:function(resultData){
				if(resultData ==0){
					$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
				}else if(resultData ==1){ //일치할 경우
					$("#msg").text("");
					$("#loginForm").attr("action","/eportfolio/teacher.ssm");
					$("#loginForm").submit();
				}
			}
		
		});	
	}	


	</script>
</head>
<body>
<h2>로그인페이지</h2>
<p>세션기능완료되면 삭제할것</p>
	<form id="loginForm" name="loginForm">
		아이디:<input Type="text" id="ttId" name="ttId"><br>
		비밀번호:<input Type="text" id="ttPw" name="ttPw">
		<input Type="button" id="submitbut" name="submitbut" value="입력">
		<span id="msg"></span>
	</form>
</body>
</html>
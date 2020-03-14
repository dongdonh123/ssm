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
			pwdConfirm();
		});
		
		function pwdConfirm(){
			
			$.ajax({
				url:"/qnaboard/pwdConfirm.ssm",
				type:"POST",
				data:$("#pwcheckForm").serialize(),
				error:function(){
					alert('시스템 오류입니다 관리자에게 문의하세요');
				},
				success:function(resultData){
					var goUrl="";
					if(resultData ==0){
						$("#msg").text("입력한 비밀번호가 일치하지 않습니다.").css("color","red");
					}else if(resultData ==1){ //일치할 경우
						$("#msg").text("");
						goUrl="/qnaboard/qbDetail.ssm";
						$("#pwcheckForm").attr("action",goUrl);
						$("#pwcheckForm").submit();
					}
				}
			});	
			
	
		}
		
	});
	</script>
</head>
<body>
비밀글입니다 비밀번호를 입력하세요!
<div>
	<form id="pwcheckForm" name="pwcheckForm">
		<input type="text" id="ssPw" name="ssPw">
		<input type="button" id="submitbutton" name="submitbutton" value="보내기">
		<input type="hidden" id="qbNo" name="qbNo" value="<%=qbno%>">
		<span id="msg"></span>
	</form>
</div>
</body>
</html>
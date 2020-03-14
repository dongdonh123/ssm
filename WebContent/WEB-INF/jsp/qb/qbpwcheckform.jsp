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
					alert('�ý��� �����Դϴ� �����ڿ��� �����ϼ���');
				},
				success:function(resultData){
					var goUrl="";
					if(resultData ==0){
						$("#msg").text("�Է��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color","red");
					}else if(resultData ==1){ //��ġ�� ���
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
��б��Դϴ� ��й�ȣ�� �Է��ϼ���!
<div>
	<form id="pwcheckForm" name="pwcheckForm">
		<input type="text" id="ssPw" name="ssPw">
		<input type="button" id="submitbutton" name="submitbutton" value="������">
		<input type="hidden" id="qbNo" name="qbNo" value="<%=qbno%>">
		<span id="msg"></span>
	</form>
</div>
</body>
</html>
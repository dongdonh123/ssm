<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@include file = "/common/header.jsp" %>
 <%  request.setCharacterEncoding("EUC-KR"); %>
<%-- System.out.println("cgMainS ID>>: "+sessionID);
 System.out.println("cgMainS NO>>: "+sessionNO);
 if(sessionNO.length() > 0 && sessionNO != "" ){
	 
 } --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>���â�� ����(�л�)</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#vcMain").click(function(){
					alert("vcMain�� >>>");
					$("#cgMainS").attr({
						"method":"POST",
						"action":"/jsp/cg/visit/vcMain.ssm"
					});
					$("#cgMainS").submit();	
				});
			});
		</script>
	</head>
	<body>
		<form  name="cgMainS" id="cgMainS" method="post">
			<input type = button name="vcMain" id="vcMain" value="�湮���">
			<input type = button name="" id="" value="�¶��λ��">
		</form>
	</body>
</html>
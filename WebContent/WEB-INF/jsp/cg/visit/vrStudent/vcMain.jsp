<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@include file = "/common/header.jsp" %>
  <%  request.setCharacterEncoding("EUC-KR"); %>
<%-- System.out.println("vcMainS ID>>: "+sessionID);
 System.out.println("vcMainS NO>>: "+sessionNO);
 if(sessionNO.length() > 0 && sessionNO != "" ){
	 
 } --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>vcMainStudent</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#vcT2").click(function(){
					alert("담임교사 스케줄로 >>>");
					$("#ssNo").val("<%=sessionNO%>");
					console.log("D >>> " + $("#ssNo").val());
					$("#vcMainS").attr({
						"method":"POST",
						"action":"/jsp/cg/visit/vcSchedule.ssm"
					});
					$("#vcMainS").submit();	
				});
			});
		</script>
	</head>
	<body>
		<form  name="vcMainS" id="vcMainS" method="post">
			<input type = button name="vcT2" id="vcT2" value="담임교사">
			<input type = button name="vcT3" id="vcT3" value="상담교사">
			<input type = hidden name="ssNo" id="ssNo" />
		</form>
	</body>
</html>
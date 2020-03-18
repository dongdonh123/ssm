<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ssm.cg.vo.VisitCounsel_RsvVO"%>
<%@ page import = "java.util.ArrayList"%>
 <% request.setCharacterEncoding("EUC-KR"); 	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>cacacacal</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script>		
		$(document).ready(function(){
			
			$("#calendar").show();
		});
		</script>
		<style>
			html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 15px;
			}
			
			#calendar {
			  max-width: 1500px; /* max-width : width의 값이 설정한 값보다 커지는 것을 방지 */
			  width : 1000px;
			  margin: 40px auto;
			  text-align : center;
			}
			.fc-time{
				display : none;
			}
			
		</style>
		

	</head>
	<body>

	 <%@include file="/common/header.jsp"%>
	<form name="vcSchedule" id="vcSchedule" method="post">
		<div id="calendar">
		 	<class="btn btn-primary" data-toggle="modal" data-target="#myModal">
			<input type = hidden name="vrDate" id="vrDate">
			<input type = hidden name="vrTime" id="vrTime">
			<input type = hidden name="ttNo" id="ttNo">
			<input type = hidden name="ssNo" id="ssNo" value="<%=sessionNO%>">
		</div>		
	</form>
		<%@include file="vcTimeTable.jspf"%>
		<%@include file="vcModal.jspf"%>		
	</body>
</html>
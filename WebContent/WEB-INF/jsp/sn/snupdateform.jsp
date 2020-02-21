<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.SchedulNoticeVO" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		$("#snupdateform").attr('action','/schedulnotice/snupdate.ssm').submit();
	    	});
	    });
    </script>
</head>
<body>
	<%
	SchedulNoticeVO svo =(SchedulNoticeVO)request.getAttribute("updateData");
	%>
	<form id="snupdateform" name="snupdateform">
		<table border="1">
		
			<tr>
				<td colspan="2">공지사항게시판 글수정하기<td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" id="snTitle" name="snTitle" value="<%=svo.getSnTitle()%>"></td>
			</tr>
			<tr>
				<td>글내용</td>
			<td><textarea name="snContents" id="snContents" rows="10" cols="50" ><%=svo.getSnContents()%></textarea></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><input type="text" id="snDate" name="snDate" value="<%=svo.getSnDate()%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="수정">
					<input type="hidden" id ="snNo" name="snNo" value="<%=svo.getSnNo()%>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
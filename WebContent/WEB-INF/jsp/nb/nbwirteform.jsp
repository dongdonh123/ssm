<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
	    
	    	$("#submitbutton").click(function(){
	    		$("#nbwirteform").attr('action','/noticeboard/nbwirte.ssm').submit();
	    	});
	    });
    </script>
</head>
<body>
	<form id="nbwirteform" name="nbwirteform" enctype="multipart/form-data" method="post">
		<table border="1">
			<tr>
				<td colspan="2">공지사항게시판 글입력하기<td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" id="ttno" name="ttno" value=""></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" id="nbtitle" name="nbtitle"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea id="nbcontents" name="nbcontents" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일1</td>
				<td><input type="file" id="nbfile" name="nbfile"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="입력">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
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
	    		
	    		$("#snwirteform").attr('action','/schedulnotice/snwirte.ssm').submit();
	    	});
	    });
	    
	    
	    
    </script>
</head>
<body>
	<form id="snwirteform" name="snwirteform">
		<table border="1">
			
			<tr>
				<td colspan="2">�������װԽ��� ���Է��ϱ�</td>
			</tr>
			<tr>
				<td>�ۼ���</td><!--  ttno�� ���ǿ��� �������� �ֱ� -->
				<td><input type="text" id="ttNo" name="ttNo" value=""></td>
			</tr>
			<tr>
				<td>������</td>
				<td><input type="text" id="snTitle" name="snTitle"></td>
			</tr>
			<tr>
				<td>�۳���</td>
				<td><textarea name="snContents" id="snContents" rows="10" cols="50" ></textarea></td>
			</tr>
			<tr>
				<td>��¥�Է�</td>
				<td><input type="text" id="snDate" name="snDate"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="�Է�">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
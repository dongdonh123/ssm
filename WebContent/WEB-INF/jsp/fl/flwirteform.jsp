<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript" src="/kk/js/service/HuskyEZCreator.js" charset="EUC-KR"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    
	    $(document).ready(function(){
	    
	    	var oEditors = [];
	    	nhn.husky.EZCreator.createInIFrame({
	    	 oAppRef: oEditors,
	    	 elPlaceHolder: "nbContents",
	    	 sSkinURI: "/kk/SmartEditor2Skin_ko_KR.html",
	    	 fCreator: "createSEditor2"
	    	});
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		oEditors.getById["nbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		
	    		$("#nbwirteform").attr('action','/noticeboard/nbwirte.ssm').submit();
	    	});
	    });
	    
	    
	    
    </script>
</head>
<body>
	<form id="nbwirteform" name="nbwirteform" enctype="multipart/form-data" method="post">
		<table border="1">
			<colgroup>
				<col width="100px"></col>
				<col width="800px"></col>
			</colgroup>
			<tr>
				<td colspan="2">�������װԽ��� ���Է��ϱ�</td>
			</tr>
			<tr>
				<td>�ۼ���</td><!--  ttno�� ���ǿ��� �������� �ֱ� -->
				<td><input type="text" id="ttNo" name="ttNo" value="">ttno�� ���ǿ��� �������� �ֱ�(T8200003)</td>
			</tr>
			<tr>
				<td>������</td>
				<td><input type="text" id="nbTitle" name="nbTitle"></td>
			</tr>
			<tr>
				<td>�۳���</td>
				<td><textarea name="nbContents" id="nbContents" rows="10" cols="100" >�����Ϳ� �⺻���� ������ ��(���� ���)�� ���ٸ� �� value ���� �������� �����ø� �˴ϴ�.</textarea></td>
			</tr>
			<tr>
				<td>÷������1</td>
				<td><input type="file" id="nbFile" name="nbFile"></td>
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
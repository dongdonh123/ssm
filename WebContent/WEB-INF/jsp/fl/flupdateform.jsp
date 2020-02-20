<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>    
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
	    		$("#nbupdateform").attr('action','/noticeboard/nbupdate.ssm').submit();
	    	});
	    });
    </script>
</head>
<body>
	<%
	NoticeBoardVO nvo =(NoticeBoardVO)request.getAttribute("updateData");
	%>
	<form id="nbupdateform" name="nbupdateform" enctype="multipart/form-data" method="post">
		<table border="1">
			<colgroup>
				<col width="100px"></col>
				<col width="800px"></col>
			</colgroup>
			<tr>
				<td colspan="2">공지사항게시판 글수정하기<td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" id="nbTitle" name="nbTitle" size="110"value="<%=nvo.getNbTitle()%>"></td>
			</tr>
			<tr>
				<td>글내용</td>
			<td><textarea name="nbContents" id="nbContents" rows="10" cols="100" ><%=nvo.getNbContents()%></textarea></td>
			</tr>
			<tr>
				<td>첨부파일1</td>
				<td><input type="file" id="nbFile" name="nbFile"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="수정">
					<input type="hidden" id ="nbNo" name="nbNo" value="<%=nvo.getNbNo()%>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>

<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		$("#qbupdateform").attr('action','/qnaboard/qbupdate.ssm').submit();
	    	});
	    	
	    	$('.A').keydown(function(){
	            cut_28(this);
	        });
	    	
	    });
	    
	    function cut_28(obj){
	        var text = $(obj).val();
	        var leng = text.length;
	        while(getTextLength(text) > 28){
	            leng--;
	            text = text.substring(0, leng);
	        }
	        $(obj).val(text);
	        $('.C').text(getTextLength(text));
	    }
	    
	    function getTextLength(str) {
	        var len = 0;
	        for (var i = 0; i < str.length; i++) {
	            if (escape(str.charAt(i)).length == 6) {
	                len++;
	            }
	            len++;
	        }
	        return len;
	    }
	    
    </script>
</head>
<body>
	<%
	QnABoardVO qvo =(QnABoardVO)request.getAttribute("updateData");
	%>
	<form id="qbupdateform" name="qbupdateform">
		<table border="1">
			<tr>
				<td colspan="2">Q&A게시판 글수정하기<td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" class="A" id="qbTitle" name="qbTitle" value="<%=qvo.getQbTitle()%>">
					<div class="bytes-wrapper">
        				<span class="C">0</span>bytes
    				</div>
    			</td>
			</tr>
			<tr>
				<td>글내용</td>
			<td><textarea name="qbContents" id="qbContents" rows="10" cols="50" ><%=qvo.getQbContents()%></textarea></td>
			</tr>
			<tr>
				<td>비밀글 설정</td>
				<td>
					<input type="radio" id="qbSecretyn" name="qbSecretyn" value="N">공개글
					<input type="radio" id="qbSecretyn" name="qbSecretyn" value="Y" checked>비밀글
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="수정">
					<input type="hidden" id ="qbNo" name="qbNo" value="<%=qvo.getQbNo()%>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
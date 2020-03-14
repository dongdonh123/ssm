<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript" src="/navereditor/js/service/HuskyEZCreator.js" charset="EUC-KR"></script> 
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    
	    $(document).ready(function(){
		    
	    	var oEditors = [];
	    	nhn.husky.EZCreator.createInIFrame({
	    	 oAppRef: oEditors,
	    	 elPlaceHolder: "qbContents",
	    	 sSkinURI: "/navereditor/SmartEditor2Skin_ko_KR1.html",
	    	 fCreator: "createSEditor2"
	    	});
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		oEditors.getById["qbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		
	    		$("#qbwirteform").attr('action','/qnaboard/qbwirte.ssm').submit();
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
	<form id="qbwirteform" name="qbwirteform">
	<!-- ssNo는 세션으로 입력하기 -->
	<input Type="hidden" id="ssNo" name="ssNo" value="S7180001">
		<table border="1">
			<colgroup>
				<col width="100px"></col>
				<col width="800px"></col>
			</colgroup>
			<tr>
				<td colspan="2">Q&A게시판 글입력하기</td>
			</tr>
			
			<tr>
				<td>글제목</td>
				<td><input type="text" id="qbTitle" name="qbTitle" class="A">
					<div class="bytes-wrapper">
        				<span class="C">0</span>bytes
    				</div>
    			</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="qbContents" id="qbContents" rows="10" cols="50" ></textarea></td>
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
					<input type="button" id ="submitbutton" name="submitbutton" value="입력">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
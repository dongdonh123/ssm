<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script>
  
    $(function() {
    	
      $( "#snDate" ).datepicker({
        dateFormat: 'yy.mm.dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: true,
        changeMonth: true,
        changeYear: true,
        yearSuffix: '년'
      });
      
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
				<td colspan="2">공지사항게시판 글입력하기</td>
			</tr>
			<tr>
				<td>작성자</td><!--  ttno는 세션에서 히든으로 넣기 -->
				<td><input type="text" id="ttNo" name="ttNo" value=""></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" id="snTitle" name="snTitle"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="snContents" id="snContents" rows="10" cols="50" ></textarea></td>
			</tr>
			<tr>
				<td>날짜입력</td>
				<td><input type="text" id="snDate" name="snDate"></td>
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
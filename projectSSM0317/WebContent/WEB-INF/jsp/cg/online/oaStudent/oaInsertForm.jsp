<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<title>Insert</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script>
			function oaListBtn(){
				location.href = "/onlineApplication/oaBoardList.ssm";
			} // function()
			
			function oaInsertBtn(){
				if(confirm("상담글을 저장하시겠습니까?")){
					$("#oaInsertForm").attr("action","/onlineApplication/oaBoardInsert.ssm")
					.submit();
				} // if
			} // function()
			
		</script>
	</head>
	<body>
		<div id="oaInsert">
			<form id="oaInsertForm" name="oaInsertForm" method="POST" enctype="multipart/form-data">
				<div id="boardTit"><h3>온라인 상담 신청</h3></div>
				<table>
					<tr>
						<td>상담사</td>
						<td>
							<input type="radio" name="ttNo" value="담임교사"/>담임교사
							<input type="radio" name="ttNo" value="상담교사"/>상담교사
						</td>
					</tr>
					<tr>
						<td>상담분야</td>
						<td id="oaField">
							<input type="radio" name="oaField" value="CAC"/>진로
							<input type="radio"	name="oaField" value="LIC"/>생활
							<input type="radio" name="oaField" value="LEC"/>학습
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" id="oaTitle" name="oaTitle"/></td>
					</tr>
					<tr>
						<td>상담내용</td>
						<td><textarea id="oaContents" name="oaContents" cols="50" rows="10"></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" id="oaFile" name="oaFile"></td>
					</tr>
				</table>
			</form>
			<div id="btn">
				<input type="button" onclick="oaInsertBtn()" value="저장">
				<input type="button" onclick="oaListBtn()" value="목록"/>
			</div>
			<!-- // div_btn -->
		</div>
		<!-- // div_oaInsert -->
	</body>
</html>
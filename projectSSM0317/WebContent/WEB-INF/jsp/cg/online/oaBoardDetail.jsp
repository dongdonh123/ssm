<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import =  "ssm.cg.controller.OnlineApplication_BoardController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("EUC-KR");
	//String imagePath = request.getRealPath("uploadStorage");
	Object obj = request.getAttribute("oaDetailList");
	OnlineApplication_BoardVO oaVo = (OnlineApplication_BoardVO)obj;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Detail</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script>
			
			function oaListBtn(){
				alert("(log)이전페이지로");
				//location.href = document.referrer; 
				history.go(-1);	
			}
			function oaUpdateBtn(){
				alert("(log)수정하러");
				$("#oaDetailForm")
				.attr("action","/onlineApplication/oaUpdateForm.ssm")
				.submit();
			}
			function oaDeleteBtn(){
				if(confirm("글을 삭제하시겠습니까?")){
					$("#oaDetailForm")
					.attr("action","/onlineApplication/oaBoardDelete.ssm")
					.submit();
				}
			}
			function wwo(){
				
				alert("파일다운로드");
				var filePath = "";
				//var fileName = $("#oaFile").src();
				//var fileName = "야야야";
				//alert(fileName);
				$("#oaDetailForm").attr({
					//"method":"post",
					"action":"/onlineApplication/oaFileDownload.ssm"
				});
				$("#oaDetailForm").submit();
				
				//location.href="/onlineApplication/oaFileDownload.ssm?filePath="+filePath+"&fileName"+fileName;
			}
		</script>
		<style>
		html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 4px;
			}
			
			table  {
				width : 1000px;
				text-align : center;
				margin : auto;
				border-collapse : collapse;
			}	
	</style>
	</head>
	<body>
		<div id="oaDetail">
			<div id="oaTitle"><h3>온라인 상담</h3></div>
			<div id="updateBtn">
				<table>
					<tr>
						<td>
							<input type="button" onclick="oaUpdateBtn()" value="수정">
							<input type="button" onclick="oaDeleteBtn()" value="삭제" />
							<input type="button" onclick="oaListBtn()" value="목록"/>
						</td>
					</tr>
				</table>
			</div>
			<table border="1">
			<%
				if(oaVo == null){
			%>
				<tr><td>조회에 실패했습니다.</td></tr>
			<%	
			} else {
			%>
				<tr>
					<td>신청번호</td>
					<td><%=oaVo.getOaNo() %></td>
					<td>신청일</td>
					<td><%=oaVo.getOaInsertdate() %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="4"><%=oaVo.getSsNo() %></td>
				</tr>
				<tr>
					<td>상담사</td>
					<td><%=oaVo.getTtNo() %></td>
					<td>상담분야</td>
					<td><%=oaVo.getOaField() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=oaVo.getOaTitle() %></td>
				</tr>
				<tr>
					<td height="200px">상담내용</td>
					<td colspan="3"><%=oaVo.getOaContents() %></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3">
					
					<%
						if(oaVo.getOaFile() == null) {
					%>
						첨부파일이 없습니다.</td>
					<%
						} else {
					%>
						<p><%=oaVo.getOaFile() %>&nbsp;&nbsp;&nbsp;<a href="/onlineApplication/oaFileDownload.ssm?fileName=<%=oaVo.getOaFile()%>">다운로드</a></p></td>
					<%		
						}
					%>
				</tr>
			<%
			}
			%>
			</table>
			<form id="oaDetailForm" name="oaDetailForm" method="POST">
				<input type="hidden" id="oaNo" name="oaNo" value=<%=oaVo.getOaNo() %> />
				<input type="hidden" id="ssNo" name="ssNo" value=<%=oaVo.getSsNo() %> />
			</form>
		</div>
		<%@include file="oaComment.jsp"%> 
	</body>
</html>
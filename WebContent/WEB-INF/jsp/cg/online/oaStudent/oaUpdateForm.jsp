<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.cg.controller.OnlineApplication_BoardController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>update</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script>
			function oaListBtn(){
				location.href = "/onlineApplication/oaBoardList.ssm";
			} // function()
			
			function oaUpdateBtn(){
				if(confirm("상담글을 수정하시겠습니까?")){
					$("#oaUpdateForm").attr("action","/onlineApplication/oaBoardUpdate.ssm")
					.submit();
				} // if
			} // function()
			

		</script>
	</head>
	<body>
		<div id="oaUpdate">
			<div id="boardTit"><h3>온라인 상담신청 수정</h3></div>
			<form id="oaUpdateForm" name="oaUpdateForm">
				<table border="1">
				<%
					Object obj = request.getAttribute("oaUpdateList");
					OnlineApplication_BoardVO oaVo = (OnlineApplication_BoardVO)obj;	
					if(obj == null){
				%>
					<tr><td>선택된 글이 없습니다. 목록으로 돌아가세요.</td></tr>
				<%
					} else {
				%>
					<tr>
						<td>신청번호</td>
						<td colspan="3"><input type="text" id=oaNo" name="oaNo" value=<%=oaVo.getOaNo()%> readOnly/></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3"><input type="text" id="ssNo" name="ssNo" value=<%=oaVo.getSsNo()%> readOnly/></td>
					</tr>
					<tr>
						<td>상담분야</td>
						<td>
				<%
							String oaField = oaVo.getOaField();
							System.out.println("(log)oaField : " + oaField);
				%>
							<input type="radio" name="oaField" value="CAC" <%if("CAC".equals(oaField)){%>checked<%}%> />진로
							<input type="radio" name="oaField" value="LIC" <%if("LIC".equals(oaField)){%>checked<%}%> />생활
							<input type="radio" name="oaField" value="LEC" <%if("LEC".equals(oaField)){%>checked<%}%> />학습
						</td>	
						<td>상담사</td>
						<td>
							<input type="text" id="ttNo" name="ttNo" value=<%=oaVo.getTtNo() %> />
						</td>
					</tr>
					<tr>
						<td>상담제목</td>
						<td colspan="3"><input type="text" id="oaTitle" name="oaTitle" value=<%=oaVo.getOaTitle() %>></td>
					</tr>
					<tr>
						<td>상담내용</td>
						<td colspan="3"><textarea id="oaContents" name="oaContents" cols="50" rows="10"><%=oaVo.getOaContents() %></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="3"><input type="file" id="oaFile" name="oaFile" /></td>
					</tr>	
				</table>
				<%
					}
				%>
			</form>
			<div id="btn">
				<input type="button" onclick="oaUpdateBtn()" value="수정" />
				<input type="button" onclick="oaListBtn()" value="목록" />
			</div>
		</div>
	</body>
</html>
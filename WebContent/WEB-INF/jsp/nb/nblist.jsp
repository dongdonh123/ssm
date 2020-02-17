<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.nb.vo.NoticeBoardVO" %>    
<%@ page import="java.util.List" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#nbinsertbutton").click(function(){
			$(location).attr('href',"/noticeboard/nbwirteform.ssm");
		});
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".nbDetail").click(function(){
			var nbNo = $(this).parents("tr").attr("data-num");
			$("#nbNo").val(nbNo);
			$("#nbdetailForm").attr('action',"/noticeboard/nbDetail.ssm")
			.submit();
		});
	});
	</script>
</head>
<body>
<%
	List<NoticeBoardVO> nblist =(List<NoticeBoardVO>)request.getAttribute("nblist");
%>
	<div id="boardContainer">
		<h1>공지사항 게시판</h1>
		
		<div id="boardlist">
			<table border ="1"summary="게시판 리스트">
				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성일</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(nblist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>작성된 글이 없습니다.</td>
						<td></td>
						<td></td>
					</tr>
					<%
					}else{
						for (int i=0; i<nblist.size(); i++){
							NoticeBoardVO nvo = nblist.get(i);
					%>	
						<tr data-num=<%=nvo.getNbNo() %>>
							<td><%=nvo.getNbNo() %></td>
							<td><span class="nbDetail"><%=nvo.getNbTitle() %></span></td>
							<td><%=nvo.getNbInsertdate() %></td>
							<td><%=nvo.getTtNo() %></td>
						</tr>
					<% 		
						}
					}
					%>
				</tbody>
			</table>
			<form id="nblistform" name="nblistform">
				<input type="button" id="nbinsertbutton" name="nbinsertbutton" value="글쓰기">
			</form>
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="nbdetailForm" id="nbdetailForm">
			<input type="hidden" name="nbNo" id="nbNo">
			</form>
		</div>
	</div>
	
</body>
</html>
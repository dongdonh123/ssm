<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "ssm.mi.vo.SMemberVO"%>
<%
		Object obj = request.getAttribute("ssOaList");
		System.out.println("obj >>> : " +obj);
		
		if (obj != null){
			ArrayList<OnlineApplication_BoardVO> aList = (ArrayList<OnlineApplication_BoardVO>) obj;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ssOaList</title>
			<script src="/include/js/jquery-1.11.3.min.js"></script>
			<script>
			$(document).ready(function(){
				
				// 제목 클릭 시 상세페이지로 이동
				$(".goDetail").click(function(){
					var oaNo = $(this).parents("tr").attr("dataNo");
					alert("(log)no : " + oaNo);
					$("#oaNo") .val(oaNo);
					alert("(log)goDetail");
					$("#ssOaList").attr({
						"method":"get",
						"action":"/onlineApplication/oaDetailForm.ssm"
					});
					$("#ssOaList").submit();
				});
			}); // ready()
			</script>
		</head>
	<body>
		<form name="ssOaList" id="ssOaList" 
		method ="POST"
		enctype="application/x-www-form-urlencoded">
		<input type="hidden" id="oaNo" name="oaNo"/>
		<input type="hidden" id="ssNo" name="ssNo"/>
		<h1>[<%=aList.get(0).getSmemberVO().getSsName()%> 학생의 예약목록]</h1>
<%			if (aList.size() == 0){
	
	%>	
				<table border="1">
					<tr>
						<td>NO DATA</td>
					</tr>
				</table>			
				<% 		
					}else{
				%>
				<div id="ssOaList">
				<table border ="1">
				<h3> 답변대기 목록</h3>
					<colgroup>
						<col width="8%">
						<col width="7%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th><a href="javascript:setOrder('oaNo');">신청번호
							</a></th>
							<th>답변상태</th>
							<th>상담분야</th>
							<th>제목</th>
							<th>작성자</th>
							<th>신청일</th>
						</tr>
					</thead>
					<tbody>
				
<% 					for(int i =0; i<aList.size(); i++){  
							OnlineApplication_BoardVO oaVo = aList.get(i);
							if(oaVo.getOaStatus().equals("대기")){
%>
					
						<tr align="center" dataNo = <%=oaVo.getOaNo() %>>
							<td><%=oaVo.getOaNo()%></td>
							<td>답변<%=oaVo.getOaStatus() %></td>
							<td><%=oaVo.getOaField() %></td>
							<td class="goDetail"><%=oaVo.getOaTitle()%></td>
							<td><%=oaVo.getSmemberVO().getSsName() %></td>
							<td><%=oaVo.getOaInsertdate() %></td>
						</tr>
					
								
<%							}//if끝
						} //for끝
%>					</tbody>
				</table>
				<hr width="1100px" align="left">
				<table border="1">
					<h3>답변완료 목록</h3>
					<colgroup>
						<col width="8%">
						<col width="7%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th><a href="javascript:setOrder('oaNo');">신청번호
							</a></th>
							<th>답변상태</th>
							<th>상담분야</th>
							<th>제목</th>
							<th>작성자</th>
							<th>신청일</th>
						</tr>
					</thead>
					<tbody>


<%						
					for(int i =0; i<aList.size(); i++){  
							OnlineApplication_BoardVO oaVo = aList.get(i);
							if(oaVo.getOaStatus().equals("완료")){
						%>
						
						<tr align="center" dataNo = <%=oaVo.getOaNo() %>>
							<td><%=oaVo.getOaNo()%></td>
							<td>답변<%=oaVo.getOaStatus() %></td>
							<td><%=oaVo.getOaField() %></td>
							<td class="goDetail"><%=oaVo.getOaTitle()%></td>
							<td><%=oaVo.getSmemberVO().getSsName() %></td>
							<td><%=oaVo.getOaInsertdate() %></td>
						</tr>
						
							
						<%	}//if끝
						} //for끝	
					} //aList.size if 끝
%>					
					</tbody>
				</table>		
			</div>
			
			
		</form>
<%	}//if-else obj %>
	</body>
</html>
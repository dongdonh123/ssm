<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.FamilyLetterVO" %>    
<%@ page import="java.util.List" %>    
   
<%
	List<FamilyLetterVO> fllist =(List<FamilyLetterVO>)request.getAttribute("fllist");
FamilyLetterVO data =(FamilyLetterVO)request.getAttribute("data");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		/*검색 대상이 변경될 때마다 처리 이벤트*/
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		/*검색 버튼 클릭 시 처리 이벤트*/
		$("#searchBut").click(function(){
			
			goPage(1);
		});
		
		$("#insertbutton").click(function(){
			$(location).attr('href',"/familyletter/flwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/familyletter/fllist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".flDetail").click(function(){
			var flNo = $(this).parents("tr").attr("data-num");
			$("#flNo").val(flNo);
			$("#fldetailForm").attr('action',"/familyletter/flDetail.ssm")
			.submit();
		});
	});
	</script>
</head>
<body>
	<div id="boardContainer">
		<h1>가정통신문 게시판</h1>
		
		<%-- ======================검색기능 시작============================ --%>
		
		<div id="boardSearch">
			<form id="f_search" name="f_search">
				<table summary="검색">
					<colgroup>
						<col width="70%"></col>
						<col width="30%"></col>
					</colgroup>
					<tr>
						<td>
						<label>검색조건</label>
						<select id="search" name="search">
							<option value="all">전체</option>
							<option value="flTitle">제목</option>
							<option value="flContents">내용</option>
							<option value="ttName">작성자</option>
						</select>
						
						<input type="text" name="keyword" id="keyword" value="검색어를입력하세요" />
						<input type="button" value="검색" id="searchBut" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<%-- =======================검색기능 끝============================ --%>
		
		<div id="boardlist" style="text-align:center">
			<table summary="게시판 리스트">
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
					if(fllist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>작성된 글이 없습니다.</td>
						<td></td>
						<td></td>
					</tr>
					<%
					}else{
						int count = fllist.size();
						for (int i=(count-1); i>=0; i--){
							FamilyLetterVO nvo = fllist.get(i);
							int no = i+1;
					%>	
						<tr data-num=<%=nvo.getFlNo() %>>
							<td><%=no%> </td>
							<td><span class="flDetail"><%=nvo.getFlTitle() %></span></td>
							<td><%=nvo.getFlInsertdate() %></td>
							<td><%=nvo.gettMembervo().getTtName() %></td>
						</tr>
					<% 		
						}
					}
					%>
				</tbody>
			</table>
			<form id="fllistform" name="fllistform">
				<input type="button" id="insertbutton" name="insertbutton" value="글쓰기">
			</form>
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="fldetailForm" id="fldetailForm">
			<input type="hidden" name="flNo" id="flNo">
			</form>
		</div>
	</div>
	
</body>
</html>
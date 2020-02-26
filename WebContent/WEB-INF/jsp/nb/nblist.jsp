<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>    
<%@ page import="java.util.List" %>    
   
<%
	request.setCharacterEncoding("UTF-8");
	int pageCount = 0;
	List<NoticeBoardVO> nblist =(List<NoticeBoardVO>)request.getAttribute("nblist");
	int listSize= nblist.size();
	if(listSize >0){
		NoticeBoardVO nvo_ = nblist.get(0);
		double totalCount = (double)Integer.parseInt(nvo_.getTotalCount()); 
		int pagelistSize = (int)request.getAttribute("listSize");
		double dval = (double)pagelistSize;
		pageCount = (int)Math.ceil(totalCount/dval); //pageCount 변수 사용
		System.out.println("pageCount>>>:"+ pageCount); //1
		System.out.println("totalCount>>>:"+ totalCount); //10
		System.out.println("pagelistSize>>>:"+ pagelistSize);
	}
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
		
		$("#nbinsertbutton").click(function(){
			$(location).attr('href',"/noticeboard/nbwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/noticeboard/nblist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".nbDetail").click(function(){
			var nbNo = $(this).parents("tr").attr("data-num");
			$("#nbNo").val(nbNo);
			$("#nbdetailForm").attr('action',"/noticeboard/nbDetail.ssm")
			.submit();
		});
		
		$(".pageNobut").click(function(){
			var pageNo = $(this).val();
			$("#pageNo").val(pageNo);
			alert(pageNo);
			$("#pageNoForm").attr('action',"/noticeboard/nblist.ssm")
			.submit();
		});
		
		
	});
	</script>
</head>
<body>
	<div id="boardContainer">
		<h1>공지사항 게시판</h1>
		
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
							<option value="nbTitle">제목</option>
							<option value="nbContents">내용</option>
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
						int count = nblist.size();
						for (int i=0; i<count; i++){
							NoticeBoardVO nvo = nblist.get(i);
							String no = nvo.getNbNo().substring(4);
					%>	
						<tr data-num=<%=nvo.getNbNo() %>>
							<td><%=no%> </td>
							<td><span class="nbDetail"><%=nvo.getNbTitle() %></span></td>
							<td><%=nvo.getNbInsertdate() %></td>
							<td><%=nvo.gettMembervo().getTtName() %></td>
						</tr>
					<% 		
						}
						%>
						<form id="pageNoForm">
						<%
						for(int i=1 ; i<=pageCount;i++){
						%>
						<input type="button" class="pageNobut" id="pageNobut" name="pageNobut" value="<%=i%>" >
						<input type="hidden" id="pageNo" name="pageNo" value="1">
						<input type="hidden" id="listSize" name="listSize" value="10">
						</form>
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
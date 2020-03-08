<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.SchedulNoticeVO" %>    
<%@ page import="java.util.List" %>    
   
<%	
	SchedulNoticeVO searchdata =(SchedulNoticeVO)request.getAttribute("Searchdata");
	int pageCount = 0;
	List<SchedulNoticeVO> snlist =(List<SchedulNoticeVO>)request.getAttribute("snlist");
	int listSize=snlist.size();
	if(listSize >0){
	SchedulNoticeVO svo_ = snlist.get(0);
	double totalCount = (double)Integer.parseInt(svo_.getTotalCount()); 
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
		
		$("#insertbutton").click(function(){
			
			window.open("/schedulnotice/snwirteform.ssm","pop1","width=600,height=450");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/schedulnotice/snlist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".snDetail").click(function(){
			var snNo = $(this).parents("tr").attr("data-num");
			$("#snNo").val(snNo);
			$("#sndetailForm").attr('action',"/schedulnotice/snDetail.ssm")
			.submit();
		});
		
		$(".pageNobut").click(function(){
			var pageNo = $(this).val();
			$("#pageNo").val(pageNo);
			alert(pageNo);
			$("#pageNoForm").attr('action',"/schedulnotice/snlist.ssm")
			.submit();
		});
		
		if("<%=searchdata.getKeyword()%>" != ""){
			$("#keyword").val("<%=searchdata.getKeyword()%>");
			$("#search").val("<%=searchdata.getSearch()%>");
			
		}
		
		$("#calendarbutton").click(function(){
			$("#pageNoForm").attr('action',"/schedulnotice/sncalendar2.ssm")
			.submit();
		});
		
	});	


	
	</script>
</head>
<body>
	<div id="boardMode">
		<h1>학교일정 게시판</h1>
		<input type="button" value="목록형" disabled>
		<input type="button" id="calendarbutton" value="캘린더형">
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
							<option value="snTitle">제목</option>
							<option value="snContents">내용</option>
							<option value="ttName">작성자</option>
						</select>
						
						<input type="text" name="keyword" id="keyword" value="검색어를입력하세요" />
						<input type="button" value="검색" id="searchBut" />
						<input type="button" id="insertbutton" name="insertbutton" value="글쓰기">
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<%-- =======================검색기능 끝============================ --%>
		
		<div id="boardlist">
			<table summary="게시판 리스트">
				<colgroup>
					<col width="33%" />
					<col width="33%" />
					<col width="33%" />
				</colgroup>
				<thead>
					<tr>
						<th>시작일</th>
						<th>종료일</th>
						<th>일정</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(snlist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>작성된 글이 없습니다.</td>
						<td></td>
					</tr>
					<%
					
					}else{
						int count = snlist.size();
						for (int i=0; i< count; i++){
							SchedulNoticeVO svo = snlist.get(i);
					%>	
						<tr data-num=<%=svo.getSnNo() %>>
							<td><%=svo.getSnStartdate()%> </td>
							<td><%=svo.getSnEnddate()%> </td>
							<td><span class="snDetail"><%=svo.getSnTitle() %></span></td>
						</tr>
						
					<% 		
					}
					}
					%>
					
				</tbody>
			</table>
			<div>
			<% 
			for(int i=1 ; i<=pageCount;i++){%>
				<input type="button" class="pageNobut" id="pageNobut" name="pageNobut" value="<%=i%>" />
			<%}%>
			</div>
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="sndetailForm" id="sndetailForm">
			<input type="hidden" name="snNo" id="snNo">
			</form>
			
			<!--페이지징  form -->
			<form id="pageNoForm">
				<input type="hidden" id="pageNo" name="pageNo" value="1">
				<input type="hidden" id="listSize" name="listSize" value="10">
				<input type="hidden" id="search" name="search" value="<%=searchdata.getSearch()%>">
				<input type="hidden" id="keyword" name="keyword" value="<%=searchdata.getKeyword()%>">
			</form>
		</div>
		
	</div>
</body>
</html>
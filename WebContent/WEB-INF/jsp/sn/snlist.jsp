<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.SchedulNoticeVO" %>    
<%@ page import="java.util.List" %>    
   
<%
	List<SchedulNoticeVO> snlist =(List<SchedulNoticeVO>)request.getAttribute("snlist");
	SchedulNoticeVO data =(SchedulNoticeVO)request.getAttribute("data");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#calendarMode").hide(); 
		
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
		
	});	
	
	function showbutton(actionName){
		if('L' == actionName){
			$("#calendarMode").hide(); 
			$("#boardMode").show();
		}
		if('C' == actionName){
			$("#boardMode").hide(); 
			$("#calendarMode").show(); 
		}
	}


	
	</script>
</head>
<body>
	<div id="boardMode">
		<h1>학교일정 게시판</h1>
		
		<%-- ======================검색기능 시작============================ --%>
		
		<div id="boardSearch">
			<form id="ajaxform" name="ajaxform">
				<input type="button" onclick="showbutton('L')" value="목록형" disabled>
				<input type="button" onclick="showbutton('C')" value="캘린더형">
			</form>
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
					if(snlist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>작성된 글이 없습니다.</td>
						<td></td>
						<td></td>
					</tr>
					<%
					
					}else{
						int count = snlist.size();
						for (int i=(count-1); i>=0; i--){
							SchedulNoticeVO svo = (SchedulNoticeVO)snlist.get(i);
							int no = i+1;
					%>	
						<tr data-num=<%=svo.getSnNo() %>>
							<td><%=no%> </td>
							<td><span class="snDetail"><%=svo.getSnTitle() %></span></td>
							<td><%=svo.getSnInsertdate() %></td>
							<td><%=svo.gettMembervo().getTtName() %></td>
						</tr>
					<% 		
						}
					}
					%>
				</tbody>
			</table>
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="sndetailForm" id="sndetailForm">
			<input type="hidden" name="snNo" id="snNo">
			</form>
		</div>
	</div>
	
	
	<div id="calendarMode">
		<h1>학교일정 게시판</h1>
		<form id="ajaxform" name="ajaxform" align="left">
			<input type="button" onclick="showbutton('L')" value="목록형" >
			<input type="button" onclick="showbutton('C')" value="캘린더형" disabled>
		</form>
	캘린더 모드 여기에 캘린더 api넣을거야
	</div>
</body>
</html>
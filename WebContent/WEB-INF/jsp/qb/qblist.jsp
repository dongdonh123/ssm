<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
<%@ page import="java.util.List" %>    
<%
	request.setCharacterEncoding("EUC-KR");	
%>
<%	
	QnABoardVO searchdata =(QnABoardVO)request.getAttribute("Searchdata");
	int pageCount =0;
	List<QnABoardVO> qblist =(List<QnABoardVO>)request.getAttribute("qblist");
	int listSize=qblist.size();
	if(listSize >0){
	QnABoardVO qvo_ = qblist.get(0);
	double totalCount = (double)Integer.parseInt(qvo_.getTotalCount()); 
	int pagelistSize = (int)request.getAttribute("listSize");
	double dval = (double)pagelistSize;
	pageCount = (int)Math.ceil(totalCount/dval); //pageCount 변수 사용
	}
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
			
			goPage();
		});
		
		$("#insertbutton").click(function(){
			$(location).attr('href',"/qnaboard/qbwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/qnaboard/qblist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".qbDetail").click(function(){
			var qbNo = $(this).parents("tr").attr("data-num");
			
			if($(this).attr("id") == 'Y'){
				
				//세션으로 ttno 넣기
				var ttNo = null;
				alert("시작ㅋ");
				if(ttNo != null){
					alert("선생님 번호가 있다 (비밀글도 비밀번호없이 조회)");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
					.submit();
				}else{
					alert("선생님 번호가 없다 (비밀번호 입력페이지)");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbPwcheckform.ssm")
					.submit();
				}
			}else{
				alert("N");
				$("#qbNo").val(qbNo);
				$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
				.submit();
			}
		});
		
		$(".pageNobut").click(function(){
			var pageNo = $(this).val();
			$("#pageNo").val(pageNo);
			alert(pageNo);
			$("#pageNoForm").attr('action',"/qnaboard/qblist.ssm")
			.submit();
		});
		
		var keyword2 = "<%=searchdata.getKeyword()%>";
		var search2 = "<%=searchdata.getSearch()%>";
		if(keyword2 != "null" && keyword2 != ""){ // 키워드 데이터가 있을때 실행
			$("#keyword").val(keyword2);
			$("#search").val(search2);
		}
		
		/* 선생번호가있으면 글쓰기버튼을 숨겨라 (세션)
		var ttno = "T7180001"; */
		if(ttno != "null" && ttno != ""){
			$("#qbinsertbutton").hide();
		}
	});	
	</script>
	
</head>
<body>
	<div id="boardContainer">
		<h1>Q&A 게시판</h1>
		
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
							<option value="qbTitle">제목</option>
							<option value="qbContents">내용</option>
							<option value="ssName">작성자</option>
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
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>답변상태</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(qblist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>작성된 글이 없습니다.</td>
						<td></td>
						<td></td>
					</tr>
					<%
					}else{
						int count = qblist.size();
						for (int i=0; i<count; i++){
							QnABoardVO qvo = qblist.get(i);
							String no = qvo.getQbNo().substring(4);
							String Secretyn = qvo.getQbSecretyn();
					%>	
						<tr data-num=<%=qvo.getQbNo() %>>
							<td><%=no %></td>
							
							<% 
							if(Secretyn.equals("N") ){//(ssno가 있을때 || ttno가 있때 
							%>
							<td style="text-align:left" id="N"><span class="qbDetail" id="N"><%=qvo.getQbTitle() %></span></td>
							<% 
							}else{
							%>
							<td style="text-align:left"><span class="qbDetail" id="Y">비밀글입니다.</span></td>
							
							<%
							}
							%>	
							<td><%=qvo.getQbInsertdate() %></td>
							<td><%=qvo.getsMembervo().getSsName() %></td>
							<td><%=qvo.getQaCount()%></td>
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
					<input type="hidden" name="search" value="<%=searchdata.getSearch()%>">
					<input type="hidden" name="keyword" value="<%=searchdata.getKeyword()%>">
					</form>
					<%
					}
					}
					%>
				</tbody>
			</table>
			<form id="qblistform" name="qblistform">
				<input type="button" id="insertbutton" name="insertbutton" value="글쓰기">
			</form>
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="qbdetailForm" id="qbdetailForm">
			<input type="hidden" name="qbNo" id="qbNo">
			</form>
		</div>
	</div>
	
</body>
</html>
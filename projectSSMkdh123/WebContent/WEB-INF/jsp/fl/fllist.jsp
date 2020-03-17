<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.FamilyLetterVO" %>    
<%@ page import="java.util.List" %>    
   
<%
	FamilyLetterVO searchdata =(FamilyLetterVO)request.getAttribute("Searchdata");
	int pageCount = 0;
	List<FamilyLetterVO> fllist =(List<FamilyLetterVO>)request.getAttribute("fllist");
	int listSize= fllist.size();
	if(listSize >0){
		FamilyLetterVO fvo_ = fllist.get(0);
		double totalCount = (double)Integer.parseInt(fvo_.getTotalCount()); 
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
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=1"></script>
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
		
		$(".pageNobut").click(function(){
			var pageNo = $(this).val();
			$("#pageNo").val(pageNo);
			alert(pageNo);
			$("#pageNoForm").attr('action',"/familyletter/fllist.ssm")
			.submit();
		});
		
		var keyword2 = "<%=searchdata.getKeyword()%>";
		var search2 = "<%=searchdata.getSearch()%>";
		if(keyword2 != "null" && keyword2 != ""){ // 키워드 데이터가 있을때 실행
			$("#keyword").val(keyword2);
			$("#search").val(search2);
		}
		
		/* 학생번호가있으면 글쓰기버튼을 숨겨라 (세션)
		var ssno = "S7180001"; */
		if(ssno != "null" && ssno != ""){
			$("#flinsertbutton").hide();
		}
		
	});
	</script>
	
	<style>
		html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 4px;
			}
			
			table  {
				width : 500px;
				text-align : center;
				margin : auto;
			}
			
			.list
			{
				width : 500px;
				text-align : left;
				margin : auto;
			}	
	</style>
	
</head>
<body>
<div id="wrap">
			<header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
			<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
			<section>
				<div class="container">
	<div id="boardContainer">
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
						for (int i=0; i<count; i++){
							FamilyLetterVO fvo = fllist.get(i);
							String no = fvo.getFlNo().substring(4);
					%>	
						<tr data-num=<%=fvo.getFlNo() %>>
							<td><%=no%> </td>
							<td><span class="flDetail"><%=fvo.getFlTitle() %></span></td>
							<td><%=fvo.getFlInsertdate() %></td>
							<td><%=fvo.gettMembervo().getTtName() %></td>
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
			<form id="fllistform" name="fllistform">
				<input type="button" id="insertbutton" name="insertbutton" value="글쓰기">
			</form>
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="fldetailForm" id="fldetailForm">
			<input type="hidden" name="flNo" id="flNo">
			</form>
		</div>
	</div>
	</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>	
	
</body>
</html>
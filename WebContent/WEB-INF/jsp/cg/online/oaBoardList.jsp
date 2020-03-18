<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "ssm.mi.vo.SMemberVO"%>
<% request.setCharacterEncoding("EUC-KR");
	
	String SessionID ="S7200004";
		Object dataObj = request.getAttribute("data");
		OnlineApplication_BoardVO oa_Vo = (OnlineApplication_BoardVO)dataObj;
		Object ssNo = request.getAttribute("ssNo");
		Object commentCnt = request.getAttribute("commentCnt");
		System.out.println(">>>>"+commentCnt);
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>랄랄</title>
	</head>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/index.js"></script>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<script>
		function oaInsertBtn(){
			location.href = "/onlineApplication/oaInsertForm.ssm";
		} 
		
		function oaListBtn(){
			location.href = "/onlineApplication/oaBoardList.ssm";
		}
		
		
		
		$(document).ready(function(){
			
			// 검색 변경에 대해
			<%
			if(oa_Vo.getKeyword() != "" && oa_Vo.getKeyword() != null){
			%>
				$("#keyword").val("<%=oa_Vo.getKeyword()%>");
				$("#search").val("<%=oa_Vo.getSearch()%>");
			<%
			}
			%>
			
			// 검색버튼 클릭
			$("#oaSearchBtn").click(function(){
				alert(">>");
				goPage(1);
			});
			
			// 제목 클릭 시 상세페이지로 이동
			$(".goDetail").click(function(){
				var oaNo = $(this).parents("tr").attr("dataNo");
				console.log("(log)no : " + oaNo);
				$("#oaNo") .val(oaNo);
				alert("(log)goDetail");
				$("#goDetailForm").attr({
					"method":"post",
					"action":"/onlineApplication/oaDetailForm.ssm"
				});	
				$("#goDetailForm").submit();
			});
		}); // ready()
		
		// 정렬버튼 클릭
		function setOrder(orderBy){
			$("#orderBy").val(orderBy);
			if($("#orderSc").val()=='DESC'){
				$("#orderSc").val('ASC');
				alert("최신글부터 조회합니다");
			} else {
				$("#orderSc").val('DESC');
				alert("오래된 글부터 조회합니다");
			}
			goPage(1);
		}
		
		// 검색과 페이징에 대한 실질적 처리함수
		function goPage(page){
			console.log("(log)goPage() >>>");
			$("#page").val(page);
			$("#oaSearchForm").attr({
				"method":"get",
				"action":"/onlineApplication/oaBoardList.ssm"
			});
			$("#oaSearchForm").submit();
		}
		
		// ajax polling
		var beforeData = 0;
		(function poll() {
			console.log(beforeData);
			var count = '1';
		    $.ajax({
		        url: "/onlineApplication/pollPush.ssm",
		        type: "post",
				dataType : "text",
				data : {count : count},
		        success: function(data) {
		        	
		        	console.log("폴링폴링");
		        	
		        	if(beforeData == 0){
		        		beforeData = data;
		        	} else {
		        		if(beforeData != data) {
		        			push();
		        			beforeData = data;
		        			console.log("controller에서 가져온 결과 : " + data);
		        			console.log("beforeData : " + beforeData);
		        			before = data;
			        	} else if(beforeData == data){
			        		console.log("이벤트업다");
		        			console.log("controller에서 가져온 결과 : " + data);
		        			console.log("beforeData : " + beforeData);
			        	}
		        	}
		        },
		        timeout: 3000,
	        	complete:setInterval(function() { poll(); }, 10000)
		    })
		})();
		
		
		// push
		function push(){
			
			 var message = "게시글에 답변이 달렸습니다.";
			 var notification = new Notification(message);
			 
			 setTimeout(function(){
				notification.close(); 
			 }, 3000);
			 
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
	<body>
		<div id="wrap">
			<header include-html="/common/ssmMain/header.html"></header>
			<nav include-html="/common/ssmMain/ssmCategory/nav.html"></nav>
			<section>
				<div class="container">
					<div class="list" id="boardTit"><h3>나의 온라인 상담 목록</h3></div>
					<form id="oaSearchForm" name="oaSearchForm">
						<input type="hidden" id="page" name="page" value=<%=oa_Vo.getPage()%> /> 
						<input type="hidden" id="orderBy" name="orderBy" value=<%=oa_Vo.getOrderBy()%> />
						<input type="hidden" id="orderSc" name="orderSc" value=<%=oa_Vo.getOrderSc()%> />
						<table>
							<colgroup>
								<col width="70%"/>
								<col width="30%"/>
							</colgroup>
							<tr>
								<td>
									<select id="search" name="search">
										<option value="oaTitle">제목</option>
										<option value="oaField">상담분야</option>
									</select>
									<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
									<input type="button" id="oaSearchBtn" name="oaSearchBtn" value="검색"/>
								</td>
							</tr>
						</table>
					</form>
					<div id="oaBoardList">
						<table>
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="30%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th><a href="javascript:setOrder('oaNo');">신청번호</a></th>
									<th>상담교사</th>
									<th>답변상태</th>
									<th>상담분야</th>
									<th>제목</th>
									<th>작성자</th>
									<th>신청일</th>
								</tr>
							</thead>
				<%
							Object obj = request.getAttribute("oaBoardList");
							ArrayList<OnlineApplication_BoardVO> aList = (ArrayList<OnlineApplication_BoardVO>)obj;
							if(aList != null){
								for(int i=0; i<aList.size(); i++){
									OnlineApplication_BoardVO oaVo = aList.get(i);
				%>
							<tbody>
								<tr align="center" dataNo = <%=oaVo.getOaNo() %>>
									<td><%=oaVo.getOaNo()%></td>
									<td><%=oaVo.getTmemberVO().getTtName()%></td>
									<td>답변<%=oaVo.getOaStatus() %></td>
									<td><%=oaVo.getOaField() %></td>
									<td class="goDetail"><%=oaVo.getOaTitle()%></td>
									<td><%=oaVo.getSmemberVO().getSsName() %></td>
									<td><%=oaVo.getOaInsertdate() %></td>
								</tr>
							</tbody>
							
				<%
									} // for
								} else {
				%>
									<tr><td>NO DATA</td></tr>
				<%
								} // if
				%>
						</table>
					</div>
					<div class="list" id="btn">
						<input type="button" onclick="oaInsertBtn()" value="상담신청"/>
						<input type="button" onclick="oaListBtn()" value="목록"/>
					</div>
					<form id="goDetailForm" name="goDetailForm">
						<input type="hidden" id="ssNo" name="ssNo" value="<%=SessionID%>" /> 
						<input type="hidden" id="oaNo" name="oaNo"/>
					</form>
					<!-- // div_container -->
					<div class="list" id="oaPaging">
						<%@include file="../visit/paging.jsp" %>
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
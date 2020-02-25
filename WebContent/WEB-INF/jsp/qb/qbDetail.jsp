<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>글 상세 보기</title>
 	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		var butChk =0; //수정버튼과 삭제버튼을 구별하기 위한 변수
		$(function(){
			$("#pwdChk").hide();
			
			
			/*수정 버튼 클릭시 처리 이벤트*/
			$("#updateForm").click(function(){
				$("#pwdChk").show();
				$("#msg").text("작성시 입력한 비빌번호를 입력해 주세요").css("color","#000099");
				butChk=1;
			});
			
			$("#cancelBut").click(function(){
				$("#pwdChk").hide();
			});
			
			/*삭제 버튼 클릭시 처리 이벤트*/
			$("#boardDelete").click(function(){
				$("#pwdChk").show();
				$("#msg").text("작성시 입력한 비빌번호를 입력해 주세요").css("color","#000099");
				butChk=2;
			});
			

			/* 비밀번호 확인 버튼 클릭 시 처리 이벤트*/
			$("#pwdBut").click(function(){
				pwdConfirm();
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardList").click(function(){
				location.href="/qnaboard/qblist.ssm";
			});
			
		});//end of 펑션
		
		/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수*/
		
		function pwdConfirm(){
			
				$.ajax({
					url:"/qnaboard/pwdConfirm.ssm",
					type:"POST",
					data:$("#pwcheckform").serialize(),
					error:function(){
						alert('시스템 오류입니다 관리자에게 문의하세요');
					},
					success:function(resultData){
						var goUrl="";
						if(resultData ==0){
							$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
						}else if(resultData ==1){ //일치할 경우
							$("#msg").text("");
							if(butChk==1){
								goUrl="/qnaboard/qbupdateForm.ssm";
							}else if(butChk==2){
								goUrl="/qnaboard/qbDelete.ssm";
							}
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}
					}
				});	
				
		
		}	
	</script>
</head>
<body>
	<%
	QnABoardVO qvo =(QnABoardVO)request.getAttribute("qbdetail");
	%>
	<h3>글상세</h3>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="qbNo" name="qbNo" value="<%=qvo.getQbNo() %>" />
	</form>
	
	<%-- ========================비밀번호 확인 버튼 및 버튼 추가 종료 ================================ --%>
	
	<%-- ======================상세 정보 보여주기 시작 ========================================== --%>
	<div id="boardDetail">
		<table border="1">
			<colgroup>
				<col width="100px" />
				<col width="200px" />
				<col width="250px" />
				<col width="250px" />
				</colgroup>
			<tbody>
				<tr>
					<td>작성자</td>
					<td><%=qvo.getsMembervo().getSsName() %></td>
					<td>작성일:<%=qvo.getQbInsertdate() %></td>
					<td>수정일:<%=qvo.getQbUpdatedate() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=qvo.getQbTitle() %></td>
					<td colspan="2">비밀글설정 <%=qvo.getQbSecretyn() %></td>
				</tr>
				<tr height="300px">
					<td>내용</td>
					<td colspan="3" ><%=qvo.getQbContents() %></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- ======================상세 정보 보여주기 종료 ========================================== --%>
	
	<%--===============================비밀번호 확인 버튼 및 버튼 추가 시작======================== --%>
	<table id="boardPwdBut">
		<tr>
			<td>
				<div id="pwdChk">
					<form name="pwcheckform" id="pwcheckform">
						<label for="sspw" id="l_pwd">비밀번호 : </label>
						<input type="password" name="qbPw" id="qbPw" />
						<input type="hidden" name="qbNo" id="qbNo" value="<%=qvo.getQbNo() %>"/>
						<input type="button" name="pwdBut" id="pwdBut" value="확인" />
						<input type="button" name="cancelBut" id="cancelBut" value="취소" />
						
						<span id="msg"></span>
					</form>
				</div>
			</td>
			<td>
				<input type="button" value="수정" id="updateForm">
				<input type="button" value="삭제" id="boardDelete">
				<input type="button" value="목록" id="boardList">
			</td>
		</tr>
	</table>
	
		<jsp:include page="qnaanswer.jsp"></jsp:include>
</body>
</html>
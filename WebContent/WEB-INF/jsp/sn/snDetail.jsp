<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.SchedulNoticeVO" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
				location.href="/schedulnotice/snlist.ssm";
			});
			
		});//end of 펑션
		
		/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수*/
		
		function pwdConfirm(){
			
				$.ajax({
					url:"/schedulnotice/pwdConfirm.ssm",
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
								goUrl="/schedulnotice/snupdateForm.ssm";
								window.open("","pop1","width=600,height=450");
								$("#f_data").attr("action",goUrl);
								$("#f_data").attr("target","pop1");
								$("#f_data").submit();
							}else if(butChk==2){
								goUrl="/schedulnotice/snDelete.ssm";
								$("#f_data").attr("action",goUrl);
								$("#f_data").submit();
							}
						}
					}
				});	
				
		
		}	
	</script>
</head>
<body>
	<%
	SchedulNoticeVO svo =(SchedulNoticeVO)request.getAttribute("sndetail");
	%>
	<h3>글상세</h3>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="snNo" name="snNo" value="<%=svo.getSnNo() %>" />
	</form>
	
	<%-- ========================비밀번호 확인 버튼 및 버튼 추가 종료 ================================ --%>
	
	<%-- ======================상세 정보 보여주기 시작 ========================================== --%>
	<div id="boardDetail">
		<table border="1">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="300px" />
				<col width="300px" />
				</colgroup>
			<tbody>
				<tr>
					<td>작성자</td>
					<td><%=svo.gettMembervo().getTtName() %></td>
					<td>작성일:<%=svo.getSnInsertdate() %></td>
					<td>수정일:<%=svo.getSnUpdatedate() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=svo.getSnTitle() %></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td colspan="3"><%=svo.getSnDate() %></td>
				</tr>
				<tr height="300px">
					<td>내용</td>
					<td colspan="3" ><%=svo.getSnContents() %></td>
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
						<label for="ttpw" id="l_pwd">비밀번호 : </label>
						<input type="password" name="ttPw" id="ttPw" />
						<input type="hidden" name="snNo" id="snNo" value="<%=svo.getSnNo()%>"/>
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
</body>
</html>
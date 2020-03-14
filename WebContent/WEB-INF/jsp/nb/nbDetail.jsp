<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>    
    
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
			$("#updatebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("비밀번호를 입력하세요").css("color","#000099");
				butChk=1;
			});
			
			$("#cancelBut").click(function(){
				$("#pwdChk").hide();
				$("#buttons").show();
			});
			
			/*삭제 버튼 클릭시 처리 이벤트*/
			$("#deletebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("비밀번호를 입력하세요").css("color","#000099");
				butChk=2;
			});
			

			/* 비밀번호 확인 버튼 클릭 시 처리 이벤트*/
			$("#pwdBut").click(function(){
				pwdConfirm();
			});
			
		});//end of 펑션
		
		/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수*/
		
		function pwdConfirm(){
			
				$.ajax({
					url:"/noticeboard/pwdConfirm.ssm",
					type:"POST",
					data:$("#pwcheckform").serialize(),
					error:function(){
						alert('시스템 오류입니다 관리자에게 문의하세요');
					},
					success:function(resultData){
						var goUrl="";
						if(resultData ==0){
							$("#msg").text("비밀번호가 일치하지 않습니다.").css("color","red");
						}else if(resultData ==1){ //일치할 경우
							$("#msg").text("");
							if(butChk==1){
								goUrl="/noticeboard/nbupdateForm.ssm";
							}else if(butChk==2){
								goUrl="/noticeboard/nbDelete.ssm";
							}
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}
					}
				});	
				
		
		}
		
		/* 학생번호가있으면 수정, 삭제버튼을 숨겨라 (세션)
		var ssno = "S7180001"; */
		if(ssno != "null" && ssno != ""){
			$("#buttons").hide();
		}
	</script>
</head>
<body>
	<%
	NoticeBoardVO nvo =(NoticeBoardVO)request.getAttribute("nbdetail");
	String NbFile=nvo.getNbFile();
	NbFile = NbFile.substring(10);
	%>
	<h3>글상세</h3>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="nbNo" name="nbNo" value="<%=nvo.getNbNo() %>" />
		<input type="hidden" name="nbfile" value="<%=nvo.getNbFile() %>" />
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
					<td><%=nvo.gettMembervo().getTtName() %></td>
					<td>작성일:<%=nvo.getNbInsertdate() %></td>
					<td>수정일:<%=nvo.getNbUpdatedate() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=nvo.getNbTitle() %></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3">
					<%
					if(NbFile.equals("null")){
					%>
					첨부파일 없습니다.</td>
					<%
					}else{
					%>
					<p><%=NbFile%>&nbsp;&nbsp;&nbsp;<a href="/noticeboard/nbDownload.ssm?filename=<%=NbFile%>">다운로드</a></p></td>
					<%	
					}
					%>
				</tr>
				<tr height="300px">
					<td>내용</td>
					<td colspan="3" ><%=nvo.getNbContents() %></td>
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
						<input type="hidden" name="nbNo" id="nbNo" value="<%=nvo.getNbNo()%>"/>
						<input type="button" name="pwdBut" id="pwdBut" value="확인" />
						<input type="button" name="cancelBut" id="cancelBut" value="취소" />
						
						<span id="msg"></span>
					</form>
				</div>
			</td>
			<td>
				<div id ="buttons">
					<input type="button" value="수정" id="updatebutton">
					<input type="button" value="삭제" id="deletebutton">
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
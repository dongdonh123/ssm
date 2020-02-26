<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="ssm.cm.vo.QnABoardVO" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>qnaanswer(답글페이지)</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  		<script type="text/javascript">
  		<%
  		QnABoardVO qvo =(QnABoardVO)request.getAttribute("qbdetail");
  		String qbNo=qvo.getQbNo();
  		%>
  		
  		
  		$(function(){
  				//기본 댓글 목록 불러오기
  				var qbNo = "<%=qvo.getQbNo()%>";
  				listAll(qbNo); // 댓글 리스트 요청함수
  				
  				$('#qnaanswerContainer').hide();
 
  				if(true){//교사세션이 있으면 
  					$('#qnaanswerContainer').show();
  				}
  				
  				// 댓글 내용 저장 이벤트
  				$('#qaInsert').click(function(){
  					alert("버튼이 눌린다!");
					var insertUrl = "/qnaanswer/qaInsert.ssm";
					//글 저장을 위한 POST 방식의 Ajax 연동 처리
					$.ajax({
						url : insertUrl, // 전송 URL
						type : "post",
						headers : {
								"Content-Type":"application/json",
								"X-HTTP-Method-Override":"POST"},
						dataType : "text",
						data : JSON.stringify({
							qbNo : qbNo,
							ttNo : $("#ttNo").val(),
							qaContents : $("#qaContents").val()
						}),
						success : function(resultData){
							if(resultData == "SUCCESS"){
								alert("댓글이 등록되었습니다!");
								dataReset(); // input 태그들에 대한 초기화 함수
								listAll(qbNo); // 리스트 요청 함수
							}
						},
						error : function(){
							alert("시스템 오류! ");
						}
						
						
					});
  					
  					
  				});
  				
  				
  				// 수정버튼 클릭시 수정폼 출력
  				$(document).on("click",".update_form",function(){
  					$(".reset_btn").click();
  					var conText = $(this).parents("li").children().eq(1).html();
  					console.log("conText >>> : "+conText);
  					$(this).parents("li").find("input[type='button']").hide();
  					$(this).parents("li").children().eq(0).html();
  					var conArea = $(this).parents("li").children().eq(1);
  					
  					conArea.html("");
  					var data = "<textarea name='content' id='content'>"+conText+"</textarea>";//텍스트박스생성
  					data += "<input type='button' class='update_btn' value='수정완료'>";//수정버튼생성
  					data += "<input type='button' class='reset_btn' value='수정취소'>";//수정취소버튼생성
  					conArea.html(data);
  				});
  				
  				
  				//초기화 버튼
  				$(document).on("click",".reset_btn",function(){//수정취소누를때
  					var conText = $(this).parents("li").find("textarea").html();
  					$(this).parents("li").find("input[type=button]").show();
  					var conArea = $(this).parents("li").children().eq(1);
  					conArea.html(conText);
  				});
  				
  				
  				//글 수정을 위한 Ajax 연동 처리
  				$(document).on("click",".update_btn",function(){//수정완료 누를때
  					alert("버튼이 눌리니 안눌리니");
  					var qaNo = $(this).parents("li").attr("data-num");
  					var qaContents = $("#content").val();
  					
						$.ajax({
							url : "/qnaanswer/"+qaNo+".ssm",
							type : 'put',
							headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override":"PUT"},
							data : JSON.stringify({
								qaContents:qaContents}),
							dataType : "text",
							success : function(result){
								console.log("result >>> : "+result);
								if(result == "SUCCESS"){
									alert("수정완료!");
									listAll(qbNo);
								}
							},
							error : function(){
								alert("error");
							}
						})
  					
  				});
  				
  				
  				// 글 삭제를 위한 Ajax 연동 처리
  				$(document).on("click",".delete_btn",function(){
  					alert("버튼이 눌리니 안눌리니");
  					var qaNo = $(this).parents("li").attr("data-num");
  					console.log("qaNo >>> : "+qaNo);
  					
  					if(confirm("선택하신 댓글을 삭제 하시겠습니까?")){
  						$.ajax({
  							type : "patch",
  							url : "/qnaanswer/delete/"+qaNo+".ssm",
  							headers : {
  								"Content-Type" : "application/json",
  								"X-HTTP-Method-Override" : "PATCH"
  							},
  							dataType : "text",
  							success : function(result){
  								console.log("result >>> : "+result);
  								if(result == "SUCCESS"){
  									alert("삭제완료!");
  									listAll(qbNo);
  								}
  							},
  							error : function(){
  								alert("error");
  							}
  						});
  					}
  					
  				});
  				
  			});
  		
  			function listAll(qbNo){
  				$("#comment_list").html("");
  				var url = "/qnaanswer/all/"+qbNo+".ssm";
  				$.getJSON(url,function(data){
  					console.log(data.length);
  					
  					$(data).each(function(){
  						var qaNo = this.qaNo;
  						var ttNo = this.ttNo;
  						var qaContents = this.qaContents;
  						var qaInsertdate = this.qaInsertdate;
  						var qaUpdatedate = this.qaUpdatedate;
  						addNewItem(qaNo,ttNo,qaContents,qaInsertdate,qaUpdatedate);
  					});
  				}).fail(function(){
  					alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도 해주세요!.");
  				});
  			}
  			
  			// 새로운 글을 화면에 추가하기 위한 함수
  			function addNewItem(qaNo,ttNo,qaContents,qaInsertdate,qaUpdatedate){
  				
  				// 새로운 글이 추가될 li태그 객체
  				var new_li = $("<li>");
  				new_li.attr("data-num",qaNo);
  				new_li.addClass("comment_item");
  				
  				// 작성자 정보가 지정될 <p>태그
  				var writer_p = $("<p>");
  				writer_p.addClass("writer");
  				
  				// 작성자의 이름
  				var name_span = $("<span>");
  				name_span.addClass("name");
  				name_span.html(ttNo+"님");
  				
  				//작성일시, 수정일시
  				var date_span = $("<span>");
  				date_span.html("/"+qaInsertdate+" "+"/"+qaUpdatedate);
  				
  				// 수정하기 버튼
  				var up_input = $("<input>");
  				up_input.attr({"type":"button","value":"수정하기"});
  				up_input.addClass("update_form");
  				
  				//삭제하기 버튼
  				var del_input = $("<input>");
  				del_input.attr({"type":"button","value":"삭제하기"});
  				del_input.addClass("delete_btn");
  				

  				//내용
  				var content_p = $("<p>");
  				content_p.addClass("con");
  				content_p.html(qaContents);
  				
  				//조립하기
  				writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
  				new_li.append(writer_p).append(content_p);
  				$("#comment_list").append(new_li);
  			}
  			
  			// INPUT 태그들에 대한 초기화 함수
  			function dataReset(){
  				$("#ttNo").val("");
  				$("#qaContents").val("");
  				
  			}
  			
  		</script>
	</head>
	<body>
		<div id="qnaanswerContainer" >
			<h1></h1>
			<div id="qnawrite">
				<form id="qnaform" name="qnaform">
					<div>
						<label for="ttNo">작성자</label>
						<input type="text" name="ttNo" id="ttNo">
						<input type="button" id="qaInsert" value="저장하기">
					</div>
					<div>
						<label for="qaContents">내용</label>
						<textarea name="qaContents" id="qaContents"></textarea>
					</div>
				</form>
			</div>
			<ul id="comment_list">
				<!-- 여기에 동적 생성 요소가 들어가게 됩니당. -->
			</ul>
		</div>
	</body>
</html>
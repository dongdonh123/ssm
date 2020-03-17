<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "ssm.cg.vo.Online_CommentVO"%>
<% 
request.setCharacterEncoding("EUC-KR");
String sessionNO= "T8180001";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<title>Comment</title>
		<script type="text/javascript">
	 	$(document).ready(function(){	 					
		    getCommentList();
		    $("#commentInsertForm").hide();
		   
		});//ready
		
		/**
		 * 답변 불러오기(Ajax)
		 */
		function getCommentList(){
		    
		    $.ajax({
		        type:'POST',
		        url : "/oaComment/commentList.ssm",
		        dataType : "json",
		        data:$("#commentForm").serialize(),
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		        success : function(data){
		            
		            var html = "";
		            var cCnt = data.length;

		            //alert(data);
		            //alert(cCnt);
		            //alert (data[0]);
		            if(cCnt !=null && cCnt> 0){
		            	 //alert("성공댓글불러와");
		                for(i=0; i<data.length; i++){
		                	
		                	var ocNo = data[i].ocNo;
				            var ttNo = data[i].ttNo;
				            var oaStatus = data[i].oaStatus;
							var ocTitle =data[i].ocTitle;
							var ocContents =data[i].ocContents;
							var ocInsertdate = data[i].ocInsertdate;
							console.log(ttNo);
							
		                    html += "<br><br>";
		                    html += "<div><table data-num='"+data[i].ocNo+"'class='table' border='1' width : 1000px><thead><tr><td colspan='2'><h6><strong>"+data[i].ttNo +"선생님";
		                    html += "<input type='button' id='ocStatus' name='ocStatus' value='상담"+data[i].oaStatus+"' disabled> 답변건수 :  "+cCnt+"건 </strong></h6></tr></thead>";
		                    html += "<tbody><tr id='title'><td width='20%'>제목 : </td><td>"+data[i].ocTitle +"</td></tr>"
		                    		+ "<tr id='context' width='20%' height='200px'><td >답변 : </td><td>"+data[i].ocContents +"</td></tr>";
		                   
		                    html += "<tr id='button1' style='display: none;'><td colspan='2'><input type='button' class='update_form'  value='수정하기'>";
		                    html += "<input type='button'  class='delete_btn'  value='삭제하기'></td></tr>";
		                    html += "<tr id='button2' style='display: none;'><td colspan='2'><input type='button' class='update_btn'  value='수정완료'>";
		                    html += "<input type='button' class='reset_btn'  value='수정취소'></td></tr><tbody>";
		                    html += "</table></div>";
		                   // $("#button2").hide();
		                   // $("#button1").hide();

		                  
		                }
		                
		            } else {
		               // alert("didididididi");
		                html += "<div id='waiting'>";
		                html += "<div onclick='goCommentForm()'><input type='button' id='goCommentForm' name='goCommentForm' value='답변하기'></div>";
		                html += "<div><table class='table'><p><strong>상담사의 답변을 기다리는 중입니다.</strong></p>";     
		                html += "</table></div>";               
		                html += "</div>";
		                
		            }
		            
		            $("#cCnt").html(cCnt);
		            $("#commentList").html(html);
		            getCommentAu();
		        },
		        error:function(request,status,error){
		        	 alert("에러닷");
		       }
		        
		    });
		    
		   
		}//getCommentList
		/**
		 * 초기 페이지 로딩시 댓글 불러오기
		 */

		function goCommentForm(){
			var insertTtNo= "<%=oaVo.getTtNo()%>";
			var sessionNo ="<%=sessionNO%>";
			
			alert(insertTtNo+" : "+sessionNo);
			if(insertTtNo==sessionNo){
			$("#waiting").hide();
			$("#commentInsertForm").show();
			}else{
				alert("상담답변 권한이 없습니다");
			}
		}//goCommentForm

		/*덧글 내용 저장이벤트*/
		$(document).on("click", ".commentInsert", function(){
			
			var sessionNo ="<%=sessionNO%>"; 	
			var oaNo = "<%=oaVo.getOaNo()%>"; 	
			// commentForm
			var form = $("#commentForm")[0];
			var formData = new FormData(form);
			// form에 ttNo(SESSION)/oaNo 추가 
			formData.append("ttNo",sessionNo);
			formData.append("oaNo",oaNo);
			
			$.ajax({
				url : "/oaComment/commentInsert.ssm",
				type : "post",
				contentType : false,
				processData : false,
				data : formData,
				success : function(resultData){
					if(resultData == "SUCCESS"){
						alert("댓글저장");
						getCommentList();
						$("#commentInsertForm").hide();
					}
				},
				error : function(){
					alert("에러");
				}
			}); // ajax
		}); // replyInsert
		
		/**수정버튼 클릭시 수정폼 출력**/
		$(document).on("click",".update_form",function(){
			$(".reset_btn").click();
			var conTitle = $(this).parents("tbody").children().eq(0).find('td:eq(1)').text();//제목 입력칸된 값
			var conText = $(this).parents("tbody").children().eq(1).find('td:eq(1)').text();//내용 입력칸된 값
			console.log("conTitle: " +conTitle);
			
			$("#button1").hide();
			$("#button2").show();
			
			
			$(this).parents("tbody").children().eq(0).find('td:eq(1)').html();
			var conArea = $(this).parents("tbody").children().eq(0).find('td:eq(1)');
			$(this).parents("tbody").children().eq(1).find('td:eq(1)').html();
			var conArea1 = $(this).parents("tbody").children().eq(1).find('td:eq(1)');
		
			conArea.html("");
			conArea1.html("");
			var data = "<textarea name='up_title' id='up_title' cols='100'>" +conTitle+ "</textarea>";
			var data1 = "<textarea name='up_content' id='up_content' cols='100' rows='20'>" +conText+ "</textarea>";
			conArea.html(data);
			conArea1.html(data1);			
		});//update_form
		
		//수정취소버튼
		$(document).on("click",".reset_btn",function(){
			var conTitle = $(this).parents("tbody").children().eq(0).find("textarea").html();
			var conText = $(this).parents("tbody").children().eq(1).find("textarea").html();
			var conArea = $(this).parents("tbody").children().eq(0).find('td:eq(1)');
			var conArea1 = $(this).parents("tbody").children().eq(1).find('td:eq(1)');
			$("#button1").show();
			$("#button2").hide();
			conArea.html(conTitle);
			conArea1.html(conText);
		});//reset
		
		/**글 수정을 위한 Ajax 연동처리**/
		$(document).on("click", ".update_btn", function(){
			
			var ocNo= $(this).parents("table").attr("data-num");
			var ocTitle = $("#up_title").val();
			var ocContents = $("#up_content").val();
			alert(ocNo);
			console.log("ocTitle>>> : "+ocTitle);
			console.log("ocContents>>> : "+ocContents);

				$.ajax({
							url:'/oaComment/'+ocNo+".ssm",
							type:'put',
							headers: {
								"Content-Type":"application/json",
									"X-HTTP-Method-Override":"PUT"},
							data:JSON.stringify({
								ocTitle:ocTitle,
								ocContents: ocContents							
							}),
							dataType:'text',
							success:function(result){
								console.log("result:" +result);
								if(result == 'SUCCESS'){
									alert("수정완료!!!");
									getCommentList();
								}//if
							}//success
				});//ajax
		});//update_btn
		
		/**글 삭제를 위한 Ajax 연동처리**/
		$(document).on("click",".delete_btn",function(){
			var ocNo= $(this).parents("table").attr("data-num");
			
			if(confirm("선택한 댓글을 삭제하시겠습니까?")){
				$.ajax({
						type : 'delete',
						url:'/oaComment/'+ocNo+'.ssm',
						headers: {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : 'text',
						success : function(result){
							console.log("result" +result);
							if(result == 'SUCCESS'){
								alert("삭제완료!!!!");
								getCommentList();
							}//if
						}//success
				});//ajax
			}//if				
		});//delete_btn
		function getCommentAu(){
			var insertTtNo= "<%=oaVo.getTtNo()%>";
			var sessionNo ="<%=sessionNO%>";
			
			//alert(insertTtNo+" : "+sessionNo);

			if(insertTtNo==sessionNo){
				$("#button1").show();
			}else{
				$("#button1").hide();
			}
		}
	</script>
	<style>
	
	li { list-style: none } <!-- 혹은 ul(li 상위 테그일 경우) 점없애기 -->
	
	</style>
</head>
<body>
<div class="container" id="commentInsertForm">
    <form id="commentForm" name="commentForm" method="post">
    <input type="hidden" name="oaNo" id="oaNo" value="<%=oaVo.getOaNo()%>"/>
    <br><br>
        <div>
           <table class="table" border="1" width="100%">   
				<thead>
					<tr>
						<td colspan='2'><h6><strong>
						 <span><strong>답변입력창</strong></span> 현재 답변수 : <span id="cCnt">건</span>
						</td>
					</tr>
				</thead>	
				<tbody>
	                <tr>
	                <td>제목</td>
	                <td><input style="width: 90%" type="text" id="ocTitle" name="ocTitle" placeholder="제목을입력하시오"/></td>
	                </tr>                 
                    <tr>
                        <td  height="200px">내용</td>
                         <td><textarea style="width: 90%" rows="20" cols="20" id="ocContents" name="ocContents" placeholder="내용을 입력하세요"></textarea></td>
                    <br>
					<tr>
						<td colspan="2">
                            <div>
                               <input type="button" id="commentInsert" class="commentInsert" value="답변입력" />
                            </div>
                        </tr>
                    </tr>
                    <tr>
                    	<td colspan="2">
                    		<input type="file" id="ocFile" name="ocFile" />
                    	</td>
                    </tr>
				</tbody>
			</table>
        </div>     
    </form>
</div>

<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
	<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다 -->
		</ul>
 
</body>
</html>

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
		 * �亯 �ҷ�����(Ajax)
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
		            	 //alert("������ۺҷ���");
		                for(i=0; i<data.length; i++){
		                	
		                	var ocNo = data[i].ocNo;
				            var ttNo = data[i].ttNo;
				            var oaStatus = data[i].oaStatus;
							var ocTitle =data[i].ocTitle;
							var ocContents =data[i].ocContents;
							var ocInsertdate = data[i].ocInsertdate;
							console.log(ttNo);
							
		                    html += "<br><br>";
		                    html += "<div><table data-num='"+data[i].ocNo+"'class='table' border='1' width : 1000px><thead><tr><td colspan='2'><h6><strong>"+data[i].ttNo +"������";
		                    html += "<input type='button' id='ocStatus' name='ocStatus' value='���"+data[i].oaStatus+"' disabled> �亯�Ǽ� :  "+cCnt+"�� </strong></h6></tr></thead>";
		                    html += "<tbody><tr id='title'><td width='20%'>���� : </td><td>"+data[i].ocTitle +"</td></tr>"
		                    		+ "<tr id='context' width='20%' height='200px'><td >�亯 : </td><td>"+data[i].ocContents +"</td></tr>";
		                   
		                    html += "<tr id='button1' style='display: none;'><td colspan='2'><input type='button' class='update_form'  value='�����ϱ�'>";
		                    html += "<input type='button'  class='delete_btn'  value='�����ϱ�'></td></tr>";
		                    html += "<tr id='button2' style='display: none;'><td colspan='2'><input type='button' class='update_btn'  value='�����Ϸ�'>";
		                    html += "<input type='button' class='reset_btn'  value='�������'></td></tr><tbody>";
		                    html += "</table></div>";
		                   // $("#button2").hide();
		                   // $("#button1").hide();

		                  
		                }
		                
		            } else {
		               // alert("didididididi");
		                html += "<div id='waiting'>";
		                html += "<div onclick='goCommentForm()'><input type='button' id='goCommentForm' name='goCommentForm' value='�亯�ϱ�'></div>";
		                html += "<div><table class='table'><p><strong>������ �亯�� ��ٸ��� ���Դϴ�.</strong></p>";     
		                html += "</table></div>";               
		                html += "</div>";
		                
		            }
		            
		            $("#cCnt").html(cCnt);
		            $("#commentList").html(html);
		            getCommentAu();
		        },
		        error:function(request,status,error){
		        	 alert("������");
		       }
		        
		    });
		    
		   
		}//getCommentList
		/**
		 * �ʱ� ������ �ε��� ��� �ҷ�����
		 */

		function goCommentForm(){
			var insertTtNo= "<%=oaVo.getTtNo()%>";
			var sessionNo ="<%=sessionNO%>";
			
			alert(insertTtNo+" : "+sessionNo);
			if(insertTtNo==sessionNo){
			$("#waiting").hide();
			$("#commentInsertForm").show();
			}else{
				alert("���亯 ������ �����ϴ�");
			}
		}//goCommentForm

		/*���� ���� �����̺�Ʈ*/
		$(document).on("click", ".commentInsert", function(){
			
			var sessionNo ="<%=sessionNO%>"; 	
			var oaNo = "<%=oaVo.getOaNo()%>"; 	
			// commentForm
			var form = $("#commentForm")[0];
			var formData = new FormData(form);
			// form�� ttNo(SESSION)/oaNo �߰� 
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
						alert("�������");
						getCommentList();
						$("#commentInsertForm").hide();
					}
				},
				error : function(){
					alert("����");
				}
			}); // ajax
		}); // replyInsert
		
		/**������ư Ŭ���� ������ ���**/
		$(document).on("click",".update_form",function(){
			$(".reset_btn").click();
			var conTitle = $(this).parents("tbody").children().eq(0).find('td:eq(1)').text();//���� �Է�ĭ�� ��
			var conText = $(this).parents("tbody").children().eq(1).find('td:eq(1)').text();//���� �Է�ĭ�� ��
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
		
		//������ҹ�ư
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
		
		/**�� ������ ���� Ajax ����ó��**/
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
									alert("�����Ϸ�!!!");
									getCommentList();
								}//if
							}//success
				});//ajax
		});//update_btn
		
		/**�� ������ ���� Ajax ����ó��**/
		$(document).on("click",".delete_btn",function(){
			var ocNo= $(this).parents("table").attr("data-num");
			
			if(confirm("������ ����� �����Ͻðڽ��ϱ�?")){
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
								alert("�����Ϸ�!!!!");
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
	
	li { list-style: none } <!-- Ȥ�� ul(li ���� �ױ��� ���) �����ֱ� -->
	
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
						 <span><strong>�亯�Է�â</strong></span> ���� �亯�� : <span id="cCnt">��</span>
						</td>
					</tr>
				</thead>	
				<tbody>
	                <tr>
	                <td>����</td>
	                <td><input style="width: 90%" type="text" id="ocTitle" name="ocTitle" placeholder="�������Է��Ͻÿ�"/></td>
	                </tr>                 
                    <tr>
                        <td  height="200px">����</td>
                         <td><textarea style="width: 90%" rows="20" cols="20" id="ocContents" name="ocContents" placeholder="������ �Է��ϼ���"></textarea></td>
                    <br>
					<tr>
						<td colspan="2">
                            <div>
                               <input type="button" id="commentInsert" class="commentInsert" value="�亯�Է�" />
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
			<!-- ���⿡ ���� ���� ��Ұ� ���� �˴ϴ� -->
		</ul>
 
</body>
</html>
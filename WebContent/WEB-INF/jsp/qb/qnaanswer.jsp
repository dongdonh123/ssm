<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ page import="ssm.cm.vo.QnABoardVO" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>qnaanswer(���������)</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  		<script type="text/javascript">
  		<%
  		QnABoardVO qvo =(QnABoardVO)request.getAttribute("qbdetail");
  		String qbNo=qvo.getQbNo();
  		%>
  		
  		
  		$(function(){
  				//�⺻ ��� ��� �ҷ�����
  				var qbNo = <%=qbNo%>;
  				listAll(qbNo); // ��� ����Ʈ ��û�Լ�
  				
  				// ��� ���� ���� �̺�Ʈ
  				$('#qaInsert').click(function(){
  					alert("��ư�� ������!");
					var insertUrl = "/qnaanswer/qaInsert.ssm";
					//�� ������ ���� POST ����� Ajax ���� ó��
					$.ajax({
						url : insertUrl, // ���� URL
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
								alert("����� ��ϵǾ����ϴ�!");
								dataReset(); // input �±׵鿡 ���� �ʱ�ȭ �Լ�
								listAll(qbNo); // ����Ʈ ��û �Լ�
							}
						},
						error : function(){
							alert("�ý��� ����! ");
						}
						
						
					});
  					
  					
  				});
  				
  				
  				// ������ư Ŭ���� ������ ���
  				$(document).on("click",".update_form",function(){
  					$(".reset_btn").click();
  					var conText = $(this).parents("li").children().eq(1).html();
  					console.log("conText >>> : "+conText);
  					$(this).parents("li").find("input[type='button']").hide();
  					$(this).parents("li").children().eq(0).html();
  					var conArea = $(this).parents("li").children().eq(1);
  					
  					conArea.html("");
  					var data = "<textarea name='content' id='content'>"+conText+"</textarea>";//�ؽ�Ʈ�ڽ�����
  					data += "<input type='button' class='update_btn' value='�����Ϸ�'>";//������ư����
  					data += "<input type='button' class='reset_btn' value='�������'>";//������ҹ�ư����
  					conArea.html(data);
  				});
  				
  				
  				//�ʱ�ȭ ��ư
  				$(document).on("click",".reset_btn",function(){//������Ҵ�����
  					var conText = $(this).parents("li").find("textarea").html();
  					$(this).parents("li").find("input[type=button]").show();
  					var conArea = $(this).parents("li").children().eq(1);
  					conArea.html(conText);
  				});
  				
  				
  				//�� ������ ���� Ajax ���� ó��
  				$(document).on("click",".update_btn",function(){//�����Ϸ� ������
  					alert("��ư�� ������ �ȴ�����");
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
									alert("�����Ϸ�!");
									listAll(qbNo);
								}
							},
							error : function(){
								alert("error");
							}
						})
  					
  				});
  				
  				
  				// �� ������ ���� Ajax ���� ó��
  				$(document).on("click",".delete_btn",function(){
  					alert("��ư�� ������ �ȴ�����");
  					var qaNo = $(this).parents("li").attr("data-num");
  					console.log("qaNo >>> : "+qaNo);
  					
  					if(confirm("�����Ͻ� ����� ���� �Ͻðڽ��ϱ�?")){
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
  									alert("�����Ϸ�!");
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
  					alert("��� ����� �ҷ����µ� �����Ͽ����ϴ�. ����Ŀ� �ٽ� �õ� ���ּ���!.");
  				});
  			}
  			
  			// ���ο� ���� ȭ�鿡 �߰��ϱ� ���� �Լ�
  			function addNewItem(qaNo,ttNo,qaContents,qaInsertdate,qaUpdatedate){
  				
  				// ���ο� ���� �߰��� li�±� ��ü
  				var new_li = $("<li>");
  				new_li.attr("data-num",qaNo);
  				new_li.addClass("comment_item");
  				
  				// �ۼ��� ������ ������ <p>�±�
  				var writer_p = $("<p>");
  				writer_p.addClass("writer");
  				
  				// �ۼ����� �̸�
  				var name_span = $("<span>");
  				name_span.addClass("name");
  				name_span.html(ttNo+"��");
  				
  				//�ۼ��Ͻ�, �����Ͻ�
  				var date_span = $("<span>");
  				date_span.html("/"+qaInsertdate+" "+"/"+qaUpdatedate);
  				
  				// �����ϱ� ��ư
  				var up_input = $("<input>");
  				up_input.attr({"type":"button","value":"�����ϱ�"});
  				up_input.addClass("update_form");
  				
  				//�����ϱ� ��ư
  				var del_input = $("<input>");
  				del_input.attr({"type":"button","value":"�����ϱ�"});
  				del_input.addClass("delete_btn");
  				

  				//����
  				var content_p = $("<p>");
  				content_p.addClass("con");
  				content_p.html(qaContents);
  				
  				//�����ϱ�
  				writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
  				new_li.append(writer_p).append(content_p);
  				$("#comment_list").append(new_li);
  			}
  			
  			// INPUT �±׵鿡 ���� �ʱ�ȭ �Լ�
  			function dataReset(){
  				$("#ttNo").val("");
  				$("#qaContents").val("");
  				
  			}
  			
  		</script>
	</head>
	<body>
		<div id="qnaanswerContainer">
			<h1></h1>
			<div id="qnawrite">
				<form id="qnaform" name="qnaform">
					<div>
						<label for="ttNo">�ۼ���</label>
						<input type="text" name="ttNo" id="ttNo">
						<input type="button" id="qaInsert" value="�����ϱ�">
					</div>
					<div>
						<label for="qaContents">����</label>
						<textarea name="qaContents" id="qaContents"></textarea>
					</div>
				</form>
			</div>
			<ul id="comment_list">
				<!-- ���⿡ ���� ���� ��Ұ� ���� �˴ϴ�. -->
			</ul>
		</div>
	</body>
</html>
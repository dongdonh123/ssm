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
		<title>����</title>
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
			
			// �˻� ���濡 ����
			<%
			if(oa_Vo.getKeyword() != "" && oa_Vo.getKeyword() != null){
			%>
				$("#keyword").val("<%=oa_Vo.getKeyword()%>");
				$("#search").val("<%=oa_Vo.getSearch()%>");
			<%
			}
			%>
			
			// �˻���ư Ŭ��
			$("#oaSearchBtn").click(function(){
				alert(">>");
				goPage(1);
			});
			
			// ���� Ŭ�� �� ���������� �̵�
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
		
		// ���Ĺ�ư Ŭ��
		function setOrder(orderBy){
			$("#orderBy").val(orderBy);
			if($("#orderSc").val()=='DESC'){
				$("#orderSc").val('ASC');
				alert("�ֽűۺ��� ��ȸ�մϴ�");
			} else {
				$("#orderSc").val('DESC');
				alert("������ �ۺ��� ��ȸ�մϴ�");
			}
			goPage(1);
		}
		
		// �˻��� ����¡�� ���� ������ ó���Լ�
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
		        	
		        	console.log("��������");
		        	
		        	if(beforeData == 0){
		        		beforeData = data;
		        	} else {
		        		if(beforeData != data) {
		        			push();
		        			beforeData = data;
		        			console.log("controller���� ������ ��� : " + data);
		        			console.log("beforeData : " + beforeData);
		        			before = data;
			        	} else if(beforeData == data){
			        		console.log("�̺�Ʈ����");
		        			console.log("controller���� ������ ��� : " + data);
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
			
			 var message = "�Խñۿ� �亯�� �޷Ƚ��ϴ�.";
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
					<div class="list" id="boardTit"><h3>���� �¶��� ��� ���</h3></div>
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
										<option value="oaTitle">����</option>
										<option value="oaField">���о�</option>
									</select>
									<input type="text" id="keyword" name="keyword" placeholder="�˻�� �Է��ϼ���"/>
									<input type="button" id="oaSearchBtn" name="oaSearchBtn" value="�˻�"/>
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
									<th><a href="javascript:setOrder('oaNo');">��û��ȣ</a></th>
									<th>��㱳��</th>
									<th>�亯����</th>
									<th>���о�</th>
									<th>����</th>
									<th>�ۼ���</th>
									<th>��û��</th>
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
									<td>�亯<%=oaVo.getOaStatus() %></td>
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
						<input type="button" onclick="oaInsertBtn()" value="����û"/>
						<input type="button" onclick="oaListBtn()" value="���"/>
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
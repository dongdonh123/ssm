<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
<%@ page import="java.util.List" %>    
   
<%
	List<QnABoardVO> qblist =(List<QnABoardVO>)request.getAttribute("qblist");
	QnABoardVO data =(QnABoardVO)request.getAttribute("data");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		/*�˻� ����� ����� ������ ó�� �̺�Ʈ*/
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("��ü ������ ��ȸ�մϴ�.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		/*�˻� ��ư Ŭ�� �� ó�� �̺�Ʈ*/
		$("#searchBut").click(function(){
			
			goPage(1);
		});
		
		$("#insertbutton").click(function(){
			$(location).attr('href',"/qnaboard/qbwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/qnaboard/qblist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*���� Ŭ���� �� ������ �̵��� ���� ó�� �̺�Ʈ*/
		$(".qbDetail").click(function(){
			var qbNo = $(this).parents("tr").attr("data-num");
			$("#qbNo").val(qbNo);
			$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
			.submit();
		});
	});
	</script>
</head>
<body>
	<div id="boardContainer">
		<h1>�������� �Խ���</h1>
		
		<%-- ======================�˻���� ����============================ --%>
		
		<div id="boardSearch">
			<form id="f_search" name="f_search">
				<table summary="�˻�">
					<colgroup>
						<col width="70%"></col>
						<col width="30%"></col>
					</colgroup>
					<tr>
						<td>
						<label>�˻�����</label>
						<select id="search" name="search">
							<option value="all">��ü</option>
							<option value="qbTitle">����</option>
							<option value="qbContents">����</option>
							<option value="ssNo">�ۼ���</option>
						</select>
						
						<input type="text" name="keyword" id="keyword" value="�˻���Է��ϼ���" />
						<input type="button" value="�˻�" id="searchBut" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<%-- =======================�˻���� ��============================ --%>
		
		<div id="boardlist" style="text-align:center">
			<table summary="�Խ��� ����Ʈ">
				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th>�۹�ȣ</th>
						<th>������</th>
						<th>�ۼ���</th>
						<th>�ۼ���</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(qblist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>�ۼ��� ���� �����ϴ�.</td>
						<td></td>
						<td></td>
					</tr>
					<%
					}else{
						for (int i=0; i<qblist.size(); i++){
							QnABoardVO qvo = qblist.get(i);
							int cc = i+1;
					%>	
						<tr data-num=<%=qvo.getQbNo() %>>
							<td><%=cc%> </td>
							<td><span class="qbDetail"><%=qvo.getQbTitle() %></span></td>
							<td><%=qvo.getQbInsertdate() %></td>
							<td><%=qvo.getsMembervo().getSsName() %></td>
						</tr>
					<% 		
						}
					}
					%>
				</tbody>
			</table>
			<form id="qblistform" name="qblistform">
				<input type="button" id="insertbutton" name="insertbutton" value="�۾���">
			</form>
			<!-- �� ������ �̵��� ���� form -->
			<form name="qbdetailForm" id="qbdetailForm">
			<input type="hidden" name="qbNo" id="qbNo">
			</form>
		</div>
	</div>
	
</body>
</html>
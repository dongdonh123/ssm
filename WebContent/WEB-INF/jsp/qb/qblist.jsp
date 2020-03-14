<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
<%@ page import="java.util.List" %>    
<%
	request.setCharacterEncoding("EUC-KR");	
%>
<%	
	QnABoardVO searchdata =(QnABoardVO)request.getAttribute("Searchdata");
	int pageCount =0;
	List<QnABoardVO> qblist =(List<QnABoardVO>)request.getAttribute("qblist");
	int listSize=qblist.size();
	if(listSize >0){
	QnABoardVO qvo_ = qblist.get(0);
	double totalCount = (double)Integer.parseInt(qvo_.getTotalCount()); 
	int pagelistSize = (int)request.getAttribute("listSize");
	double dval = (double)pagelistSize;
	pageCount = (int)Math.ceil(totalCount/dval); //pageCount ���� ���
	}
	
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
			
			goPage();
		});
		
		$("#insertbutton").click(function(){
			$(location).attr('href',"/qnaboard/qbwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/qnaboard/qblist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*���� Ŭ���� �� ������ �̵��� ���� ó�� �̺�Ʈ*/
		$(".qbDetail").click(function(){
			var qbNo = $(this).parents("tr").attr("data-num");
			
			if($(this).attr("id") == 'Y'){
				
				//�������� ttno �ֱ�
				var ttNo = null;
				alert("���ۤ�");
				if(ttNo != null){
					alert("������ ��ȣ�� �ִ� (��б۵� ��й�ȣ���� ��ȸ)");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
					.submit();
				}else{
					alert("������ ��ȣ�� ���� (��й�ȣ �Է�������)");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbPwcheckform.ssm")
					.submit();
				}
			}else{
				alert("N");
				$("#qbNo").val(qbNo);
				$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
				.submit();
			}
		});
		
		$(".pageNobut").click(function(){
			var pageNo = $(this).val();
			$("#pageNo").val(pageNo);
			alert(pageNo);
			$("#pageNoForm").attr('action',"/qnaboard/qblist.ssm")
			.submit();
		});
		
		var keyword2 = "<%=searchdata.getKeyword()%>";
		var search2 = "<%=searchdata.getSearch()%>";
		if(keyword2 != "null" && keyword2 != ""){ // Ű���� �����Ͱ� ������ ����
			$("#keyword").val(keyword2);
			$("#search").val(search2);
		}
		
		/* ������ȣ�������� �۾����ư�� ���ܶ� (����)
		var ttno = "T7180001"; */
		if(ttno != "null" && ttno != ""){
			$("#qbinsertbutton").hide();
		}
	});	
	</script>
	
</head>
<body>
	<div id="boardContainer">
		<h1>Q&A �Խ���</h1>
		
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
							<option value="ssName">�ۼ���</option>
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
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>�۹�ȣ</th>
						<th>������</th>
						<th>�ۼ���</th>
						<th>�ۼ���</th>
						<th>�亯����</th>
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
						int count = qblist.size();
						for (int i=0; i<count; i++){
							QnABoardVO qvo = qblist.get(i);
							String no = qvo.getQbNo().substring(4);
							String Secretyn = qvo.getQbSecretyn();
					%>	
						<tr data-num=<%=qvo.getQbNo() %>>
							<td><%=no %></td>
							
							<% 
							if(Secretyn.equals("N") ){//(ssno�� ������ || ttno�� �ֶ� 
							%>
							<td style="text-align:left" id="N"><span class="qbDetail" id="N"><%=qvo.getQbTitle() %></span></td>
							<% 
							}else{
							%>
							<td style="text-align:left"><span class="qbDetail" id="Y">��б��Դϴ�.</span></td>
							
							<%
							}
							%>	
							<td><%=qvo.getQbInsertdate() %></td>
							<td><%=qvo.getsMembervo().getSsName() %></td>
							<td><%=qvo.getQaCount()%></td>
						</tr>
					<% 		
						}
					
					
					%>
					<form id="pageNoForm">
					<%
					for(int i=1 ; i<=pageCount;i++){
					%>
					<input type="button" class="pageNobut" id="pageNobut" name="pageNobut" value="<%=i%>" >
					<input type="hidden" id="pageNo" name="pageNo" value="1">
					<input type="hidden" id="listSize" name="listSize" value="10">
					<input type="hidden" name="search" value="<%=searchdata.getSearch()%>">
					<input type="hidden" name="keyword" value="<%=searchdata.getKeyword()%>">
					</form>
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
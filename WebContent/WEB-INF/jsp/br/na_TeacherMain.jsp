<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_ApplicationVO" %>
<%
	request.setCharacterEncoding("EUC-KR");
	Non_ApplicationVO navo = new Non_ApplicationVO();
	List list =null;
	Object obj = request.getAttribute("list");
	if(obj!=null){
		list = (List)obj;
	}
	String npNo= (String)request.getAttribute("npNo");



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){

			});
			function approval(naNo,npNo){
	
 				location.href="/non_Application/approval.ssm?naNo="+naNo+"&npNo="+npNo;
			}
			function approvalCancel(naNo,npNo){			
 				location.href="/non_Application/approvalCancel.ssm?naNo="+naNo+"&npNo="+npNo;
			}
		</script>
	</head>
	<body>
		<form>
			<table border='1'>
				<tr>
					<td>�й�</td>
					<td>�̸�</td>
					<td>�̸���</td>
					<td>����</td>
					<td>÷������</td>
					<td>���</td>	
				</tr>
				
				<%if(list.size()!=0){
					for (int i=0;i<list.size();i++){
						navo=(Non_ApplicationVO)list.get(i);
					%>
				<tr>
					<td><%=navo.getSsNo() %></td>
					<td><%=navo.getSsName() %></td>
					<td><%=navo.getSsEmail() %></td>
					<td><%=navo.getNaContents() %></td>
					<td><%=navo.getNaFile() %></td>	
					<%	if(navo.getNaStatus().equals("01")){ %>
					<td><input type="button" id="bb" name="bb" value="����" onclick="approval('<%=navo.getNaNo()%>','<%=npNo%>')"></td>
					<%}else{ %>
					<td>
					<input type="button" id="aa" name="aa" value="�������" onclick="approvalCancel('<%=navo.getNaNo()%>','<%=npNo%>')">
					</td>
				</tr>
				
				<%	}
					}
				}else{
					
				%>
					<tr>
					<td colspan='6'>��û�� ����� �����ϴ�</td>
					</tr>
				<%
				}
				%>
			</table>
		</form>
	</body>
</html>
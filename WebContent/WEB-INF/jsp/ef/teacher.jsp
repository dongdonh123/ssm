<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.List"%> 
<%@ page import ="ssm.mi.vo.SmemberVO"%> 
    
<% List<SmemberVO> eftlist = (List<SmemberVO>)request.getAttribute("eflist"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("#kdhtable tr").click(function(){
			var ssNo= $(this).attr("data-num");
			$("#ssNo").val(ssNo);
			$("#tForm").attr('action','/eportfolio/student.ssm')
			.submit();
			
		});
		
	});
	</script>
	
</head>
<body>
	<%if(eftlist.size()!=0){
	SmemberVO svo = eftlist.get(0); 
					String grade = svo.getFmMembervo().getFmGrade();
					String class_= svo.getFmMembervo().getFmClass();%>
						
					
					<h1><%=grade%>�г� <%=class_ %>�� </h1>
					<%
					}%>
	<div class="list" style="text-align:center">
			<table id="kdhtable">
				<colgroup>
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
				</colgroup>
				<thead>
					<tr>
						<th>�й�</th>
						<th>����</th>
						<th>�̸�</th>
						<th>�г�</th>
						<th>��</th>
						<th>��ȣ</th>
						<th>����о�</th>
						<th>�������</th>
						<th>��ġ��</th>
					</tr>
				</thead>
				<tbody>
					<%
					System.out.println("eftlist.size()>>>:" + eftlist.size());
					if(eftlist.size()==0){
					%>
					
					<tr>
						<td>0</td>
						<td>0</td>
						<td>�л������ �����ϴ�.</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%
					}else{
						
						int count = eftlist.size();
						for (int i=0; i<count; i++){
							SmemberVO svo = eftlist.get(i);
							String no = svo.getSsNo();
							no= no.substring(2);
					%>	
						
						<tr data-num=<%=svo.getSsNo() %>>
							<td><%=no%> </td>
							<td><span class="efstudent"><%=svo.getSsImage()%></span></td>
							<td><%=svo.getSsName() %></td>
							<td><%=svo.getFmMembervo().getFmGrade()%></td>
							<td><%=svo.getFmMembervo().getFmClass()%></td>
							<td><%=svo.getFmMembervo().getFmNum()%></td>
							<td><%=svo.getBasicInpormationvo().getBiWf()%></td>
							<td><%=svo.getBasicInpormationvo().getBiWi()%></td>
							<td><%=svo.getValueSettingvo().getVsFirst()%></td>
						</tr>
						
					<% 		
						}
					}
						%>
				</tbody>
			</table>
		</div>
		<form id="tForm" name="tForm">
			<input Type="hidden" id="ssNo" name="ssNo">
		
		</form>
	
	
	
	<div>
		<h2>�л� 20�� ���</h2>
	</div>
</body>
</html>
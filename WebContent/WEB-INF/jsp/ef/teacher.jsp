<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.List"%> 
<%@ page import ="ssm.mi.vo.SMemberVO"%> 
    
<% List<SMemberVO> eftlist = (List<SMemberVO>)request.getAttribute("eflist"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		//tr 클릭시 페이지 이동
		$("#kdhtable tr").click(function(){
			var ssNo= $(this).attr("data-num");
			$("#ssNo").val(ssNo);
			$("#tForm").attr('action','/eportfolio/student.ssm')
			.submit();
			
		});
		
	});
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
	
</head>
<body>
<div id="wrap">
			<header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
			<nav include-html="/common/ssmMain/ssmCategory/nav.html"></nav>
			<section>
				<div class="container">
	<%if(eftlist.size()!=0){
	SMemberVO svo = eftlist.get(0); 
					String grade = svo.getFmMembervo().getFmGrade();
					String class_= svo.getFmMembervo().getFmClass();%>
						
					
					<h1><%=grade%>학년 <%=class_ %>반 </h1>
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
						<th>학번</th>
						<th>사진</th>
						<th>이름</th>
						<th>학년</th>
						<th>반</th>
						<th>번호</th>
						<th>희망분야</th>
						<th>희망직종</th>
						<th>가치관</th>
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
						<td>학생명단이 없습니다.</td>
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
							SMemberVO svo = eftlist.get(i);
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
</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>
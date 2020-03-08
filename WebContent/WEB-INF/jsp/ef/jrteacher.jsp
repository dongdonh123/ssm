<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List"%> 
<%@ page import ="ssm.mi.vo.SmemberVO"%> 
    
<% List<SmemberVO> eftlist = (List<SmemberVO>)request.getAttribute("eflist"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%if(eftlist.size()!=0){
		System.out.println("1");
	SmemberVO svo = eftlist.get(0); 
	System.out.println("2");
					String grade = svo.getJrMembervo().getJrGrade();
					System.out.println("3");
					String class_= svo.getJrMembervo().getJrClass();%>
						
					
					<h1><%=grade%>학년 <%=class_ %>반 </h1>
					<%
					}%>
	<div id="studentlist" style="text-align:center">
			<table summary="학생 리스트">
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
							SmemberVO svo = eftlist.get(i);
							String no = svo.getSsNo();
							no= no.substring(2);
					%>	
						<tr data-num=<%=svo.getSsNo() %>>
							<td><%=no%> </td>
							<td><span class="efstudent"><%=svo.getSsImage()%></span></td>
							<td><%=svo.getSsName() %></td>
							
							<td><%=svo.getJrMembervo().getJrGrade()%></td>
							<td><%=svo.getJrMembervo().getJrClass()%></td>
							<td><%=svo.getJrMembervo().getJrNum()%></td>
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
	
	
	
	
	<div>
		<h2>학생 20명 통계</h2>
	</div>
</body>
</html>
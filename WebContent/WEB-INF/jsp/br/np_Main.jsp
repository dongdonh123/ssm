<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.br.vo.Non_ProgramVO" %>
<%@ page import="java.util.List"  %>
<%  request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	String resultStr = (String)request.getAttribute("resultStr");
	
	double totalCountJsp =0.0;
	int listSizeJsp2 = 0;
	double listSizeJsp = 0.0;
	int pageCount = 0;
	Non_ProgramVO npvo = new Non_ProgramVO();
	Non_ProgramVO npvo2 = new Non_ProgramVO();
	String npTitle ="";
	String npContents="";
	Object npTitle1= request.getAttribute("npTitle");
	Object npContents1= request.getAttribute("npContents");
	if(npTitle1!=null) npTitle = (String)npTitle1;
	if(npContents1!=null) npContents = (String)npTitle1;

	List list = null;
	if(obj != null){
		 list = (List)request.getAttribute("list");	
		 int listSize=0;
			
			listSizeJsp2 = Integer.parseInt((String)request.getAttribute("listSize"));
			if(obj != null){
				list = (List)request.getAttribute("list");
				if(list.size()>0){
					listSize=list.size();
					npvo = (Non_ProgramVO)list.get(0);
					totalCountJsp = (double)Integer.parseInt(npvo.getTotalCount());
					listSizeJsp = (double)listSizeJsp2;
					pageCount = (int)Math.ceil(totalCountJsp/listSizeJsp);
					
					
				}
			}
	}
	
	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#howmany").val("<%=listSizeJsp2 %>");
			if("<%=resultStr%>"!=null && <%=resultStr%>!=""){
				alert(<%=resultStr%>);
			}
			alert("�����̻����")
			if("<%=npTitle%>"!=null) $("#text").val("<%=npTitle%>");
			if("<%=npContents%>"!=null) $("#text").val("<%=npContents%>");
			$("#insert").click(function(){
				location.href="/nonprogram/np_InsertForm.ssm";
			});
			
			
			$(".pageNo").click(function(){
				
				var ss = $(this).val();
				$("#pageNo").val(ss);
				alert($("#pageNo").val())
				$("#howmany").val("<%=listSizeJsp2 %>");
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();
				
			});
			
			//���� Ŭ����
			$("#reFresh").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val());//howmany=listSize������ ���Ĺ�ư�̾ƴ� �ٸ���ưŬ���� ���������ʱ����� ������ 
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();
			});
			
			$("#text").keydown(function(key){
				if(key.keyCode==13){
					$("#pageNo").val("1");
					$("#listSize").val($("#howmany").val())
					if($("#where").val()==1) $("#npTitle").val($("#text").val());
					if($("#where").val()==2) $("#npContents").val($("#text").val());
					$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();	
				}
			});
			$("#search").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val())
				if($("#where").val()==1) $("#npTitle").val($("#text").val());
				if($("#where").val()==2) $("#npContents").val($("#text").val());
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();			
			});	
		});
		function goDetail(npNo){
			location.href="/nonprogram/np_detailData.ssm?npNo="+npNo;
			
			//$(".npNo").val(null);
			//$("#npNo").val(npNo);
			//$("#nonProgramList").attr("action","/nonprogram/np_detailData.ssm").submit();
			
		}
		
		
		
	</script>
	
</head>
<body>
	<form id="nonProgramList">
		����������
		<select id="howmany" name="howmany">
			<option value="10">10��</option>
			<option value="20">20��</option>
			<option value="30">30��</option>
			<option value="50">50��</option>
			<option value="70">70��</option>
			<option value="100">100��</option>			
		</select>
		<input type="button" id="reFresh" name="reFresh" value ="����">
		
		<!-- ==================================================== -->
		<select id="where" name="where">
			<option value="1">����</option>
			<option value="2">����</option>
		</select>
		<input type="text" id="text" name="text">
		<input type="button" id="search" name="search" value ="�˻�">
		
		<!-- ==================================================== -->
		
		<table border='2' align="center">
			<tr align='center'>
				<td colspan='2'>�񱳰� ���α׷�</td>
			</tr>
		<%if(obj!=null){
			for(int i =0 ; i<list.size();i++){
				npvo=(Non_ProgramVO)list.get(i);
				%>
				
			<tr>
				<%if((i%2) == 0){ %>
				
				<td onclick="goDetail('<%=npvo.getNpNo()%>')">
					<br>
					<img src="/npFile/<%=npvo.getNpImage()%>"  width="160" height="100"/><br>
					<%=npvo.getNpTitle()%><br>
					<%=npvo.getNpCenter()%><br>
					<%=npvo.getNpObject() %><br>
					<%=npvo.getNpPersonnel()%><br>

					<input type="hidden" class="npNo" id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
				</td>

				
				<%} 
					if(i==list.size()-1){
						break;
						
					}else{
						i++;
					}

					npvo2=(Non_ProgramVO)list.get(i);%>
				<%if((i%2) == 1){ %>
				<td onclick="goDetail('<%=npvo2.getNpNo()%>')">
					<br>
					<img src="/npFile/<%=npvo2.getNpImage()%>"  width="160" height="100"/><br>
					<%=npvo2.getNpTitle()%><br>
					<%=npvo2.getNpCenter()%><br>
					<%=npvo2.getNpObject() %><br>
					<%=npvo2.getNpPersonnel()%><br>
					
					<input type="hidden" class="npNo" id="npNo" name="npNo" value="<%=npvo2.getNpNo()%>">
				</td>
			
				<%} %>
			</tr>	
			
				<%
				
			}
			
		}else{%>
		<tr><td>��������</td></tr>
			<%
		}
		%>
		
		
		
		</table>
		<input type='button' id='insert' name='insert' value="���ۼ�">
		 <%for(int i=1 ; i<=pageCount;i++){%>
			<input type="button" class="pageNo" id="pageNo2" name="pageNo2" value="<%=i%>">
	<%}
	%>
	<input type="hidden" id="npTitle" name="npTitle">
	<input type="hidden" id="npContents" name="npContents">
	<input type="hidden" id="listSize" name="listSize" value="<%=listSizeJsp2 %>">
    <input type="hidden" id="pageNo" name="pageNo" value='1'>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "ssm.mi.vo.SMemberVO"%>
<% String sessionNO = "T8180001"; %>
<%		
	Object obj1 = request.getAttribute("oaListCLT"); 
	System.out.println("obj >>> : " +obj1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�¶��λ�� ���ӱ��� 1������</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script>
		$(document).ready(function(){
			
			$("a[name='oaCount']").on("click",function(e){
	            fn_openOaDetail($(this));
	        });
			
			
			
			$("#oaCount").click(function(){
				alert(">>");
				var tagId = $(this).attr('id');
				alert(tagId);

				
				$("#oaListCLT").attr({
					"method":"POST",
					"action":"/onlineApplication/oaListCLT.ssm"
				});
				$("#oaListCLT").submit();	
				;
			});
		});//ready
	
		function fn_openOaDetail(val){
			var idx= val.parent().find("#IDX").val();
			alert("idx>> : " +idx);
			$("#ssNo").val(idx);
			
			$("#oaListCLT").attr({
				"method":"POST",
				"action":"/onlineApplication/ssOaList.ssm"
			});
			$("#oaListCLT").submit();	
			
	        //var comSubmit = new ComSubmit();
	        //comSubmit.addParam("IDX",val.parent().find("#IDX").val());
	        //comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do'/>");
	        //comSubmit.submit();
	    }
		</script>
	</head>
	<body>
		<form name="oaListCLT" id="oaListCLT" 
		method ="POST"
		enctype="application/x-www-form-urlencoded">
<%		
		if (obj1 != null){
			ArrayList<OnlineApplication_BoardVO> aList = (ArrayList<OnlineApplication_BoardVO>) obj1;
			
			if (aList.size() == 0){
	
			%>	
			<table border="1">
				<tr>
					<td>NO DATA</td>
				</tr>
			</table>			
			<% 		
	 		}else{
			%>
			<table border="1">
				<tr>
					<td colspan="18" align="center"><h3> <%=aList.get(0).getSmemberVO().getSsGrade()%> <%=aList.get(0).getSmemberVO().getSsClass()%>�� �¶��λ�� ����Ʈ</h3></td>
				</tr>	
				<tr>
					<td colspan="18" align="left">	
						<input type="hidden" name="ttNo" id="ttNo" value="<%=sessionNO%>">
						<input type="hidden" name="ssNo" id="ssNo">												
						<input type="button" value="�ε������ư���" name="index" id="index">

										
					</td>					
				</tr>
				<tr>
					<td><input type="checkbox" name="chkAll" id="chkAll"></td>
				 	<td>�л���ȣ</td>
					<td>�л���</td>
					<td>�ݹ�ȣ</td>
					<td>���Ǽ�</td>
					<td>�ѻ���û�Ǽ� </td>
				</tr>			 		
		<% 		for(int i =0; i<aList.size(); i++){  
				OnlineApplication_BoardVO oavo = aList.get(i);
		%>
				<tr>
				    <td align="center">
						<input type="checkbox" name="chkInNo" 
								id="chkInNo"  value=<%=oavo.getSmemberVO().getSsNo()%>
						 	    onclick="checkOnly(this)">
					</td>
					<td><%=oavo.getSmemberVO().getSsNo()%></td>
					<td><%=oavo.getSmemberVO().getSsName()%></td>
					<td><%=oavo.getSmemberVO().getSsNum()%>��</td>
					<td>
						<input type="hidden" id="IDX" value="<%=oavo.getSmemberVO().getSsNo()%>"/>
								<a class="oaCount" href="#this" name="oaCount" ><%=oavo.getOaCount()%>��</a>
					</td>
					<td>
					<input type="hidden" id="IDX2" value="<%=oavo.getSmemberVO().getSsNo()%>"/>
								��<a class="oaCount" href="#this" name="oaCount" ><%=oavo.getOaCountall()%>��</a>
					
				</tr>
				
		<%			} //for��
				} //aList.size if ��
			}//object if ��%>
			</table>	
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isELIgnored="false" %>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.BabySession" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<%	String sessionID = BabySession.getSessionID(request);
	String sessionNO = BabySession.getSessionNO(request);
	if(sessionID == null){
		sessionID = "";
	}
%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
	<title>���</title>

</head>
<body>
	<table border=0  width="100%">
	  <tr>
	     <td>	
	     </td>
	     <td>
	       <h1><font size=30>��Ʈ����б� �л� �������� ����Ʈ </font></h1>
	     </td>
	
<%
		if(sessionID.length() > 0 && sessionID != "" ){
%>      
	           <td>
						<!--  <img src="/upload/${member.ttImage}" width="100" heigh="100"/>-->
					    
		     	</td>
	             <td> <h3>ȯ���մϴ�. <%=sessionID%>��!</h3>
	            <a href="/user/logout.ssm"><h3>�α׾ƿ�</h3></a> </td>
	
	     <%}else{%>  
		        <td> <a href="/user/loginForm.ssm"><h3>�α���</h3></a> </td>
		 <%}%> 
	  
	    
	  </tr>
	</table>


</body>
</html>
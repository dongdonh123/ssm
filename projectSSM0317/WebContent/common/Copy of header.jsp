<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%-- request.setCharacterEncoding("EUC-KR"); 

	HttpSession session1= request.getSession();
	Object obj = session1.getAttribute("isLogOn");
	System.out.println("jsp obj��>>>"+obj);
	Boolean isLogOn =false;
	isLogOn = (Boolean)obj;
	System.out.println("jsp isLogOn��>>>"+isLogOn);
	if(obj != null && isLogOn==true ){
		
		
		Object objj = session1.getAttribute("member");
		TMemberVO tmvo = (TMemberVO)objj;
		System.out.println("jsp header tmvo>>>"+tmvo);
		System.out.println("jsp header tmvo.get>>>"+tmvo.getTtId());
		System.out.println("jsp header tmvo.get>>>"+tmvo.getTtPw());

	}
	
	
--%>

<!-- 	Object headerResult = request.getAttribute("result");
	Object headerMessage = request.getAttribute("message");
	System.out.println("header headerResult "+headerResult);
	System.out.println("header headerMessage "+headerMessage);
	String result ="";
	String message="";
	if(headerResult != null){
		result = (String)headerResult;
		message = (String)headerMessage;
		System.out.println("header result "+result);
		System.out.println("header message "+message);
	} -->
	
<%-- request.setCharacterEncoding("EUC-KR"); 

	HttpSession session1= request.getSession(false);
	Object obj = session1.getAttribute("isLogOn");
	System.out.println("jsp obj��>>>"+obj);
	Boolean isLogOn =false;
	isLogOn = (Boolean)obj;
	System.out.println("jsp isLogOn��>>>"+isLogOn);
	if(obj != null && isLogOn==true ){
		
		
		Object objj = session1.getAttribute("member");
		TMemberVO tmvo = (TMemberVO)objj;
		System.out.println("jsp header tmvo>>>"+tmvo);
		System.out.println("jsp header tmvo.get>>>"+tmvo.getTtId());
		System.out.println("jsp header tmvo.get>>>"+tmvo.getTtPw());

	}
	
	
--%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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
		<a href="${contextPath}/defalt.jsp">
			 <img src="/upload/peng.jpg" width="100" heigh="100"/>	
		</a>
     </td>
     <td>
       <h1><font size=30>��Ʈ����б� �л� �������� ����Ʈ </font></h1>
     </td>
  <!-- <a href="#"><h3>�α���</h3></a> -->
       <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
           <td>
					<%-- <img src="${contextPath}/resources/image/duke_swing.gif"  />--%>
					<img src="/upload/${member.ttImage}" width="100" heigh="100"/>
				
	     	</td>
             <td> <h3>ȯ���մϴ�. ${member.ttName}��!</h3>
            <a href="${contextPath}/tMember/logout.ssm"><h3>�α׾ƿ�</h3></a> </td>
          </c:when>
          
          
          <c:otherwise>
	        <td> <a href="${contextPath}/tMember/loginForm.ssm"><h3>�α���</h3></a> </td>
	      </c:otherwise>
	   </c:choose>     
    
  </tr>
</table>


</body>
</html>
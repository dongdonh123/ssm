<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.BabySession" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<c:if test='${not empty message }'>
		<script>
		window.onload=function()
		{
		  result();
		}
		
		function result(){
			alert("���̵�  ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���");
		}
		</script>
		</c:if>
	</head>
	<body>
		<H3>ȸ�� �α��� â</H3>
		<DIV id="detail_table">
		<form action="${contextPath}/tMember/login.ssm" method="post">
			<TABLE>
				<TBODY>
					<TR class="dot_line">
						<TD class="fixed_join">���̵�</TD>
						<TD><input name="ttId" type="text" size="20" /></TD>
					</TR>
					<TR class="solid_line">
						<TD class="fixed_join">��й�ȣ</TD>
						<TD><input name="ttPw" type="password" size="20" /></TD>
					</TR>
				</TBODY>
			</TABLE>
			
			<br><br>
			<INPUT	type="submit" value="�α���"> 
			<INPUT type="button" value="�ʱ�ȭ">
			
			<Br><br>
			   <a href="#">���̵� ã��</a>  | 
			   <a href="#">��й�ȣ ã��</a> | 
			   <a href="${contextPath}/tMember/checkFormTMember.ssm">ȸ������</a>    | 
			   <a href="#">�� ����</a>
						   
		</form>		
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="ssm.common.utils.BabySession" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
<%

String sessionAU = BabySession.getSessionAU(request);
String sessionNO = BabySession.getSessionNO(request);
String sessionID = BabySession.getSessionID(request);

	if(sessionAU == null){
		sessionAU = "";
	}
	String you ="";
	if(sessionAU.equals("1")){
		you="�л�";
	}
	if(sessionAU.equals("2")){
		you="������";
	}
%>
	<body>
		<p style="text-align : center; margin : 15px 5px ;">
			<span>
				<a href="/main_1.jsp" id="headerTit">��Ʈ����б�</a>
			</span>
		</p>
		<hr>
		<nav>
			<div class="wrapMenu">
				<ul class="menuList">
					<li><a href="javascript:goCareerDesign()">���μ���</a></li>
			<li><a href="javascript:goCounseling()">���â��</a></li>
			<li><a href="javascript:goBigyogwaRecommend()">�񱳰���õ</a></li>
			<li><a href="javascript:goEportfolio('<%=sessionAU%>','<%=you%>')">E-��Ʈ������</a></li>
			<li><a href="javascript:goCommunity()">Ŀ�´�Ƽ</a></li>
				</ul>
			</div>
		</nav>
		<hr>
	</body>
</html>
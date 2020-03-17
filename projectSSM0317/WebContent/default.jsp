<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>INDEX 첫 페이지</title>
		<style type="text/css">
		div{
			font: 15px "굴림";
		}
		
		a{text-decoration: none;}
		#wrap {
			width: 1000px;
			margin: 0 auto 0 auto;
		}
		
		#header {
			text-align: center;
			width: 1000px;
			height: 50px;
			background-color: #FFCA6C;
			padding: 30px 0px;
		}
		
		#main {
			float: left;
			width: 1000px;
			height: 500px;
			background-color: #49BEAA;
			text-align:left;
			vertical-align: middle;
		}
		#footer {
			clear: left;
			width: 1000px;
			height: 60px;
			background-color: #7DFE74;
		}
		</style>
	</head>
	<body> 
	<div id="wrap">
		<div id="header">
		   <%@include file = "/common/header.jsp" %>
		</div>
		<div id="main">
		<br><Br>
			<a href="/onlineApplication/oaBoardList.ssm">온라인상담 학생페이지</a><br>
			<a href="/onlineApplication/oaListCLT.ssm">온라인 상담 담임교사페이지</a><br><br><Br>
			<a href="/visitCounsel/vcSchedule.ssm">방문상담 학생 예약</a><br>
			<a href="/visitCounsel/vcMineList.ssm">방문상담 학생 예약현황</a><br>
		<a href="/eduSchedule/eduRsvList.ssm">방문상담 교사페이지</a><br><br><br><br><br>
		
			<a href="/tMember/insertFormTMember.ssm">[관리자 교사 입력]</a>&nbsp;&nbsp;<br> <!--입력할때 성별	 -->	
			<a href="/tMember/listTMemberN.ssm">[관리자 미가입교사 확인]</a>&nbsp;&nbsp;<br>
			<a href="/tMember/listTMemberY.ssm">[관리자 가입교사 승인]</a>&nbsp;&nbsp; <!--관리자 화면에서 디테일 ajax --><br><br>
			
			<a href="/tMember/checkFormTMember.ssm">[교사 회원가입]</a>&nbsp;&nbsp;  <!--반선택에 중복확인/아이디중복확인 -->
			
			<!--<a href="/tMember/loginForm.ssm">[T로그인]</a>  세션받아서접근제한인터셉트/로그아웃시 header/jstl바꾸기  -->
			<a href="/login/loginForm.ssm">[로그인]</a>
			<br><br>
		<!-- 	<a href="/reserve/reserveDateForm.ssm">[예약]</a> -->
			
			
			<br><br>
			<a href="/jsp/cg/cgMain.ssm"/>[cgMain]</a>
			
			
		</div>
	</div>
	</body>
</html>
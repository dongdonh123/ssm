<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.List" %>
<%@ page import ="ssm.mi.vo.SmemberVO" %>
<%@ page import ="ssm.cd.vo.CareerdesignVO" %>
<%@ page import ="ssm.br.vo.NonprogramVO" %>
<%@ page import ="ssm.cg.vo.OnlineapplicationVO" %>
<%@ page import ="ssm.cd.vo.ValuesettingVO" %>

<!--  cdlist brlist cglist vslist받기 -->
<% List<CareerdesignVO> cdlist =(List<CareerdesignVO>)request.getAttribute("cdlist");%>
<% List<NonprogramVO> brlist =(List<NonprogramVO>)request.getAttribute("brlist");%>
<% List<OnlineapplicationVO> cglist =(List<OnlineapplicationVO>)request.getAttribute("cglist");%>
<% ValuesettingVO vvo =(ValuesettingVO)request.getAttribute("vslist");%>

<!-- pageNO 받아온거 데이터 설정 -->
<% SmemberVO svo_ =(SmemberVO)request.getAttribute("pageNo");%>
<% String brpageNo =svo_.getBrpageNo();%>
<% String cgpageNo =svo_.getCgpageNo();%>
<% String cdyearNo =svo_.getCdyearNo();%>
<% String bryearNo =svo_.getBryearNo();%>
<% String cgyearNo =svo_.getCgyearNo();%>

<!--  mylist 받아온거 데이터 설정 -->
<% SmemberVO svo =(SmemberVO)request.getAttribute("mylist");%>
<% String grade = svo.getSsGrade();
	String fmno=""; String jrno=""; String srno="";
   if(grade.equals("FM")){ grade="1학년"; fmno="20";}
   else if(grade.equals("JR")){ grade="2학년"; fmno="19"; jrno="20";}
   else if(grade.equals("SR")){ grade="3학년"; fmno="18"; jrno="19"; srno="20";}%>
   

<!--  brlist 받아온거 페이징 데이터 설정 -->   
<%  int brpageCount = 0;
	if(brlist.size() >0){
		NonprogramVO nvo_ = brlist.get(0);
		double totalCount = (double)Integer.parseInt(nvo_.getTotalCount()); 
		int pagelistSize = (int)request.getAttribute("listSize");
		double dval = (double)pagelistSize;
		brpageCount = (int)Math.ceil(totalCount/dval); //pageCount 변수 사용
	}
%>   
   
<!--  cglist 받아온거 페이징 데이터 설정 -->   
<%  int cgpageCount = 0;
	if(cglist.size() >0){
		OnlineapplicationVO ovo_ = cglist.get(0);
		double totalCount = (double)Integer.parseInt(ovo_.getTotalCount()); 
		int pagelistSize = (int)request.getAttribute("listSize");
		double dval = (double)pagelistSize;
		cgpageCount = (int)Math.ceil(totalCount/dval); //pageCount 변수 사용
	}
%>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		//진로설계 결과 보기 버튼 눌렀을때
		$(".cdlinkbutton").click(function(){
			var url = $(this).parents("tr").attr("data-num");
			window.open(url);
		});
		
		//비교과 프로그램 글제목 눌렀을때
		$(".brlinkbutton").click(function(){
			var npNo = $(this).parents("tr").attr("data-num");
			$("#npNo").val(npNo);
			$("#linkForm").attr('action','/어노테이션/어노테이션.ssm').submit();
			
		});
		
		//상담결과 결과버튼 눌렀을때 (온라인게시판글로가는거)
		$(".cgoalinkbutton").click(function(){
			var oaNo = $(this).attr("data-num");
			$("#oaNo").val(oaNo);
			window.open("","pop1","width=600,height=450");
			$("#linkForm").attr('action','/어노테이션/어노테이션.ssm');
			$("#linkForm").attr('target','pop1');
			$("#linkForm").submit();
		});
		
		//상담결과 버튼눌렀을때  (방문상담게시판신 글로가는거)
		$(".cgvrlinkbutton").click(function(){
			var vrNo = $(this).attr("data-num");
			$("#vrNo").val(vrNo);
			window.open("","pop2","width=600,height=450");
			$("#linkForm").attr('action','/어노테이션/어노테이션.ssm');
			$("#linkForm").attr('target','pop2');
			$("#linkForm").submit();
		});
		
		//진로설계 학년버튼으로 검색
		$(".cdgradebutton").click(function(){
			var cdyearNo = $(this).attr("data-num");
			$("#cdyearNo").val(cdyearNo);
			$("#pageNoForm").attr('action','/eportfolio/student.ssm');
			$("#pageNoForm").submit();
		});
		
		//비교과프로그램 학년버튼으로 검색
		$(".brgradebutton").click(function(){
			var bryearNo = $(this).attr("data-num");
			$("#bryearNo").val(bryearNo);
			$("#pageNoForm").attr('action','/eportfolio/student.ssm');
			$("#pageNoForm").submit();
		});
		
		//상담 학년버튼으로 검색
		$(".cggradebutton").click(function(){
			var cgyearNo = $(this).attr("data-num");
			$("#cgyearNo").val(cgyearNo);
			$("#pageNoForm").attr('action','/eportfolio/student.ssm');
			$("#pageNoForm").submit();
		});
		
		//비교과 페이징 왼쪽 버튼
		$("#brpageleftbutton").click(function(){
			var brpageNo =$("#brpageNo").val();
			if(brpageNo == 1){
				alert("첫번째페이지입니다!");
			}else{
				brpageNo  = brpageNo-1;
				$("#brpageNo").val(brpageNo);
				$("#pageNoForm").attr('action','/eportfolio/student.ssm').submit();
			}
		});
		
		//비교과 페이징 오른쪽 버튼
		$("#brpagerightbutton").click(function(){
			var brpageNo =$("#brpageNo").val();
			if(brpageNo >= <%=brpageCount%>){
				alert("마지막페이지입니다");
			}else{
				brpageNo  = Number(brpageNo)+1;
				$("#brpageNo").val(brpageNo);
				$("#pageNoForm").attr('action','/eportfolio/student.ssm').submit();
			}
		});
		
		//삼담 페이징 왼쪽 버튼
		$("#cgpageleftbutton").click(function(){
			var cgpageNo =$("#cgpageNo").val();
			if(cgpageNo == 1){
				alert("첫번째페이지입니다!");
			}else{
				cgpageNo  = cgpageNo-1;
				$("#cgpageNo").val(cgpageNo);
				$("#pageNoForm").attr('action','/eportfolio/student.ssm').submit();
			}
		});
		
		//상담 페이징 오른쪽 버튼
		$("#cgpagerightbutton").click(function(){
			var cgpageNo =$("#cgpageNo").val();
			if(cgpageNo >= <%=cgpageCount%>){
				alert("마지막페이지입니다");
			}else{
				cgpageNo  = Number(cgpageNo)+1;
				$("#cgpageNo").val(cgpageNo);
				$("#pageNoForm").attr('action','/eportfolio/student.ssm').submit();
			}
		});
		
		//비교과프로그램 페이지번호 버튼 
		$(".brpageNobutton").click(function(){
			var brpageNo = $(this).attr("data-num");
			$("#brpageNo").val(brpageNo);
			$("#pageNoForm").attr('action','/eportfolio/student.ssm').submit();
		});
		
		//상담 페이지번호 버튼
		$(".cgpageNobutton").click(function(){
			var cgpageNo = $(this).attr("data-num");
			$("#cgpageNo").val(cgpageNo);
			$("#pageNoForm").attr('action','/eportfolio/student.ssm').submit();
		});
		
		
		
	});
	
	</script>
	
	<style>
        body{
            margin: 0px;
            padding: 0px;
        }
        div{
            width: 500px;
            height: 300px;
        }
        #aa{
            background-color: lightpink;
            position: absolute;
            left: 50px;    
            top: 150px;
        }
        #bb{
            background-color: lightgreen;
             position: absolute;
            left: 650px;    
            top: 150px;
        }
        #cc{
            background-color: lightgray;
             position: absolute;
            left: 50px;    
            top: 500px;
        }
        #dd{
            background-color: lightyellow;
             position: absolute;
            left: 650px;    
            top: 500px;
        }
       
    </style>




</head>
<body>
	<h1>e포트폴리오 학생페이지</h1>
	<p><%=grade%> <%=svo.getSsName() %></p>
	<div id="aa" >
		<h2>진로설계과정 </h2>
		<%
		if(fmno.equals("20")){
		%>	
			<input Type="button" class="cdgradebutton" value="1학년" data-num="<%=fmno%>">
		<%	
		}
		if(fmno.equals("19")){
		%>
		<input Type="button" class="cdgradebutton" value="1학년" data-num="<%=fmno%>">
		<input Type="button" class="cdgradebutton" value="2학년" data-num="<%=jrno%>">
		<%
		}
		if(fmno.equals("18")){
		%>
		<input Type="button" class="cdgradebutton" value="1학년" data-num="<%=fmno%>">
		<input Type="button" class="cdgradebutton" value="2학년" data-num="<%=jrno%>">
		<input Type="button" class="cdgradebutton" value="3학년" data-num="<%=srno%>">
		<%
		}
		%>
		<table>
			<thead>
				<tr>
					<th>검사 유형</th>
					<th>검사날짜</th>
					<th>검사결과</th>
				</tr>
			</thead>
			<tbody>	
			<% if(cdlist.size()==0){
			%>
			<tr>
				<td></td>
				<td>데이터가없습니다.</td>
				<td></td>
			</tr>
			<%
			}else{
				String ja="검사 미실시"; String ji= "검사 미실시"; String ih="검사 미실시"; String va ="검사 미실시"; String cm ="검사 미실시";
				String jaurl="";    String jiurl="";      String ihurl="";    String vaurl="";      String cmurl="";
				for(int i=0; i<cdlist.size(); i++){
					CareerdesignVO cvo = cdlist.get(i);
					if(cvo.getCdValue().equals("JA")) {ja = cvo.getCdInsertdate().substring(0,10); jaurl=cvo.getCdUrl();}	
					else if(cvo.getCdValue().equals("JI")){ji = cvo.getCdInsertdate().substring(0,10); jiurl=cvo.getCdUrl();}
					else if(cvo.getCdValue().equals("IH")){ih = cvo.getCdInsertdate().substring(0,10); ihurl=cvo.getCdUrl();}
					else if(cvo.getCdValue().equals("VA")){va = cvo.getCdInsertdate().substring(0,10); vaurl=cvo.getCdUrl();}
					else if(cvo.getCdValue().equals("CM")){cm = cvo.getCdInsertdate().substring(0,10); cmurl=cvo.getCdUrl();}
					
					
				}
				
			%>
			<tr data-num="<%=jaurl %>">
				<td>직업적성검사</td>
				<td><%=ja%></td>
				<td><%if(ja !="검사 미실시"){%><input Type="button" class="cdlinkbutton" value="결과보기" /><%} %></td>	
			</tr>	
			<tr data-num="<%=jiurl %>">
				<td>직업흥미검사(K)</td>
				<td><%=ji%></td>
				<td><%if(ji !="검사 미실시"){%><input Type="button" class="cdlinkbutton"  value="결과보기" /><%} %></td>	
			</tr>
			<tr data-num="<%=ihurl %>">
				<td>직업흥미검사(H)</td>
				<td><%=ih%></td>
				<td><%if(ih !="검사 미실시"){%><input Type="button" class="cdlinkbutton"  value="결과보기" /><%} %></td>	
			</tr>
			<tr data-num="<%=vaurl %>">
				<td>직업가치관검사</td>
				<td><%=va%></td>
				<td><%if(va !="검사 미실시"){%><input Type="button" class="cdlinkbutton"  value="결과보기" /><%} %></td>	
			</tr>
			<tr data-num="<%=cmurl %>">
				<td>직업성숙도검사</td>
				<td><%=cm%></td>
				<td><%if(cm !="검사 미실시"){%><input Type="button" class="cdlinkbutton"  value="결과보기" /><%} %></td>	
			</tr>
			</tbody>	
			<%
			}
			%>
		</table>
	</div>
	<div id="bb">
		<h2>비교과 활동현황</h2>
		<%
		if(fmno.equals("20")){
		%>	
			<input Type="button" class="brgradebutton" value="1학년" data-num="<%=fmno%>">
		<%	
		}
		if(fmno.equals("19")){
		%>
		<input Type="button" class="brgradebutton" value="1학년" data-num="<%=fmno%>">
		<input Type="button" class="brgradebutton" value="2학년" data-num="<%=jrno%>">
		<%
		}
		if(fmno.equals("18")){
		%>
		<input Type="button" class="brgradebutton" value="1학년" data-num="<%=fmno%>">
		<input Type="button" class="brgradebutton" value="2학년" data-num="<%=jrno%>">
		<input Type="button" class="brgradebutton" value="3학년" data-num="<%=srno%>">
		<%
		}
		%>
			<table>
			<thead>
				<tr>
					<th>no</th>
					<th>Title</th>
					<th>Date</th>
					<th>운영기관</th>
				</tr>
			</thead>
			<tbody>	
			<% if(brlist.size()==0){
			%>
			<tr>
				<td></td>
				<td>데이터가없습니다.</td>
				<td></td>
				<td></td>
			</tr>
			<%
			}else{
				for(int i=0; i<brlist.size(); i++){
					NonprogramVO nvo = brlist.get(i);
					String no = "00"+ nvo.getRowNo();
					no = no.substring(no.length()-2,no.length());
			%>
			<tr data-num="<%=nvo.getNpNo()%>">
				<td><%=no%></td>		
				<td><span class="brlinkbutton"><%=nvo.getNpTitle()%></span></td>		
				<td><%=nvo.getNpPsdate().substring(0,10)%></td>		
				<td><%=nvo.getNpCenter()%></td>		
			</tr>
			<% 			
				}
			%>
			<% }%>
		</table>
		<br>
		<div align="center">
		<input Type="button" id="brpageleftbutton" value="◀">
		<%
		for(int i=1 ; i<=brpageCount;i++){
		%>
		<span class="brpageNobutton" data-num="<%=i%>"> <%=i%></span>
		<%
		}
		%>
		<input Type="button" id="brpagerightbutton" value="▶">
		</div> 
	</div>
	<div id="cc">
		<h2>상담결과</h2>
		<%
		if(fmno.equals("20")){
		%>	
			<input Type="button" class="cggradebutton" value="1학년" data-num="<%=fmno%>">
		<%	
		}
		if(fmno.equals("19")){
		%>
		<input Type="button" class="cggradebutton" value="1학년" data-num="<%=fmno%>">
		<input Type="button" class="cggradebutton" value="2학년" data-num="<%=jrno%>">
		<%
		}
		if(fmno.equals("18")){
		%>
		<input Type="button" class="cggradebutton" value="1학년" data-num="<%=fmno%>">
		<input Type="button" class="cggradebutton" value="2학년" data-num="<%=jrno%>">
		<input Type="button" class="cggradebutton" value="3학년" data-num="<%=srno%>">
		<%
		}
		%>
		<table>
			<thead>
				<tr>
					<th>no</th>
					<th>Date</th>
					<th>상담사</th>
					<th>상담분류</th>
					<th>상담유형</th>
					<th>상담결과</th>
				</tr>
			</thead>
			<tbody>	
			<% if(cglist.size()==0){
			%>
			<tr>
				<td></td>
				<td>데이터가없습니다.</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<%
			}else{
				for(int i=0; i<cglist.size(); i++){
					OnlineapplicationVO ovo = cglist.get(i);
					String no = "00"+ ovo.getRowNo();
					no = no.substring(no.length()-2, no.length());
					String oaNo = ovo.getOaNo();
					String oa= "온라인상담";
					String vr= "방문상담";
					String oafield = ovo.getOaField();
					String cac= "진로상담";
					String lic= "생활상담";
					String lec= "학습상담";
			%>
			<tr>
				<td><%=no%></td>		
				<td><%=ovo.getOaInsertdate().substring(0,10)%></td>		
				<td><%=ovo.gettMembervo().getTtName()%></td>		
				<td><%if(oafield.equals("CAC")){
					%> <%=cac %></td><%
				}%><%else if(oafield.equals("LIC")){
					%> <%=lic%></td><%	
				}%><%else if(oafield.equals("LEC")){
					%> <%=lec%></td><%		
				}%>
				<td><%if(oaNo.substring(0,2).equals("OA")){
						%> <%=oa%></td><%
				}%><%else if(oaNo.substring(0,2).equals("VR")){
						%> <%=vr%></td><%	
				}%>
				<td><%if(oaNo.substring(0,2).equals("OA")){
						%> <input Type="button" class="cgoalinkbutton" value="결과보기" data-num="<%=oaNo%>"></td><%
				}%><%else if(oaNo.substring(0,2).equals("VR")){
						%> <input Type="button" class="cgvrlinkbutton" value="결과보기" data-num="<%=oaNo%>"></td><%	
				}%>		
			</tr>
			<% 			
				}
			%>
			<% }%>
		</table>
		<br>
		<div align="center">
		<input Type="button" id="cgpageleftbutton" value="◀">
		<%
		for(int i=1 ; i<=cgpageCount;i++){
		%>
		<span class="cgpageNobutton" data-num="<%=i%>"><%=i%></span>
		<%
		}
		%>
		<input Type="button" id="cgpagerightbutton" value="▶">
		</div> 
	</div>
	<div id="dd">
		<h2>가치관설정</h2>
		<input Type="button" id="vsupdatebutton" name="vsupdatebutton" value="수정하기">
		<%if(vvo !=null){
			String vsfirst =vvo.getVsFirst();
			String vssecond =vvo.getVsSecond();
			String vsthird =vvo.getVsThird();
			%>
			<img alt="데이터가 없습니다." src="/image/<%=vsfirst%>.png">
			<img alt="데이터가 없습니다." src="/image/<%=vssecond%>.png">
			<img alt="데이터가 없습니다." src="/image/<%=vsthird%>.png">
			<%
		}else{
			%>
			가치관 설정을 하지 않으셨습니다.
			<%
		}
		 %>
	</div>
	<form id="linkForm" name="linkForm">
		<input Type="hidden" id="ssNo" name="ssNo" value="<%=svo.getSsNo()%>" />
		<input Type="hidden" id="npNo" name="npNo" />
		<input Type="hidden" id="oaNo" name="oaNo" />
		<input Type="hidden" id="vrNo" name="vrNo" />
		<input Type="hidden" id="vrNo" name="vrNo" />
	</form>
	<form id="pageNoForm">
		<input Type="hidden" id="ssNo" name="ssNo" value="<%=svo.getSsNo()%>" />
		<input type="hidden" id="brpageNo" name="brpageNo" value="<%=svo_.getBrpageNo()%>">
		<input type="hidden" id="cgpageNo" name="cgpageNo" value="<%=svo_.getCgpageNo()%>">
		<input Type="hidden" id="cdyearNo" name="cdyearNo" value="<%=svo_.getCdyearNo()%>"/>
		<input Type="hidden" id="bryearNo" name="bryearNo" value="<%=svo_.getBryearNo()%>"/>
		<input Type="hidden" id="cgyearNo" name="cgyearNo" value="<%=svo_.getCgyearNo()%>"/>
	</form>
</body>
</html>
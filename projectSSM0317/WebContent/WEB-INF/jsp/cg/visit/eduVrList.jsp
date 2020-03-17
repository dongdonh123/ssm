<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "ssm.cg.vo.Edu_ScheduleVO" %>
<%@ page import = "ssm.cg.vo.VisitCounsel_EduRsvVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object pageObj = request.getAttribute("page");
	Object dataObj = request.getAttribute("data");
	System.out.println(dataObj);
	VisitCounsel_EduRsvVO data_vo = (VisitCounsel_EduRsvVO)dataObj;
	Object rsvObj = request.getAttribute("RsvList");
	ArrayList<Edu_ScheduleVO> rsvList = (ArrayList<Edu_ScheduleVO>)rsvObj;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<link rel="stylesheet" href="/common/ssmCss/default.css">
		<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
		<script src="/common/ssmJs/index.js"></script>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="/include/fullcalendar/moment.min.js"></script>
		<script>
			$(document).ready(function(){
				
				// ���� ��¥���� ����
				var date = new Date();
				var today = moment(date).format('YYYY-MM-DD');

				
				// �ְ�����ǥ ���ݱ�
				$("#calBtn").click(function(){
					$("#calendar").show();
				});
				
				$("#calClose").click(function(){
					$("#calendar").hide();
				});
				
				// ����/ ��� ���� ���� ����
				$("select").change(function(){
					var vrNo = $(this).parents("tr").attr("vrNo");
					$("#vrNo").val(vrNo);
					var vrStatus = $(this).val();
					var vrDate = $(this).parents("tr").children().eq(2).html();
					var vrTime = $(this).parents("tr").children().eq(3).html();
					var ssName = $(this).parents("tr").children().eq(4).html();
				
					// ������� ���� ��¥���� �̷��϶� �Ϸ� ���� �Ұ�
					if(vrStatus == "04"){
						if(vrDate > today){
							alert("����� �����Դϴ�. ����� �Ϸ� �Ŀ� �����ϼ���.");
							return;
						}
					}
					
					// ���� ���� ajax
					$.ajax({
						url : '/eduSchedule/vrStatusUpdate.ssm',
						type : 'POST',
						headers : {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType : "text",
						data : JSON.stringify({
							vrNo : vrNo,
							vrTime : vrTime,
							vrDate : vrDate,
							vrStatus : vrStatus
						}),
						success : function(result){
							if(result=="SUCCESS"){
								alert("���� ���� �Ϸ�");
									window.location.reload();
							} else {
								alert("����ȵ�");
							}
						},
						error : function(){
							alert ("����");
						}
					});
				});
				
				// Ű���� ��ȸ
				<%
				if(data_vo.getKeyword() != "" && data_vo.getKeyword() != null){
				%>
					$("#keword").val("<%=data_vo.getKeyword() %>");
				<%
				}
				%>
				
				$("#vrSearchBtn").click(function(){
					goPage(1);
				});
			}); // ready
			
			function goPage(page){
				$("#page").val(page);
				$("#pagingForm").attr({
					"method":"get",
					"aciton":"/eduSchedule/eduRsvList.ssm"
				});
				$("#pagingForm").submit();
			}
		</script>
		
		<title>�湮��� ����ȭ��</title>
	</head>
	<body>
		<div id="wrap">
			<header include-html="/common/ssmMain/header_.jsp"></header>
			<nav include-html="/common/ssmMain/ssmCategory/nav.html"></nav>
			<section>
				<div class="container">
					<div id="calendar">
						<jsp:include page="eduCalendar.jsp"></jsp:include>
						<p><input type="button" id="calClose" value="�޷�����"/>
						4�� ���� ������ ��ȸ�˴ϴ�. <br>
					</div>
					<%@include file="rsvDetailModal.jsp"%>
					<div id="rsv">
						<!-- �������� �̵� form -->
						<form id="goRsvDetail" name="rsvDetail">
							<input type="hidden" id="vrNo" name="vrNo" />
						</form>
						<!-- ����¡/ �˻� form -->
						<form id="pagingForm">
							<input type="hidden" id="page" name="page" value=<%=pageObj%>/>
							<table border="1">
								<tr>
									<th>��� �о�</th>
									<td id="keyword">
										<input type="radio" name="keyword" value="���λ��" />���λ��
										<input type="radio" name="keyword" value="��Ȱ���" />��Ȱ���
										<input type="radio" name="keyword" value="�н����" />�н����
									</td>
									<td>
										<input type="button" id="vrSearchBtn" name="vrSearchBtn" value="�˻�" />
									</td>
								</tr>
							</table>
						</form>
						<table id="rsvTable" border="1">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>�����ȣ</th>
									<th>��������</th>
									<th>��������</th>
									<th>�������ð�</th>
									<th>����л���</th>
									<th>���о�</th>
									<th>����������</th>
									<th>�����º���</th>
								</tr>
							</thead>
			<%
							if(rsvList != null){
								for(int i = 0; i < rsvList.size(); i++){
									Edu_ScheduleVO esvo = rsvList.get(i);
			%>
							<tbody>
								<tr vrNo=<%=esvo.getVrNo() %> >
									<td class="goDetail"><%=esvo.getVrNo()%></td>
									<td class="goDetail"><%=esvo.getVrInsertdate()%></td>
									<td class="goDetail"><%=esvo.getVrDate()%></td>
									<td class="goDetail"><%=esvo.getVrTime()%></td>
									<td class="goDetail"><%=esvo.getSsNo()%></td>
									<td class="goDetail"><%=esvo.getVrField()%></td>
									<td class="goDetail"><%=esvo.getCode()%></td>
									<td>
										<select id="vrStatus" name="vrStatus">
											<option value="01" <%if(esvo.getVrStatus().equals("01")){%>selected<%}%>>���</option>
											<option value="02" <%if(esvo.getVrStatus().equals("02")){%>selected<%}%>>����</option>
											<option value="03" <%if(esvo.getVrStatus().equals("03")){%>selected<%}%>>�ݷ�</option>
											<option value="04" <%if(esvo.getVrStatus().equals("04")){%>selected<%}%>>�Ϸ�</option>
										</select>
									</td>
								</tr>
			<%
							}
						} else {
			%>
						<tr><td colspan="7" align="center">������ �����ϴ�.</td></tr>
			<%				
						}
			%>
							</tbody>
						</table>
						<input type="button" id="calBtn" value="�޷���ġ��" />
						���ð��� �����Ϸ��� �޷��� ��ġ�ʽÿ�.
						<%@include file="paging.jsp" %>
					</div>
				</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>    
<%@ page import="java.util.List" %>    
   
<%
	//����¡������ ����
	request.setCharacterEncoding("EUC-KR");
	NoticeBoardVO searchdata =(NoticeBoardVO)request.getAttribute("Searchdata");
	int pageCount = 0;
	List<NoticeBoardVO> nblist =(List<NoticeBoardVO>)request.getAttribute("nblist");
	int listSize= nblist.size();
	if(listSize >0){
		NoticeBoardVO nvo_ = nblist.get(0);
		double totalCount = (double)Integer.parseInt(nvo_.getTotalCount()); 
		int pagelistSize = (int)request.getAttribute("listSize");
		double dval = (double)pagelistSize;
		pageCount = (int)Math.ceil(totalCount/dval); //pageCount ���� ���
		System.out.println("pageCount>>>:"+ pageCount); //1
		System.out.println("totalCount>>>:"+ totalCount); //10
		System.out.println("pagelistSize>>>:"+ pagelistSize);
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	
	
	<!-- <link rel="stylesheet" href="/include/css/ssmTheme.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.less.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.min.css.css">
	<link rel="stylesheet" href="/include/css/ssmVariables.less.css"> -->
	
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=1">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=1"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		alert("zsz");
		/*�˻� ����� ����� ������ ó�� �̺�Ʈ*/
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("��ü ������ ��ȸ�մϴ�.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		/*�˻� ��ư Ŭ�� �� ó�� �̺�Ʈ*/
		$("#searchBut").click(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/noticeboard/nblist.ssm"
			});
			$("#f_search").submit();
		});
		
		//���Է� ��ư�������� �̺�Ʈ
		$("#nbinsertbutton").click(function(){
			$(location).attr('href',"/noticeboard/nbwirteform.ssm");
		});
		
		/*���� Ŭ���� �� ������ �̵��� ���� ó�� �̺�Ʈ*/
		$(".nbDetail").click(function(){
			var nbNo = $(this).parents("tr").attr("data-num");
			$("#nbNo").val(nbNo);
			$("#nbdetailForm").attr('action',"/noticeboard/nbDetail.ssm")
			.submit();
		});
		
		//��������ư�������� �̺�Ʈ
		$(".pageNobutton").click(function(){
			var pageNo = $(this).attr("data-num");
			$("#pageNo").val(pageNo);
			$("#pageNoForm").attr('action',"/noticeboard/nblist.ssm")
			.submit();
		});
		
		//Ű����˻��� �˻��ѳ��� �����ϰ��ϴ� ����
		var keyword2 = "<%=searchdata.getKeyword()%>";
		var search2 = "<%=searchdata.getSearch()%>";
		if(keyword2 != "null" && keyword2 != ""){ // Ű���� �����Ͱ� ������ ����
			$("#keyword").val(keyword2);
			$("#search").val(search2);
		}
		
	});
	</script>
	
	
	
	<style type="text/css">
	
		/* ��ü div */
		#boardContainer {
					width:1050px;
					height:677px;
			      	float:left;
			      	font-size:15px;
		}
		
		/* ���� div */
		.sub_title_wrap {
			background:#394264;
			height:50px;
	   		margin-right:10px;
	      	margin-bottom:10px;
	      	margin-left:10px;
	      	
      	 	font-size: 28px;
		    line-height: 55px;
		    text-indent: 20px;
		    font-weight: bold;
		    color: #fff;
		
		}
		
		/* ���� div�� �۾� �������� �ٲ��� */
		a[target="a_"]{	
			color: #fff; font-size: 15px;
		
		}
		
		/* �����̹��� div */
		#mainimage {
			background:#394264;
			margin-right:10px;
			margin-left:10px;
		}
		
		/* �˻����� */
		#pageandseach {
			 width: 100%;
			 margin-bottom: 10px;
		}
		
		/* �Խ��� ���� */
		#boardlist {
			height:354px;
			border: 10px solid #394264;
			background:#394264;
			margin-top:1px;
			margin-right:10px;
			margin-left:10px;
			margin-bottom: 20px;
		}	
		
		/* �Խ��ǳ��� �� th �ٲ��� */
		table.list thead th {
	    background: #50597b;
	    height: 40px;
	    text-align: center;
	    vertical-align: middle;
	    color: #fff;
	    margin:0px;
}

		table.list{
	    width:100%;
	    height:286px;
}

		
		</style>
	
</head>
<body>

<div id="wrap">
	<!-- ��� -->
	<header include-html="/common/ssmMain/header_.jsp?ver=2"></header>
	
	<!-- �׺���̼� -->
	<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
	
	<!-- �����̳� -->
	<div id="boardContainer">
	
		<!-- ���� �� -->
		<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"></section>
		
		<!-- �̹��� ��  -->
		<div id="mainimage"><img alt="�����;���" src="/image/nbmain.gif"></div>
		
		<!-- �Խ���  -->
		<div id="boardlist">
			<input type="button" style="float:right;";id="nbinsertbutton" name="nbinsertbutton" value="�۾���">
			
			<!-- �˻� �κ� -->
			<div id="pageandseach">
				<form id="f_search" name="f_search" style="text-align:left">
					<label>�˻�����</label>
					<select id="search" name="search">
						<option value="all">��ü</option>
						<option value="nbTitle">����</option>
						<option value="nbContents">����</option>
						<option value="ttName">�ۼ���</option>
					</select>
					
					<input type="text" name="keyword" id="keyword" value="�˻���Է��ϼ���" />
					<input type="button" value="�˻�" id="searchBut" />
				</form>
			</div>
			
			<div id="board_contents" style="margin-bottom:10px;">
			<table class="list">
					<colgroup>
						<col width="15%" />
						<col width="25%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead style="text-align: center;">
						<tr>
							<th>�۹�ȣ</th>
							<th>������</th>
							<th>�ۼ���</th>
							<th>��ȸ��</th>
							<th>�ۼ���</th>
							<th>÷������</th>
						</tr>
					</thead>
					<tbody>
						<%
						if(nblist.size()==0){
						%>
						<tr>
							<td>0</td>
							<td>�ۼ��� ���� �����ϴ�.</td>
							<td></td>
							<td></td>
						</tr>
						<%
						}else{
							int count = nblist.size();
							for (int i=0; i<count; i++){
								NoticeBoardVO nvo = nblist.get(i);
								String no = nvo.getNbNo().substring(4);
						%>	
							<tr data-num=<%=nvo.getNbNo() %>>
								<td><%=no%> </td>
								<td><span class="nbDetail"><%=nvo.getNbTitle() %></span></td>
								<td><%=nvo.gettMembervo().getTtName() %></td>
								<td>0</td>
								<td><%=nvo.getNbInsertdate() %></td>
								<td><img src="/image/downloadimg.jpg" width="20" height="20"></td>
							</tr>
					</tbody>
					<% }%>
				</table>
				</div>
				<% 
				}
				%>
				<form id="pageNoForm">
				<input type="hidden" id="pageNo" name="pageNo" value="1">
				<input type="hidden" id="listSize" name="listSize" value="10">
				<input type="hidden" name="search" value="<%=searchdata.getSearch()%>">
				<input type="hidden" name="keyword" value="<%=searchdata.getKeyword()%>">
				</form>
				<input Type="button" id="cgpageleftbutton" value="��">
				<%
				for(int i=1 ; i<=pageCount;i++){
				%>
				<span class="pageNobutton" data-num="<%=i%>" ><%=i%></span>
				<%}%>				
				<input Type="button" id="cgpageleftbutton" value="��">
				
				<!-- �� ������ �̵��� ���� form -->
				<form name="nbdetailForm" id="nbdetailForm">
				<input type="hidden" name="nbNo" id="nbNo">
				</form>
		</div>
	</div> <!-- �����̳� DIV �� -->
	
			
		
	    <footer include-html="/common/ssmMain/footer.html"></footer>
</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>
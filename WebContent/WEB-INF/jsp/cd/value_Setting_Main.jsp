<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cd.vo.Value_SettingVO,java.util.List" %>
<% request.setCharacterEncoding("EUC-KR");
	String ssNo="";
	String vsFirst="";
	String vsSecond="";
	String vsThird="";
	String isud = "";
	Value_SettingVO vsvo = new Value_SettingVO();
	Object obj = request.getAttribute("list");
	String resultStr= (String)request.getAttribute("resultStr");
	if(obj!=null&&obj!=""){
	 List list = (List)request.getAttribute("list");
	 vsvo = (Value_SettingVO)list.get(0);
	 ssNo=vsvo.getSsNo();
	 vsFirst=vsvo.getVsFirst();
	 vsSecond=vsvo.getVsSecond();
	 vsThird=vsvo.getVsThird();
	isud = "U";
	}else{
		isud = "I";
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
		alert("����");
		if("<%=resultStr%>" != 'null') alert("<%=resultStr%>");
		
		$("#ISUD").val("<%=isud%>");
		if("<%=vsFirst%>"=="HE") $("#select1").val("����");
		if("<%=vsFirst%>"=="CH") $("#select1").val("��ȭ");
		if("<%=vsFirst%>"=="SU") $("#select1").val("����");
		if("<%=vsFirst%>"=="LE") $("#select1").val("����");
		if("<%=vsFirst%>"=="MN") $("#select1").val("��");
		if("<%=vsFirst%>"=="CO") $("#select1").val("����");
		if("<%=vsFirst%>"=="CR") $("#select1").val("â��");
		if("<%=vsFirst%>"=="KN") $("#select1").val("����");
		
		if("<%=vsSecond%>"=="HE") $("#select2").val("����");
		if("<%=vsSecond%>"=="CH") $("#select2").val("��ȭ");
		if("<%=vsSecond%>"=="SU") $("#select2").val("����");
		if("<%=vsSecond%>"=="LE") $("#select2").val("����");
		if("<%=vsSecond%>"=="MN") $("#select2").val("��");
		if("<%=vsSecond%>"=="CO") $("#select2").val("����");
		if("<%=vsSecond%>"=="CR") $("#select2").val("â��");
		if("<%=vsSecond%>"=="KN") $("#select2").val("����");
		
		if("<%=vsThird%>"=="HE") $("#select3").val("����");
		if("<%=vsThird%>"=="CH") $("#select3").val("��ȭ");
		if("<%=vsThird%>"=="SU") $("#select3").val("����");
		if("<%=vsThird%>"=="LE") $("#select3").val("����");
		if("<%=vsThird%>"=="MN") $("#select3").val("��");
		if("<%=vsThird%>"=="CO") $("#select3").val("����");
		if("<%=vsThird%>"=="CR") $("#select3").val("â��");
		if("<%=vsThird%>"=="KN") $("#select3").val("����");
		
		$("#saveValueSetting").click(function(){
			var valueK = $("#select1").val();
			if(valueK=="����") var valueE = "HE";
			if(valueK=="��ȭ") var valueE = "CH";
			if(valueK=="����") var valueE = "SU";
			if(valueK=="����") var valueE = "LE";
			if(valueK=="��") var valueE = "MN";			
			if(valueK=="����") var valueE = "CO";
			if(valueK=="â��") var valueE = "CR";
			if(valueK=="����") var valueE = "KN";
			$("#select1").val(valueE);

			var valueK2 = $("#select2").val();
			if(valueK2=="����") var valueE2 = "HE";
			if(valueK2=="��ȭ") var valueE2 = "CH";
			if(valueK2=="����") var valueE2 = "SU";
			if(valueK2=="����") var valueE2 = "LE";
			if(valueK2=="��") var valueE2= "MN";			
			if(valueK2=="����") var valueE2 = "CO";
			if(valueK2=="â��") var valueE2 = "CR";
			if(valueK2=="����") var valueE2 = "KN";
			$("#select2").val(valueE2);
			
			var valueK3 = $("#select3").val();
			if(valueK3=="����") var valueE3 = "HE";
			if(valueK3=="��ȭ") var valueE3 = "CH";
			if(valueK3=="����") var valueE3 = "SU";
			if(valueK3=="����") var valueE3 = "LE";
			if(valueK3=="��") var valueE3= "MN";			
			if(valueK3=="����") var valueE3 = "CO";
			if(valueK3=="â��") var valueE3 = "CR";
			if(valueK3=="����") var valueE3 = "KN";
			$("#select3").val(valueE3);
			

			$("#select_Info").attr("action","/value_Setting/saveValueSetting.ssm").submit();
		});
		
		
		$("#HE").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		$("#CH").click(function(){
			//alert("��ȭŬ��");
			select("��ȭ");
		});
		
		$("#SU").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
		$("#LE").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
		$("#MN").click(function(){
			//alert("��Ŭ��");
			select("��");
		});
		
		$("#CO").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
		$("#CR").click(function(){
			//alert("â��Ŭ��");
			select("â��");
		});
		
		$("#KN").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
	});
	
	function select(vs){ 
		for(var i =1 ; i<4;i++){
			if($("#select"+i).val()== vs){
				$("#select"+i).val("");
				//alert("�̹� �ִ°��� ����Կ�");
				return;
			}
		}
		//alert("select�Լ� ����");
		if($("#select1").val()==""){
			//alert("select1����!!");
			$("#select1").val(vs);
			//alert($('#select1').val());
			return;
		}

		if($("#select2").val()==""){
			//alert("select2����!!");
	
			$("#select2").val(vs);
			//alert($('#select2').val());
			return;
		}
		
		if($("#select3").val()==""){
			//alert("select3����!!");
			$("#select3").val(vs);
			//alert($('#select3').val());
			return;
		}
		
		
		
		alert("3�����̻� �����Ҽ� �����ϴ�");
		return;
		
		
		
					
	}
</script>

</head>
<body>

	<form id="select_Info" name="select_Info">
		<table border='1'>
			<tr>
				<td align='center'>1����</td>
				<td align='center'>2����</td>
				<td align='center'>3����</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="select1" name="vsFirst" readonly >
				</td>
				<td>
					<input type="text" id="select2" name="vsSecond" readonly >
				</td>		
				<td>
					<input type="text" id="select3" name="vsThird" readonly >
				</td>
			</tr>
		</table>
		<input type="hidden" id="ISUD" name="ISUD">
	</form>
	
		
	<table>
		<tr>
			<td>
				<button class="HE" type="button" id="HE" name="HE" value="����" ><img src="/images/HE.png"></button>
			</td>
			<td>
				<button class="CH" type="button" id="CH" name="CH" value="��ȭ" ><img src="/images/CH.png"></button>
			</td>
			<td>
				<button class="SU" type="button" id="SU" name="SU" value="����" ><img src="/images/SU.png"></button>
			</td>
			<td>
				<button class="LE" type="button" id="LE" name="LE" value="����" ><img src="/images/LE.png"></button>
			</td>
		</tr>
		<tr>
			<td>
				<button class="MN" type="button" id="MN" name="MN" value="��" ><img src="/images/MN.png"></button>
			</td>
			<td>
				<button class="CO" type="button" id="CO" name="CO" value="����" ><img src="/images/CO.png"></button>
			</td>
			<td>
				<button class="CR" type="button" id="CR" name="CR" value="â��" ><img src="/images/CR.png"></button>
			</td>
			<td>
				<button class="KN" type="button" id="KN" name="KN" value="����" ><img src="/images/KN.png"></button>
			</td>
		</tr>
	</table>


	


	<input type="button" id="saveValueSetting" name="saveValueSetting" value="�����ϱ�">
	</body>
</html>
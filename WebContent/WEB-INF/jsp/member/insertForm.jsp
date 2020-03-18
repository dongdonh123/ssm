<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.mi.member.vo.SMemberVO" %>
<%@ page import="ssm.mi.member.vo.SMemberGrVO" %>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%
	/*String grClass   = "";
	String grNum     = "";
	String grTeacher = "";
	Object obj = request.getAttribute("fm");
	Object obj2 = request.getAttribute("jr");
	Object obj3 = request.getAttribute("sr");
	if(obj != null){
		SMemberGrVO smgvo = (SMemberGrVO)request.getAttribute("fm");
		grClass   = smgvo.getFmClass();   // ��
		grNum     = smgvo.getFmNum();     // ��ȣ
		grTeacher = smgvo.getFmTeacher(); // ���Ӽ����� �̸�
	}
	if(obj2 != null){
		SMemberGrVO smgvo = (SMemberGrVO)request.getAttribute("jr");
		grClass   = smgvo.getJrClass();   // ��
		grNum     = smgvo.getJrNum();     // ��ȣ
		grTeacher = smgvo.getJrTeacher(); // ���Ӽ����� �̸�
	}
	if(obj3 != null){
		SMemberGrVO smgvo = (SMemberGrVO)request.getAttribute("sr");
		grClass   = smgvo.getSrClass();   // ��
		grNum     = smgvo.getSrNum();     // ��ȣ
		grTeacher = smgvo.getSrTeacher(); // ���Ӽ����� �̸�
	}*/
	
	SMemberVO smvo     = (SMemberVO)request.getAttribute("data");
	String    ssNo     = smvo.getSsNo();         // �й�
	String    ssBirth  = smvo.getSsBirth();      // �������
	String    ssPn     = smvo.getSsPn();         // �޴�����ȣ
	String    ssName   = smvo.getSsName();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertForm.jsp(ȸ������)</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$("#insert").click(function(){
					/*var form = $("#i_form")[0];
					var formData = new FormData(form);
					formData.append("file",$("#ssImage").val());
					formData.append("text",$("#ssNo").val());
					$.ajax({
						url : "/smember/fileUpload.ssm",
						processData : false,
                        contentType : false,
						type : "post",
						data : formData,
						success : function(result){
							console.log("success");
						},
						error : function(){
							console.log("error");
						}
					});*/
					
					$("#i_form")
					.attr("action","/smember/insertInfo.ssm")
					.submit();
					
				});
				
			});
		</script>
	</head>
	<body>
		<form name="i_form" id="i_form" encType="multipart/form-data" method="post">
			<input type="hidden" name="ssNo" id="ssNo" value="<%=ssNo%>">
			<input type="hidden" name="ssGender" id="ssGender" value="7">
			<table border="1" align="center">
				<tr>
					<td>����</td>
					<td><input type="file" id="ssImage" name="ssImage"></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td>
						<input type="text" id="ssId" name="ssId">
						<input type="button" value="�ߺ�Ȯ��">
					</td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" id="ssPw" name="ssPw"></td>
				</tr>
				<tr>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" id="ssPw2" name="ssPw2"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><%=ssName%></td>				 
				</tr>
				<tr>
					<td>�������</td>
					<td><%=ssBirth%></td>
				</tr>
				<tr>
					<td>�޴�����ȣ</td>
					<td><%=ssPn %></td>
				</tr>
				<tr>
					<td>�̸���</td>
					<td>
						<input type="text" name="ssEmail" id="ssEmail">
						<select name="ssEmail2" id="ssEmail2">
							<option>�����Է�</option>
							<option value="@gmail.com">@gmail.com</option>
							<option value="@naver.com">@naver.com</option>
							<option value="@daum.net">@daum.net</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>�г�,��,��ȣ</td>
					<td>
						<select name="grGrade" id="grGrade">
							<option value="FM">1�г�</option>
							<option value="JR">2�г�</option>
							<option value="SR">3�г�</option>
						</select>
						<select name="grClass" id="grClass">
							<option value="01">1��</option>
							<option value="02">2��</option>
							<option value="03">3��</option>
							<option value="04">4��</option>
							<option value="05">5��</option>
							<option value="06">6��</option>
							<option value="07">7��</option>
							<option value="08">8��</option>
							<option value="09">9��</option>
							<option value="10">10��</option>
							<option value="11">11��</option>
							<option value="12">12��</option>
						</select>
						<select name="grNum" id="grNum">
							<option value=01>1��</option>
							<option value=02>2��</option>
							<option value=03>3��</option>
							<option value=04>4��</option>
							<option value=05>5��</option>
							<option value=06>6��</option>
							<option value=07>7��</option>
							<option value=08>8��</option>
							<option value=09>9��</option>
							<option value=10>10��</option>
							<option value=11>11��</option>
							<option value=12>12��</option>
							<option value=13>13��</option>
							<option value=14>14��</option>
							<option value=15>15��</option>
							<option value=16>16��</option>
							<option value=17>17��</option>
							<option value=18>18��</option>
							<option value=19>19��</option>
							<option value=20>20��</option>
							<option value=21>21��</option>
							<option value=22>22��</option>
							<option value=23>23��</option>
							<option value=24>24��</option>
							<option value=25>25��</option>
							<option value=26>26��</option>
							<option value=27>27��</option>
							<option value=28>28��</option>
							<option value=29>29��</option>
							<option value=30>30��</option>
							<option value=31>31��</option>
							<option value=32>32��</option>
							<option value=33>33��</option>
							<option value=34>34��</option>
							<option value=35>35��</option>
							<option value=36>36��</option>
							<option value=37>37��</option>
							<option value=38>38��</option>
							<option value=39>39��</option>
							<option value=40>40��</option>
							<option value=41>41��</option>
							<option value=42>42��</option>
							<option value=43>43��</option>
							<option value=44>44��</option>
							<option value=45>45��</option>
							<option value=46>46��</option>
							<option value=47>47��</option>
							<option value=48>48��</option>
							<option value=49>49��</option>
							<option value=50>50��</option>
							<option value=51>51��</option>
							<option value=52>52��</option>
							<option value=53>53��</option>
							<option value=54>54��</option>
							<option value=55>55��</option>
							<option value=56>56��</option>
							<option value=57>57��</option>
							<option value=58>58��</option>
							<option value=59>59��</option>
							<option value=60>60��</option>
							<option value=61>61��</option>
							<option value=62>62��</option>
							<option value=63>63��</option>
							<option value=64>64��</option>
							<option value=65>65��</option>
							<option value=66>66��</option>
							<option value=67>67��</option>
							<option value=68>68��</option>
							<option value=69>69��</option>
							<option value=70>70��</option>
							<option value=71>71��</option>
							<option value=72>72��</option>
							<option value=73>73��</option>
							<option value=74>74��</option>
							<option value=75>75��</option>
							<option value=76>76��</option>
							<option value=77>77��</option>
							<option value=78>78��</option>
							<option value=79>79��</option>
							<option value=80>80��</option>
							<option value=81>81��</option>
							<option value=82>82��</option>
							<option value=83>83��</option>
							<option value=84>84��</option>
							<option value=85>85��</option>
							<option value=86>86��</option>
							<option value=87>87��</option>
							<option value=88>88��</option>
							<option value=89>89��</option>
							<option value=90>90��</option>
							<option value=91>91��</option>
							<option value=92>92��</option>
							<option value=93>93��</option>
							<option value=94>94��</option>
							<option value=95>95��</option>
							<option value=96>96��</option>
							<option value=97>97��</option>
							<option value=98>98��</option>
							<option value=99>99��</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" name="insert" id="insert" value="�����ϱ�">
						<input type="button" name="main" id="main" value="���ΰ���">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
function goCareerDesign(){
	alert("���� �Ⱥ���");
	location.href = "/�����/�����.ssm";
}

function goCounseling(){
	location.href = "/onlineApplication/cgMain.ssm";
}

function goBigyogwaRecommend(){
	alert("���� �Ⱥ���");
	location.href = "/�����/�����.ssm";
}

function goEportfolio(sessionAU, you){
	alert("�����"+you);
	if(sessionAU ==1){
		location.href = "/eportfolio/student.ssm";
	}
	if(sessionAU==2){
		location.href = "/eportfolio/teacher.ssm";
	}
	
}

function goCommunity(){
	location.href = "/noticeboard/nblist.ssm";
}

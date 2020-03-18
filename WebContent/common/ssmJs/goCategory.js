function goCareerDesign(){
	alert("아직 안붙임");
	location.href = "/어디어디/어디어디.ssm";
}

function goCounseling(){
	location.href = "/onlineApplication/cgMain.ssm";
}

function goBigyogwaRecommend(){
	alert("아직 안붙임");
	location.href = "/어디어디/어디어디.ssm";
}

function goEportfolio(sessionAU, you){
	alert("당신은"+you);
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

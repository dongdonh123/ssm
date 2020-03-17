<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		 <script>
		 $(document).ready(function(){
		 	var vrStatus = "04"
			 $("#notiBtn").click(function(){
				 var message = "상담이 예약되었습니다.";
				 var notification = new Notification(message);
				 
				 setTimeout(function(){
					notification.close(); 
				 }, 1000);
			 });
		 });
		 </script>
	</head>
	<body>
	</body>
	<div id="notiBlock">
		<span>
			<button id="notiBtn"></button>
		</span>
	</div>
</html>
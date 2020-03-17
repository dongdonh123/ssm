<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.np.vo.Non_CenterVO"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.Map"%>
<% 
		Object obj1 = request.getAttribute("ncList"); 
		System.out.println("obj >>> : " +obj1);
		String result="";
		

		ArrayList<Non_CenterVO> aList = (ArrayList<Non_CenterVO>) obj1;

%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="EUC-KR">
	    <title>ㄴㄴㄴㄴasdㄴ3333</title>
	    <script src="/include/js/jquery-1.11.3.min.js"></script>
	    <style type="text/css">
		
		table.infowindo {
		  font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
		  border: 1px solid #52A4E6;
		  width: 100%
		  text-align: center;
		  border-collapse: collapse;
		}
		table.infowindo td, table.infowindo th {
		  border: 0px solid #AAAAAA;
		  padding: 3px 2px;
		}
		table.infowindo tbody td {
		  font-size: 13px;
		}
		table.infowindo thead {
		  background: #1C6EA4;
		  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
		  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
		  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
		}
		table.infowindo thead th {
		  font-size: 15px;
		  font-weight: bold;
		  color: #FFFFFF;
		  text-align: center;
		}
		table.infowindo tfoot {
		  font-size: 10px;
		  font-weight: bold;
		  border-top: 1px solid #444444;
		  background: #1C6EA4;
		  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
		  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
		  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
		}
		table.infowindo tfoot td {
		  font-size: 10px;
		}
		table.infowindo tfoot .links {
		  text-align: left;
		}
		table.infowindo tfoot .links a{
		  display: inline-block;
		  background: #35A490;
		  color: #FFFFFF;
		  padding: 2px 8px;
		  border-radius: 5px;
		}
		
		</style>
	</head>
	<body>
		
		<div id="map" style="width:50%;height:500px;"></div>		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8da6b2781270c75565f674a8526d670&libraries=services"></script>
		<script>
	     
		var mapContainer = document.getElementById('map');
		var mapOption = {
		    center: new daum.maps.LatLng(37.5791977,127.0020768),
		    level: 9
		};  

		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		//주소->위도경도
		var geocoder = new daum.maps.services.Geocoder();

		//넣을 데이터 배열로 
		var listData = [
		<% 		for(int i =0; i<aList.size(); i++){  
				Non_CenterVO ncVo = aList.get(i);
				System.out.println("getNcName >> : " + ncVo.getNcName());
		%>           
		                {
		                	name: '<%=ncVo.getNcName()%>', 
		                	group : '<%=ncVo.getNcPosition()%>',
		                	phone : '<%=ncVo.getNcTel()%>',
		                	email : '<%=ncVo.getNcEmail()%>',
		            		address:'<%=ncVo.getNcAddress()%>',
		            		homePage :'<%=ncVo.getNcHomepage()%>'
		                },
		                
		<%			} //for끝%>	]

		listData.forEach(function(address, index) {
		    geocoder.addressSearch(listData[index].address, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		            var marker = new daum.maps.Marker({
		                map: map,
		                position: coords
		                , clickable: true
		            });
		            var infowindow = new daum.maps.InfoWindow({
		                content: '<table class="infowindo"><thead><tr><th colspan="2">'+listData[index].name
		                	+'</th></tr></thead><tfoot><tr><td colspan="2"><div class="links"><a class="active" href="'
		                	+listData[index].homePage+'">홈페이지</a></div></td></tr></tfoot><tbody><tr><td>소속</td><td>'+
		                	listData[index].group+'</td></tr><tr><td>연락처</td><td>'
		                	+listData[index].phone+'</td></tr><tr><td>담당자 이메일</td><td>'
		                	+listData[index].email+'</td></tr><tr><td>주소</td><td>'
		                	+listData[index].address+'</td></tr></tbody></table>'	
		                	
		                	
		                ,removable : true	
		                //,disableAutoPan: true
		            });
		            //infowindow.open(map, marker);
		            kakao.maps.event.addListener(marker, 'click', function() {
		                // 마커 위에 인포윈도우를 표시합니다
		                infowindow.open(map, marker);  
		          	});
		        }//if
		    });
		});
		

		</script>
	</body>
</html>
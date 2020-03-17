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
	    <title>��������asd��3333</title>
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
		
		// �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
		// kakao.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		//�ּ�->�����浵
		var geocoder = new daum.maps.services.Geocoder();

		//���� ������ �迭�� 
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
		                
		<%			} //for��%>	]

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
		                	+listData[index].homePage+'">Ȩ������</a></div></td></tr></tfoot><tbody><tr><td>�Ҽ�</td><td>'+
		                	listData[index].group+'</td></tr><tr><td>����ó</td><td>'
		                	+listData[index].phone+'</td></tr><tr><td>����� �̸���</td><td>'
		                	+listData[index].email+'</td></tr><tr><td>�ּ�</td><td>'
		                	+listData[index].address+'</td></tr></tbody></table>'	
		                	
		                	
		                ,removable : true	
		                //,disableAutoPan: true
		            });
		            //infowindow.open(map, marker);
		            kakao.maps.event.addListener(marker, 'click', function() {
		                // ��Ŀ ���� ���������츦 ǥ���մϴ�
		                infowindow.open(map, marker);  
		          	});
		        }//if
		    });
		});
		

		</script>
	</body>
</html>
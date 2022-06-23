<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8997f643d844febefc06e44b7abe06ae"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
   
   function tableDelete(){
      $('.DesBox').hide();   
      
   }
	function tableOn(){
		var id = document.getElementById('variable').innerHTML;
		$(id).show();
	}
	
	
   function showTable(station, id) {
	  document.getElementById('variable').innerHTML = id;
      
      $('.DesBox').hide();
      
      
      
      
      $(station).show();
      map.setLevel(10);
      console.log(station);
      console.log(typeof (station));

      var listlng = new Array();
      var listlat = new Array();
      var listtype = new Array();

      <c:forEach var="list" items="${list}" varStatus="status">
      listlng.push("${list.getLng()}");
      listlat.push("${list.getLat()}");
      listtype.push("${list.getType_num()}");
      </c:forEach>

      if (station == "#seoul") {
         hideMarkers();
         for (var i = 0; i < listlng.length; i++) {
            addMarker(new kakao.maps.LatLng(listlat[i], listlng[i]));
         }
         panTo(37.5638561,126.9740863);
      } else if (station == "#table1") {
         hideMarkers();
         for (var i = 0; i < listlng.length; i++) {
            if (parseInt(listtype[i]) == 1) {
               addMarker(new kakao.maps.LatLng(listlat[i], listlng[i]));
            }
         }
         panTo(37.49684875,127.0679394);
      } else if (station == "#table2") {
         hideMarkers();
         for (var i = 0; i < listlng.length; i++) {
            if (parseInt(listtype[i]) == 2) {
               addMarker(new kakao.maps.LatLng(listlat[i], listlng[i]));
            }
         }
         panTo(37.5492994,127.14642745);
      } else if (station == "#table3") {
         hideMarkers();
         for (var i = 0; i < listlng.length; i++) {
            if (parseInt(listtype[i]) == 3) {
               addMarker(new kakao.maps.LatLng(listlat[i], listlng[i]));
            }
         }
         panTo(37.64821305,127.0164068);
      } else if (station == "#table4") {
         hideMarkers();
         for (var i = 0; i < listlng.length; i++) {
            if (parseInt(listtype[i]) == 4) {
               addMarker(new kakao.maps.LatLng(listlat[i], listlng[i]));
            }
         }
         panTo(37.56728895,126.8234106);
      }
   }

   // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
   var markers = [];

   // 마커를 생성하고 지도위에 표시하는 함수입니다
   function addMarker(position) {

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         position : position
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      // 생성된 마커를 배열에 추가합니다
      markers.push(marker);
   }

   // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
   function setMarkers(map) {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
      }
   }

   // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
   function showMarkers() {
      setMarkers(map)
   }

   // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
   function hideMarkers() {
      setMarkers(null);
   }
   
   function panTo(lat, lng) {
       // 이동할 위도 경도 위치를 생성합니다 
       var moveLatLon = new kakao.maps.LatLng(lat, lng);
       
       // 지도 중심을 부드럽게 이동시킵니다
       // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
       map.panTo(moveLatLon);            
   }        
   
   
 
// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
   function setMapType(maptype) { 
       var roadmapControl = document.getElementById('btnRoadmap');
       var skyviewControl = document.getElementById('btnSkyview'); 
       if (maptype === 'roadmap') {
           map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
           roadmapControl.className = 'selected_btn';
           skyviewControl.className = 'btn';
       } else {
           map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
           skyviewControl.className = 'selected_btn';
           roadmapControl.className = 'btn';
       }
   }

   // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
   function zoomIn() {
       map.setLevel(map.getLevel() - 1);
   }

   // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
   function zoomOut() {
       map.setLevel(map.getLevel() + 1);
   }
   
   //검색창에 검색시 테이블에 나오는 병원들만 지도에 표시되게 하는 함수
   window.onload = function(){
	   document.getElementById('variable').innerHTML = "#table5";
      var fin = "${fin}";
      console.log(fin);
      if (fin == "fin"){
         searchview();
      }
   }
   
   function selectone(lat,lng){
         hideMarkers();
         map.setLevel(1);
         panTo(lat,lng);
         addMarker(new kakao.maps.LatLng(lat, lng));
      }
   
   
   function searchview(){
      var listlng2 = new Array();
      var listlat2 = new Array();
      var listtype2 = new Array();

      <c:forEach var="list" items="${searchlist}" varStatus="status">
      listlng2.push("${list.getLng()}");
      listlat2.push("${list.getLat()}");
      listtype2.push("${list.getType_num()}");
      </c:forEach>
      
       if (listlng2.length == 1){
          /*
           map.setLevel(1);
           panTo(listlat2[0],listlng2[0]);
          addMarker(new kakao.maps.LatLng(listlat2[0], listlng2[0]));
           console.log(listlat2[0],listlng2[0]);
           */
           selectone(listlat2[0],listlng2[0]);
       }else if(listlng2.length > 1){
          var avglat = 0;
          var avglng = 0; 
          map.setLevel(9);  
          for (var i = 0; i < listlng2.length; i++) {
              addMarker(new kakao.maps.LatLng(listlat2[i], listlng2[i]));
              avglat += parseFloat(listlat2[i])/listlat2.length;
              avglng += parseFloat(listlng2[i])/listlat2.length;
              console.log(listlat2[i]);
           }
          panTo(avglat,avglng);
       }
       
   }
</script>
<style>
/*
        가장 속의 div가 선택된다.
        */
div {
	font-size: 20px;
	color: white;
}

ul {
	list-style: none;
	padding: 50px;
}

a, a:visited {
	color: #fff;
	text-decoration: none;
	cursor: pointer;
}

a:hover {
	color: #ff9031;
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 500px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

.MapBox {
	width: 600px;
	height: 600px;
}

#dogGnb {
	position:;
	background: linear-gradient(#141e30, #243b55);
	z-index: 2000;
	width: 100%;
	height: 100%;
}

.DesBox {
	overflow: auto;
	/*   lex-basis: 1000px; */
	height: 100%;
	width: 100%;
}

/* #FAVORITE {
   margin-left: 20%;
}
 */
.container1 {
	position:;
	width: 80%;
	height:;
	margin: 0 10%;
	padding: 0 10px;
	font-family: sans-serif;
	font-weight: bold;
}

.list_nav_type_fix {
	margin: 0 0%;
	padding: 3% 5% 1%;
}

.gnbBox {
	margin: 0 2%;;
}

.container {
	position:;
	width: 80%;
	height: 80%;
	margin: 0 10%;
	padding: 0 10px;
	display: flex;
	font-family: sans-serif;
	font-weight: bold;
}

hr {
	height: 0;
	width:;
	border-width:;
	color:;
	background-color:;
}

button, input {
	font-family: sans-serif;
	font-weight: bold;
}

li {
	display: inline-block;
	margin-left: 13%;
	cursor: pointer;
}

li:hover {
	color: #ff9031;
}
</style>


<body>
	<!-- div 1 -->
	<div id="dogGnb" role="navigation">
		<div class="container1">
			<div id="FAVORITE" class="gnbBox">
				<ul class="list_nav_type_fix">
					<li class="nav_item" id="#seoul"
						onclick="showTable('#seoul', this.id)">서울</li>
					<li class="nav_item" id="#table1"
						onclick="showTable('#table1', this.id)">강남</li>
					<li class="nav_item" id="#table2"
						onclick="showTable('#table2', this.id)">강동</li>
					<li class="nav_item" id="#table3"
						onclick="showTable('#table3', this.id)">강북</li>
					<li class="nav_item" id="#table4"
						onclick="showTable('#table4', this.id)">강서</li>
				</ul>
				<p id="variable" style="display: none"></p>
				<button onclick="tableDelete()">명단제거</button>
				<button onclick="tableOn()">명단보기</button>
				<br>
				<form action="/mapmain" method="GET">
					<input type="text" name="hospitalname" placeholder="검색창"> <input
						type="submit" value="검색하기"> <input type="hidden"
						name="fin" value="fin">
				</form>
			</div>
			<hr>
		</div>
		<!-- div 2 -->
		<div class="container">
			<div class="DesBox" id="seoul" style="display: none;">
				<table border="1">
					<tr>
						<th>병원 이름</th>
						<th>병원 전화번호</th>
						<th>도로명 주소</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td><a onclick="selectone(${dto.lat},${dto.lng});">${dto.name}</a></td>
							<td>${dto.phone }</td>
							<td>${dto.addr }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="DesBox" id="table1" style="display: none;">
				<table border="1">
					<tr>
						<th>병원 이름</th>
						<th>병원 전화번호</th>
						<th>도로명 주소</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<c:set var="data" value="${dto.addr}" />
						<c:if test="${fn:contains(data,'강남구') }">
							<tr>
								<td><a onclick="selectone(${dto.lat},${dto.lng});">${dto.name}</a></td>
								<td>${dto.phone }</td>
								<td>${dto.addr }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class="DesBox" id="table3" style="display: none;">
				<table border="1">
					<tr>
						<th>병원 이름</th>
						<th>병원 전화번호</th>
						<th>도로명 주소</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<c:set var="data" value="${dto.addr}" />
						<c:if test="${fn:contains(data,'강북구') }">
							<tr>
								<td><a onclick="selectone(${dto.lat},${dto.lng});">${dto.name}</a></td>
								<td>${dto.phone }</td>
								<td>${dto.addr }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class="DesBox" id="table4" style="display: none;">
				<table border="1">
					<tr>
						<th>병원 이름</th>
						<th>병원 전화번호</th>
						<th>도로명 주소</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<c:set var="data" value="${dto.addr}" />
						<c:if test="${fn:contains(data,'강서구') }">
							<tr>
								<td><a onclick="selectone(${dto.lat},${dto.lng});">${dto.name}</a></td>
								<td>${dto.phone }</td>
								<td>${dto.addr }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class="DesBox" id="table2" style="display: none;">
				<table border="1">
					<tr>
						<th>병원 이름</th>
						<th>병원 전화번호</th>
						<th>도로명 주소</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<c:set var="data" value="${dto.addr}" />
						<c:if test="${fn:contains(data,'강동구') }">
							<tr>
								<td><a onclick="selectone(${dto.lat},${dto.lng});">${dto.name}</a></td>
								<td>${dto.phone }</td>
								<td>${dto.addr }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class="DesBox" id="table5" style="display: block;">
				<table border="1">
						<tr>
							<th>병원 이름</th>
							<th>병원 전화번호</th>
							<th>도로명 주소</th>
						</tr>
					<c:forEach var="dto" items="${searchlist}">
						<tr>
							<td><a onclick="selectone(${dto.lat},${dto.lng});">${dto.name}</a></td>
							<td>${dto.phone }</td>
							<td>${dto.addr }</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<hr>

			<!-- div 3 -->

			<div class="map_wrap">
				<div id="map" class="MapBox"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<!-- 지도타입 컨트롤 div 입니다 -->
				<div class="custom_typecontrol radius_border">
					<span id="btnRoadmap" class="selected_btn"
						onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
						class="btn" onclick="setMapType('skyview')">스카이뷰</span>
				</div>
				<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
				<div class="custom_zoomcontrol radius_border">
					<span onclick="zoomIn()"><img
						src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
						alt="확대"></span> <span onclick="zoomOut()"><img
						src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
						alt="축소"></span>
				</div>
			</div>
		</div>
		<script type="text/javascript">
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
               center : new kakao.maps.LatLng(37.5638532, 126.9740863), // 지도의 중심좌표
               level : 10
            // 지도의 확대 레벨
            };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

         </script>

	</div>


	</div>
</body>
</html>
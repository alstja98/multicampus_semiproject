# MultiCampus Semi Project.

### 프로젝트 타이틀 : 애견 관련 웹 서비스



### 프로젝트 주제 및 내용

  애견 카페, 동물 병원 등 애견과 관련한 여러 가게나 장소들만 모아서 지도에서 한눈에 볼 수있고, 검색해볼 수 있는 서비스를 만든다.

  하지만 프로젝트의 총 기간이 3일이었기 때문에 우리 팀은 동물병원으로 범위를 줄였고, 그 중에서도 서울,강남,강북,강동,강서구에 위치하는 동물 병원만 지도에 나타나게 하고 목록을 만드는 기능을 구현하였다. 



### 웹페이지의 전반적인 구성 및 간략 소개 + 수행 방법/도구

1. 공공데이터 포털에서 전국에 위치하는 동물병원의 데이터를 CSV 파일로 가져왔다.

2. 가져온 데이터 내에서 강남구,강서구,강북구,강동구에 해당하는 동물병원만 추려내고 MYSQL에 'DOG'란 이름의 TABLE을 만들어 데이터를 INSERT하였다. 

3. SPRING BOOT를 이용해 STS프로그램 내에서 작업하였고, 웹페이지를 구성해 DB에서 데이터를 가져와 서울,강남,강서,강북에 해당하는 각 버튼을 누를때마다 해당 위치에 있는 동물병원의 목록을 나타내었고, 지도에 핀 형식으로 위치를 나타내는것을 구현하였다. 또한 원하는 동물병원의 이름을 클릭하면 해당 동물병원만 자세히 볼 수있는 기능, 검색창에 동물병원을 치면 검색한 동물병원의 정보만 볼 수 있는 기능도 추가하였다.

4. 앞서 말한 메인 기능을 구현하는 페이지에 들어가기 전 로그인 및 회원가입을 하는 페이지도 구현하였고, 사용자의 회원정보와 관련한 데이터들은 MYSQL에 'LOGIN'이라는 TABLE을 구성해 INSERT하였다.
5. 추가로 비회원으로 이용하려면 해당 버튼을 클릭시 바로 메인 기능을 하는 페이지로 이동할 수 있게 하였다.



### 이 프로젝트에서 내가 구현한 기능

1. mapmain.jsp 에서 목록 구현, 해당 목록에 있는 병원들을 지도에 핀을 꽂아주는 기능을 구현하였다.
   - 목록 table의 기본 display값은 none으로 맞춰주고 버튼 클릭 시 테이블을 보여줄 수 있게 함.
   - DB에서 위도와 경도값만 가져와 카카오 지도 API를 이용해 핀을 형성하도록 하였고, 테이블이 바뀔때마다 핀의 개수, 지도의 위치, 지도의 확대 정도 등이 사용자가 보기 편하도록 기능을 구현하였다.
   - 테이블의 동물 병원 이름을 클릭할 경우, 해당 동물 병원 하나의 위치만 자세히 보여주는 기능을 구현하였다. 
2. 검색창에 동물병원을 검색하면 검색한 병원의 데이터만 받아와 table에 보여주는 기능 + 해당 병원들을 지도에 보여주는 기능을 구현하였다.
   - 검색된 병원이 1개라면 해당 병원의 위치를 자세히 확대해서 보여주고 , 검색된 병원이 2개 이상이라면 지도의 중심 위치를 두 병원의 중간 위치로 지정해 병원들의 위치를 전반적으로 볼 수 있도록 구분하였다. 
3. 명단보기, 명단제거 기능을 구현함.
   - table과 지도가 나와있는 상황에서 명단제거 버튼을 누르면 table이 사라지고 지도만 확대되고, 명단보기 버튼을 누르면 다시 table이 생기는 기능을 구현하였다. 



### 시행착오, 코드 구현시 어려웠던 점과 해결 방법

1.  DB에서 위도와 경도값을 가져와서 지도 코드에 적용시켰는데 지도에 핀이 형성이 안되었음.

   -> 공공데이터의 위도 경도값이 잘못 입력되어있어서 수작업으로 하나하나 고침...

2. CSV에 저장된 데이터들을 자동으로 MYSQL에 INSERT 시키는 방법을 몰랐음.

   -> 프로젝트 기간이 3일이라 방법을 못찾고 급하게 수작업으로 작업을 마침. 본 프로젝트 때 방법을 찾아봐야겠음.

3. 카카오 지도 API 이용시 지도가 페이지가 안 나왔음.

   -> 카카오 API 사이트 내에서 도메인등록을 해줬어야 함.

4. 병원들의 위도 경도 데이터를 controller에서 받아와서 바로 for문을 이용해 지도에 핀을 형성해주는 기능이 작동하지 않음. 

   ***원인*** : 컨트롤러에서 ${} 값으로 받아오는건 컴파일이 끝난 후 받아오는 건데 for문을 컴파일이 완료하기 전 실행되는 것이기 때문에 작동이 안되는 것이라고 기억함.

   ***해결방법***: 새로운 배열 변수를 하나 만들어서 for문을 돌리기 전에 그 변수에 ${}값들을 미리 넣어두고 for문을 돌려서 해결하였음.

   ```jsp
   //작동이 안된 예시
   <script>
   //list는 controller에서 병원들의 데이터를 받아온 것   
   function showfin(){
       for (var i = 0; i < ${list.getLng()}.length; i++) {
               addMarker(new kakao.maps.LatLng(${list.getLat(i)}, ${list.getLng(i)}));
       //이렇게 하면 지도에 핀이 생성이 안됨. 
            }
   }
   
            
            
   // 마커를 생성하고 지도위에 표시하는 함수입니다
   function addMarker(position) {
   
   
         var marker = new kakao.maps.Marker({
            position : position
         });
   
         marker.setMap(map);
   
         markers.push(marker);
      }
   
   </script>
   ```

   ```jsp
   //해결한 코드 예시
   <script>
   function showfin(){
     	  var listlng = new Array();
         var listlat = new Array();
         var listtype = new Array();
   
         <c:forEach var="list" items="${list}" varStatus="status">
         listlng.push("${list.getLng()}");
         listlat.push("${list.getLat()}");
         listtype.push("${list.getType_num()}");
         </c:forEach>
       
       for (var i = 0; i <  listlng.length; i++) {
              addMarker(new kakao.maps.LatLng(listlat[i], listlng[i]));
       }
   }
   </script>
   ```

   

5. 명단보기, 명단제거 만들 때, 명단 제거는 display:none으로 쉽게 되었지만, 명단보기를 눌렀을 경우 모든 table의 display값이 block 이 되어서 전부 다 보여지는 문제가 발생함.

   -> html 내에 p태그를 새로만들고 display:none으로 만들어 보이지 않게 한 다음,  서울, 강남, 강북, 강서, 강동 버튼을 클릭할 경우 각각의 고유 id값을 p태그 내에 innerHTML로 대입하였음. 그리고 p태그에 저장된 id값을 해당하는 테이블에도 대입해주고 $(id).show()를 통해 클릭한 버튼의 해당하는 테이블만 보여줄 수 있도록 조작하였음. 

   핵심 아이디어는 this.id 로 받아온 id값을 저장해둘 수 있는 위치(일종의 새로운 값을 담을 변수..?)를 p태그로 만든다는 것.

   ```jsp
   <script>
      function tableDelete(){
         $('.DesBox').hide();   
         
      }
   	function tableOn(){
   		var id = document.getElementById('variable').innerHTML
   		$(id).show(); //각 테이블들의 id값들도 <li>태그 버튼의 id값과 동일하게 맞춰주어서 해당하는 테이블만 보여줄 수 있게 함.
   	}
       
       function showTable(station, id) {
   	document.getElementById('variable').innerHTML = id;//
         
       $('.DesBox').hide();//모든 테이블을 숨기는 코드
         
           .//아래는 관계없는 코드여서 생략
           .
           .
       }
         
   </script>
   <body>
       <!-- this.id 라는 방법으로 showTable함수에 해당 버튼에 id값을 매개변수로 넣어줌 -->
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
       <!-- 보이지 않는 p태그를 만들어 여기에 this.id값을 넣어준 것. 자바로 치면 새로운 변수를 만들어서 값을 넣어주었다고 생각하면 됨 -->
   		<p id="variable" style="display: none"></p>
   		<button onclick="tableDelete()">명단제거</button>
   		<button onclick="tableOn()">명단보기</button>
   		<br>
       
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
   </body>
   ```

   

   
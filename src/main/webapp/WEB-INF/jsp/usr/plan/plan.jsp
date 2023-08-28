<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="여행계획하기" />
<%@ include file="../common/head.jsp"%>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<script>
	function categoryChange(e) {
		const state = document.getElementById("state");

		const gangwon = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시",
				"고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군",
				"화천군", "횡성군" ];
		const gyeonggi = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시",
				"남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시",
				"안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
				"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
		const gyeongsangnam = [ "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시",
				"진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군",
				"창녕군", "하동군", "함안군", "함양군", "합천군" ];
		const gyeongsangbuk = [ "경산시", "경주시", "구미시", "김천시", "문경시", "상주시",
				"안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군",
				"영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
		const gwangju = [ "광주광역시 광산구", "광주광역시 남구", "광주광역시 동구", "광주광역시 북구",
				"광주광역시 서구" ];
		const daegu = [ "대구광역시 남구", "대구광역시 달서구", "대구광역시 동구", "대구광역시 북구",
				"대구광역시 서구", "대구광역시 수성구", "대구광역시 중구", "대구광역시 달성군" ];

		const daejeon = [ "대전광역시 대덕구", "대전광역시 동구", "대전광역시 서구", "대전광역시 유성구",
				"대전광역시 중구" ];
		const busan = [ "부산광역시 강서구", "부산광역시 금정구", "부산광역시 남구", "부산광역시 동구",
				"부산광역시 동래구", "부산광역시 진구", "부산광역시 북구", "부산광역시 사상구", "부산광역시 사하구",
				"부산광역시 서구", "부산광역시 수영구", "부산광역시 연제구", "부산광역시 영도구", "부산광역시 중구",
				"부산광역시 해운대구", "부산광역시 기장군" ];

		const seoul = [ "서울특별시 강남구", "서울특별시 강동구", "서울특별시 강북구", "서울특별시 강서구",
				"서울특별시 관악구", "서울특별시 광진구", "서울특별시 구로구", "서울특별시 금천구",
				"서울특별시 노원구", "서울특별시 도봉구", "서울특별시 동대문구", "서울특별시 동작구",
				"서울특별시 마포구", "서울특별시 서대문구", "서울특별시 서초구", "서울특별시 성동구",
				"서울특별시 성북구", "서울특별시 송파구", "서울특별시 양천구", "서울특별시 영등포구",
				"서울특별시 용산구", "서울특별시 은평구", "서울특별시 종로구", "서울특별시 중구", "서울특별시 중랑구" ];

		const ulsan = [ "울산광역시 남구", "울산광역시 동구", "울산광역시 북구", "울산광역시 중구",
				"울산광역시 울주군" ];
		const incheon = [ "인천광역시 계양구", "인천광역시 남구", "인천광역시 남동구", "인천광역시 동구",
				"인천광역시 부평구", "인천광역시 서구", "인천광역시 연수구", "인천광역시 중구", "인천광역시 강화군",
				"인천광역시 옹진군" ];
		const jeonnam = [ "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군",
				"곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군",
				"장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];
		const jeonbuk = [ "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군",
				"무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ];
		const jeju = [ "서귀포시", "제주시", "남제주군", "북제주군" ];
		const chungbuk = [ "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군",
				"옥천군", "음성군", "증평군", "진천군", "청원군" ];
		const chungnam = [ "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군",
				"서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군" ];

		if (e.value == "32") {
			add = gangwon;
		} else if (e.value == "31") {
			add = gyeonggi;
		} else if (e.value == "36") {
			add = gyeongsangnam;
		} else if (e.value == "35") {
			add = gyeongsangbuk;
		} else if (e.value == "5") {
			add = gwangju;
		} else if (e.value == "4") {
			add = daegu;
		} else if (e.value == "3") {
			add = daejeon;
		} else if (e.value == "6") {
			add = busan;
		} else if (e.value == "1") {
			add = seoul;
		} else if (e.value == "7") {
			add = ulsan;
		} else if (e.value == "2") {
			add = incheon;
		} else if (e.value == "38") {
			add = jeonnam;
		} else if (e.value == "37") {
			add = jeonbuk;
		} else if (e.value == "39") {
			add = jeju;
		} else if (e.value == "34") {
			add = chungnam;
		} else if (e.value == "33") {
			add = chungbuk;
		}

		state.options.length = 1;
		// 군/구 갯수;

		for (property in add) {
			let opt = document.createElement("option");
			opt.value = add[property];
			opt.innerHTML = add[property];
			state.appendChild(opt);
		}
	}
</script>


<div class="h-10 text-xl m-3" style="border: 1px solid black;">
	<h1>지역선택 → 상세 일정 만들기</h1>
</div>



<div class="flex">
	<div class="plan-table" style="background-color: yellow;">
		<div value="1">서울특별시</div>
		<div value="2">인천광역시</div>
		<div value="3">대전광역시</div>
		<div value="4">대구광역시</div>
		<div value="5">광주광역시</div>
		<div value="6">부산광역시</div>
		<div value="7">울산광역시</div>
		<div value="8">세종특별자치시</div>
		<div value="31">경기도</div>
		<div value="32">강원도</div>
		<div value="33">충청북도</div>
		<div value="34">충청남도</div>
		<div value="35">경상북도</div>
		<div value="36">경상남도</div>
		<div value="37">전라북도</div>
		<div value="38">전라남도</div>
		<div value="39">제주특별자치도</div>
	</div>
</div>

<div id="map" style="width: 100%; height: 800px;"></div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=382c9ddf626c81fd0aa1266b1140ffee"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨 
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			message = '<div style="padding:5px;">현 위치</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}
</script>

<%@ include file="../common/foot.jsp"%>
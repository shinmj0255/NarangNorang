<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="여행계획하기" />
<%@ include file="../common/head.jsp" %>

<script>
	// 시군구를 선택하는 select 요소와 지도 객체를 가져옵니다.
	const stateSelect = document.getElementById('state');

	function categoryChange(city) {
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
		const sejong = ["세종전체"];

		if (city.value == "32") {
			add = gangwon;
		} else if (city.value == "31") {
			add = gyeonggi;
		} else if (city.value == "36") {
			add = gyeongsangnam;
		} else if (city.value == "35") {
			add = gyeongsangbuk;
		} else if (city.value == "5") {
			add = gwangju;
		} else if (city.value == "4") {
			add = daegu;
		} else if (city.value == "3") {
			add = daejeon;
		} else if (city.value == "6") {
			add = busan;
		} else if (city.value == "1") {
			add = seoul;
		} else if (city.value == "7") {
			add = ulsan;
		} else if (city.value == "8") {
			add = sejong;
		} else if (city.value == "2") {
			add = incheon;
		} else if (city.value == "38") {
			add = jeonnam;
		} else if (city.value == "37") {
			add = jeonbuk;
		} else if (city.value == "39") {
			add = jeju;
		} else if (city.value == "34") {
			add = chungnam;
		} else if (city.value == "33") {
			add = chungbuk;
		}

		 state.options.length = 1;
		    for (property in add) {
		        let opt = document.createElement("option");
		        opt.value = add[property];
		        opt.innerHTML = add[property];
		        state.appendChild(opt);
		    }

		    // 시군구 선택 시 지도 위치 변경
		    const selectedState = state.value;
		    displayMarkers(selectedState);
	}
	
	// 선택된 "군/구" 값에 따라 마커를 표시하는 함수
	function displayMarkers(selectedState) {

		// 선택된 시군구에 해당하는 장소를 검색하고 위도와 경도를 가져옵니다.
		ps.keywordSearch(selectedState, function(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				// 검색 결과로 받은 장소 정보를 이용해 위도와 경도를 가져옵니다.
				const lat = data[0].y; // 위도
				const lng = data[0].x; // 경도

				// 위도와 경도를 사용하여 마커를 생성하고 지도에 표시합니다.
				const markerPosition = new kakao.maps.LatLng(lat, lng);
				const marker = new kakao.maps.Marker({
					position : markerPosition,
					map : map,
					title : selectedState, // 마커에 시군구 이름을 표시합니다.
				});
				markers.push(marker); // 마커를 배열에 추가

				// 선택된 시군구로 지도의 중심을 이동합니다.
				map.setCenter(markerPosition);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				console.log('검색 결과가 없습니다.');
			} else if (status === kakao.maps.services.Status.ERROR) {
				console.log('검색 중 오류가 발생했습니다.');
			}
		});
	}
</script>

<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker1,#datepicker2").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능
           ,showOn: "button" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=382c9ddf626c81fd0aa1266b1140ffee"></script>
<div id="map" style="margin-left: 50%; width:600px; height:843px;"></div>

<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(36.351051, 127.379715), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	//마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(36.351051, 127.379715);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);
</script>




<%@ include file="../common/foot.jsp" %>

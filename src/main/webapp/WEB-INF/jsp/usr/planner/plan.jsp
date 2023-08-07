<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="여행계획하기" />
<%@ include file="../common/head.jsp"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=382c9ddf626c81fd0aa1266b1140ffee"></script>
	

<div class="full_wrap" style="width: 100%; height: 850px;">
	<div class="left_full_box">
		<ul>
			<li data-val="서울특별시"></li>
			<li data-val="인천광역시"></li>
			<li data-val="대전광역시"></li>
			<li data-val="대구광역시"></li>
			<li data-val="광주광역시"></li>
			<li data-val="부산광역시"></li>
			<li data-val="울산광역시"></li>
			<li data-val="세종특별자치시"></li>
			<li data-val="경기도"></li>
			<li data-val="강원도"></li>
			<li data-val="충청북도"></li>
			<li data-val="충청남도"></li>
			<li data-val="경상북도"></li>
			<li data-val="경상남도"></li>
			<li data-val="전라북도"></li>
			<li data-val="전라남도"></li>
			<li data-val="제주도"></li>
		</ul>
	</div>
	<div id="map" style="width: 100%; height: 100%;"></div>

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
</div>

<%@ include file="../common/foot.jsp"%>
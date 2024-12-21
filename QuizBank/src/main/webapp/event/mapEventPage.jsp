<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/head.jsp" />
    <meta charset="utf-8">
    <title>이벤트 페이지</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
            background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 24px;
        }

        .container {
            max-width: 1400px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .hint {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
            padding: 10px;
            border-left: 4px solid #00c3ff;
            background: #e6f7ff;
        }

        .announcement {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            color: #007bff;
            margin: 20px 0;
        }

        .map_wrap {
            position: relative;
            width: 100%;
            height: 700px;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #menu_wrap {
            position: absolute;
            top: 10px;
            left: 10px;
            width: 300px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px;
            z-index: 1;
        }

        #menu_wrap input {
            width: calc(100% - 80px);
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        #menu_wrap button {
            background: #4facfe;
            color: white;
            border: none;
            padding: 8px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        #menu_wrap button:hover {
            background: #00c3ff;
        }

        #placesList {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        #placesList li {
            margin: 10px 0;
            padding: 10px;
            background: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
        }

        #placesList li:hover {
            background: #e6f7ff;
            border-color: #00c3ff;
        }

        #selectedPlace {
            margin: 20px 0;
            font-size: 18px;
            color: #333;
        }
        
    </style>
</head>
<body>
<jsp:include page="/common/header.jsp" />
<header>
    🎉 이벤트 참여하고 크레딧을 받아보세요! 🎉
</header>
<div class="announcement">
    <b>"위치를 맞춰라!!"</b><br>
    "관리자가 설정한 위치의 마커를 클릭하면 100크레딧을 드립니다!!"<br><br>
    <small style="color: black;"><u>검색창에 장소명을 입력하면 마커가 갱신됩니다.</u></small>
</div>
<div class="container">
    <div class="hint">
        <strong>힌트:</strong> 관리자가 다니고 있는 대학 강의실의 위치
    </div>

    <div id="selectedPlace">선택된 장소: 없음</div>

    <div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

        <div id="menu_wrap">
            <form onsubmit="searchPlaces(); return false;">
                <input type="text" id="keyword" placeholder="장소를 검색하세요">
                <button type="submit">검색</button>
            </form>
            <ul id="placesList"></ul>
        </div>
    </div>
</div>

<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-green">Copyright &copy; Quiz Bank - SY_COMPANY</p>
    </div>
</footer>
<script src="/QuizBank/js/kakaoKey.js"></script>
<jsp:include page="/common/kakaoKey.jsp" />
<script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.4483441, 127.1260904),
        level: 5
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);

    var ps = new kakao.maps.services.Places();
    var infowindow = new kakao.maps.InfoWindow({zIndex: 1});
    var markers = [];
    var selectedMarker = null;
    var targetPlaceName = "한국폴리텍대학 성남캠퍼스 드림관";

    function searchPlaces() {
        var keyword = document.getElementById('keyword').value.trim();
        if (!keyword) {
            alert('키워드를 입력해주세요!');
            return;
        }
        ps.keywordSearch(keyword, placesSearchCB);
    }

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            displayPlaces(data);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 없습니다.');
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 중 오류가 발생했습니다.');
        }
    }

    function displayPlaces(places) {
        var listEl = document.getElementById('placesList');
        var bounds = new kakao.maps.LatLngBounds();
        removeAllChildNodes(listEl);
        removeMarkers();

        for (var i = 0; i < places.length; i++) {
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
            var marker = createMarker(placePosition, i);
            var itemEl = createListItem(i, places[i]);

            bounds.extend(placePosition);

            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    setClickedMarker(marker);
                    updateSelectedPlace(place.place_name); // 장소 이름 업데이트
                    if (place.place_name === targetPlaceName) {
                        alert('🎉 축하합니다! 정답을 맞추셨습니다! 🎉\n\n 100 크레딧이 지급됩니다.');
                        sendResultToController();
                    } else {
                        alert('틀렸습니다! 다시 시도해주세요.');
                    }
                });
            })(marker, places[i]);

            listEl.appendChild(itemEl);
        }
        map.setBounds(bounds);
    }

    function createMarker(position, index) {
        var markerImage = new kakao.maps.MarkerImage(
            'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
            new kakao.maps.Size(36, 37),
            {
                spriteSize: new kakao.maps.Size(36, 691),
                spriteOrigin: new kakao.maps.Point(0, index * 46),
                offset: new kakao.maps.Point(13, 37)
            }
        );

        var marker = new kakao.maps.Marker({
            position: position,
            image: markerImage
        });
        marker.setMap(map);
        markers.push(marker);
        return marker;
    }

    function setClickedMarker(marker) {
        if (selectedMarker) {
            selectedMarker.setImage(
                new kakao.maps.MarkerImage(
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
                    new kakao.maps.Size(36, 37),
                    {
                        spriteSize: new kakao.maps.Size(36, 691),
                        spriteOrigin: new kakao.maps.Point(0, markers.indexOf(selectedMarker) * 46),
                        offset: new kakao.maps.Point(13, 37)
                    }
                )
            );
        }

        var clickedImage = new kakao.maps.MarkerImage(
            'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
            new kakao.maps.Size(36, 37)
        );
        marker.setImage(clickedImage);
        selectedMarker = marker;
    }

    function createListItem(index, place) {
        var el = document.createElement('li');
        el.innerHTML = '<span>' + (index + 1) + '</span> ' + place.place_name;
        return el;
    }

    function removeMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
        selectedMarker = null;
    }

    function removeAllChildNodes(el) {
        while (el.firstChild) {
            el.removeChild(el.firstChild);
        }
    }

    function updateSelectedPlace(placeName) {
        var selectedPlaceEl = document.getElementById('selectedPlace');
        selectedPlaceEl.textContent = '선택된 장소: ' + placeName;
    }

    function sendResultToController() {
        location.href = "/QuizBank/event/successMapEvent.do";
    }
</script>

</body>
</html>
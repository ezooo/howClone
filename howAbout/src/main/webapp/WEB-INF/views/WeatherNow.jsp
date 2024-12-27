<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<a href="./">Home</a>

<div class="container">
	<div class="row" align="center">
		<h1>[weather 출력 결과]</h1>
		<form  action="/search" method="GET">
			<label for="selectDo">도 선택</label>
			<select name="selectDo"> 
				<option value="경상남도">경상남도</option>
			</select>
			<label for="selectSi">시 선택</label>
			<select id="selectSi" name="selectSi">
				<option value="noOption">--------</option>
				<c:forEach var="si" items="${siList}" >
					<option value="${si}">${si}</option>
				</c:forEach>
			</select>
			<label for="selectDong">동,읍,면 선택</label>
			<select id="selectDong" name="selectDong">
				<option value="noOption">--------</option>
			</select>
			<button type="button" class="btn btn-secondary" onclick="searchWeather()">검색하기</button>
		</form>
		<div id="printInfo">
			<div id="printWeather"></div>
		</div>
	</div>
</div>
</body>
<script>
	function searchWeather(){
		var selectSi = $('#selectSi').val(); // 입력된 이름 가져오기
        var selectDong = $('#selectDong').val();
		console.log("selectSi 출력 : "+selectSi);
		console.log("selectDong 출력 : "+selectDong);
		$.ajax({
			url : '${pageContext.request.contextPath}/weather/now',
			type : 'GET',
			data : {selectSi : selectSi, selectDong : selectDong},
			dataType : "json",
			contentType : "application/json",
			success : function(response){
				console.log('Response:', response);
				printWeather(response);
			},
			error : function(xhr, status, error){
				console.error('Status:', status);
		        console.error('Error:', error);
		        console.error('Response Text:', xhr.responseText);
		        console.error('Response Status:', xhr.status);
			}
		});
	}
	function printWeather(weatherNowByDateList){
		var printWeatherDiv =document.getElementById('printWeather');
		if(printWeatherDiv.hasChildNodes()){
			printWeatherDiv.innerHTML='';
		}
		weatherNowByDateList.forEach(function(weather){
			var infoDiv = document.createElement('div');
			infoDiv.innerHTML = 
				'<p>출력해 보기 : ' + JSON.stringify(weather) + '</p>' +
				'<p>[ '+weather.fcstDate+'/' + weather.fcstTime+
					' 기준 ]</p> <p>기온 : '+weather.t1H
					+'</p><p>1시간 강수량 : '+weather.rn1
					+'</p><p>하늘 상태 : '+weather.sky
					+'</p><p>습도 : '+weather.reh
					+'</p><p>강수형태 : '+ weather.pty 
					+'</p><p>풍속 : '+ weather.wsd
					+'</p><p>===================================</p>';
			printWeatherDiv.appendChild(infoDiv);
		})
	}

	var selectElement = document.getElementById('selectSi');
	selectElement.addEventListener('change', function() {
       var selectedValue = selectElement.value;
        console.log('선택된 값:', selectedValue);
       	selectEvent(selectedValue);
    });
	
	function selectEvent(selectedValue){
		$.ajax({
			url : '${pageContext.request.contextPath}/weather/selectSi',
			type : 'GET',
			data : {selectSi : selectedValue},
			dataType : "json",
			contentType : "application/json",
			success : function(response){
				console.log('Response:', response);
				printDong(response);
			},
			error : function(xhr, status, error){
				console.error('Status:', status);
		        console.error('Error:', error);
		        console.error('Response Text:', xhr.responseText);
		        console.error('Response Status:', xhr.status);
			}
		});
	}
	function printDong(dongList){
		var dongs = document.querySelectorAll('.printDongs');
		var selectDong = document.getElementById('selectDong');
		if(dongs!=null){
			selectDong.innerHTML='<option value="noOption">--------</option>';
		}
		dongList.forEach(function(dong){
			var printDong = document.createElement('option');
			printDong.className="printDongs";
			printDong.value = dong;
			printDong.innerHTML = dong;
			selectDong.appendChild(printDong);
		})
	}
	
	
</script>
</html>
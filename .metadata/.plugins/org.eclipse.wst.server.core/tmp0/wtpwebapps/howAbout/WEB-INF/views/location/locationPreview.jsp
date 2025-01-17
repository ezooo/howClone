<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로케이션... 임시페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="main.jsp" %>
로케이션 임시페이지 입니다.
<a href="/howAbout/location/locations">전체 로케이션 보기</a>
<a href="/howAbout/location/locationCategory">카테고리 분류 보기</a>
<a href="/howAbout/location/locationArea">지역 분류 보기</a>
<a href="/howAbout/location/create">장소 추가</a>
<br><br>
 
	<button type="button" onclick="searchLocation()">클릭하고 여행지 찾기</button>
	<input type="text" id="searchLocation" placeholder="여행지 입력" style="display:none;"/>
<div id="results" ></div>
</body>

<script>
var results = document.getElementById("results");

function searchLocation()
{
	$.ajax
	(
		{
			url : "/howAbout/location/locationTitles",
			type : "post",
			contentType : "application/json",
			success : function(data)
				{
					//alert("성공"); 
					document.getElementById("searchLocation").style.display="block";
					displayResults(data);
				},
			error : function(errorThrown){ alert("실패"); }
		}		
	)
}

function displayResults(locations)
{
	//const results = document.getElementById("results");
	results.innerHTML = ""; // 이전 결과 초기화
	//results.style.display="none";
	
	if(locations.length > 0)
	{
		locations.forEach
		(
			function(location)
			{
				const resultItem = document.createElement("div");
				resultItem.textContent = location.data_title + " >> " + location.user_address;
				resultItem.style.display="none";
				results.appendChild(resultItem);
			}
		)
	}
	console.log("장소 가져오기 성공");
	//results.style.display="block";
}

var search = document.getElementById("searchLocation")
search.addEventListener('input', lookup);
//search.addEventListener('keyup', lookup);
function lookup()
{
	console.log(results);
	var text = search.value.toLowerCase(); // 소문자로 변환하여 대소문자 구분 없이 비교
	console.log(text);
	if(text===null || text.trim()==="")
	{
		console.log("보여줄게없어요");
		results.style.display="none";
	}
	else
	{
		for(var i=0; i<results.childElementCount; i++)
		{
			var resultItem = results.children[i];
			console.log(resultItem);
			//results.style.display="none";
			if(resultItem.textContent.toLowerCase().includes(text))
			{
				//console.log("검색되는중");
				//results.style.display="block";
				resultItem.style.display="block";
			}
			else
			{
				resultItem.style.display="none";
			}
		}
	}
}


</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 <div>
 <form method="post" action="reservation.do">
﻿ <input type="date" id="date" onclick="timetable()">
<div id="timeTable"style="display:none">


</div>
<button type="submit" id="reservation">예약완료</button>
</form>
 </div>   
    
<script>


var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("Date").setAttribute("min", today);


//var X = new Date();//현재 날짜나 시간에 대한 데이터를 받고
//var weekday = new Array("MON", "TUE", "WED", "THI", "FRI", "SAT", "SUN");//요일별로 매칭해
//var date = X.getDate();//여기서 날짜에 대한 데이터를 가져온 다음
//document.getElementById("wdate").innerHTML = date;

	//달력에서 날짜 누르면 시간테이블이 보인다
	function timetable(){
	 document.getElementById('timeTable').sytle.display='block';
	}
	//예약불가능한 시간에 disable처리(일단은 클릭하면 disable인걸로 해놓음 buyable값따라 바뀌게 해야함)
	function btnDisabled()  {
		  const target = document.getElementById('table');
		  target.disabled = true;
		}
	
	//예약완료 버튼
	document.querySelector('#reservation').addEventListener('click',function (e){
	fetch('reservation.do'),{
		method:'post',
		headers:{'Content-Type': 'application/x-www-form-urlencoded'},
		body:'id'+ id + '&reCode'+reCode+'&date'+date+'&time'+time+'&buyalbe'+buyable
		}
		.then(resolve=>resolve.json())
		.then(result=>{
			submit();
		})
	})

</script>    
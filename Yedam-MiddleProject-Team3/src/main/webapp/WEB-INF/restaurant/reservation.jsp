<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 <div>
 <form method="post" action="reservation.do">
<<<<<<< HEAD
﻿ <input type="date" id="date" onclick="timetable()">
<div id="timeTable"style="display:none">

=======
﻿ <input type="date" id="date" name="date" value="" onclick="timetable()" >
<div id="timeTable">
<c:forEach var="i" begin="11" end="22" step="1">
<input type="button" class="table" name="time" value="${i}:00" onClick='btnDisabled(this)' style="display:none; WIDTH: 60pt; HEIGHT: 60pt">
<c:if test="i%4==2">
<br>
</c:if>
</c:forEach>
>>>>>>> branch 'develop' of https://github.com/HeeJaeRA/DaeDaNae.git

</div>
<input type="hidden" name="buyAble" value="0">
<!--<button type="button" onClick='open()'>결제하기</button>-  -->
<button type="submit" id="reservation" >예약완료</button>
</form>
 </div>   
  
<script>


var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("date").setAttribute("min", today);
var times =null;
var time1 =null;
//var X = new Date();//현재 날짜나 시간에 대한 데이터를 받고
//var weekday = new Array("MON", "TUE", "WED", "THI", "FRI", "SAT", "SUN");//요일별로 매칭해
//var date = X.getDate();//여기서 날짜에 대한 데이터를 가져온 다음
//document.getElementById("wdate").innerHTML = date;
	const dates = document.querySelector('input[type="date"]')
	//달력에서 날짜 누르면 시간테이블이 보인다
	function timetable(){
		console.log("date value:" + dates.value)
	 document.querySelectorAll('.table').forEach(item => {
// 		item.disabled = false; 초기화
	 	item.style.display='inline';
	 	
	 })
	}
	
	var count=0;
	//예약불가능한 시간에 disable처리(일단은 클릭하면 disable인걸로 해놓음 buyable값따라 바뀌게 해야함)
	function btnDisabled(elem)  {
		count++;
		times = elem.value;
// 		console.log(count);
		if(count==1){
// 		console.log(elem.value)
		console.log('1'+times)
// 		elem.disabled = 'disabled';
		}else{
		document.querySelectorAll('.table').forEach(item => {
	 		item.disabled = false; //초기화
			})
			elem.disabled = 'disabled';
		}
// 		document.querySelectorAll('.table').forEach((item,i)=>{
// 			console.log("time:"+item.value)
// 			console.log(i+"번째 time:"+document.querySelectorAll('.table')[i].value) 
//  		});
		console.log(times)
		time1=times;
		times=null;
	}
			
	
	
	//예약완료 버튼
	document.querySelector('#reservation').addEventListener('click',function (e){
 	console.log(time1);	
//document.querySelectorAll('.table').forEach(item => {
// 	 		item.removeAttribute("disabled"); //초기화 disable인 상태는 값 안넘어감
// 	 		document.querySelectorAll('.table').forEach((item,e)=>{
// 				 const times= item[e].value 
// 			});

// 			})
	fetch('reservation.do?id='${logId}+'&rcode='+${vo.rsCode} +'&date='+date+'&time='+time1+'&buyAble='+buyAble)
		.then(resolve=>resolve.json())
		.then(result=>{
			console.log("result:"+result);
			submit();
		})
	})

</script>    
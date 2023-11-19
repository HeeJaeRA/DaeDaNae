<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

${logId }, ${nickname }, ${vo }
<div>
	<form method="post" action="reservation.do">

		<input type="date" id="date" name="date" value="" onclick="timetable()">
		<div id="timebutton">
			<c:forEach var="i" begin="11" end="22" step="1">
				<input type="button" class="table" id="button${i}" name="time" value="${i}:00" 
					style="display:none; WIDTH: 60pt; HEIGHT: 60pt">
					
				<c:if test="i%4==2">
					<br>
				</c:if>
			</c:forEach>

		</div>
		<input type="hidden" name="buyAble" value="0">
		<!--<button type="button" onClick='open()'>결제하기</button>-  -->
		<button type="submit" id="reservation">예약완료</button>
	</form>
</div>

<script>
	var now_utc = Date.now() // 지금 날짜를 밀리초로
	//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
	//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
	document.getElementById("date").setAttribute("min", today);
	
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
			item.style.display = 'inline';
		})
	}
	
	
// 	const buttons = document.querySelectorAll(".table")
// 	for (const button of buttons) {
// 	  button.addEventListener('click', function(event) {
// 		   button.style.backgroundColor = 'yellow';
// 		   console.log(time.value);
// 	  })
// 	}

   let id='${logId}';
   let nickname='${nickname}'
   let rcode='${vo.rsCode}';
   let times = null;
   let time1 = null;

	var timeList = document.querySelectorAll('.table');
		timeList.forEach(function(item){
  		item.addEventListener('click',function(e){
    	timeList.forEach(function(e){
  //        e.classList.remove('active');
        	item.style.backgroundColor ="orange";
        	 e.style.backgroundColor="white";
   		 });
    	//item.classList.add('active');
    	console.log(e.target.value);
    	times = e.target.value;
    	time1 = times;
    	times=null;
  	});
});
		
	//예약완료 버튼
	document.querySelector('#reservation').addEventListener('click', function (e) {
		console.log(time1);
		fetch('reservation.do',{
			method:'post',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		    body:'id='+id+'&rcode='+rcode+'&nickname' +nickname +'&date='+date+'&time='+time1+'&buyAble='+buyAble
		    })
			.then(resolve => resolve.json())
			.then(result => {
				console.log("result:" + result);
				//submit();
			})
	})
</script>
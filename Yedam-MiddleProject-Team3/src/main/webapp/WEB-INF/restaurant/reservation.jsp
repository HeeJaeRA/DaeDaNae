<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div>
	<form method="post" action="reservation.do">
		<input type="hidden" name="id" value="${logId}">
		<input type="hidden" name="rcode" value="${vo.rsCode}">
		<input type="hidden" name="nickname" value="${nickname }">
		<input type="date" id="date" name="date" value="" onclick="timetable()">
		<div id="timebutton">
			<c:forEach var="i" begin="11" end="22" step="1">
				<input type="button" class="table" id="button${i}" name="time" value="${i}:00"
					style="display:none; WIDTH: 60pt; HEIGHT: 60pt">
				<c:if test="i%4==2">
					<br>
				</c:if>
			</c:forEach>
			<!-- <input type="hidden" name="time1" value="time1"> -->
		</div>
		<!-- <input type="hidden" id="buyAble" name="buyAble" value="0"> -->
		<select name="seatcnt" id="seatcnt">
			<option value="">좌석수</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		<input type="button" id="reservation" value="예약하기">
	</form>
</div>

<!-- 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	let rsname = '${vo.rsName}';
	let rcode = '${vo.rsCode}';
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
	function timetable() {
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

	// let id='${logId}';
	// let nickname='${nickname}'
	// let rcode='${vo.rsCode}';
	// let times = null;
	// let time1 = null;

	var timeList = document.querySelectorAll('.table');
	timeList.forEach(function (item) {
		item.addEventListener('click', function (e) {
			timeList.forEach(function (e) {
				//e.classList.remove('active');
				item.style.backgroundColor = "orange";
				e.style.backgroundColor = "white";

				item.setAttribute('id', 'selected');
			});
			//item.classList.add('active');
			// console.log(e.target.value);
			// times = e.target.value;
			// time1 = times;
			// times = null;
		});
	});

	//예약완료 버튼
	document.querySelector('#reservation').addEventListener('click', function (e) {
		let id = '${logId}';
		let rcode = '${vo.rsCode}';
		let nickname = '${nickname}';
		let date = document.querySelector('#date').value;
		let realtime = document.querySelector('#selected').value;
		let seatcnt = document.querySelector('#seatcnt').value;

		fetch('reservation.do', {
				method: 'post',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded'
				},
				body: 'id=' + id + '&rcode=' + rcode + '&nickname=' + nickname + '&date=' + date + '&time=' +
					realtime + '&seatcnt=' + seatcnt
			})
			.then(resolve => resolve.json())
			.then(result => {
				if (result.retCode == "Success") {
					kakaoPay();
				} else {
					alert('예약실패');
					window.location.href = 'reservationForm.do?rcode=' + rcode;
				}
			})
			.catch(err => "err:" + err);
	})

	function kakaoPay(useremail, username) {
		IMP.init("imp43228827"); // 가맹점 식별코드
		var today = new Date();
		var hours = today.getHours();
		var minutes = today.getMinutes();
		var seconds = today.getSeconds();
		var makeMerchantUid = hours + minutes + seconds;
		let seatcnt = document.querySelector('#seatcnt').value;
		IMP.request_pay({
			pg: 'kakaopay.TC0ONETIME',
			pay_method: 'card',
			merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
			name: rsname, // 제품명
			amount: 5000 * seatcnt
		}, async function (rsp) { // callback
			if (rsp.success) { //결제 성공시
				alert('예약 완료!');
				window.location.href = 'restaurantInfo.do?rcode=' + rcode + '&focus=reviewcontent';
			} else if (rsp.success == false) { // 결제 실패시
				alert(rsp.error_msg);
			}
		});
	}
</script>

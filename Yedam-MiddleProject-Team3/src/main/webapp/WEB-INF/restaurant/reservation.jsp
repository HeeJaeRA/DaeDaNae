<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div>
	<form method="post" action="reservation.do">
		<input type="hidden" name="id" value="${logId}"> <input type="hidden" name="rcode" value="${vo.rsCode}"> <input
			type="hidden" name="nickname" value="${nickname }"> <input type="date" id="date" name="date" value=""
			onchange="handler(event);" onclick="blockTable();">
		<div id="timebutton">
			<c:forEach var="i" begin="11" end="22" step="1">
				<input type="button" class="table" id="button${i}" name="time" value="${i}:00"
					style="display: none; WIDTH: 60pt; HEIGHT: 60pt">
			</c:forEach>

		</div>

		<select name="seatcnt" id="seatcnt">
			<option value="">좌석수</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select> <input type="button" id="reservation" class="btn btn-warning" value="예약하기">
	</form>
</div>

<!-- 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	let rcode = '${vo.rsCode}';
	let rsname = '${vo.rsName}';

	var now_utc = Date.now() // 지금 날짜를 밀리초로
	//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
	//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
	document.getElementById("date").setAttribute("min", today);
	const dates = document.querySelector('input[type="date"]')

	function handler(e) {
		console.log("date value:" + dates.value)
		document.querySelectorAll('.table').forEach(item => {
			item.style.display = 'inline';
		})
	}

	function blockTable() {
		document.querySelectorAll('.table').forEach(item => {
			item.style.display = 'none';
			item.style.backgroundColor = "white";
		})

	}
	var timeList = document.querySelectorAll('.table');
	timeList.forEach(function (item) {
		item.addEventListener('click', function (e) {
			console.log(item)
			timeList.forEach(function (e) {
				console.log(e)
				item.style.backgroundColor = "orange";
				e.style.backgroundColor = "white";
				item.setAttribute('id', 'selected');
			});
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
					// alert('예약완료');
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
				window.location.href = 'restaurantInfo.do?rcode=' + rcode;
			} else if (rsp.success == false) { // 결제 실패시
				alert(rsp.error_msg);
			}
		});
	}
</script>

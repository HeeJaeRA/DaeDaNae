<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>달력</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

body {
	background-color: skyblue;
}

div {
	background-color: white;
	height: auto;
	width: 400px;
	margin: 0px;
	padding: 20px;
	margin: 0 auto;
	border-radius: 5px;
	box-shadow: 0px 40px 30px -20px rgba(0, 0, 0, 0.3);
}

td {
	width: 50px;
	height: 50px;
}

.Calendar {
	text-align: center;
}

.Calendar>thead>tr:first-child>td {
	font-family: 'Questrial', sans-serif;
	font-size: 1.1em;
	font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
	font-family: 'Questrial', sans-serif;
	font-weight: 600;
}

.Calendar>tbody>tr>td>p {
	font-family: 'Montserrat', sans-serif;
	height: 45px;
	width: 45px;
	border-radius: 45px;
	transition-duration: .2s;
	line-height: 45px;
	margin: 2.5px;
	display: block;
	text-align: center;
}

.pastDay {
	color: lightgray;
}

.today {
	background-color: #F5D042;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.futureDay {
	background-color: #FFFFFF;
	cursor: pointer;
}

.futureDay:hover {
	background: #eee;
}

.futureDay.choiceDay, .today.choiceDay {
	background: #0A174E;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}
</style>
<div>
	<table class="Calendar">
		<thead>
			<tr>
				<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
				<td colspan="5"><span id="calYear"></span>년 <span id="calMonth"></span>월
				</td>
				<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
			</tr>
			<tr>
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
		</thead>

		<tbody>
		</tbody>
	</table>
</div>
<script>
	window.onload = function() {
		buildCalendar();
	} // 웹 페이지가 로드되면 buildCalendar 실행

	let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
	let today = new Date(); // 페이지를 로드한 날짜를 저장
	today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

	// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	function buildCalendar() {

		let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
		let lastDate = new Date(nowMonth.getFullYear(),
				nowMonth.getMonth() + 1, 0); // 이번달 마지막날

		let tbody_Calendar = document.querySelector(".Calendar > tbody");
		document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
		document.getElementById("calMonth").innerText = leftPad(nowMonth
				.getMonth() + 1); // 월 숫자 갱신

		while (tbody_Calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
			tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
		}

		let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가           

		for (let j = 0; j < firstDate.getDay(); j++) { // 이번달 1일의 요일만큼
			let nowColumn = nowRow.insertCell(); // 열 추가
		}

		for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay
				.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

			let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

			let newDIV = document.createElement("p");
			newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
			nowColumn.appendChild(newDIV);

			if (nowDay.getDay() == 6) { // 토요일인 경우
				nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
			}

			if (nowDay < today) { // 지난날인 경우
				newDIV.className = "pastDay";
			} else if (nowDay.getFullYear() == today.getFullYear()
					&& nowDay.getMonth() == today.getMonth()
					&& nowDay.getDate() == today.getDate()) { // 오늘인 경우           
				newDIV.className = "today";
				newDIV.onclick = function() {
					choiceDate(this);
				}
			} else { // 미래인 경우
				newDIV.className = "futureDay";
				newDIV.onclick = function() {
					choiceDate(this);
				}
			}
		}
	}

	// 날짜 선택
	function choiceDate(newDIV) {
		if (document.getElementsByClassName("choiceDay")[0]) { // 기존에 선택한 날짜가 있으면
			document.getElementsByClassName("choiceDay")[0].classList
					.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
		}
		newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가
	}

	// 이전달 버튼 클릭
	function prevCalendar() {
		nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1,
				nowMonth.getDate()); // 현재 달을 1 감소
		buildCalendar(); // 달력 다시 생성
	}
	// 다음달 버튼 클릭
	function nextCalendar() {
		nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1,
				nowMonth.getDate()); // 현재 달을 1 증가
		buildCalendar(); // 달력 다시 생성
	}

	// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	function leftPad(value) {
		if (value < 10) {
			value = "0" + value;
			return value;
		}
		return value;
	}
</script>







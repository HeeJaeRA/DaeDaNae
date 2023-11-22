<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
	section .intro {
		display: flex;
		justify-content: center;
		text-align: center;
	}

	.sec1 {
		width: 500px;
		display: flex;
		flex-wrap: wrap;
		flex-direction: column;
		justify-content: space-around;
		padding: 10px;
	}

	.copTotal,
	.pointTotal {
		display: flex;
		justify-content: space-around;
	}

	.hidden {
		display: none;
	}

	.delmodal {
		position: absolute;
		width: 700px;
		height: 400px;
		display: flex;
		background-color: rgba(255, 110, 000, 0.9);
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		margin: auto;
		z-index: 300;
	}

	a,
	ul,
	li {
		text-decoration: none;
		list-style: none;
	}

	.tab {
		display: flex;
		align-items: center;
		padding: 1rem;
	}

	.tab__item {
		padding: 0.6rem 1.3rem;
		margin-right: 1rem;
		border: 1px solid #17a2b8;
		border-radius: 0.5rem;
		background-color: #17a2b8;
	}

	.tab__item:hover {
		background-color: #087384;
		color: #fff;
	}

	.tab__item.active {
		display: inline-block;
		border: 1px solid #38b44a;
		background-color: #38b44a;
		color: #000;
		text-decoration: none;
	}

	.tab__content-wrapper {
		padding: 1rem
	}

	.tab__content {
		display: none;
	}

	.tab__content.active {
		display: block;
	}

	thead,
	tbody,
	th {
		text-align: center;
		border-radius: 10px;
	}

	.myOwn {
		width: 100%;
		height: auto;
		/* border : 2px solid coral; */
		border-collapse: collapse;
		table-layout: fixed;
		caption-side: top;
		word-break: break-all;
		vertical-align: middle;
		background-color: rgb(255, 235, 229);
	}

	.myOwn2 {
		border: 2px;
		width: 60%;
		height: auto;
		/* border : 2px solid coral; */
		border-top: 1px solid #444444;
		border-collapse: collapse;
		table-layout: fixed;
		caption-side: top;
		word-break: break-all;
		vertical-align: middle;
		background-color: rgb(255, 235, 229, 0.6);
	}

	.myOwn2 thead,
	th,
	td {
		border-bottom: 1px solid #444444;
	}

	.myOwn2 tr {
		height: 50px;
	}

	.myOwn2 tbody {
		background-Color: white;
	}

	caption {
		text-align: center;
		font-weight: bold;
		color: coral;
	}

	.myOwn td,
	.myOwn th {
		border: 1px dashed #ccc;
		padding: 5px;
		text-align: center;
	}

	.popup-btn {
		color: salmon;
	}

	#main>section>div.intro>div.sec1>div.copList>table>tbody>tr:nth-child(2)>td:nth-child(1)>a:hover {
		color: green;
	}

	.popup-view {
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		width: 800px;
		background-color: #fff;
		border: 1px solid #b6b6b6;
		border-radius: 0.5rem;
		box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.2);
		z-index: 1000;
		display: none;

	}

	.popup-close {
		position: absolute;
		background-color: #000;
		padding: 14px;
		display: block;
		right: 0;
		border-top-right-radius: 0.5rem;
	}
	#myCoptb {
		margin-bottom: 0;
	}
</style>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<title>my page</title>

<!-- Template Main CSS File -->
<link href="resources/my/css/myStyle.css" rel="stylesheet">

</head>

<body>
<%-- 	${bookList } --%>
	<%-- 	쿠폰${ccnt } --%>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Profile</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="restaurantList.do">Home</a></li>
					<li class="breadcrumb-item active">User</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section>
			<div class="intro">

				<div class="sec1">
					<div class="copList">
						<table class="myOwn" cellspacing="0" cellpadding="0">
							<caption>나의 쿠폰</caption>
							<tr>
								<th>보유 쿠폰</th>
								<th>사용 쿠폰</th>
								<th>소멸 쿠폰</th>
							</tr>
							<tr>
								<td><a href="#" class="popup-btn">${ccnt }</a></td>
								<td>0</td>
								<td>0</td>
							</tr>
						</table>
					</div>

					<div class="myPoint">
						<table class="myOwn" cellspacing="0" cellpadding="0">
							<caption>나의 포인트</caption>
							<tr>
								<th>보유 포인트</th>
								<th>소멸 포인트</th>
							</tr>
							<tr>
								<td>${point }</td>
								<td>0</td>
							</tr>
						</table>
					</div>

				</div>

				<div class="col-xl-4">

					<div class="card">


						<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
							<img src="resources/images/memimg/${image }" alt="Profile" class="rounded-circle"
								width="150px;">

							<h3>${nickname }</h3>
							<h4>${userName }</h4>
							<div class="follow">
								<p>
									팔로잉 <span><b>0</b></span> | 팔로워 <span><b>0</b></span>
								</p>
							</div>

							<div class="delmodal hidden">
								<table class="deltable myOwn2">
									<thead>
										<tr>
											<th colspan="3">
												<h4>회원탈퇴</h4>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th colspan="3" style="width: 100px;">탈퇴 하시겠습니까?</th>
										</tr>
										<tr>

											<th colspan="3"><input type="button" id="deleteMems" class="btn btn-danger"
													value="네">
												<button class="btn btn-danger modal_close">아니요</button></th>

										</tr>
									</tbody>
								</table>
							</div>

							<div class="my">

								<button class="btn btn-danger"
									onclick="location.href = 'modifyMemF.do?id=${logId}'">회원수정</button>
								<button class="btn btn-danger modal_open">회원탈퇴</button>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 쿠폰모달창 -->
			<div class="popup-view">
				<a href="#" class="popup-close">X</a>
				<div class="tab__content-wrapper">
					<div>
						<table class="table table-light" id="myCoptb">
							<thead>
								<tr>
									<th>쿠폰코드</th>
									<th>쿠폰타입</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${copList }" var="vo">
									<tr>
										<td>${vo.couponCode }</td>
										<td>${vo.couponType }%</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</section>



		<div class="tab_menu">
			<!-- <input type="button" value="나의저장" onclick="" class="btn btn-primary" id="bookmar">
			<input type="button" value="예약현황" onclick="" class="btn btn-primary" id="booking"> -->

			<!-- 탭 버튼 영역 -->
			<ul class="tab">
				<li class="tab__item active"><a href="#tab1">나의저장</a></li>
				<li class="tab__item"><a href="#tab2">예약현황</a></li>
			</ul>


			<!-- 탭 내용 영역 -->
			<div class="tab__content-wrapper">
				<div id="tab1" class="tab__content active">
					<table class="table table-secondary">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>가게이름</th>
								<th>장소(군/구)</th>
								<th>전화번호</th>
								<th>평점</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bookList }" var="vo">
								<tr>
									<td>${vo.rsCategory }</td>
									<td>${vo.rsName }</td>
									<td>${vo.rsGu }</td>
									<td>${vo.phone }</td>
									<td>${vo.starcnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<div id="tab2" class="tab__content">
					<table class="table table-secondary">
						<thead>
							<tr>
								<th>가게코드</th>
								<th>가게이름</th>
								<th>예약날짜</th>
								<th>예약시간</th>
								<th>예약 좌석수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bookingList }" var="vo2">
								<tr>
									<td>${vo2.rsCode }</td>
									<td>${vo2.rsName }</td>
									<td>${vo2.resDate }</td>
									<td>${vo2.resTime }</td>
									<td>${vo2.seatcnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>


		</div>





	</main>
	<!-- End #main -->

	<script>
		let id = '${logId}';
		const open = document.querySelector(".modal_open");
		const close = document.querySelector(".modal_close");
		const modal = document.querySelector(".delmodal");

		function init() {
			open.addEventListener("click", function () {
				modal.classList.remove("hidden");
			})
			close.addEventListener("click", function () {
				modal.classList.add("hidden");
			})
		}
		init();
		let deleteMem = document.querySelector("#deleteMems").addEventListener("click", function (e) {
			console.log(id)

			fetch('adRemoveMember.do', {
					method: 'post',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: 'id=${logId}'
				})
				.then(resolve => resolve.json())
				.then(result => {
					console.log(result);
					if (result.retCode == 'OK') {
						console.log(result);
						alert("회원 탈퇴하셨습니다");
						//회원탈퇴 되면 자동 로그아웃(?)
						location.href = "logout.do";
					} else {
						console.log(result);
						alert("실패!!");
					}


				})
		})

		//탭 --> 리스트 확인
		const tabItem = document.querySelectorAll(".tab__item");
		const tabContent = document.querySelectorAll(".tab__content");

		tabItem.forEach((item, index) => {
			item.addEventListener("click", (e) => {
				e.preventDefault();

				tabContent.forEach((content) => {
					content.classList.remove("active");
				});

				tabItem.forEach((content) => {
					content.classList.remove("active");
				});

				tabItem[index].classList.add("active");
				tabContent[index].classList.add("active");
			});
		});

		// 쿠폰리스트 모달
		window.onload = function () {
			document.querySelector(".popup-btn").addEventListener("click", function () {
				document.querySelector(".popup-view").style.display = "block";
			});
			document.querySelector(".popup-close").addEventListener("click", function () {
				document.querySelector(".popup-view").style.display = "none";
			});
		}
	</script>

	<!-- Vendor JS Files -->
	<script src="resources/my/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="resources/my/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/my/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="resources/my/assets/vendor/echarts/echarts.min.js"></script>
	<script src="resources/my/assets/vendor/quill/quill.min.js"></script>
	<script src="resources/my/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="resources/my/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="resources/my/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/my/js/main.js"></script>
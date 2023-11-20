<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<style>

section .intro {
	display: flex;
	justify-content: center;
	text-align: center;
}
.sec1 {
	width : 500px;
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	justify-content: space-around;
}

.copTotal, .pointTotal {
	display: flex;
	justify-content: space-around;
}
</style>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>my page</title>

<!-- Template Main CSS File -->
<link href="resources/my/css/myStyle.css" rel="stylesheet">

</head>
<body>
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
						<h4>나의 쿠폰</h4>
						<div class="copTotal">
							<div class="now">
								<h5>보유 쿠폰</h5>
								<p>3</p>
							</div>
							<div class="done">
								<h5>사용 쿠폰</h5>
								<p>3</p>
							</div>
							<div class="yet">
								<h5>소멸 쿠폰</h5>
								<p>2</p>
							</div>
						</div>
					</div>

					<div class="myPoint">
						<h4>나의 포인트</h4>
						<div class="pointTotal">
							<div class="now">
								<h5>보유 포인트</h5>
								<p>${point }</p>
							</div>
							<div class="yet">
								<h5>소멸 포인트</h5>
								<p>250</p>
							</div>
						</div>
					</div>

				</div>
				
				<div class="col-xl-4">
					<div class="card">
						<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
							<img src="resources/images/memimg/${image }" alt="Profile" class="rounded-circle" width="150px">
							<h3>${nickname }</h3>
							<h4>${userName }</h4>
							<div class="follow">
								<p>팔로잉 <span><b>5</b></span> | 팔로워 <span><b>3</b></span></p>
							</div>
							<div class="my">
								<button class="btn btn-danger">회원수정</button>
								<button class="btn btn-danger">회원탈퇴</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>


		
		<div class="container px-4 px-lg-5 mt-5">

			<input type="button" value="나의저장" onclick="" class="btn btn-primary">
			<input type="button" value="예약현황" onclick="" class="btn btn-primary">

			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="rslist">
				
				
				
				<table>
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
						<tr>
							<td>ㅇ</td>
							<td>ㅇ</td>
							<td>ㅇ</td>
							<td>ㅇ</td>
							<td>ㅇ</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</main>
	<!-- End #main -->





	<!-- Vendor JS Files -->
	<script src="resources/my/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="resources/my/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/my/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="resources/my/assets/vendor/echarts/echarts.min.js"></script>
	<script src="resources/my/assets/vendor/quill/quill.min.js"></script>
	<script
		src="resources/my/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="resources/my/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="resources/my/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/my/js/main.js"></script>
</body>
</html>


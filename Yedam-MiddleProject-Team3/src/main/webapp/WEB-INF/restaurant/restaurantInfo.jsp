<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.wrap_review {
	max-width: 700px;
	margin: 0 auto;
	/* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.btn02 {
	display: block;
	width: 100%;
	font-weight: bold;
	border: 0;
	border-radius: 10px;
	max-height: 50px;
	padding: 15px 0;
	font-size: 1.1em;
	text-align: center;
	background: bisque;
}

#if {
	width: 0px;
	height: 0px;
	border: 0px;
}

.tab__content-wrapper {
	padding: 1rem
}

.tab__content.active {
	display: block;
}

thead, tbody, th {
	text-align: center;
	border-radius: 10px;
}

/* .table_head {
		font-weight: bold;
	}

	.review_date {
		width: 250px;
	}

	.review_content {
		width: 700px;
	}

	.star {
		width: 100px;
	}

	.like {
		width: 100px;
	}

	.td {
		width: 150px;
	} */
</style>

<!-- Product section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top"
					src="resources/images/rsimg/${vo.image1 }.jpg" alt="..." /> <input
					type="button" id="imgMain" class="btn btn-light" value="대표사진">
				<input type="button" id="imgCard1" class="btn btn-light" value="사진1">
				<input type="button" id="imgCard2" class="btn btn-light" value="사진2">
			</div>
			<div class="col-md-6">
				<span class="text-muted">${vo.rsCategory } / ${vo.rsGu }</span>
				<h1 class="display-5 fw-bolder">${vo.rsName }
					/
					<c:choose>
						<c:when test='${empty reviewCnt.star }'>
							0점
						</c:when>
						<c:otherwise>
							${reviewCnt.star }점
						</c:otherwise>
					</c:choose>
				</h1>
				<div class="fs-5 mb-5">
					<span class="text"> </span>
				</div>
				<p class="lead">${vo.rsDesc }</p>
				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
			<div style="width: 100%; height: 100px; text-align: center;">
				<c:choose>
					<c:when test='${empty logId }'>
						<span class="text-black"></span>
					</c:when>
					<c:otherwise>
						<br>
						<br>
						<a class="btn btn-danger mt-auto"
							href="reservationForm.do?rcode=${vo.rsCode }">예약하기</a>
						&emsp;
						<a class="btn btn-warning mt-auto" id="bookmark"
							onclick="mark(); this.onclick=null;">찜하기</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">${vo.rsName }과(와) 비슷한 맛집</h2>
		<input type="button" value="종류별" id="categoryBtn"
			class="btn btn-light"> <input type="button" value="지역별"
			id="addressBtn" class="btn btn-light">
	</div>

	<div class="container px-4 px-lg-5 mt-5" id="allDiv"
		style="display: block;">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${allList }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-danger text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">hot</div>
						<img class="card-img-top"
							src="resources/images/rsimg/${vo.image1 }.jpg" alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<span class="text-muted">${vo.rsCategory } / ${vo.rsGu }</span>
								<h5 class="fw-bolder">${vo.rsName }</h5>
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<c:forEach var="i" begin="1" end="${vo.starcnt }">
										<div class="bi-star-fill"></div>
									</c:forEach>
								</div>
								<span class="text-muted">방문자 ${vo.likecnt }명</span>
							</div>
						</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="restaurantInfo.do?rcode=${vo.rsCode }">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5" id="adrDiv"
		style="display: none;">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${addressList }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-danger text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">hot</div>
						<img class="card-img-top"
							src="resources/images/rsimg/${vo.image1 }.jpg" alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<span class="text-muted">${vo.rsCategory } / ${vo.rsGu }</span>
								<h5 class="fw-bolder">${vo.rsName }</h5>
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<c:forEach var="i" begin="1" end="${vo.starcnt }">
										<div class="bi-star-fill"></div>
									</c:forEach>
								</div>
								<span class="text-muted">방문자 ${vo.likecnt }명</span>
							</div>
						</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="restaurantInfo.do?rcode=${vo.rsCode }">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5" id="cateDiv"
		style="display: none;">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${categoryList }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-danger text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">hot</div>
						<img class="card-img-top"
							src="resources/images/rsimg/${vo.image1 }.jpg" alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<span class="text-muted">${vo.rsCategory } / ${vo.rsGu }</span>
								<h5 class="fw-bolder">${vo.rsName }</h5>
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<c:forEach var="i" begin="1" end="${vo.starcnt }">
										<div class="bi-star-fill"></div>
									</c:forEach>
								</div>
								<span class="text-muted">방문자 ${vo.likecnt }명</span>
							</div>
						</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="restaurantInfo.do?rcode=${vo.rsCode }">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5">
		<div class="wrap_review">
			<h2>리뷰 작성</h2>
			<form name="reviewform" class="reviewform">
				<label>작성자 <input name="nickname" value="${nickname }"
					readonly></label>
				<div class="review_rating">
					<label>맛 <select name="startaste" id="startaste">
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
					</select>
					</label> <label>가격 <select name="starprice" id="starprice">
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
					</select>
					</label> <label>서비스 <select name="starservice" id="starservice">
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
					</select>
					</label>
				</div>
				<div class="review_visit">
					<label>방문일자 <select name="visit_date" id="visit_date">
							<c:forEach items="${reservList}" var="voR">
								<option>${voR.resDate.substring(0,10) }</option>
							</c:forEach>
					</select>
					</label>
				</div>
				<div class="review_contents">
					<textarea rows="10" name="writecontent" id="reviewcontent"
						class="review_textarea"></textarea>
				</div>
				<div class="cmd">
					<c:choose>
						<c:when test='${empty logId}'>
							<span class="text-muted">로그인 후 작성 가능합니다.</span>
						</c:when>
						<c:when test='${empty reservList}'>
							<span class="text-muted">예약 후 작성 가능합니다.</span>
						</c:when>
						<c:when test='${reservList.size() eq reviewCheck.size()}'>
							<span class="text-muted">이미 리뷰를 작성하셨습니다.</span>
						</c:when>
						<c:otherwise>
							<input type="button" id="addreview" value="리뷰작성"
								onclick="addReview();" class="btn btn-success">
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</div>

	<div class="tab__content-wrapper">
		<h2>리뷰 목록</h2>
		<div id="tab1" class="tab__content active">
			<table class="table table-secondary">
				<thead>
					<tr class="table_head">
						<td>작성자</td>
						<td class="review_content">리뷰 내용</td>
						<td class="visit_date">방문일자</td>
						<td class="review_date">작성일자</td>
						<td class="star">맛</td>
						<td class="star">가격</td>
						<td class="star">서비스</td>
						<td class="like">좋아요</td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr style="visibility: collapse;">
						<td>작성자</td>
						<td class="review_content">리뷰 내용</td>
						<td class="visit_date">방문일자</td>
						<td class="review_date">작성일자</td>
						<td class="star">0</td>
						<td class="star">0</td>
						<td class="star">0</td>
						<td class="like">좋아요수</td>
						<td><input type="button" id="likereview" value="좋아요"></td>
						<td><button id="delreview">삭제</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</section>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46ff76ad0b944380d5f5b43fdd9dd2d8&libraries=services"></script>
<script>
	// 맵
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 1 // 지도의 확대 레벨
		};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${vo.rsAddress }', function (result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.rsName }</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
	});

	// 리뷰 등록
	let rc = "${vo.rsCode }";
	let uid = "${logId }";
	let nick = "${nickname }";

	function addReview() {
		let writecontent = document.querySelector('.review_textarea').value;
		let taste = document.querySelector('#startaste').value;
		let price = document.querySelector('#starprice').value;
		let service = document.querySelector('#starservice').value;

		document.querySelector('#addreview').addEventListener('click', function (e) {
			fetch('addReview.do', {
					method: 'post',
					headers: {
						'Content-type': 'application/x-www-form-urlencoded'
					},
					body: 'rscode=' + rc + '&userid=' + uid + '&nickname=' + nick + '&writecontent=' +
						writecontent + '&startaste=' + taste + '&starprice=' + price + '&starservice=' +
						service
				})
				.then(resolve => resolve.json())
				.then(result => {
					if (result.retCode == 'OK') {
						alert('포인트 지급 완료');
						clearReview();
						showReviewList();
					} else {
						alert('등록 실패');
						clearReview();
						showReviewList();
					}
				})
				.catch(err => console.log('error:' + err));
		});
	}

	// 리뷰 등록창 초기화
	function clearReview() {
		document.querySelector('.review_textarea').value = '';
		document.querySelector('#startaste').value = '5';
		document.querySelector('#starprice').value = '5';
		document.querySelector('#starservice').value = '5';
	}

	// 리뷰 리스트
	function showReviewList() {
		document.querySelectorAll('tbody tr:not(:nth-of-type(1))').forEach(tr => tr.remove());
		fetch('reviewList.do?rscode=' + rc)
			.then(resolve => resolve.json())
			.then(result => {
				result.reviewlist.forEach(review => {
					let temp = makeRow(review);
					document.querySelector('tbody').append(temp);
				})
			})
			.catch(err => console.log('err: ', err));
	}
	showReviewList();

	function makeRow(review) {
		let temp = document.querySelector('tbody tr').cloneNode(true);
		temp.style.visibility = 'visible'
		temp.querySelector('td:nth-of-type(1)').innerHTML = review.nickname;
		temp.querySelector('td:nth-of-type(2)').innerHTML = review.writeContent;
		temp.querySelector('td:nth-of-type(3)').innerHTML = visit_date.value;
		temp.querySelector('td:nth-of-type(4)').innerHTML = review.writeDate;
		temp.querySelector('td:nth-of-type(5)').innerHTML = review.starTaste;
		temp.querySelector('td:nth-of-type(6)').innerHTML = review.starPrice;
		temp.querySelector('td:nth-of-type(7)').innerHTML = review.starService;
		temp.querySelector('td:nth-of-type(8)').innerHTML = review.likecnt;

		temp.querySelector('#likereview').addEventListener('click', function (e) {
			if (uid == '') {
				alert('권한이 없습니다.');
				return;
			}
			fetch('likeReview.do', {
					method: 'post',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: 'reviewNo=' + review.reviewCode
				})
				.then(resolve => resolve.json())
				.then(result => {
					if (result.retCode == 'OK') {
						// alert('좋아요');
						showReviewList();
					} else {
						alert('좋아요 실패');
					}
				})
				.catch(err => console.log(err));
		})

		temp.querySelector('#delreview').addEventListener('click', function (e) {
			if (uid == '' || uid != review.userId) {
				alert('권한이 없습니다.');
				return;
			}
			fetch('removeReview.do', {
					method: 'post',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: 'reviewNo=' + review.reviewCode
				})
				.then(resolve => resolve.json())
				.then(result => {
					console.log(result);
					if (result.retCode == 'OK') {
						alert('삭제 성공');
						e.target.parentElement.parentElement.remove();
						showReviewList();
					} else {
						alert('삭제 실패');
					}
				})
				.catch(err => console.log(err));
		})
		return temp;
	}

	// 카테고리별, 지도별 조회 버튼
	document.querySelector('#categoryBtn').addEventListener('click', function (e) {
		document.querySelector('#allDiv').style.display = 'none';
		document.querySelector('#adrDiv').style.display = 'none';
		document.querySelector('#cateDiv').style.display = 'block';
	})

	document.querySelector('#addressBtn').addEventListener('click', function (e) {
		document.querySelector('#allDiv').style.display = 'none';
		document.querySelector('#cateDiv').style.display = 'none';
		document.querySelector('#adrDiv').style.display = 'block';
	})

	// 이미지 전환 버튼
	let img1 = '${vo.image1}';
	let img2 = '${vo.image2}';
	let img3 = '${vo.image3}';
	document.querySelector('#imgMain').addEventListener('click', function (e) {
		document.querySelector('.card-img-top').src = 'resources/images/rsimg/' + img1 + '.jpg';
	})
	document.querySelector('#imgCard1').addEventListener('click', function (e) {
		document.querySelector('.card-img-top').src = 'resources/images/rsimg/' + img2 + '.jpg';
	})
	document.querySelector('#imgCard2').addEventListener('click', function (e) {
		document.querySelector('.card-img-top').src = 'resources/images/rsimg/' + img3 + '.jpg';
	})


	// 찜하기
	function mark() {
		fetch('bookMark.do', {
				method: 'post',
				headers: {
					'Content-type': 'application/x-www-form-urlencoded'
				},
				body: 'id=' + uid + '&rcode=' + rc
			})
			.then(resolve => resolve.json())
			.then(result => {
				if (result.retCode == 'OK') {
					alert('찜목록에 추가되었습니다.');
				} else {
					alert('실패');
				}
			})
			.catch(err => console.log('err:' + err));
	}
</script>
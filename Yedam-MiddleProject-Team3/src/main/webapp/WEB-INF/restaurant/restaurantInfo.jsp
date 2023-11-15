<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Product section-->

<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top" src="resources/images/store.jpg" alt="..." />
			</div>
			<div class="col-md-6">
				<span class="text-muted">${vo.rsCategory } / ${vo.rsGu }</span>
				<h1 class="display-5 fw-bolder">${vo.rsName }</h1>
				<div class="fs-5 mb-5">
					<span class="text"> </span>
				</div>
				<p class="lead">${vo.rsDesc }</p>
				<div id="map" style="width:100%;height:350px;"></div>
				<div class="d-flex">
					<button class="btn btn-outline-primary flex-shrink-0" type="button">
						<i class="bi-cart-fill me-1"></i> 예약하기
					</button>
				</div>
			</div>
			<div style="width:100%; height:100px; text-align:center;"><span class="text-muted">내용${vo.rsDesc }</span>
			</div>
		</div>
	</div>


	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">${vo.rsName }과 비슷한 맛집</h2>
		<input type="button" value="종류별" id="categoryBtn">
		<input type="button" value="지역별" id="addressBtn">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="relateDiv">
			<c:forEach items="${allList }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
							bookmark</div>
						<img class="card-img-top" src="resources/images/store.jpg" alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<span class="text-muted">${vo.rsCategory } / ${vo.rsGu }</span>
								<h5 class="fw-bolder">${vo.rsName }</h5>
								<div class="d-flex justify-content-center small text-warning mb-2">
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
									href="restaurantInfo.do?rcode=${vo.rsCode }">예약하기</a>
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
			<form name="reviewform" class="reviewform" method="post" action="/addReview.do">
				<input type="hidden" name="rate" id="rate" value="0" />
				<p class="title_star">별점과 리뷰를 남겨주세요.</p>
				<div class="review_rating">
					<div class="warning_msg">별점을 선택해 주세요.</div>
					<div class="rating">
						<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
						<label for="rating1"></label>
						<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
						<label for="rating2"></label>
						<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점">
						<label for="rating3"></label>
						<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
						<label for="rating4"></label>
						<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
						<label for="rating5"></label>
					</div>
				</div>
				<div class="review_contents">
					<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
					<textarea rows="10" class="review_textarea"></textarea>
				</div>
				<div class="cmd">
					<input type="button" name="save" class="btn02" id="save" value="등록">
				</div>
			</form>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5">
		<h2>리뷰 목록</h2>
		<table>
			<thead>
				<tr class="table_head">
					<td>리뷰번호</td>
					<td>작성자</td>
					<td class="review_content">리뷰내용</td>
					<td>작성일자</td>
					<td>별점</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>test</td>
					<td class="review_content">너무맛있어요</td>
					<td>2023-11-15</td>
					<td>3</td>
				</tr>
			</tbody>
		</table>		
	</div>

</section>

<script>
	//카테고리별, 지도별 조회 버튼
	document.querySelector('#categoryBtn').addEventListener('click', function (e) {

		// document.querySelector('#relateDiv').remove();

		document.querySelector('#relateDiv').innerHTML = '';

		document.querySelector('#relateDiv').innerHTML =
			'<div class="col mb-5"><div class="card h-100"><div class="badge bg-dark text-white position-absolute"style="top: 0.5rem; right: 0.5rem">bookmark</div><img class="card-img-top" src="resources/images/store.jpg" alt="..." /><div class="card-body p-4"><div class="text-center"><span class="text-muted">${vo.rsCategory } / ${vo.rsGu }</span><h5 class="fw-bolder">${vo.rsName }</h5><div class="d-flex justify-content-center small text-warning mb-2"><div class="bi-star-fill"></div></div><span class="text-muted">방문자 ${vo.likecnt }명</span></div></div><div class="card-footer p-4 pt-0 border-top-0 bg-transparent"><div class="text-center"><a class="btn btn-outline-dark mt-auto" href="restaurantInfo.do?rcode=${vo.rsCode }">예약하기</a></div></div></div></div>';

	})

	function makeDiv() {

	}
</script>
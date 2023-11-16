<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Product section-->

${logId }, ${nickname }, ${respon }

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
			<c:forEach items="${addressList }" var="vo" end="3">
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
			<form name="reviewform" class="reviewform" method="post" action="addReview.do" target="_blank">
			<label hidden = "hidden">가게번호 <input name = "rscode" value="1"></label>
			<label hidden = "hidden">아이디 <input name = "userid" value="test"></label>
			<label>작성자 <input name = "nickname" value="${nickname }" readonly></label>

				<div class="review_rating">
				<label>맛 <input name="startaste" value="3"></label>
				<label>가격 <input name="starprice" value="3"></label>
				<label>서비스 <input name="starservice" value="3"></label>
					
				</div>
				<div class="review_contents">

					<textarea rows="10" name="writecontent" class="review_textarea"></textarea>
				</div>
				<div class="cmd">
					<input type="submit" id="save" class="btn02" value="등록">
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
					<td class="review_content">너무 맛있어요</td>
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
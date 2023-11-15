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
				<div class="small mb-1">Code: ${vo.rsCode }</div>
				<div class="small mb-1">종류: ${vo.rsCategory }</div>
				<h1 class="display-5 fw-bolder">${vo.rsName }</h1>
				<div class="fs-5 mb-5">
					<span class="text-decoration-line-through">${vo.likecnt }</span> <span>${vo.starcnt }</span>
				</div>
				<p class="lead">${vo.rsDesc }</p>
				<div class="d-flex">
					<input class="form-control text-center me-3" id="inputQuantity"
						type="num" value="1" style="max-width: 3rem" />
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						<i class="bi-cart-fill me-1"></i> Add to cart
					</button>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">${vo.rsName }과 비슷한 맛집</h2>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${addressList }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">bookmark</div>
						<img class="card-img-top" src="resources/images/store.jpg" alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<h5 class="fw-bolder">${vo.rsName }</h5>
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<c:forEach var="i" begin="1" end="${vo.starcnt }">
										<div class="bi-star-fill"></div>
									</c:forEach>
								</div>
								<span class="text-muted text-decoration-line-through">${vo.likecnt }</span>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="restaurantInfo.do?rcode=${vo.rsCode }">예약하기</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
	</div>
</section>
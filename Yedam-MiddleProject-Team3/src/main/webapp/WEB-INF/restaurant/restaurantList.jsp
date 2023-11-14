<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Header-->
<header class="bg-dark py-5" style ="background-image : url('resources/images/banner.jpg'); height:300px;">

</header>

<section class="py-5">
	<input type="button" value="종류별" onclick="location.href='categoryList.do'">
	<input type="button" value="지역별" onclick="location.href='addressList.do'">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${list }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem"></div>
						<img class="card-img-top" src="resources/images/${vo.image1 }"
							alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<p>${vo.rsCategory }</p>
								<h5 class="fw-bolder">${vo.rsName }</h5>
								<p>${vo.rsGu }</p>
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<c:forEach var="i" begin="1" end="${vo.starcnt }">
										<div class="bi-star-fill"></div>
									</c:forEach>
								<span class="text-muted">&nbsp;&nbsp;(${vo.likecnt })</span>
								</div>
							</div>
						</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">예약하기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
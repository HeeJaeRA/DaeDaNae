<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	#slider {
		width: 100%;
		height: 350px;
	}

	.sliderWrap {
		position: relative;
	}

	.sliderWrap>div {
		display: block;
	}

	.sliderWrap>div:first-child {
		display: block;
	}

	.sliderWrap .slider {
		position: absolute;
		width: 100%;
		height: 100%;
	}

	#slider>div>div>img {
		vertical-align: top;
		object-fit: fill;
		width: 100%;
		height: 350px;
	}
</style>

<header>
	<article id="slider">
		<div class="sliderWrap">
			<div class="slider">
				<img src="resources/images/banner.jpg" alt="banner1">
			</div>
			<div class="slider">
				<img src="resources/images/banner2.jpg" alt="banner2">
			</div>
			<div class="slider">
				<img src="resources/images/banner3.jpg" alt="banner3">
			</div>
		</div>
	</article>
</header>

<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
	<c:choose>
		<c:when test='${empty mlist ||empty searchWord }'>
			<h3 class="fw-bolder mb-4">검색 결과가 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<h2 class="fw-bolder mb-4">'${searchWord }' 검색 결과 &nbsp; ${mlist.size()}개</h2>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${mlist }" var="vo">
					<div class="col mb-5">
						<div class="card h-100">
							<img class="card-img-top" src="resources/images/rsimg/${vo.image1 }" alt="..." />
							<div class="card-body p-4">
								<div class="text-center">
									<p>${vo.rsCategory }</p>
									<h5 class="fw-bolder">${vo.rsName }</h5>
									<p>${vo.rsGu }</p>
									<div class="d-flex justify-content-center small text-warning mb-2">
										<c:forEach var="i" begin="1" end="${vo.starcnt }">
											<div class="bi-star-fill"></div>
										</c:forEach>
										<span class="text-muted">&nbsp;&nbsp;(${vo.likecnt })</span>
									</div>
								</div>
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"href="restaurantInfo.do?rcode=${vo.rsCode }">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
		
	</div>
	
</section>

<script>

window.onload = function(){
            let currentIndex = 0;
            const slider = document.querySelectorAll(".slider"); 
            slider.forEach(img => img.style.opacity ="0"); 
            slider[0].style.opacity = "1";

            setInterval(() => { 
                let nextIndex = (currentIndex + 1) % slider.length;

                slider[currentIndex].style.opacity = "0"; 
                slider[nextIndex].style.opacity = "1";
                slider.forEach(img => img.style.transition = "all 1s");

                currentIndex = nextIndex;
            }, 3000);
        }


</script>


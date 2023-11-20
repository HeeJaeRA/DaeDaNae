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
.sliderWrap > div {
    display: block;
}
.sliderWrap > div:first-child {
	display: block;
}
.sliderWrap .slider {
	position: absolute;
	width: 100%;
	height: 100%;
}
#slider > div > div > img {
	vertical-align: top;
	object-fit: fill;
	width: 100%;
}

.container {
	display : flex;
	justify-content: center;
}

.container > button {
	margin : 0 5px;
}

.modal-body {
	display : flex;
	flex-wrap : wrap;
	justify-content: space-between;
}
</style>

<!-- 배너-->
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

${logId }, ${nickname }, ${respon }, ${money }, ${mlist}

<section class="py-5">
	<div class="container">
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#category">종류별</button>
		<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#address">지역별</button>

		<!-- Modal -->
		<div class="modal fade" id="category" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">종류별</h4>
					</div>
					<div class="modal-body"  id="ccontent">
						<button type="button" class="btn btn-success btn-lg">한식</button>
						<button type="button" class="btn btn-success btn-lg">중식</button>
						<button type="button" class="btn btn-success btn-lg">일식</button>
						<button type="button" class="btn btn-success btn-lg">양식</button>
						<button type="button" class="btn btn-success btn-lg">포차</button>
						<button type="button" class="btn btn-success btn-lg">디저트</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		
		<div class="modal fade" id="address" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">지역별</h4>
					</div>
					<div class="modal-body" id="acontent">
						<button type="button" class="btn btn-info btn-lg">중구</button>
						<button type="button" class="btn btn-info btn-lg">북구</button>
						<button type="button" class="btn btn-info btn-lg">서구</button>
						<button type="button" class="btn btn-info btn-lg">동구</button>
						<button type="button" class="btn btn-info btn-lg">수성구</button>
						<button type="button" class="btn btn-info btn-lg">달서구</button>
						<button type="button" class="btn btn-info btn-lg">달성군</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="rslist">
			<c:forEach items="${mlist }" var="vo">
				<div class="col mb-5">
					<div class="card h-100">
						<img class="card-img-top" src="resources/images/rsimg/${vo.image1 }.jpg" alt="..." />
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
								<a class="btn btn-warning mt-auto"href="restaurantInfo.do?rcode=${vo.rsCode }">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
</section>

<script>

	document.querySelectorAll('#ccontent button').forEach(item => {
		item.addEventListener('click', function(e) {
			let ct = e.target.innerHTML;
			fetch('categoryList.do')
			.then(resolve => {
				window.location.href = resolve.url + '?category=' + ct;
			})
            .catch(err => console.log(err));
		})
	})

	document.querySelectorAll('#acontent button').forEach(item => {
		item.addEventListener('click', function(e) {
			let ad = e.target.innerHTML;
			fetch('addressList.do')
			.then(resolve => {
				window.location.href = resolve.url + '?address=' + ad;
			})
            .catch(err => console.log(err));
		})
	})
	
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Header-->
<header class="bg-dark py-5" style="background-image : url('resources/images/banner.jpg'); height:300px;">

</header>

<section class="py-5">
	<div class="container">
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#category">종류별</button>
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#address">지역별</button>

		<!-- Modal -->
		<div class="modal fade" id="category" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">종류별</h4>
					</div>
					<div class="modal-body">
						<button type="button" class="btn btn-info btn-lg">한식</button>
						<button type="button" class="btn btn-info btn-lg">중식</button>
						<button type="button" class="btn btn-info btn-lg">일식</button>
						<button type="button" class="btn btn-info btn-lg">양식</button>
						<button type="button" class="btn btn-info btn-lg">호프</button>
						<button type="button" class="btn btn-info btn-lg">디저트</button>
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
					<div class="modal-body">
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
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${list }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
						</div>
						<img class="card-img-top" src="resources/images/store.jpg" alt="..." />
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
								<a class="btn btn-outline-dark mt-auto"href="restaurantInfo.do?rcode=${vo.rsCode }">예약하기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${list }" var="vo" end="3">
				<div class="col mb-5">
					<div class="card h-100">
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
						</div>
						<img class="card-img-top" src="resources/images/store.jpg" alt="..." />
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
								<a class="btn btn-outline-dark mt-auto" href="restaurantInfo.do?rcode=${vo.rsCode }">예약하기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	
</section>

<<script type="text/javascript">
//지도
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);

// 리뷰 등록
function Rating() {};

Rating.prototype.rate = 0;
Rating.prototype.setRate = function (newrate) {
    //클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function (item, idx) {
        if (idx < newrate) {
            item.checked = true;
        } else {
            item.checked = false;
        }
    });
}
let rating = new Rating();

document.addEventListener('DOMContentLoaded', function () {
    document.querySelector('.rating').addEventListener('click', function (e) {
        let elem = e.target;
        if (elem.classList.contains('rate_radio')) {
            rating.setRate(parseInt(elem.value));
        }
    })
});

document.querySelector('#save').addEventListener('click', function (e) {
    if (rating.rate == 0) {
        rating.showMessage('rate');
        return false;
    }
    if (document.querySelector('.review_textarea').value.length < 5) {
        rating.showMessage('review');
        return false;
    }
});

Rating.prototype.showMessage = function (type) {
    switch (type) {
        case 'rate':
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            break;
        case 'review':
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            break;
    }
}

</script>

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
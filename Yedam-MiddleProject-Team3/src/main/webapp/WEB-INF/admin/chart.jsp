<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <h1 class="mt-4">차트보기</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item active">차트목록</li>
	</ol>
	

	<div class="chart1">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-bar me-1"></i> 인기많은 가게
			</div>
			<div class="card-body">
				<div id="popRes" style="height:400px;"></div>
			</div>
		</div>
	</div>
	
	<div class="chart2">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fa fa-pie-chart me-1"></i> 인기많은 카테고리
			</div>
			<div class="card-body">
				<div id="popCate" style="height:400px;"></div>
			</div>
		</div>
	</div>
	


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    
	
	function drawBasic() {
		fetch('drawChart.do')
		.then(resolve => resolve.json())
		.then(result => {
			let dataAry = [['RESTAURANT_NAME', '좋아요수']];
			console.log(result);
			result.forEach(item => {
				
				dataAry.push([item.RESTAURANT_NAME, item.LIKECNT]);
			})
		var data = google.visualization.arrayToDataTable(dataAry);
		var options = {
			title : 'Population Restaurant',
			chartArea : {
				width : '50%'
			},
			hAxis : {
				title : 'Total Population',
				minValue : 0
			},
			vAxis : {
				title : '가게이름'
			}
		};

		var chart = new google.visualization.BarChart(document.getElementById('popRes'));
		chart.draw(data, options);
		
		})
		.catch(err => console.log(err));
	}
	


    function drawChart() {
    	
    	
    	fetch('drawChart2.do')
		.then(resolve => resolve.json())
		.then(result => {
			let dataAry = [['CATEGORY', 'LIKECNT']];
			console.log(result);
			result.forEach(item => {
				dataAry.push([item.CATEGORY, item.LIKECNT]);
			})
		var data = google.visualization.arrayToDataTable(dataAry);
		var options = {
	        title: '인기 많은 카테고리',
	        is3D: true,
		};
		
	    var chart = new google.visualization.PieChart(document.getElementById('popCate'));
	    chart.draw(data, options);
		
		})
		.catch(err => console.log(err));

    }
	
	
	
// 	google.charts.load("current", {packages:["corechart"]});
// 	google.charts.setOnLoadCallback(drawChart);
// 	function drawChart() {
// 		fetch('drawChart.do')
// 		.then(resolve => resolve.json())
// 		.then(result => {
// 			let dataAry = [['RES_DATE', 'BUYABLE']];
// 			console.log(result);
// 			result.forEach(item => {
				
// 				dataAry.push([item.RES_DATE, item.BUYABLE]);
// 			})
// 		var data = google.visualization.arrayToDataTable(dataAry);
// 		);
//       	var options = {
//     	        title: '날짜별 예약현황',
//     	        legend: { position: 'none' },
//     	        colors: ['green']
//     	};


// 		var chart = new google.visualization.Histogram(document.getElementById('bookRes'));
// 		chart.draw(data, options);
// 		})
// 		.catch(err => console.log(err));
    	
//     }


</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <h1 class="mt-4">Dashboard</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item active">Dashboard</li>
	</ol>
	
	
	<div class="row">
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area me-1"></i> Area Chart Example
				</div>
				<div class="card-body">
					<canvas id="myAreaChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i> 인기많은 가게
				</div>
				<div class="card-body">
					<div id="popRes"></div>
					<canvas id="myBarChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	
	
    <div class="card mb-4">    
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 회원목록
		</div>
		
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>아이디</th>
						<th>패스워드</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>등급</th>
						<th>연락처</th>
						<th>주소</th>
						<th>적립금</th>
						<th>이미지</th>
						<th>성별</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>아이디</th>
						<th>패스워드</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>등급</th>
						<th>연락처</th>
						<th>주소</th>
						<th>적립금</th>
						<th>이미지</th>
						<th>성별</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${memList }" var="vo">
					<tr>
						<td>${vo.userId }</td>
						<td>${vo.userPw }</td>
						<td>${vo.userName }</td>
						<td>${vo.nickname }</td>
						<td>${vo.grade }</td>
						<td>${vo.phone }</td>
						<td>${vo.address }</td>
						<td>${vo.money }</td>
						<td>${vo.image }</td>
						<td>${vo.gender }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
	
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

</script>
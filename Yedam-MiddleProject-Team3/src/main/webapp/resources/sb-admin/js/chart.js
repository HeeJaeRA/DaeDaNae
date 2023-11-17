
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

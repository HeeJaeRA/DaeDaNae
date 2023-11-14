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
					<i class="fas fa-chart-bar me-1"></i> Bar Chart Example
				</div>
				<div class="card-body">
					<canvas id="myBarChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	
	
    <div class="card mb-4">    
		<div class="card-header">
			<i class="fas fa-table me-1"></i> DataTable Example
		</div>
		
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>제품 코드</th>
						<th>제품 이름</th>
						<th>제품 설명</th>
						<th>가격</th>
						<th>할인 가격</th>
						<th>평점</th>
						<th>사진</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>제품 코드</th>
						<th>제품 이름</th>
						<th>제품 설명</th>
						<th>가격</th>
						<th>할인 가격</th>
						<th>평점</th>
						<th>사진</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.prodCode }</td>
						<td>${vo.prodName }</td>
						<td>${vo.prodDesc }</td>
						<td>${vo.price }</td>
						<td>${vo.offPrice }</td>
						<td>${vo.likeIt }</td>
						<td>${vo.prodImage }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
	   <div class="card mb-4">    
		<div class="card-header">
			<i class="fas fa-table me-1"></i> DataTable Example
		</div>
		
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>제품 코드</th>
						<th>제품 이름</th>
						<th>제품 설명</th>
						<th>가격</th>
						<th>할인 가격</th>
						<th>평점</th>
						<th>사진</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>제품 코드</th>
						<th>제품 이름</th>
						<th>제품 설명</th>
						<th>가격</th>
						<th>할인 가격</th>
						<th>평점</th>
						<th>사진</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.prodCode }</td>
						<td>${vo.prodName }</td>
						<td>${vo.prodDesc }</td>
						<td>${vo.price }</td>
						<td>${vo.offPrice }</td>
						<td>${vo.likeIt }</td>
						<td>${vo.prodImage }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
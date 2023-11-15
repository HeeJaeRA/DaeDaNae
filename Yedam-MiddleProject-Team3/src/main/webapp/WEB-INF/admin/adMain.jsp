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
						<th>군구</th>
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
						<th>군구</th>
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
						<td>${vo.gunGu }</td>
						<td>${vo.money }</td>
						<td>${vo.image }</td>
						<td>${vo.gender }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
		
	
	    <div class="card mb-4">    
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 업체목록
		</div>
		
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>업체코드</th>
						<th>카테고리</th>
						<th>이름</th>
						<th>주소</th>
						<th>군구</th>
						<th>동</th>
						<th>연락처</th>
						<th>소개</th>
						<th>이미지1</th>
						<th>이미지2</th>
						<th>이미지3</th>
						<th>좋아요</th>
						<th>평점</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>업체코드</th>
						<th>카테고리</th>
						<th>이름</th>
						<th>주소</th>
						<th>군구</th>
						<th>동</th>
						<th>연락처</th>
						<th>소개</th>
						<th>이미지1</th>
						<th>이미지2</th>
						<th>이미지3</th>
						<th>좋아요</th>
						<th>평점</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${resList }" var="vo">
					<tr>
						<td>${vo.rsCode }</td>
						<td>${vo.rsCategory }</td>
						<td>${vo.rsName }</td>
						<td>${vo.rsAddress }</td>
						<td>${vo.rsGu }</td>
						<td>${vo.rsDong }</td>
						<td>${vo.phone }</td>
						<td>${vo.rsDesc }</td>
						<td>${vo.image1 }</td>
						<td>${vo.image2 }</td>
						<td>${vo.image3 }</td>
						<td>${vo.likecnt }</td>
						<td>${vo.starcnt }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
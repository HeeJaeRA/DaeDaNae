<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

   <h1 class="mt-4">업체관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item active">업체목록</li>
	</ol>
	
	

    <div class="card mb-4">    
		<div class="card-header">
			<i class="fas fa-table me-1"></i> DataTable Example
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
						<th>좋아요</th>
						<th>평점</th>
						<th>삭제</th>
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
						<th>좋아요</th>
						<th>평점</th>
						<th>삭제</th>
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
						<td>${vo.likecnt }</td>
						<td>${vo.starcnt }</td>
					    <td><button class="" >삭제</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<button>가게 추가</button>
		</div>
	</div>
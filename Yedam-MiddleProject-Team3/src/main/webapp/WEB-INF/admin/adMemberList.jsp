<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <h1 class="mt-4">회원관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item active">회원목록</li>
	</ol>
	
	

    <div class="card mb-4">    
		<div class="card-header">
			<i class="fas fa-table me-1"></i> DataTable Example
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
	

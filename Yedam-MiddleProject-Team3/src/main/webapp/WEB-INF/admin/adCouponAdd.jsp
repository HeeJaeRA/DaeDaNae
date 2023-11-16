<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <h1 class="mt-4">쿠폰발급</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item active">쿠폰발급</li>
	</ol>
		
    <div class="card mb-4">    
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 회원목록
		</div>
		
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>등급</th>
						<th>연락처</th>
						<th>적립금</th>
						<th>성별</th>
						<th>쿠폰선택</th>
						<th>발급</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>등급</th>
						<th>연락처</th>
						<th>적립금</th>
						<th>성별</th>
						<th>쿠폰선택</th>
						<th>발급</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${memList }" var="vo">
					<tr>
						<td>${vo.userId }</td>
						<td>${vo.userName }</td>
						<td>${vo.nickName }</td>
						<td>${vo.grade }</td>
						<td>${vo.phone }</td>
						<td>${vo.money }</td>
						<td>${vo.gender }</td>
						<td>
							<form>
								<select name="copAdd">
									<option value="cop_3">할인쿠폰_3%</option>
									<option value="cop_5">할인쿠폰_5%</option>
									<option value="cop_7">할인쿠폰_7%</option>
									<option value="cop_10">할인쿠폰_10%</option>
								</select>
							</form>
						</td>
							<td><button>발급</button>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
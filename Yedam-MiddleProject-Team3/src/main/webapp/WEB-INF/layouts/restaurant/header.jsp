<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="restaurantList.do"><img
			src="resources/images/logo.png"></a>

		<form class="d-flex">
			<input style="width: 800px;" class="form-control me-sm-2" type="search"
				placeholder="Search">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>

		<div>
		<c:choose>
			<c:when test="${empty logId }">
				<button class="btn btn-light" onclick="location.href='loginForm.do'">로그인</button>
			</c:when>
			<c:otherwise>
				<button class="btn btn-light" onclick="location.href='logout.do'">로그아웃</button>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
</nav>


<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">

		<div class="collapse navbar-collapse" id="navbarColor04">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a class="nav-link" href="aboutBoard.do">About</a></li>
				<li class="nav-item"><a class="nav-link" href="noticeBoard.do">Notice</a></li>
				<li class="nav-item"><a class="nav-link" href="freeBoard.do">맛집추천</a></li>
				<li class="nav-item"><a class="nav-link" href="qnaBoard.do">QnA</a></li>
				<li class="nav-item"><a class="nav-link" href="eventBoard.do">Event</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">Instagram</a></li>
			</ul>
			<form class="d-flex">
				<button class="btn btn-outline-primary" type="submit">
					<i class="bi-cart-fill me-1"></i> 예약정보 <span
						class="badge bg-primary text-white ms-1 rounded-pill">0</span>
				</button>
			</form>
		</div>
	</div>
</nav>
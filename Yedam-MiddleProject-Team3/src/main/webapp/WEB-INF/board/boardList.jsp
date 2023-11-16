
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
		
<!-- let freeB = document.getElementById("freeB");    -->
<!-- freeB.addEventListener("click", freeB());        -->
<!-- function freeB() { -->
<!--    자유게시판 오픈되게.. -->
<!-- } -->
<!-- 	<a href="noticeBoard.do"><input type="button" value = "공지사항"></a> -->
<!-- 	<a href="qnaBoard.do"><input type="button" value = "QnA게시판"></a> -->
<!-- 	<a href="freeBoard.do"><input type="button" value = "자유게시판"></a> -->
		
		
<h3>전체게시글(임시..)</h3>

<table class="table" border="1">
	<thead>
		<tr>
		
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>수정일자</th>
			<th>내용</th>
			<th>조회수</th>
			<th>공감수</th>

		</tr>
	<tbody>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.boardCode }</td>
				<td><a href="getBoard.do?bco=${vo.boardCode }">${vo.boardTitle }</a></td>
				<td>${vo.userId }</td>
				<td><fmt:formatDate value="${vo.writeDate }"
						pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
				<td><fmt:formatDate value="${vo.updateDate }"
						pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
				<td>${vo.boardContent }</td>		
				<td>${vo.boardView }</td>		
				<td>${vo.likeCnt }</td>		
				
			</tr>

		</c:forEach>

	</tbody>

</table>

<p>
	<a href="addBoard.do">게시글 등록</a>
</p>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!-- 	<select name="board"> -->
<!-- 			<option value="자유게시판" id = "freeB">자유게시판</option> -->
<!-- 			<option value="QnA게시판" id = "qnaB">QnA게시판</option> -->
<!-- 			<option value="공지사항" id = noticeB>공지사항</option> -->
<!-- 		</select> -->

<!-- let freeB = document.getElementById("freeB");    -->
<!-- freeB.addEventListener("click", freeB());        -->
<!-- function freeB() { -->
<!--    자유게시판 오픈되게.. -->
<!-- } -->
<!-- 	<a href="freeBoard.do"><input type="button" value = "자유게시판"></a> -->
<!-- 	<a href="qnaBoard.do"><input type="button" value = "QnA게시판"></a> -->

<style>
.button-style {
	display: inline-block;
	padding: 10px 20px;
	background-color: rgb(255, 128, 64); /* 버튼 배경색 */
	color: white; /* 버튼 텍스트 색상 */
	text-decoration: none;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
table, th {
	text-align: center;
}
p {
	text-align: right;
	padding-right: 30px;
}


</style>
<h3>공지사항</h3>

<table class="table table-light">
	<thead>
		<tr>

			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>수정일자</th>
<!-- 			<th>내용</th> -->
			<th>조회수</th>
			<th>공감수</th>

		</tr>
	<tbody>
		<c:forEach items="${noticeList }" var="vo">
			<tr>
				<td>${vo.boardCode }</td>
				<td><a href="getBoard.do?bco=${vo.boardCode }">${vo.boardTitle }</a></td>
			
				<td>${vo.userId }</td>
				<td><fmt:formatDate value="${vo.writeDate }"
						pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
				<td><fmt:formatDate value="${vo.updateDate }"
						pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
<%-- 				<td>${vo.boardContent }</td> --%>
				<td>${vo.boardView }</td>
				<td>${vo.likecnt }</td>


			</tr>

		</c:forEach>

	</tbody>

</table>

<p>
	<a href="boardForm.do" class="button-style">게시글 등록</a>
</p>


<%@page import="co.yedam.board.service.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<h3>게시글 삭제화면</h3> 
	<form action="removeBoard.do" method="post">
		<input type="hidden" name="bco" value = "${vo.boardCode }">
		<table border="1" class = "table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${vo.boardTitle }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"
					value="${vo.userId }"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="31" rows="6" name="content">${vo.boardContent }</textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><img src="images/${vo.image1 }" width="80px">
			</tr>

			<tr>
				<td colspan="2" align="center"><input class="btn btn-primary" type="submit" value="삭제">
					<input class = "btn btn-warning" type="reset" value="초기화"></td>
			</tr>
		</table>

	</form>

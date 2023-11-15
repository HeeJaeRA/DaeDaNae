<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>게시글 등록화면</h3>
<form action="addBoard.do" method="post" enctype="multipart/form-data">
	<table border="1" class="talbe">
	<th>카테고리</th>
		<tr>
			<td><input type="text" name="title" class="form-control"
				value="${boardCategory }"></td>
		</tr>
		<tr>
			<th>글 번호</th>
			<td><input type="text" name="boardCode" class="form-control" value="${boardCode }"></td>
		</tr>


		<tr>
			<th>제목</th>
			<td><input type="text" name="boadrTitle" class="form-control"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" readonly class="form-control"
				name="writer" value="${userId }"></td>
			<!--readonly 값수정불가  -->
		</tr>
		<tr>
			<th>작성일</th>
			<td><input type="text" readonly class="form-control"
				name="writer" value="${writeDate }"></td>
			<!--readonly 값수정불가  -->
		</tr>
		<tr>
			<td colspan="2"><textarea cols="31" class="form-control"
					rows="6" name="content"></textarea></td>
		</tr>
	
		<tr>
			<td colspan="2"><input type="submit" class="btn btn-primary"
				value="저장"> <input type="reset" class="btn btn-warning"
				value="초기화"></td>
		</tr>
	</table>

</form>



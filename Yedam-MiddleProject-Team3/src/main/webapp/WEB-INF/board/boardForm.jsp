<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.form-control {
		display: inline-block;
		width : 1200px;
		margin : 5px;
	}
	
	
</style>
<h3>게시글 등록화면</h3>
<form action="addBoard.do" method="post" enctype="multipart/form-data"> <!--  enctype="multipart/form-data 이부분 지워야할지 말아야할지 ? -->
	<table border="1" class="talbe">

	<th>카테고리 선택</th>
		<tr>
			<td>
			<select name="boardCategory" id="category" onchange="chageLangSelect()">		
			<option value="QnA게시판">QnA게시판</option>
			<option value="자유게시판">맛집 추천 게시판</option>
			<option value="공지사항">공지사항</option>
			</select>
			</td>
		</tr>

		<tr>
			<th>제목</th>
			<td><input type="text" name="boardTitle"  class="form-control" width ="800px"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" class="form-control"
				name="userId" value="${logId }" readonly></td>
			<!--readonly 값수정불가  -->
		</tr>
<!-- 		<tr> -->
<!-- 			<th>작성일</th> -->
<!-- 			<td><input type="text"  class="form-control" -->
<%-- 				name="writer" value="${writeDate }"></td> --%>
<!-- 			<!--readonly 값수정불가  -->
<!-- 		</tr> -->
		<tr>
		<th>내 용</th>
			<td colspan="2"><textarea cols="39" class="form-control"
					rows="6" name="boardContent"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input type="file" name="image1" class="form-control">
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input type="file" name="image2" class="form-control">
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input type="file" name="image3" class="form-control">
		</tr>
		<tr>
			<td colspan="2"><input type="submit" class="btn btn-primary"
				value="저장"> <input type="reset" class="btn btn-warning"
				value="초기화"></td>
		</tr>
		
	</table>

</form>




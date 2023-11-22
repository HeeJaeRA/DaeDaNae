<%@page import="co.yedam.board.service.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>게시글 수정</h3>
<form action="modifyBoard.do" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="bco" value="${vo.boardCode }"> <input
		type="hidden" name="boardCategory" value="${vo.boardCategory }">
	<table class="table" border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="boardTitle"
				value="${vo.boardTitle }"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="userId" value="${vo.userId }"
				readonly></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="200" rows="10"
					name="boardContent">${vo.boardContent }</textarea></td>
		</tr>
		<tr>
			<th>파일명 ${vo.image1 }</th>
			<td><label for="attached"> <input class="file_real"
					id="attached" type="file" name="image1"> <input
					class="file_fake" type="text"
					placeholder="* 10MB 미만의 jpg, png, bmp, gif만 첨부 가능" readonly
					tabindex="-1">
			</label></td>
		</tr>
		<tr>
			<th>파일명 ${vo.image2 }</th>

			<td><label for="attached"> <input class="file_real"
					id="attached" type="file" name="image2"> <input
					class="file_fake" type="text"
					placeholder="* 10MB 미만의 jpg, png, bmp, gif만 첨부 가능" readonly
					tabindex="-1">
			</label></td>
		</tr>
		<tr>
			<th>파일명 ${vo.image3 }</th>

			<td><label for="attached"> <input class="file_real"
					id="attached" type="file" name="image3"> <input
					class="file_fake" type="text"
					placeholder="* 10MB 미만의 jpg, png, bmp, gif만 첨부 가능" readonly
					tabindex="-1">
			</label></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input class="btn btn-primary"
				type="submit" value="수정"> <input class="btn btn-warning"
				type="reset" value="초기화"></td>
		</tr>

	</table>

</form>
<script>
	$('.file_real').on('change', function() {
		var files = $(this)[0].files[0];
		var fake = $('.file_fake');

		fake.val('');
		if (files !== undefined) {
			fake.val(files.name);
		}
	});
</script>
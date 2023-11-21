<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.form-control {
	display: inline-block;
	width: 1200px;
	margin: 5px;
}
</style>
<h3>가게 등록화면</h3>
<form action="adAddRestaurant.do" method="post"
	enctype="multipart/form-data">
	<table border="1" class="talbe">

		<tr>
			<th>업체코드</th>
			<td><input type="text" name="rs_code"
				class="form-control" width="800px"></td>
		</tr>

		<th>카테고리 선택</th>
		<tr>
			<td><select name="rs_category" id="category"
				onchange="chageLangSelect()">
					<option value="한식" selected>한식</option>
					<option value="일식">일식</option>
					<option value="중식">중식</option>
					<option value="양식">양식</option>
					<option value="카페">카페</option>
					<option value="디저트">디저트</option>
					<option value="포차">포차</option>
			</select></td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td><input type="text" name="rs_name"
				class="form-control" width="800px"></td>
		</tr>

		<tr>
			<th>주소</th>
			<td><input type="text" name="rs_address"
				class="form-control" width="800px"></td>
		</tr>
		<tr>
			<th>군구</th>
			<td><input type="text" name="rs_gu" class="form-control"
				width="800px"></td>
		</tr>
		<tr>
			<th>동</th>
			<td><input type="text" name="rs_dong"
				class="form-control" width="800px"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone"
				class="form-control" width="800px"></td>
		</tr>
		<tr>
			<th>소개</th>
			<td><input type="text" name="rs_desc"
				class="form-control" width="800px"></td>
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




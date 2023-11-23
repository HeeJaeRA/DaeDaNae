<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<h3>전체 게시글</h3>
<table class="table" border="1">
	<thead>
		<tr>
			<th>글번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>수정일자</th>
			<th>내용</th>
			<th>조회수</th>
			<th>좋아요</th>
			<th>삭제</th>
		</tr>
	<tbody>
		<tr style="visibility: collapse;">
			<td>글번호</td>
			<td>카테고리</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일자</td>
			<td>수정일자</td>
			<td>내용</td>
			<td>조회수</td>
			<td>좋아요</td>
			<td><button id="delboard">삭제</button></td>
		</tr>
	</tbody>

</table>

<p>
	<a href="addBoard.do">게시글 등록</a>
</p>

<script>
	function showBoardList() {
		document.querySelectorAll('tbody tr:not(:nth-of-type(1))').forEach(tr => tr.remove());
		fetch('boardList.do')
			.then(resolve => resolve.json())
			.then(result => {
				result.boardlist.forEach(board => {
					let temp = makeRow(board);
					document.querySelector('tbody').append(temp);
				})
			})
			.catch(err => console.log('err: ', err));
	}
	showBoardList();

	function makeRow(board) {
		let temp = document.querySelector('tbody tr').cloneNode(true);
		temp.style.visibility = 'visible';
		temp.querySelector('td:nth-of-type(1)').innerHTML = board.boardCode;
		temp.querySelector('td:nth-of-type(2)').innerHTML = board.boardCategory;
		temp.querySelector('td:nth-of-type(3)').innerHTML = board.boardTitle;
		temp.querySelector('td:nth-of-type(4)').innerHTML = board.userId;
		temp.querySelector('td:nth-of-type(5)').innerHTML = board.writeDate;
		temp.querySelector('td:nth-of-type(6)').innerHTML = board.updateDate;
		temp.querySelector('td:nth-of-type(7)').innerHTML = board.boardContent;
		temp.querySelector('td:nth-of-type(8)').innerHTML = board.boardView;
		temp.querySelector('td:nth-of-type(9)').innerHTML = board.likecnt;

		temp.querySelector('#delboard').addEventListener('click', function (e) {
			document.location.href = 'removeBoard.do?bco=' + board.boardCode;
		})
		return temp;
	}
</script>
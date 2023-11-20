<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#list span {
	margin: 8px;
}

.pagination {
	display: inline-block;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.table {
	
}
</style>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

${bco }


<h3>상세 화면(조회화면)</h3>
<form action="modifyForm.do" name="myForm">
	<input type="hidden" name="bco" value="${bco.boardCode }">
	<table border="1" class="table">
		<tr>
			<th>글번호</th>
			<td class="boardCode" id="bco">${bco.boardCode }</td>
			<th>작성일시</th>
			<td><fmt:formatDate value="${bco.writeDate }"
					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">"${bco.boardTitle }"</td>
		</tr>
		<tr>
			<td colspan="4"><textarea rows="10" cols="250" readonly>${bco.boardContent }</textarea></td>
		</tr>
		<tr>
			<th>첨부파일1</th>
			<td colspan="3"><c:if test="${!empty bco.image1  }">
					<img width="500px" src="resources/images/${bco.image1 }">
				</c:if></td>
		</tr>
		<tr>
			<th>첨부파일2</th>
			<td colspan="3"><c:if test="${!empty bco.image2  }">
					<img width="500px" src="resources/images/${bco.image2 }">
				</c:if></td>
		</tr>
		<tr>
			<th>첨부파일3</th>
			<td colspan="3"><c:if test="${!empty bco.image3  }">
					<img width="500px" src="resources/images/${bco.image3 }">
				</c:if></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bco.userId }</td>
			<th>조회수</th>
			<td>${bco.boardView }</td>

			<td>
				<div>
					<button class="btn btn-warning" type="button" value="like"
						id="likeBtn">like</button>

				</div>
			</td>
			<td id="likeTd">${bco.likecnt }</td>
		</tr>
		<tr>

			<!-- 로그인 아이디랑 책 작성자랑 같으면 수정삭제가능 아니면 버튼 비활성화 -->
			<!-- 로그인 기능 연동할때까지 주석 -->
			<td colspan="2" align="center"><c:choose>
					<c:when test="${!empty logId && logId == bco.userId }">
						<input type="submit" value="수정" class="btn btn-primary">
						<button class="btn btn-warning" type="button" value="삭제"
							id="boardDelBtn">삭제</button>
					</c:when>
					<c:otherwise>
						<input disabled type="submit" value="수정" id="boardDelBtn">
						<input disabled type="button" value="삭제">
					</c:otherwise>
				</c:choose></td>


		</tr>
	</table>
</form>
<h3>댓글등록</h3>

<table class="table">
	<tr>
		<th>댓글내용</th>
		<td><input type="text" id="content"></td>
		<td><button id="addReply">댓글등록</button></td>
	</tr>
</table>

<h3>댓글목록</h3>
<ul id="list">
	<li style="display: none;" id="template"><span>00</span> <b>첫번째글입니다.</b><span>user01</span><span>2023-10-10</span>
		<button id="delReply">삭제</button></li>
</ul>

<div class="pagination"></div>

<p>
	<!-- 스위치 되면 스위치로 하기 -->
	<a href="freeBoard.do">목록으로</a>
</p>

<script>
document.getElementById('likeBtn').addEventListener('click', function (e) {
	//document.forms.myForm.action = 'updateLikecnt.do'
	//document.forms.myForm.submit();
	e.preventDefault();
	let bco = document.getElementById('bco').innerHTML;
	fetch('updateLikecnt.do?bco=' + bco)
	.then(resolve => {
		return resolve.json()
	})
	.then(result => {
		console.log(result);
		
		let num = Number(document.getElementById('likeTd').innerHTML);
	 	num +=1
		document.getElementById('likeTd').innerHTML = num;
	 	
	})
	alert('좋아요를 눌렀습니다.')
});


	document.getElementById('boardDelBtn').addEventListener('click', function (e) {
		document.forms.myForm.action = 'removeForm.do'
		document.forms.myForm.submit();

	});

	//댓글목록
	let bco = "${bco.boardCode }";
	let userId = "${logId }";


	bco = document.querySelector('.boardCode').innerHTML;
	let page = 1;


	function showList(pg = 1) { //1은 초기값

		document.querySelectorAll('#list li:not(:nth-of-type(1))') //1제외하고 지운다는뜻
			.forEach(li => li.remove()); //첫번쨰 li는 template 용도라서 안지움

		fetch('replyList.do?bco=' + bco + '&page=' + pg)
			.then(resolve => resolve.json())
			.then(result => {

				if (pg < 0) {
					page = Math.ceil(result.dto.total / 5);
					showList(page);
					return;

				} else if (pg == 0) {
					showList(1);
					return;
				}
				


				result.list.forEach(reply => {
					let li = makeRow(reply);
					//ul>li 생성..
					document.querySelector('#list').append(li);

				})

				//page 생성..

				makePaging(result.dto);

			})
			.catch(err => console.log(err));

	}
	showList();

	//페이지링크 생성.
	function makePaging(dto = {}) {
		document.querySelector('.pagination').innerHTML = '';

		if (dto.prev) {
			let aTag = document.createElement('a');
			aTag.setAttribute('href', dto.startPage - 1);
			aTag.innerHTML = "&laquo;"
			document.querySelector('.pagination').append(aTag);

		}
		for (let i = dto.startPage; i <= dto.endPage; i++) {
			let aTag = document.createElement('a');
			aTag.setAttribute('href', i);
			aTag.innerHTML = i;
			//active 녹색
			if (i == page) {
				aTag.className = 'active'; //class속성을 지정할때 className.
			}

			document.querySelector('.pagination').append(aTag);

		}
		if (dto.next) {
			let aTag = document.createElement('a');
			aTag.setAttribute('href', dto.endPage + 1);
			aTag.innerHTML = "&raquo;"
			document.querySelector('.pagination').append(aTag);

		}
		//a 에 클릭이벤트 등록.
		document.querySelectorAll('.pagination a') //a태그를 다 가져온다
			.forEach(elem => {
				elem.addEventListener('click', function (e) {
					e.preventDefault(); //form, a=> 링크 기능 차단..
					page = elem.getAttribute('href');
					showList(page);
				})
			})


	}

	// 댓글등록버튼에 대한 이벤트
	document.querySelector('#addReply').addEventListener('click', function (e) {
		let reply = document.querySelector('#content').value;
		// 로그인안한사람은 댓글못담 
		console.log(userId);
		if (!bco || userId == 'null' || !reply) {
			alert("값을 확인하세요.");
			return;
		}

		//ajax.bco/writer/reply => 전달.
		fetch('addReply.do', {
				method: 'post',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded'
				},
				body: 'bco=' + bco + '&replyContent=' + reply + '&userId=' +
					'${logId }' //나중에 실제 로그인한 유저의 ID로 변경.(세션)${logId }로 변경하기
			})
			.then(resolve => resolve.json())
			.then(result => {
				if (result.retCode == 'OK') {

					//document.querySelector('#list').append(makeRow(result.vo));
					showList(-1); // -1을 넘겨주면 
				} else {
					aler('Error.')
				}

			})
	})

	function makeRow(reply) {

		function deleteCallback(e) {
			if (userId != reply.userId) {
				alert('권한이 없습니다')
				return;
			}
			//삭제.
			fetch('removeReply.do?rco=' + reply.replyCode)
				.then(resolve => resolve.json())
				.then(result => {
					if (result.retCode == 'OK') {
						alert('Success!')
						e.target.parentElement.remove();

						if (document.querySelectorAll('#list > li').length == 1) {
							if (page - 1 > 0) {
								page = page - 1;
								showList(page);
							}
						} else {
							showList(page);
						}
					} else {
						alert('Error!')

					}
				})
				.catch(err => console.log(err))
		}

		let temp = document.querySelector('#template').cloneNode(true);
		temp.style.display = 'block';
		temp.querySelector('span:nth-of-type(1)').innerHTML = reply.replyCode;
		temp.querySelector('b').innerHTML = reply.replyContent;
		temp.querySelector('span:nth-of-type(2)').innerHTML = reply.userId;
		temp.querySelector('span:nth-of-type(3)').innerHTML = reply.writeDate;
		temp.querySelector('#delReply').addEventListener('click', deleteCallback);


		return temp;
	}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<table class=" myOwn2">
	<thead>
		<tr>
			<th colspan="3">
				<h1>본인확인</h1> <br>
			</th>
		</tr>
		</thead>
	<tbody>
		<tr height="50" class="comp1">
			<th width="70">이름</th>
			<th colspan="2" style="width: 100px;"><input type="text"
				name="scName" id="scName" placeholder="이름을 입력하세요" autofocus></th>
		</tr>
		<tr height="50" class="comp2">
			<th width="70">전화번호 확인</th>
			<th colspan="2" style="width: 100px;"><input type="tel"
				name="scTel" id="scTel" placeholder="전화번호를 입력하세요"></th>
		</tr>
		<tr id="showId" style="display: none;" height="80">
			<th colspan="3" style="width: 100px;"><p></p></th>
		</tr>
		<tr>
			<th colspan="3"><input type="button" class="btn btn-danger"
				id="searchId" value="아이디 찾기">
				<button class="btn btn-danger modal_close">x</button></th>
		</tr>
	</tbody>
</table>


<script>
document.querySelector('#searchPw').addEventListener('click', function(e){
	fetch('searchPw.do',{
		method:'post',
		headers:{'Content-Type': 'application/x-www-form-urlencoded'},
		body:'id='+id.value+'&phone='+scTel.value
	})
	.then(resolve=>resolve.json())
	.then(result=>{
		if(result.retCode=="일치"){
			console.log('pw: ' + result.pw);
			document.querySelector('p').innerHTML += result.id;
			document.getElementById('showPw').style.display='block';
			document.querySelector('.comp1').style.display='none';
			document.querySelector('.comp2').style.display='none';
		}else{
			alert("일치하는 정보가 없습니다")
			document.querySelector('#scTel').value ='';
			document.querySelector('#scId').value ='';
		}
		
	})
	
})
</script>

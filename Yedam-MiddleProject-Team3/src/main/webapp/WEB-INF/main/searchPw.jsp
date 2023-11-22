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
			<th width="70">아이디 확인</th>
			<th colspan="2" style="width: 100px;"><input type="text"
				name="scId" id="scId" placeholder="아이디를 입력하세요" autofocus></th>
		</tr>
		<tr height="50" class="comp2">
			<th width="70">전화번호 확인</th>
			<th colspan="2" style="width: 100px;"><input type="tel"
				onKeyup="addHypen(this);" name="scTel" id="scTel"
				placeholder="전화번호를 입력하세요"></th>
		</tr>
		<tr id="showPw" style="display: none;" height="80">
			<th colspan="3" style="width: 100px;"><p></p></th>
		</tr>
		<tr>
			<th colspan="3"><input type="button" class="btn btn-danger"
				id="searchPw" value="비밀번호 찾기">
		</tr>
	</tbody>
</table>

<input type="button"  id="changeP" value="비밀번호 변경" style="display:none;">
<form class="pwForm">
<div class="showPwCh" style="display: none;">
<div class="col-md-12">
	비밀번호<input class="form-control" type="password" name="pw" id="pw"
		placeholder="비밀번호를 입력하세요" required
		style="width: 540px; background-color: 808080;">

	<div class="valid-feedback" style="display: none">사용가능한 비밀번호 입니다</div>
	<div class="invalid-feedback" style="display: none">비밀번호를 다시 입력하세요
		확인하세요</div>
</div>
<div class="col-md-12">
	비밀번호 재확인<input class="form-control" type="password" name="rePw"
		id="rePw" placeholder="비밀번호를 재입력하세요" required onKeyup="checkPw()"
		style="width: 540px; background-color: 808080;">

	<div class="valid-feedback" style="display: none">비밀번호가 일치합니다</div>
	<div class="invalid-feedback" style="display: none">비밀번호가 일치하지
		않습니다</div>
</div>
<input type="submit" class="btn btn-danger" value="비밀번호 변경 완료" onclick="return check()">
</div>
</form>

<script>

function addHypen(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}
document.querySelector('#searchPw').addEventListener('click', function(e){
	fetch('searchPw.do',{
		method:'post',
		headers:{'Content-Type': 'application/x-www-form-urlencoded'},
		body:'id='+scId.value+'&phone='+scTel.value
	})
	.then(resolve=>resolve.json())
	.then(result=>{
		if(result.retCode=="일치"){
			console.log('pw: ' + result.pw);
			document.querySelector('p').innerHTML += result.pw;
			document.getElementById('showPw').style.display='block';
			document.getElementById('changeP').style.display='block';
			document.querySelector('.comp1').style.display='none';
			document.querySelector('.comp2').style.display='none';
			document.querySelector('#searchPw').style.display='none';
		}else{
			alert("일치하는 정보가 없습니다")
			document.querySelector('#scTel').value ='';
			document.querySelector('#scId').value ='';
		}
		
	})
	
})
document.querySelector('#changeP').addEventListener('click', function(e){
	document.querySelector('.showPwCh').style.display = 'block';
	document.getElementById('changeP').style.display='none';
	document.querySelector('p').style.display="none";
})


	function checkPw(){
			let pw = document.querySelector('#pw').value;
			let rePw = document.querySelector('#rePw').value;
			if (pw != rePw && rePw!='') {
				console.log(pw);
				console.log(rePw);
				document.getElementsByClassName('invalid-feedback')[0].style.display='block';
				
			} else if(pw == rePw && rePw!=''){
				document.getElementsByClassName('invalid-feedback')[0].style.display='none';
				document.getElementsByClassName('valid-feedback')[0].style.display='block';
			}
		}
		
//비밀번호 재확인 다르면 가입이 안됨
function check(){
	let pw = document.querySelector('#pw').value;
	let rePw = document.querySelector('#rePw').value;
	if (pw != rePw) {
	document.querySelector('#pw').value = "";
	document.querySelector('#rePw').value = "";
	alert("비밀번호를 다시 확인해주세요.")
	return false;
	}
	
	fetch('changePw.do', {
		method:'post',
		headers:{'Content-Type': 'application/x-www-form-urlencoded'},
		body:'id='+scId.value+'&pw='+pw
	})
	.then(resolve => resolve.json())
	.then(result => {
		console.log(result);
		alert("비밀번호가 변경되었습니다");
		pwForm.submit();
	})
}
		
</script>

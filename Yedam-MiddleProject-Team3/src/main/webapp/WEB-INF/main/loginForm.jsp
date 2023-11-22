<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <link href="resources/boot-shop/css/loginStyle.css" rel="stylesheet" type="text/css" /> -->
<style>
/*  body{  */
/*   height: auto;  */
/*    min-height: 100%;  */
/*    padding-bottom: 80px;  */
/*  }  */
/*  footer{  */
/*    height: 80px;  */
/*   position : relative;  */
/*    transform : translateY(-100%);  */
/* }  */
input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: rgb(255, 128, 64);
    margin-top: 20px;
}


.login {
    width: 60%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 25px;
    border-radius: 6px;
    float;
}
#search {
    width: 25%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 25px;
    border-radius: 6px;
    ;
}
.container{
 margin:30px, 10px, 50px, 10px;
 text-align:center;
}
.hidden {
	display: none;
}

.delmodal {
	position: absolute;
	width: 700px;
	height: 400px;
	display: flex;
	background-color: rgba(255, 110, 000, 0.9);
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	z-index: 300;
}
.delmodal .modal_close {
 
    position: absolute;
    top: 20px;
    right: 17px;
    
/*     cursor: pointer; // 닫기 버튼 클릭 시 홈으로 이동 */
  }
  h1{
  color:white;
  font-weight:bold;
  text-align:center;
  }
   
</style>
<section class="container">
<div id="wrapper">
    <div class="login-wrapper">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
        <h2 id = "title">로그인화면</h2>
         <br>
          <br>
           <br>
            <br>
             <br>
        <div class="delmodal hidden">
        ${vo}
 
        <br>
								<table class=" myOwn2">
									<thead>
										<tr>
											<th colspan="3">
												<h1  >본인확인</h1>
												<br>
											</th>
										</tr>
									</thead>
									<tbody>
									<tr height="50" class="comp1">
											<th width="70">이름</th>										
											<th colspan="2" style="width: 100px;"><input type="text" name="scName" id="scName" placeholder="이름을 입력하세요" autofocus ></th>
										</tr>
										<tr height="50"  class="comp2">
											<th width="70">전화번호 확인</th>										
											<th colspan="2" style="width: 100px;"><input type="tel" name="scTel" id="scTel" placeholder="전화번호를 입력하세요" ></th>
										</tr>
										<tr id="showId" style="display: none;" height="80">									
											<th colspan="3" style="width: 100px;"><p></p></th>
										</tr>
										<tr>
										<th colspan="3"><input type="button" class="btn btn-danger" id="searchId" value="아이디 찾기">
								         <button class="btn btn-danger modal_close">x</button> </th>
										</tr>
									</tbody>
								</table>
								
							</div>
        <form action="login.do" method="post" id="login-form">
            <label for="input-id">아이디
            <input type="text" name="id" id="input-id" placeholder="아이디를 입력하세요" autofocus></label>
            <hr>
            <label for ="inptu-pass">비밀번호
            <input type="password" name="pass" id="inptu-pass" placeholder="비밀번호를 입력하세요"></label>
            <hr>
            <label for="remember-check">
                <input type="checkbox" id="remember-check">아이디 저장하기
            </label>
            <br>
            <input type="submit" class="login" value="Login">
            <br>
            <label><input type="button" class="btn btn-danger modal_open search" value="아이디 찾기">
             <input type="button" class="btn btn-danger search"value="비밀번호 찾기" onClick="location.href='searchPwForm.do'"></label>
            <br>
             <br>
              <br>
			<label>아직 대다내의 회원이 아니신가요?<input type="button" class="btn btn-danger"value="회원가입"  onClick="location.href='joinForm.do'">
			</label>
			 <br>
			  <br>
			   <br>
			    <br>
			     <br>
			      <br>
			      
        </form>
    </div>
    </div>
</section>
<script>
const open = document.querySelector(".modal_open");
const close = document.querySelector(".modal_close");
const modal = document.querySelector(".delmodal");

function init() {
	open.addEventListener("click", function () {
		modal.classList.remove("hidden");
		document.getElementById('showId').style.display='none';
		document.querySelector('.comp1').style.display='block';
		document.querySelector('.comp2').style.display='block';
		document.querySelector('#scTel').value ='';
		document.querySelector('#scName').value ='';
	})
	close.addEventListener("click", function () {
		modal.classList.add("hidden");
	})
}
init();

document.querySelector('#searchId').addEventListener('click', function(e){
	fetch('searchId.do',{
		method:'post',
		headers:{'Content-Type': 'application/x-www-form-urlencoded'},
		body:'name='+scName.value+'&phone='+scTel.value
	})
	.then(resolve=>resolve.json())
	.then(result=>{
		if(result.retCode=="일치"){
			console.log('id: ' + result.id);
			document.querySelector('p').innerHTML += result.id;
			document.getElementById('showId').style.display='block';
			document.querySelector('.comp1').style.display='none';
			document.querySelector('.comp2').style.display='none';
		}else{
			alert("일치하는 정보가 없습니다")
			document.querySelector('#scTel').value ='';
			document.querySelector('#scName').value ='';
		}
		
	})
	
})
</script>




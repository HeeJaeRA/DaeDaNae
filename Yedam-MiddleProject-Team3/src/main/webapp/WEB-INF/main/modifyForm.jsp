<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

.container {
	align: center;
	margin-top:90px;
	margin-bottom:90px;
	
}
 </style>
 <div class="container">
	<div class="form-body">
		<div class="row">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<h3>회원정보 수정</h3>
						<p>수정할 내용을 기입해 주세요</p>
						<form method="post" action="modifyMem.do" id="myForm" class="requires-validation" enctype="multipart/form-data">
							<div class="col-md-12">

								아이디<input class="form-control" type="text" name="id" id="id" value="${logId }"
									 placeholder="${logId }" oninput="resetfb()"
									style="width: 540px; background-color: 808080;" readonly>
<!-- 								<input type="button" id="userid" value="아이디 중복확인" onclick="checkId()"> -->
<!-- 								<button type="button id="join-id"></button> -->
<!-- 								<div class="valid-feedback" style="display:none">사용가능한 아이디 입니다!</div> -->
<!-- 								<div class="invalid-feedback" style="display:none">사용 불가능한 아이디 입니다ㅠ</div> -->
							</div>

							<div class="col-md-12">
								비밀번호<input class="form-control" type="password" name="pw" id="pw" 
									placeholder="비밀번호를 입력하세요" required 
									style="width: 540px; background-color: 808080;">

								<div class="valid-feedback" style="display:none">사용가능한 비밀번호 입니다</div>
								<div class="invalid-feedback" style="display:none">비밀번호를 다시 확인하세요</div>
							</div>
							<div class="col-md-12">
								비밀번호 재확인<input class="form-control" type="password" name="rePw" id="rePw"
									placeholder="비밀번호를 재입력하세요" required onKeyup="checkPw()"
									style="width: 540px; background-color: 808080;">

								<div class="valid-feedback" style="display:none">비밀번호가 일치합니다</div>
								<div class="invalid-feedback" style="display:none">비밀번호가 일치하지 않습니다</div>
							</div>

							<div class="col-md-12">
								이름<input class="form-control" type="text" name="name" id="name" 
								placeholder="${mvo.userName}" value="${mvo.userName }"
									required style="width: 540px; background-color: 808080;" readonly>

								<div class="valid-feedback" style="display:none">Username field is valid!</div>
								<div class="invalid-feedback" style="display:none">Username field cannot be blank!</div>
							</div>

							<div class="col-md-12">
								닉네임<input class="form-control" type="text" name="nickname" id="nickname" 
									placeholder="${nickname }" required oninput="resetfb()"
									style="width: 540px; background-color: 808080;" readonly>
<!-- 								<button type="button" id="join-nick">닉네임 중복확인</button> -->
<!-- 								<div class="valid-feedback" style="display:none">사용 가능한 닉네임 입니다</div> -->
<!-- 								<div class="invalid-feedback" style="display:none">이미 사용중인 닉네임 입니다</div> -->
							</div>
							
							
 							<div class="col-md-12">
								생년월일<input class="form-control" type="text" name="birthDay" id="birthDay" 
									placeholder="${mvo.birthDay }"  value= "${mvo.birthDay }" required maxlength="10"
									style="width: 540px; BACKGROUND-COLOR: 808080;" readonly>

								<div class="valid-feedback" style="display:none">확인</div>
								<div class="invalid-feedback" style="display:none">년도를 4자리로 입력하세요</div>
							</div>

							<div class="col-md-12">
								전화번호<input class="form-control" type="tel" name="phone" id="phone" 
									placeholder="${mvo.phone }" value="${mvo.phone}" required maxlength="13"
									style="width: 540px; background-color: 808080;" onKeyup = "addHypen(this);">

								<div class="valid-feedback" style="display:none">바르게 입력 가능합니다</div>
								<div class="invalid-feedback" style="display:none">하이픈 포함 13자로 입력해주세요</div>
							</div>


							<div class="col-md-12">
								주소<input type="text" id="sample4_postcode" class="d_form mini line addressCheck"
									placeholder="우편번호" readonly>
								<input type="button" id="addressButton" class="d_form mini"
									onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly>

								<input type="text" id="sample4_roadAddress" class="form-control"
									class="d_form mini line" placeholder="도로명주소" readonly><br>
								<input type="text" id="sample4_jibunAddress" name="address" class="form-control" 
									class="d_form mini line" placeholder="지번주소" readonly ><br>
									
								
								<span id="guide" style="color: #999; display: none"></span>
								<input type="text" id="sample4_detailAddress" class="d_form mini line addressCheck"
									placeholder="상세주소">
								<input type="hidden" id="gunGu" name="gunGu" >
							</div>


							<div class="col-md-12">
								프로필 사진<input class="form-control" type="file" id="image" name="image" 
									value="${mvo.image }"style="width: 540px; background-color: 808080;">

							</div>


<!-- 							<div class="col-md-12"> -->
<!-- 							<label>성별<br> -->
							
<!-- 							남성<input class="form-control" type="radio" name="gender" value="남성" checked> -->
<!-- 							여성<input class="form-control" type="radio" name="gender" value="여성" ></label> -->
							
<!-- 								<div class="invalid-feedback" style="display:none"> 성별을 체크해 주세요</div> -->
<!-- 							</div> -->

							
							
							<div class="form-check">
							<label class="form-check-label">
							<input class="form-check-input" class="form-control" type="checkbox" 
									id="invalidCheck" required value="[필수] 동의하세요" checked>
							[필수]동의하세요</label>
							<div class="invalid-feedback" style="display:none">동의하세요 확인!!!</div>
							</div>


							<input type="submit" id = "modify" value="회원수정" class="btn btn-danger"onclick="return checkm()">
							<input type="reset" value="초기화" class="btn btn-danger">

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<!-- 주소api -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                document.getElementById("sample4_detailAddress").focus();
//                 // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
//                 if(roadAddr !== ''){
//                     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
//                 } else {
//                     document.getElementById("sample4_extraAddress").value = '';
//                 }

//                 var guideTextBox = document.getElementById("guide");
//                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//                 if(data.autoRoadAddress) {
//                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//                     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
//                     guideTextBox.style.display = 'block';

//                 } else if(data.autoJibunAddress) {
//                     var expJibunAddr = data.autoJibunAddress;
//                     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
//                     guideTextBox.style.display = 'block';
//                 } else {
//                     guideTextBox.innerHTML = '';
//                     guideTextBox.style.display = 'none';
//                 }
            }
        }).open();
    }
    
</script>
		
		
<script>		
		//엔터누르면 무조건 submit되는거 차단하기
		document.addEventListener('keydown', function(event) {
  			if (event.keyCode === 13) {
    			event.preventDefault();
 			 };
			});
		
		// 정규식
		// id, pw
		let regId = /^[a-zA-Z0-9]{6,10}$/;
		// 휴대전화
		let regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		let id = document.getElementById("id");

		
		
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
		//비밀번호 재확인(비밀번호)
		
		function checkPw(){
			let pw = document.querySelector('#pw').value;
			let rePw = document.querySelector('#rePw').value;
			if (pw != rePw && rePw!='') {
				console.log(pw);
				console.log(rePw);
				document.getElementsByClassName('invalid-feedback')[1].style.display='block';
				
				//document.querySelector('invalid-feedback:nth-of-type(2)').style.display = 'block';
			} else if(pw == rePw && rePw!=''){
				document.getElementsByClassName('invalid-feedback')[1].style.display='none';
				document.getElementsByClassName('valid-feedback')[1].style.display='block';
				document.querySelector('#name').focus();
				
				//document.querySelector('.valid-feedback:nth-of-type(2)').style.display = 'block';
			}else {
				document.getElementsByClassName('valid-feedback')[1].style.display='none';
				document.getElementsByClassName('invalid-feedback')[1].style.display='none';
			}
		}
		function checkm(){
			let pw = document.querySelector('#pw').value;
			let rePw = document.querySelector('#rePw').value;
			let birth = document.getElementById("birthDay");
			let phone = document.getElementById("phone");
			let gender = document.getElementById("gender");
			let address = document.getElementById("sample4_postcode");
			// 아이디,이름 등 input값이 널이면 가입안됨
			if (id.value == "") {
			alert("아이디는 필수입니다.")
			id.focus();
			return false;
			}
			if (pw == "") {
				alert("비밀번호를 입력해주세요.")
				userPassword.focus();
				return false;
				}
			 if (!regId.test(id.value)) {
						alert("아이디는 6~12자로 대소문자 구분하여(숫자포함 가능)입력하세요.")
						id.focus();
					return false;
				}
		
//			비밀번호 재확인 다르면 가입이 안됨
			if (pw!= rePw) {
				document.querySelector('#pw').value = "";
				document.querySelector('#rePw').value = "";
				userRePassword.focus();
				alert("비밀번호를 확인해주세요.")
				return false;
				}
			 if (birth.value.length != 10) {
				alert("생년월일 YYYY-MM-dd형식으로 입력해주세요.");
				birth.focus();
				return false ;
			}
			
			 if (phone.value.length !=13 ) {
				alert("올바른 형식으로 입력해주세요.");
				phone.focus();
				return false;
			}else if(!regPhone.test(phone.value)) {
				alert("전화번호 형식으로 입력하세요")
				phone.focus();
				return false;
			}
			 if (phone.value.length !=13 ) {
					alert("올바른 형식으로 입력해주세요.");
					phone.focus();
					return false;
				}else if(!regPhone.test(phone.value)) {
					alert("전화번호 형식으로 입력하세요")
					phone.focus();
					return false;
				}
				if (address.value == "") {
					alert("주소를 입력해주세요.");
					return false;
				}

				 var agree = document.getElementById('invalidCheck');
			        if(invalidCheck.checked == false ) {
			            alert(" 약관을 동의해 주세요.")
			            return false;
			        }
			fetch('modifyMem.do', {
				method:'post',
				headers:{'Content-Type': 'application/x-www-form-urlencoded'},
				body:'id='+id+'&pw='+pw+'&name='+ name+'&birthDay='+birth+'&phone='+phone 
				+'&address=' + address + '&image=' + image 
			})
			.then(resolve => resolve.json())
			.then(result => {
				consol.log(result);
				submit();
			})
		}//전송하기 전 check
			
	
		
	</script>


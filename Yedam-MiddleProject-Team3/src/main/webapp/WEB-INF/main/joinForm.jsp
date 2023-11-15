<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
</style>
<link rel="stylesheet" href="resources/boot-shop/css/joinStyle.css">
<!-- <script src="error.js"></script> -->
</head>
<body>


	
	<div class="form-body">
	<div class= "row">
	<div class= "form-holder">
	<div class= "form-content">
	<div class= "form-items">
	<h3>회원가입</h3>
	<p>빈칸을 작성해 주세요</p>
	<form method="post" action="join.do" class="requires-validation" novalidate>
	<div class="col-md-12">
                               아이디<input class="form-control"  type="text" name="joinId" placeholder="아이디를 입력하세요" required="" style="width: 540px; background-color: 808080;">
                               <button id="join-id">아이디 중복확인</button>
                               <div class="valid-feedback" style="display:none">사용가능한 아이디 입니다!</div>
                               <div class="invalid-feedback" style="display:none">사용 불가능한 아이디 입니다ㅠ</div>
                            </div>
                            
    <div class="col-md-12">
                               비밀번호<input class="form-control" type="password" name="joinPw" placeholder="비밀번호를 입력하세요" required="" style="width: 540px; background-color: 808080;">
                      
                               <div class="valid-feedback" style="display:none">사용가능한 비밀번호 입니다</div>
                               <div class="invalid-feedback" style="display:none">비밀번호를 다시 확인하세요</div>
                            </div>
    <div class="col-md-12">
                               비밀번호 재확인<input class="form-control" type="password" name="reJoinPw" placeholder="비밀번호를 재입력하세요" required="" style="width: 540px; background-color: 808080;">
                      
                               <div class="valid-feedback" style="display:none">비밀번호가 일치합니다</div>
                               <div class="invalid-feedback" style="display:none">비밀번호가 일치하지 않습니다</div>
                            </div>
                            
    <div class="col-md-12">
                               이름<input class="form-control" type="text" name="joinName" placeholder="이름을 입력하세요" required="" style="width: 540px; background-color: 808080;">
                              
                               <div class="valid-feedback" style="display:none">Username field is valid!</div>
                               <div class="invalid-feedback" style="display:none">Username field cannot be blank!</div>
                            </div>
                            
     <div class="col-md-12">
                               닉네임<input class="form-control" type="text" name="joinNickname" placeholder="닉네임을 입력하세요" required="" style="width: 540px; background-color: 808080;">
                               <button id="join-nick">닉네임 중복확인</button>
                               <div class="valid-feedback" style="display:none">사용 가능한 닉네임 입니다</div>
                               <div class="invalid-feedback" style="display:none">이미 사용중인 닉네임 입니다</div>
                            </div>
                            
                            
    <div class="col-md-12">
                               전화번호<input class="form-control" type="tell" name="jointell" placeholder="전화번호를 입력하세요(-(하이픈) 제외)" required="" maxlength="11" style="width: 540px; background-color: 808080;">
                               
                               <div class="valid-feedback" style="display:none">바르게 입력 가능합니다</div>
                               <div class="invalid-feedback" style="display:none">하이픈 없이 11자로 입력해주세요</div>
                           	 </div>
                            
                            
    <div class="col-md-12">
       						 주소<input type="text" id="sample4_postcode"
							 class="d_form mini line addressCheck" placeholder="우편번호" readonly>
							 <input type="button" id="addressButton" class="d_form mini"
							 onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly>
							 
							<input type="text" id="sample4_roadAddress" class="d_form mini line" placeholder="도로명주소" readonly><br>
							<input type="text" id="sample4_jibunAddress" class="d_form mini line" placeholder="지번주소" readonly><br>
							<span id="guide"style="color: #999; display: none"></span>
							<input type="text" id="sample4_detailAddress" class="d_form mini line addressCheck"placeholder="상세주소">
							</div>
                              
                              
    <div class="col-md-12">
                               프로필 사진<input class="form-control" type="file" name="joinImg"  style="width: 540px; background-color: 808080;">
                               
                            </div>
                            
    <div class="col-md-12">
                               성별
                               <button>남성</button> <button>여성</button>
                               <div class="valid-feedback" style="display:none">사용 가능한 닉네임 입니다</div>
                               <div class="invalid-feedback" style="display:none">이미 사용중인 닉네임 입니다</div>
                            </div>
                            
    <div class="form-check">
                          <input class="form-check-input" type="checkbox" value="[필수]동의하세요" id="invalidCheck" required="">
                          <label class="form-check-label">[필수]동의하세요</label>
                         <div class="invalid-feedback" style="display:none">동의하세요 확인!!!</div>
                        </div>
                            
                  
                            
                            <input type="submit" id="join" value="회원가입">
                            
                                                                                                                                                                       
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	
	
	
	
		

		<!-- 주소api -->
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
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script>
let invalid = document.querySelector('.invalid-feedback').cloneNode(true);
let valid = document.querySelector('.valid-feedback').cloneNode(true);
//아이디 중복버튼
document.querySelector('#join-id').addEventListener('click',function(e){
if(list.userId != vo.userId){
	invalid.querySelector('invalid:nth-of-type(1)').style.display='block';
	//아이디 칸 초기화 시키는 함수
	return;
}else{
	valid.querySelector('valid:nth-of-type(1)').style.display='block';
	//비밀번호 칸으로 커서 이동 함수
}
})

//닉네임 중복버튼
document.querySelector('#join-nick').addEventListener('click',function(e){
	if(list.Nickname != vo.Nickname){
		invalid.querySelector('invalid:nth-of-type(5)').style.display='block';
		//닉네임 칸 초기화 시키는 함수
		return;
	}else{
		valid.querySelector('valid:nth-of-type(5)').style.display='block';
		//전화번호 칸으로 커서 이동 함수
	}
})
	
	//회원가입 버튼(회원등록)
	
document.querySelector('#join').addEventListener('click',function(e){
	//동의 체크박스가 체크되어 있지 않으면 가입이 안됨
if(document.querySelector('#invalidCheck').value ==null){
	invalid.querySelector('invalid:nth-of-type(8)').style.display='block';
	return;
	else{
		//ajax.값=>전달
		fetch('addMember.do',{
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded'},
			body:
		.then(resolve=>resolve.json())
		.then(result=>{
			//.submit()
		})
		})
	}//else
}
	
	
	}//회원가입버튼
	
		
})


</script>
	

</body>
</html>
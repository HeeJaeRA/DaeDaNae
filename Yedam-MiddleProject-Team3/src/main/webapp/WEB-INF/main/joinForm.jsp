<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
</style>
<script src="error.js"></script>
<script src="address.js"></script>
</head>
<body>
	<header>
		<div id="header">
			<p>회원가입 페이지</p>
		</div>
	</header>

	<form method="post" name="join" id="join">
		<label for="아이디"><input type="text" name="joinId" placeholder="아이디를 입력하세요" maxlength="20">
			<button>아이디 중복확인</button></label>
			<label for="비밀번호" class="list"><input type="password" name="joinPw" class="check" placeholder="비밀번호를 입력하세요" maxlength="30"></label>
			<label for="비밀번호재확인" class="list"><input type="password" name="joinRePw" class="check" placeholder="동일한 비밀번호를 입력하세요"></label>
			<label for="회원이름" class="list"><input type="text" name="joinName" class="check" placeholder="이름을 입력하세요"></label>
			<label for="닉네임" class="list"><input type="text" name="joinNickname" class="check" placeholder="사용할 닉네임을 입력하세요"></label>
			
			<label for="나이" class="list"><input type="text" name="joinAge" class="check">
			<select id = "age" name="age">
			<c:forEach var="i" begin="1" end="130">
			 <option value="${i}">${i}</option>
			</c:forEach>
			</select>
			
			</label>
			<label for="전화번호" class="list"><input type="tel" name="joinTell" class="check" placeholder="전화번호를 입력하세요(-제외)" maxlength="11"></label>
			<label for="생일" class="list"><input type="text" name="joinBirth" class="check" placeholder="생년월일을 입력하세요"></label>
	
			 <div id="address" class="list">
                  <span>
                  <input type="text" id="sample4_postcode" class="d_form mini line addressCheck" placeholder="우편번호" readonly>
                  <input type="button" id="addressButton" class="d_form mini" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly>
                  </span>
                  
                  <input type="text" id="sample4_roadAddress" class="d_form mini line" placeholder="도로명주소" readonly>
                  <input type="text" id="sample4_jibunAddress" class="d_form mini line" placeholder="지번주소" readonly>
  				<span id="guide" style="color:#999;display:none"></span>
                  <input type="text" id="sample4_extraAddress" class="d_form mini line" placeholder="참고주소" readonly>
                  <input type="text" id="sample4_detailAddress" class="d_form mini line addressCheck" placeholder="상세주소" >
                </div>


			
			<label for="보안코드" class="list"><!--math.random코드 넣기  --><input type="text" name="joincode"></label>
			<label for="aprove" class="list"><input type="checkbox" id="aprove">[필수]동의하세요</label>

		<input type="submit" value="joinMember">
	</form>
	
	<script>
	<!--아이디 중복확인 -->
	</script>
	<script>
	<!--닉네임 중복확인 -->
	</script>
	<script>
	<!--동의합니다 체크확인 -->
	</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="login-wrapper">
        <h1 id = "title">로그인화면</h1>
        <form action="login.do" method="post" id="login-form">
            <label for="input-id">아이디
            <input type="text" name="userId" id="input-id" placeholder="아이디를 입력하세요" autofocus></label>
            <hr>
            <label for ="inptu-pass">비밀번호
            <input type="password" name="userPassword" id="inptu-pass" placeholder="비밀번호를 입력하세요"></label>
            <hr>
            <label for="remember-check">
                <input type="checkbox" id="remember-check">아이디 저장하기
            </label>
            
            <input type="submit" value="Login">
            <input type="submit" value="Join" onclick="location.href='joinForm.do'">
        </form>
    </div>






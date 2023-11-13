<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
*{
    padding: 0;
    margin: 0;
    border: none;
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
}

.login-wrapper{
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
}

.login-wrapper > h2{
    font-size: 24px;
    color: #6A24FE;
    margin-bottom: 20px;
}
#login-form > input{
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
}
#login-form > input::placeholder{
    color: #D2D2D2;
}
#login-form > input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #6A24FE;
    margin-top: 20px;
}

#login-form > input[type="checkbox"]{
    display: none;
}
#login-form > label{
    color: #999999;
}
#login-form input[type="checkbox"] + label{
    cursor: pointer;
    padding-left: 26px;
    background-image: url("checkbox.png");
    background-repeat: no-repeat;
    background-size: contain;
}
#login-form input[type="checkbox"]:checked + label{
    background-image: url("checkbox-active.png");
    background-repeat: no-repeat;
    background-size: contain;
}
#title {
align: center;
}
</style>

<body>
    <div class="login-wrapper">
        <h1 id = "title">로그인화면</h1>
        <form action="login.do" method="post" id="login-form">
            <label for="input-id">
            <input type="text" name="userId" placeholder="아이디를 입력하세요"></label>
            
            <label for ="inptu-pass">
            <input type="password" name="userPassword" placeholder="비밀번호를 입력하세요"></label>
            
            <label for="remember-check">
                <input type="checkbox" id="remember-check">아이디 저장하기
            </label>
            
            <input type="submit" value="Login">
            
        </form>
    </div>
</body>






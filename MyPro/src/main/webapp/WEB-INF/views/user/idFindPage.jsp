<%@page import="com.project.harubang.user.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8" />
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
<style>
    .findId { 
      width: 400px;
      margin: 0 auto;
      padding: 20px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      font-family: 'Noto Serif KR', serif;
      margin-top:40px;
    }
    .findId h3 { 
      margin:0 0 15px 0;
      font-size:30px;
      font-family: 'Noto Serif KR', serif;
    }
    .findId .desc { 
      margin:0 0 30px;
      font-size:18px;
      color:#008bcc;
      font-weight:bold;
      font-family: 'Noto Serif KR', serif;
    }
    .findId .memberInfo {
      overflow:hidden;
      border:1px solid #d6d4d4;
      text-align:left;
      font-family: 'Noto Serif KR', serif;
    }
    .findId .memberInfo .info {
      padding: 35px 60px 20px 60px;
    }
    .findId .memberInfo .info span {
      color:#008bcc;
      font-family: 'Noto Serif KR', serif;
      font-weight:bold;
    }
    .findId .memberInfo .thumb {
      float:left;
      padding:10px;
      font-family: 'Noto Serif KR', serif;
    }
    .findId .copy {
      margin:40px 0 0;
      color:#757575;
      font-family: 'Noto Serif KR', serif;
    }
    .findId .button {
      margin:30px 0 0;
      }
      .thumb{
        width:400px;
        margin:0 auto;
        font-family: 'Noto Serif KR', serif;
      }
    .img{
      display: flex;
      justify-content: center;
      width:120px;
      height:110px;
      margin:0 auto;

    }
    .button .login{
      width:110px;
      height:35px;
      padding-right:10px;
    }
    .button .password{
      width:130px;
      height:35px;
    }
</style>
</head>
<body>

<div> </div>
<div module="member_findidresult">
  <div class="findId">
      <h3>아이디 찾기</h3>
      <p class="desc">회원님 아이디 찾기가 완료 되었습니다.</p>
      <div class="memberInfo">
          <p class="thumb">
            <img class="img" src="${path}/resources/images/icon/find_id.png" alt="" /></p>
      		<p class="info">저희 홈페이지를 이용해주셔서 감사합니다.<br />다음정보로 가입된 아이디는 <span>${id}</span>입니다.</p>
      </div>
      <p class="copy">
	          회원님의 아이디 찾기가 성공적으로 이루어졌습니다.<br />
	          회원님의 즐겁고 편리한 여행을 위해서 저희 홈페이지는 항상 최선의 노력을 다하겠습니다.
      </p>
      <p class="button">
          <a href="/user/login"><img class="login" src="${path}/resources/images/icon/login_button.png" alt="로그인" /></a>
          <a href="/user/pwFind"><img class="password" src="${path}/resources/images/icon/find_password_button.png" alt="비밀번호 찾기" /></a>
      </p>
  </div>
</div>
</body>
</html>
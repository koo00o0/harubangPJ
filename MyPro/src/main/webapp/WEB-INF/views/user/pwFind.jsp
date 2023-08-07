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

    <style>
            body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }
        .class{
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        form {
            width: 400px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="button"] {
            width: 100%;
            padding: 10px;
            background-color: #EEC06C;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .Mas{
           font-size: 12px;
           color: red;
           
        }
        .logo{
            width:300px;
            margin: 0 auto;
            padding:15px;
            margin-top:40px;
            margin-bottom:20px;
        }
        .itemBox{
            position: relative;
            margin-bottom: 20px;
        }

        .itemBox input{
                width: 380px;
                height: 45px;
                border: 1px solid #D5D5D5;
                border-radius: 5px;
                padding-left: 35px;
            }

        .itemBox img{
            position: absolute;
            width: 25px;
            height: 25px;
            left: 7px;
            bottom: 60%;
            transform: translateY(50%);
        }
        h3{
            margin:0 auto;
            margin-bottom:20px;
            margin-top:-20px;
        }
        
    </style>
<script>
   function pwFind() {   
      if ($("#id").val() == "") {
         var idMs="";
         idMs = "<p class='Mas'>* 아이디를 입력해주세요. </p>"
         $(".idMass").html(idMs);
         $("#id").focus();
         return;
      }
      if ($("#email").val() == "") {
         var emailMs="";
         emailMs = "<p class='Mas'>* 이메일을 입력해주세요. </p>"
         $(".emailMass").html(emailMs);
         $("#email").focus();
         return;
      }
      if ($("#phone").val() == "") {
         var phoneMs="";
         phoneMs = "<p class='Mas'>* 전화번호를 입력해주세요.</p>"
         $(".phoneMass").html(phoneMs);
         $("#phone").focus();
         return;
      }
      
      document.getElementById("pwFind").submit();
   }
</script>
</head>
<body>
    <div class="class">
        <div class="logos">
            <a href="/user/login"><img src="/resources/images/logo/logo.png" alt="" class="logo"></a>
        </div>
        <form action="/pwFind" method="POST" id="pwFind">
            <br/>
            <h3>비밀번호 찾기</h3>
            <div class="itemBox">
                <input type="text" id="id" name="id" placeholder="아이디"><br>
                <img src="${path}/resources/images/icon/user.png" alt="">
            </div>
            <div class="itemBox">
                <input type="text" id="email" name="email" placeholder="이메일"><br>
                <img src="${path}/resources/images/icon/email.png" alt="">
            </div>
            <div class="itemBox">
                <input type="text" id="phone" name="phone" placeholder="전화번호"><br>
                <img src="${path}/resources/images/icon/mobile-phone.png" alt="">
            </div>
            <div class="emailMass phoneMass idMass"></div>
            <input type="button" value="확인" onclick="pwFind()">
        </form>
    </div>
</body>
</html>
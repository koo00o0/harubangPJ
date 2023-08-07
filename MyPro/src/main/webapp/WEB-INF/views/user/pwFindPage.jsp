<%@page import="com.project.harubang.user.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<% 
	UserVO vo=(UserVO)request.getSession().getAttribute("result");
	String id=(String)request.getSession().getAttribute("id");
	String pw=(String)request.getSession().getAttribute("pw");

	System.out.println(id);
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 300px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        input[type="hidden"] {
            display: none; /* Hide the hidden input field */
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
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
            font-weight: bold;
        }

        input[type="button"]:hover {
            background-color: #cea65d;
        }
        
        .Mas{
           font-size: 12px;
           color: red;
        }
        .logo{
            width:300px;
            margin: 0 auto;
            margin-bottom:35px;
            padding-left:20px;
        }
    </style>
<script>

const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 1200,
    timerProgressBar: true,
    didOpen: (toast) => {
        /* toast.addEventListener('mouseenter', Swal.stopTimer); */
        toast.addEventListener('mouseleave', Swal.resumeTimer);
    },
    willClose: () => {
        setTimeout(() => {
            location.href = "/user/login";
        }, 300);
    }
});



   function pwFind() {   
      if ($("#pw").val() == "") {
         var pwMs="";
         pwMs = "<p class='Mas'>* 비밀번호를 입력해주세요. </p>"
         $(".pwMass").html(pwMs);
         $("#pw").focus();
         return;
      }
      if ($("#pw2").val() == "") {
         var pw2Ms="";
         pw2Ms = "<p class='Mas'>* 비밀번호를 입력해주세요. </p>"
         $(".pw2Mass").html(pw2Ms);
         $("#pw2").focus();
         return;
      }
      if ($("#pw").val() != $("#pw2").val()) {
         var pw3Ms="";
         pw3Ms = "<p class='Mas'>* 비밀번호가 서로 다릅니다.</p>"
         $(".pw3Mass").html(pw3Ms);
         $("#pw").focus();
         return;
      }
      if ($("#pw").val() == <%=pw%>) {
         var pw4Ms="";
         pw4Ms = "<p class='Mas'>* 사용자 비밀번호와 같습니다.</p>"
         $(".pw4Mass").html(pw4Ms);
         $("#pw").focus();
         return;
      }
      $.ajax({
         dataType : "text",
         type : "POST",
         url : "/pwFindChange",
         data:{
            "pw" : $("#pw").val()
         },
         success : function(result) {
            if (result == "T") {
               Toast.fire({
                   icon: 'success',
                   title: '비밀번호 변경을 성공했습니다.'
               })
            } else {
               alert("비밀번호 변경 실패..");
            }
         },
         error : function(e) {
            alert(e);
         }
      })
   }
</script>
</head>
<body>

    <div class="contain">
        <div class="logos">
            <a href="/user/login"><img src="/resources/images/logo/logo.png" alt="" class="logo"></a>
        </div>
    <div class="container">
        <input type="hidden" name="id"> <br/>
        <label for="pw">새 비밀번호 :</label>
        <input type="password" id="pw" name="pw" placeholder="새로운 비밀번호 입력"><br/>
        <label for="pw2">새 비밀번호 확인 :</label>
        <input type="password" id="pw2" name="pw2" placeholder="새로운 비밀번호 확인"><br/>
        <div class="pwMass pw2Mass pw3Mass pw4Mass"></div>
        <input type="button" value="변경" onclick="pwFind()">
    </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>하루방</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="${path}/resources/css/reset.css" rel="stylesheet"/>    
    <link href="${path}/resources/css/join.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<% 
   String id=(String)request.getSession().getAttribute("id");
%>

<script>

const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 1000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer);
        toast.addEventListener('mouseleave', Swal.resumeTimer);
    },
    didClose: () => {

    	setTimeout(() => {
    		$("#joinPage").submit();
        }, 200);
    }
});



function idCheck() {
   if ($("#id").val() == "") {
      var html = "";
      html +=   "<div>"
      html +=   "<p>아이디를 입력해주세요</p>"
      html += "</div>"   
      $(".textWrap").html(html);
      return;
   }
   $.ajax({
      dataType : "text",
      type : "POST",
      url : "/user",
      data : {
         "id" : $("#id").val(),
      },
      success : function(result) {
         if (result == "F") {
            var html = "";
               html +=   "<div>"
               html +=   "<p>사용가능한 아이디 입니다</p>"
               html += "</div>"   
            } else if(result == "T") {
            var html = "";
            html +=   "<div>"
            html +=   "<p>중복된 아이디 입니다</p>"
            html += "</div>"   
         }else if(result == ""){
            var html = "";
            html +=   "<div>"
            html +=   "<p>아이디를 입력해주세요</p>"
            html += "</div>"   
         }
         $(".textWrap").html(html);
      },
      error : function(e) {
         alert(e);
      }
   })
}

function joinStart(){
   if ($("#id").val() =="") {
      var html = "";
	   html +=   "<div>"
	   html +=   "<p>아이디를 입력해주세요</p>"
	   html += "</div>"   
	   $(".textWrap").html(html);
      $("#id").focus();
      return;
   }
   if ($("#pw").val() =="") {
      var html = "";
	   html +=   "<div>"
	   html +=   "<p>비밀번호를 입력해주세요</p>"
	   html += "</div>"   
	    $(".textWrap").html(html);
      $("#pw").focus();
      return;
   }
   if ($("#pw2").val() =="") {
      var html = "";
	   html +=   "<div>"
	   html +=   "<p>비밀번호를 입력해주세요</p>"
	   html += "</div>"   
	   $(".textWrap").html(html);
      $("#pw2").focus();
      return;
   }
   if ($("#pw2").val() !=$("#pw").val()) {
      var html = "";
      html +=   "<div>"
      html +=   "<p>비밀번호가 서로 다릅니다.</p>"
      html += "</div>"   
      $(".textWrap").html(html);
      $("#pw").focus();
      return;
   }
   
   if ($("#name").val() == "") {
      var html = "";
	   html +=   "<div>"
	   html +=   "<p>이름을 입력해주세요.</p>"
	   html += "</div>"   
	    $(".textWrap").html(html);
         $("#name").focus();
      return;
   }
   if ($("#email").val() == "") {
	   var html = "";
	   html +=   "<div>"
	   html +=   "<p>이메일을 입력해주세요.</p>"
	   html += "</div>"   
			 $(".textWrap").html(html);
      return;
   }
   if ($("#phone").val() == "") {
	  var html = "";
	   html +=   "<div>"
	   html +=   "<p>전화번호를 입력해주세요.</p>"
	   html += "</div>"   
	   $(".textWrap").html(html);
      return;
   }
   if ($("#birthday").val() == "") {
	   var html = "";
	   html +=   "<div>"
	   html +=   "<p>생년월일을 입력해주세요.</p>"
	   html += "</div>"   
	    $(".textWrap").html(html);
      $("#birthday").focus();
      return;
   }
   Toast.fire({
	    icon: 'success',
	    title: '회원가입이 완료되었습니다.',
	});
   
}

</script>
<body oninput=   "idCheck()">
<form action="/user/join" method="post" id="joinPage">
    <div class="joinWrap">
        <div class="logo"><a href="/"><img src="${path}/resources/images/logo/logo.png" alt="#"></a></div>
        <div class="joinBox">
            <div class="itemBox">
                <input id="id" name="id" type="text" placeholder="아이디"><br>
                <img src="${path}/resources/images/icon/user.png" alt="">
            </div>
            <div class="itemBox">
                <input id="pw" name="pw" type="password" placeholder="비밀번호" onclick="idCheck()"><br>
                
                <img src="${path}/resources/images/icon/password.png" alt="">
            </div>
            <div class="itemBox">
                <input id="pw2" name="pw2"type="password" placeholder="비밀번호 확인" onclick="idCheck()"><br>
                
                <img src="${path}/resources/images/icon/password.png" alt="">
            </div>
            <div class="itemBox">
                <input id="email" name="email" type="text" placeholder="비밀번호 분실 시 확인용 이메일"><br>
                <img src="${path}/resources/images/icon/email.png" alt="">
            </div>
            <div class="textWrap">
                <p>* 아이디 : 필수 정보입니다.</p>
                <p>* 비밀번호 : 필수 정보입니다.</p>
            </div>
            <div class="itemBox">
                <input id="name" name="name" type="text" placeholder="이름"><br>
                <img src="${path}/resources/images/icon/user.png" alt="">
            </div>
            <div class="itemBox">
                <input id="birthday" name="birthday" type="text" placeholder="생년월일 6자리 (예 : 1996-10-15)"><br>
                <img src="${path}/resources/images/icon/calendars.png" alt="">
            </div>
            <div class="genderBox">
                <ul>
                    <li class="gender" ><input type="radio" name="gender" value="man">남자</li>
                    <li><input type="radio" name="gender" value="female">여자</li>
                </ul>
                <!-- <input id="male" type="button" value="남자">
                <input id="female" type="button" value="여자"> -->
            </div>
            
            <div class="itemBox">
                <input id="phone" name="phone" type="text" placeholder="(예: 010 5287 4567)"  ><br>
                <img src="${path}/resources/images/icon/mobile-phone.png" alt="">
            </div>
            <input type="button" id ="join" value="회원가입" onclick="joinStart()">
        </div>
</form>
        <script>
            $(".genderBox li").click(function(){
                console.log($(this).index())
                let i =  $(this).index()
                $(".genderBox li").removeClass("active")
                $(".genderBox li").eq(i).addClass("active")
            })
        </script>
    
</body>
</html>
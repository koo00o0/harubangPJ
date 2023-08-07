<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title>하루방</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.css"></script>
    <link href="${path}/resources/css/reset.css" rel="stylesheet"/> 	
    <link href="${path}/resources/css/login.css" rel="stylesheet"/>
<meta charset="UTF-8" />
</head>
<style>

.Mas{
	font-size: 12px;
	color: red;
	margin-bottom: 15px;
}

</style>

<script>
function loginP() {
	if ($("#id").val() == "") {
		var idMs="";
		idMs = "<p class='Mas'>* 아이디를 입력해주세요. </p>"
		$(".idMass").html(idMs);
		$("#id").focus();
		return;
	}
	if ($("#pw").val() == "") {
		var pwMs="";
		pwMs = "<p class='Mas'>* 비밀번호를 입력해주세요. </p>"
		$(".pwMass").html(pwMs);
		$("#pw").focus();
		return;
	}
	document.getElementById("loginGOGO").submit();
}


</script>
<body>
	<form action ="/login" method="POST" id="loginGOGO">
		<div class="loginWrap">
	        <div class="logo"><a href="/"><img src="${path}/resources/images/logo/logo.png" alt="#"></a></div>
	        <div class="loginBox">
	            <div class="idBox">
	                <input id="id" name="id" type="text" placeholder="아이디"><br>
	                <img src="${path}/resources/images/icon/user.png" alt="">
	            </div>
	            <div class="pwBox">
	                <input id="pw" name="pw" type="password" placeholder="비밀번호"><br>
	                <img src="${path}/resources/images/icon/password.png" alt="">
	            </div>
	         	<div class="pwMass idMass"></div>
	            <c:if test="${Loginfalse=='fail'}">
	            <div class="checkBox">
	                <p>* 아이디 혹은 패스워드가 틀렸습니다.</p>
		        </div>
		        </c:if> 
	            <input type="button" id ="login" value="로그인" onclick="loginP()">
	        </div>
	        <div class="menuWrap">
	            <ul>
	                <li><a href="/user/pwFind">비밀번호 찾기</a></li>
	                <li><a href="/user/idFind">아이디 찾기</a></li>
	                <li><a href="/user/join">회원가입</a></li>
	            </ul>
	        </div>
	        <div class="jejuImg">
	            <div class="slideWrap">
	                <ul class="slide">
	                    <li style="background-image:url(${path}/resources/images/default/banner01.jpg)" class="sItem"></li>
	                    <li style="background-image:url(${path}/resources/images/default/banner02.jpg)" class="sItem"></li>
	                    <li style="background-image:url(${path}/resources/images/default/banner03.jpg)" class="sItem"></li>
	                    <li style="background-image:url(${path}/resources/images/default/banner04.jpg)" class="sItem"></li>
	                    <li style="background-image:url(${path}/resources/images/default/banner05.jpg)" class="sItem"></li>
	                </ul>
	            </div>
	        </div>
	
	        <div class="footerWrap">
	            <p>copyright © 하루방 제주에서의 여행을 만들다. All Rights Reserved.</p>
	        </div>
	    </div>
	</form>
	
	<script>
        $(".slide").bxSlider({
            auto:true,
            controls:false,
            pager:false,
            mode:"fade",
            speed:300,
        });
    </script>

</body>
</html>
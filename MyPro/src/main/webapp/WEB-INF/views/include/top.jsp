<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 	
	String id=(String)request.getSession().getAttribute("id"); 
	String email=(String)request.getSession().getAttribute("email"); 
	System.out.println(id+"fasfasfsafasfasf");
%>
<title>하루방</title>
	<!-- HARUBNAG font link  --> 
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
	<link href="${path}/resources/css/reset.css" rel="stylesheet"/>
	<link href="${path}/resources/css/top.css" rel="stylesheet"/>
</head>
<body>
	<!-- Top 로그인 메뉴바  -->
	<div class="top">
        <div class="loginWrap">
  		<% if(id==null||id.equals("")){ %> 	
        	<!-- 로그인 전, 메뉴바  로그인 기능 추가 시 변경 바람 *-->
             <ul class="clearfix">
                <li><a href="/user/login">로그인</a></li>
                <li><a href="/user/join">회원가입</a></li>
                <li><a href="/user/idFind">아이디/비밀번호 찾기</a></li>
            </ul> 
         	<%}else { %>
            <!-- 로그인 후, 메뉴바  -->
            <div class="dropdownWrap">
                <div class="imgWrap">
                    <img src="/resources/images/icon/userB.png" alt="">
                </div>
                <div class="dropdown">
                    <div class="dropbtn"><%=id %> 님, 안녕하세요. ▼</div>
                    <div class="dropdown-content">
                        <div class="userWrap">
                            <img src="/resources/images/icon/profile-user.png" alt="">
                            <div class="userInfo">
                                <h4><%=id %></h4>
                                <p><%=email %></p>
                            </div>
                        </div>

					<form action="/logout" method="POST">
                        <div class="buttonWrap">
                            <input type="button" name="" id="" value="마이페이지" onClick="location.href='/user/mypage'">
							<input  type="submit" value="로그아웃"  onclick="">
                       	</div>
					</form>	

                    </div>
                </div>  
            </div>
            <%} %>
        </div>
        
       
		<!-- 상단 메뉴바 -->
        <div class="navWrap clearfix">
            <h1><a href="/"><img class="logo" src="${path}/resources/images/logo/logo.png" alt="logo"></a></h1>
            <nav class="gnb">
                <ul class="clearfix">
                    <li><a href="/info/infoList">제주여행</a></li>
                    <li><a href="/schedule/schedule">나의여행</a></li>
                    <li><a href="/blog/blog">구경하기</a></li>
                    <li><a href="/board/board">게시판</a></li>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>
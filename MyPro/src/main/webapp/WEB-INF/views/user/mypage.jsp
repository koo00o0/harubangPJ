<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)request.getSession().getAttribute("id");
	String pw=(String)request.getSession().getAttribute("pw");
	String email=(String)request.getSession().getAttribute("email");
	String phone=(String)request.getSession().getAttribute("phone");
	String name=(String)request.getSession().getAttribute("name");	
	session.setMaxInactiveInterval(60*60) ;
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta charset="UTF-8">
    <title>하루방</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
    <link href="${path}/resources/css/reset.css" rel="stylesheet"/>
    <link href="${path}/resources/css/mypage.css" rel="stylesheet"/>
    <script>
    $(function(){
    	loadPage('mypageFriendAdd');
    	})
    	
          function loadPage(param){
            $('#jspContainer').load('/user/include/'+param) ;
        }  

    </script>
</head>
<body>
   <input type='hidden' name='pwa' value='<%=pw%>' id='pwjs'>
 <div class="mypageWrap">
        <div class="mypageBox">
            <div class="leftWrap">
                <div class="logoWrap">
                    <a href="/"><img src="/resources/images/logo/logo.png" alt=""></a>
                </div>
                <div class="userWrap">
                    <div class="img"></div>
                    <h2><%=id %></h2>
                    <p><%=email %></p>
                </div>
                <div class="menuWrap">
                    <ul>
                        <li onclick="loadPage('mypageInfoChange')">회원정보수정</li>
                        <li onclick="loadPage('mypageFriendAdd')">친구 추가·목록</li>
                        <li>내가 작성한 글</li>
                    </ul>
                    <div class="bottomBar"></div>
                </div>
                <div class="imgBox"></div>
                <p class="footer">copyright © 하루방 제주에서의 하루를 만들다. All Rights Reserved.</p>
                <div class="bar"></div>
            </div>

            <div class="rightWrap">
                <div class="infoWrap">
                <div id="jspContainer"></div>
                 <!-- 회원정보수정 INCLUDE -->
<%--                    <jsp:include page="/WEB-INF/views/user/include/mypageInfoChange.jsp"/>    --%>
                    <!-- 친구추천·목록 -->
                    
                  <%--  <jsp:include page="/WEB-INF/views/user/include/mypageFriendAdd.jsp"/>   --%>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
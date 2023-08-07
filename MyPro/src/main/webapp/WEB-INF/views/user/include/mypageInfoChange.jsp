<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id=(String)request.getSession().getAttribute("id");
	String pw=(String)request.getSession().getAttribute("pw");
	String email=(String)request.getSession().getAttribute("email");
	String phone=(String)request.getSession().getAttribute("phone");
	String name=(String)request.getSession().getAttribute("name");	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루방</title>
	<link href="${path}/resources/css/mypageInfoChange.css" rel="stylesheet"/>
</head>
<body>
	<div class="topMenuWrap">
        <h2>회원정보수정</h2>
        <div class="menuWrap">
            <ul>
                <li><div class="myImg"></div></li>
                <li><%=id %> ▼</li>
                <li><img src="/resources/images/icon/notification.png" alt=""></li>
            </ul>
        </div>
    </div>
    <div class="editWrap">
        <h4>기본정보수정</h4>
        <div class="eitemWrap">
                <img src="/resources/images/icon/profile-user.png" alt="" class="item">
                <div class="emailWrap item">
                    <h2><%=name %></h2>
                    <p><%=email %></p>
                </div>
                <input id="email" type="button" value="EMAIL 수정" onclick="changeClick(this.id, '<%=email %>')" class="item">
        </div>
        <div class="eitemWrapA">
            <img src="/resources/images/icon/mobile-phone.png" alt="" class="item">
            <div class="emailWrap item">
                <p><%=phone %></p>
            </div>
            <input id="phone" type="button" value="연락처 수정" onclick="changeClick(this.id, '<%=phone %>')" class="item">
        </div>
        <div class="eitemWrapA">
            <img src="/resources/images/icon/password.png" alt="" class="item">
            <div class="emailWrap item">
                <p><%=pw %></p>
            </div>
            <input id="password" type="button" value="비밀번호 수정" onclick="changeClick(this.id, '<%=pw %>')" class="item">
        </div>
    </div>
    <div id="modal" class="explainWrap">
        <div class="explainBox">
            <div class="changeWrap">
            </div>
            <div class="cancelWrap">
                <img src="/resources/images/icon/cancel.png" alt="">
            </div>
        </div>    
    </div>

    <script src="${path}/resources/js/jquery.min.js"></script>
    <script src="${path}/resources/js/mypage_modal.js"></script>
</body>
</html>
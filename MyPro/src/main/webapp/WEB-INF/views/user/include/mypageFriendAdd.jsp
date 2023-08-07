<%@page import="java.util.List"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.harubang.user.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="${path}/resources/js/jquery.min.js"></script>
<%
	String friendId=(String)request.getSession().getAttribute("friendId"); 
	String id=(String)request.getSession().getAttribute("id");
 	List<UserVO> List =  (List<UserVO>)request.getSession().getAttribute("List");
 	List<UserVO> RECIVE_List = (List<UserVO>)request.getSession().getAttribute("RECIVE_List");
%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
            location.href = "/user/mypage";
        }, 200);
    }
});

	$(function(){
		getFriendPage();
		getFriendRecive();
		getFriendList();
		getFriendList2();
    }); 
	
	function friend() {
		
		if ($("#friend").val() == "") {

			$("#friend").focus();
			var friendList="";
			friendList = "<p class='friendNot'>* 아이디를 입력해주세요. </p>"
			$(".requestWrap").html(friendList);
			return;
		}
		if ($("#friend").val() == "<%=id%>") {
			
			$("#friend").focus();
			var friendList="";
			friendList = "<p class='friendNot'>* 사용자 아이디와 동일합니다. </p>"
			$(".requestWrap").html(friendList);
			return;
		}
		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/friend",
			data : {
				"id" : $("#friend").val(),
			},success : function(result) {
				if(result=="F"){
					if('${fail2=="fail"}'){
					var friendList="";
					friendList = "<p class='friendNot'>* 존재하지않는 아이디 입니다</p>"
					$(".requestWrap").html(friendList);
					}
				}else {
					var friendList= result;
					friendList  = "<div class='friendRequest'>";
					friendList += '<img class="item" src="/resources/images/icon/profile-user.png" alt="">';
					friendList += '<h5 class="item">'+result+'</h5>';
					friendList += "<input type='button' class='item' id='friendRequest'  value='요청' onclick='friendRequest()'>";
					friendList += "</div>";
					$(".requestWrap").html(friendList);
				}
			}
		})
	}
	
	function friendRequest() {
		
		  const btnElement = document.getElementById('friendRequest');
		  btnElement.value = "요청중";
		   
		  $.ajax({
				dataType : "text",
				type : "POST",
				url : "/friendRequest"
				,success : function(result) {
					if(result=="F"){

						Toast.fire({
						    icon: 'success',
						    title: '친구요청이 되었습니다.',
						});
						
					}else {
						var friendList="";
						friendList = "<p class='friendNot'>* 이미 요청중이거나 친구목록에 있는 친구입니다</p>"
						$(".requestWrap").html(friendList);
					}
				}
			})
		}
	
	function getFriendPage() {
		
		$.ajax({
			dataType : "JSON",
			type : "POST",
			url : "/friendRequesting",
			success : function(result) {
				for(var i=0; i<result.length; i++){
					var obj = result[i];
					console.log(obj);
					friendList = "<div class='friendRequest recive_id"+i+"' 'item'>";
					friendList += '<img class="item" src="/resources/images/icon/profile-user.png" alt="">';
					friendList += '<h5 class="item">' + obj['recive_id'] + '</h5>';
					friendList += '<input class="item" type="button" value="요청중" onclick="requesting1('+i+')">';
					friendList += '</div>';
					$(".requestList").append(friendList);
				}
			}
		})
	}

	function requesting1(i) {
		
		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/requestCancel",
			data : {
				"recive_id"  : $(".recive_id"+i).text()
			},
			success : function(result) {
				if(result == "T"){
					alert("실패.");
				}else{
					Toast.fire({
					    icon: 'success',
					    title: '친구요청이 취소되었습니다.',
					});
				}
			}
		}) 
	}
	
	function getFriendRecive() {
		
		$.ajax({
			dataType : "JSON",
			type : "POST",
			url : "/friendRecive",
			success : function(result1) {
				var html = "";
				for(var i=0; i<result1.length; i++){
					var obj = result1[i];
					html +="<div class='friendRequest send_id"+i+"'>"
					html +="<img class='item' src='/resources/images/icon/profile-user.png' alt=''>"
					html +="<h5 class='item'>"+obj['send_id']+"</h5>"
					html +="<input class='item' type='button' value='수락' onclick='acceptFriend("+i+")'>"
					html +=	"<input class='item' type='button' value='거절' onclick='refuseFriend("+i+")'>"
					html += "</div>"
				}
				document.getElementById("friendRecive").innerHTML = html;
			}
		})
	}

	function acceptFriend(i) {
		
 		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/acceptFriend",
			data : {
				"send_id"  : $(".send_id"+i).text()
			},
			success : function(result) {
				if(result == "T"){
					alert("실패.");
				}else{
					Toast.fire({
					    icon: 'success',
					    title: '친구 추가 완료중.',
					});
				}
			}
		})
	}
	function refuseFriend(i) {
		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/refuseFriend",
			data : {
				"send_id"  : $(".send_id"+i).text()
			},
			success : function(result) {
				if(result == "T"){
					alert("실패.");
				}else{
					Toast.fire({
					    icon: 'success',
					    title: '친구 거절 신천중.',
					});
				}
			}
		}) 
	}
	
	function getFriendList() {
		
		$.ajax({
			dataType : "JSON",
			type : "POST",
			url : "/friendList",
			success : function(result2) {
				for(var i=0; i<result2.length; i++){
					var obj = result2[i];
					friendList =    "<div class='friendRequest' 'send_id"+i+"'>"
					friendList +=   '<img class="item" src="/resources/images/icon/profile-user.png" alt="">'
					friendList +=   '<h5 class="item">'+obj['send_id'] +'</h5>'
					friendList +=   '<input class="item" type="button" value="구경하기"  onclick="friendWatch2('+i+')" >'
					friendList +=   '<input class="item" type="button" value="삭제"  onclick="friendCencle2('+i+')" >'
					friendList +=   "</div>"
					$(".getFriendList").append(friendList);
					
				}
			}
		})	
	}
	function friendCencle2(i) {
		
		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/friendCencle2",
			data : {
				"send_id"  : $(".send_id"+i).text()
			},
			success : function(result) {
				if(result == "T"){
					alert("삭제 실패.");
				}else{
					Toast.fire({
					    icon: 'success',
					    title: '친구 삭제 중입니다.',
					});
				}
			}
		}) 
	}
	
/* 	function friendWatch2(i) {
		
		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/friendWatch2",
			data : {
				"send_id"  : $(".send_id"+i).text()
			},
			success : function(result) {
				if(result == "T"){
					alert("삭제 실패.");
				}else{
					
				}
			}
		}) 
	} */
	
	function getFriendList2() {
		
		$.ajax({
			dataType : "JSON",
			type : "POST",
			url : "/friendList2",
			success : function(result3) {
				for(var i=0; i<result3.length; i++){
					var obj= result3[i]
					friendList =   "<div class='friendRequest' 'recive_id"+i+"'>"
					friendList +=  '<img class="item" src="/resources/images/icon/profile-user.png" alt="">'
					friendList +=  '<h5 class="item">'+obj['recive_id'] +'</h5>'
					friendList +=  '<input class="item" type="button" value="구경하기"  onclick="friendWatch('+i+')" >'
					friendList +=  '<input class="item" type="button" value="삭제"  onclick="friendCencle('+i+')" >'
					friendList +=  "</div>"
					$(".getFriendList2").append(friendList);
				}
			}
		})
	}
	
	function friendCencle(i) {
		
		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/friendCencle",
			data : {
				"recive_id"  : $(".recive_id"+i).text()
			},
			success : function(result) {
				if(result == "T"){
					alert("삭제 실패.");
				}else{
					Toast.fire({
					    icon: 'success',
					    title: '친구 삭제 중입니다.',
					});
				}
			}
		}) 
	}
	
/* 	function friendWatch(i) {
		
		$.ajax({
			dataType : "text",
			type : "POST",
			url : "/friendWatch",
			data : {
				"recive_id"  : $(".recive_id"+i).text()
			},
			success : function(result) {
				if(result == "T"){
					alert("삭제 실패.");
				}else{
					
					location.href="구경하는 페이지로 가기";
				}
			}
		}) 
	} */
</script>
<html>
<head>
<meta charset="UTF-8">
<title>하루방</title>
	<link href="${path}/resources/css/mypageFriendAdd.css" rel="stylesheet"/>
</head>
<body>
	<div class="topMenuWrap">
         <h2>친구 추가·목록</h2>
         <div class="menuWrap">
             <ul>
                 <li><div class="myImg"></div></li>
                 <li><%=id %> ▼</li>
                 <li><img src="/resources/images/icon/notification.png" alt=""></li>
             </ul>
         </div>
     </div>
     <div class="searchWrap">
         <input class="searchID" id="friend" type="text" placeholder="아이디를 검색하세요.">
         <input class="searchButton" type="button" value="검색" onclick="friend()">
     </div>
     <div class="requestWrap" >
     </div>
     <div class="friendListWrap">
         <h3>친구 목록</h3>
         <div class="frienList getFriendList getFriendList2">
         </div>
     </div>
     <div class="friendListWrap">
         <h3>친구 (수락 : 거절) </h3>
         <div class="frienList" id="friendRecive">
         </div>
     </div>
     <div class="requestListWrap">
         <h3>요청중인 친구목록</h3>
         <div class="requestList" >
         </div>
     </div>
</body>
</html>
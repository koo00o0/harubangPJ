<%@page import="com.project.harubang.info.InfoDTO"%>
<%@page import="java.awt.SystemColor"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.harubang.info.InfoResultVO" %>
<%
	ArrayList<InfoResultVO> Infolist = (ArrayList<InfoResultVO>)request.getAttribute("infoList");
	ArrayList<InfoDTO> Infolist1 = (ArrayList<InfoDTO>)request.getAttribute("infoList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루방</title>
	<link href="${path}/resources/css/Swiper_3.3.1_css_swiper.min.css" rel="stylesheet"/>
	<link href="${path}/resources/css/schedule.css" rel="stylesheet"/>
	
</head>
<body>
	<!-- 공통 Top 구조 include  -->	
	<jsp:include page="/WEB-INF/views/include/top.jsp"/>
	
	<!-- Banner Type  -->
	<div class="bannerWrap">
        <img src="${path}/resources/images/default/banner_jeju01.png" alt="제주이미지" class="bn">
        <div class="titleWrap">
            <h4>Make A Day In Jeju</h4>
            <h2>나의여행</h2>
            <div class="button"><input type="button" value="일정 만들기"></div>
        </div>
    </div>
    
    <!-- Search & menu Wrap -->
    <div class="searchWrap">
        <h2>하루방에서 나의 일정을 만들어보세요.</h2>
        <p>검색하거나 목록에서 직접 선택해주세요.</p>
        <div class="searchBar">
            <input class="serchInput" type="text"><br>
            <input type="button" class="button-add">
        </div>
        
        <nav class="menuWrap">
            <ul class="clearfix">
                <li class="active">나의 일정</li>                
                <li>찜목록</li>                
                <li>나의 기록</li>                
            </ul>
        </nav>
    </div>

	<script src="${path}/resources/js/jquery.min.js"></script>
	<script>
        $(".menuWrap li").click(function(){
            console.log($(this).index())
            let i =  $(this).index()
            $(".menuWrap li").removeClass("active")
            $(".menuWrap li").eq(i).addClass("active")
        })
        
     	$(function(){
     		heartList();
	    });
		
		function heartList() {
			
			$.ajax({
	    		dataType : "JSON",
	    		url : "/heartList",
	    		type : "POST",
	    		data : {
	    		},success : function(result) {
	    	 	   for(var i=0;i<result.length;i++){
	    	 		   var obj = result[i];
	    	 		   var wish = obj['wish']
	    	 		   var classid = obj['checkId']
	    	 		  	if(wish=="SUCCESS"){
	    	 		  		$('#'+classid).attr("src", "/resources/images/icon/heartR.png");
	    	 		  	}
	    	 	   }
				},error : function(e){
					alert(e)
				}
	    	})
		}

    </script>
	<!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
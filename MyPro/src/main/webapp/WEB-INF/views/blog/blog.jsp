<%@page import="java.awt.SystemColor"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루방</title>
<link href="${path}/resources/css/Swiper_3.3.1_css_swiper.min.css" rel="stylesheet"/>
	<link href="${path}/resources/css/blog.css" rel="stylesheet"/>
	
</head>
<body>
	<!-- 공통 Top 구조 include  -->	
	<jsp:include page="/WEB-INF/views/include/top.jsp"/>
	
	<!-- Banner Type  -->
	<div class="bannerWrap">
        <img src="${path}/resources/images/default/banner_jeju02.png" alt="제주이미지" class="bn">
        <div class="titleWrap">
            <h4>Look Around</h4>
            <h2>구경하기</h2>
        </div>
    </div>
    
    <!-- Search & menu Wrap -->
    <div class="searchWrap">
        <h2>다른 여행자의 일정을 확인해보세요.</h2>
        <p>검색하거나 목록에서 직접 선택해주세요.</p>
        <div class="searchBar">
            <input class="serchInput" type="text"><br>
            <input type="button" class="button-add">
        </div>
        
    </div>

	<!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
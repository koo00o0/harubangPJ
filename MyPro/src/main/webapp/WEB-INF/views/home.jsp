<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>하루방</title>
	<link href="${path}/resources/css/home.css" rel="stylesheet"/>
</head>
<body>
	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
    <!-- Banner video 추가  -->
    <div class="banner">
        <div class="videoWrap">
            <video id="vid" src="${path}/resources/images/video/video01.mov" type="video/mov" autoplay muted loop></video>
        </div>
    </div>
    
    <!-- Section 추가  -->
    <div class="sectionWrap">
        <div class="section-item1">
            <div class="textWrap">
                <h4>제주여행의 모든 것</h4>
                <h2>하루방에서 제주를</h2>
                <h2>제주에서 하루방을</h2>
                <p>하루방에서 제주의 하루를 그리다</p>
            </div>

            <img src="${path}/resources/images/default/main20.jpeg" alt="">
        </div>

        <div class="section-item2">
            <div class="textWrap">
                <h2>배낭</h2>
                <p>서로 다른 생각을 가지고<br>
                   	 하늘을 보았다<br>
                </p>
                <p>서로 예쁜 발자국을 담으며<br>
                    	바다를 걸었다<br>
                </p>
                    
                <p>
                    	함께 꿈이라는 시간 속을 걸으며<br>
                    	서로를 느꼈다<br>
                </p>
                <p>
                    	그 순간을<br>
                    	하나라도 놓칠까 담았다<br>
                </p>
            </div>
            <div class="imgWrap">
                <img src="${path}/resources/images/default/main01.jpg" alt="" class="item1">
                <img src="${path}/resources/images/default/main03.jpg" alt="" class="item2">
                <img src="${path}/resources/images/default/main04.jpg" alt="" class="item3">
            </div>
        </div>
       <div class="section-item3">
           <div class="textWrap">
               <h2>HOW TO USE HARUBANG</h2>
           </div>
           <div class="navWrap">
               <ul>
                   <li>관광지 추천<br> <img src="${path}/resources/images/icon/recommended.png" alt=""></li>
                   <li>여행계획 및 공유<br> <img src="${path}/resources/images/icon/sharing.png" alt=""></li>
                   <li>블로그형 기록<br> <img src="${path}/resources/images/icon/writing.png" alt=""></li>
               </ul>
           </div>
       </div>
   </div>
    <!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
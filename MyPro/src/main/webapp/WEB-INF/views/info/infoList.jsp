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
	<link href="${path}/resources/css/infoList.css" rel="stylesheet"/>
	<link href="${path}/resources/css/grid-swiper.css" rel="stylesheet"/>
	<link href="${path}/resources/css/jeju_travel_explain.css" rel="stylesheet"/>
</head>
<body>
	<!-- 공통 Top 구조 include  -->	
	<jsp:include page="/WEB-INF/views/include/top.jsp"/>
	
	<!-- Banner Type  -->
	<div class="bannerWrap">
        <img src="${path}/resources/images/default/banner_jeju.png" alt="제주이미지" class="bn">
        <div class="titleWrap">
            <h4>Travel In Jeju</h4>
            <h2>제주여행</h2>
        </div>
    </div>
    
    <!-- Search & menu Wrap -->
    <div class="searchWrap">
        <h2>하루방에서 제주도 여행을 준비하세요.</h2>
        <p>검색하거나 목록에서 직접 선택해주세요.</p>
        <div class="searchBar">
            <input class="serchInput" type="text"><br>
            <input type="button" class="button-add">
        </div>
        
        <nav class="menuWrap">
            <ul class="clearfix">
                <li class="active">전체보기</li>         
                <li>여행지</li>       
                <li>숙소</li>                
                <li>맛집</li>                
            </ul>
        </nav>
    </div>
    
    <div class="swiperWrap">
        <div class="swiper-container">
            <div class="swiper-wrapper">
            	 <% for (int i = 0 ; i < Infolist.size(); i++){ 
						InfoResultVO info = Infolist.get(i);
						String newSrcFile = "/resources/images/info/" + info.getInfoDTO().getSort() + "/" + info.getInfoDTO().getImgfile();
						/* String newAddress = info.getInfoAddressDTO().getAddressName(); */
						String[] newAddress = info.getInfoAddressDTO().getAddressName().split(" ");
						String newAddressName = newAddress[0] + " " + newAddress[1];
				%>
                <div id="<%= info.getInfoDTO().getItemId() %>" class="swiper-slide" data-filter="<%= info.getInfoDTO().getSort() %>" onclick="swiperClick(this.id)">
                    <img class="mainImg" src="<%=newSrcFile %>" alt="">
                    <div class="tWrap">
                        <h4><%= info.getInfoDTO().getItemName() %></h4>
                        <p><%=newAddressName %></p>
                    </div>
                    <img onclick="heartClick(this.id)"  id="<%= info.getInfoDTO().getCheckId() %>" class="heartImg" src="${path}/resources/images/icon/heart.png" alt="">
                </div>
                <% } %>
            </div>
            <!-- <div class="swiper-pagination"></div> -->
        </div>
    </div>
    
    <div id="modal" class="explainWrap">
        <div class="explainBox">
            <div class="imgWrap">
                <img class="itemImg" src="" alt="">
                <img class="heartImg" src="${path}/resources/images/icon/heart.png" alt="">
            </div>
            <div class="textWrap">
                <div class="explainText">
                	<input id="modalInput" type="hidden">
                    <h1></h1>
                    <h4></h4>
                    <p></p>
                </div>
                <div class="iconWrap">
					<!-- 데이터 항목에 따라 html 변경 travel/hoted/food -->
            	</div>
            	<div class="cancelWrap">
                    <img src="${path}/resources/images/icon/cancel.png" alt="">
                </div> 
        </div>
    </div>
    </div>
    <script src="${path}/resources/js/jquery.min.js"></script>
    <script src="${path}/resources/js/Swiper_3.3.1_js_swiper.min.js"></script>
    <script src="${path}/resources/js/modal.js"></script>
    <script src="${path}/resources/js/gird_swiper.js"></script>
    <script>

		$(function(){
			getHeart();
	    });
		
		function getHeart() {
			
			$.ajax({
	    		dataType : "JSON",
	    		url : "/getHeart",
	    		type : "POST",
	    		data : {
	    		},success : function(result) {
	    	 	   for(var i=0;i<result.length;i++){
	    	 		   var obj = result[i];
	    	 		   var wish = obj['wish']
	    	 		   var classid = obj['checkId']
	    	 		  	if(wish=="SUCCESS"){
	    	 		  		$('#'+classid).attr("src", "/resources/images/icon/heartR.png");
	    	 		  	}else{
	    	 		  		$('#'+classid).attr("src", "/resources/images/icon/heart.png");
	    	 		  	}
	    	 	   }
				},error : function(e){
					alert(e)
				}
	    	})
		}
	    
	    function heartClick(checkid) {
	        event.stopPropagation();
			$.ajax({
        		dataType : "JSON",
        		url : "/heart",
        		type : "POST",
        		data : {
       				"checkId" : checkid
        		},success : function (result) {
 	    	 	   for(var i=0;i<result.length;i++){
	    	 		   var obj = result[i];
	    	 		   var wish = obj['wish']
	    	 		   var classid = obj['checkId']
	    	 		  	if(wish=="SUCCESS"){
	    	 		  		$('#'+classid).attr("src", "/resources/images/icon/heartR.png");
	    	 		  	}else{
	    	 		  		$('#'+classid).attr("src", "/resources/images/icon/heart.png");
	    	 		  	}
	    	 	   }
				}
        	})
		}
    </script>
	<!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
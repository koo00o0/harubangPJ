const modal = document.getElementById("modal");
    
function modalOn() {
    modal.style.display = "flex";
    document.body.style.overflow = 'hidden';
    
}

function isModalOn() {
    return modal.style.display === "flex"
}

function modalOff() {
    modal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

function swiperClick(inputItemId){
	document.getElementById('modalInput').value = inputItemId;
	$.ajax({
    	dataType: 'json',
    	type:"POST",
    	url:"/info/itemIdCheck",
    	data: {
    		"id" : inputItemId,
    	},
    	success : function(result){
    		var imgUrl = "/resources/images/info/" + result[0].infoDTO.sort + "/" + result[0].infoDTO.imgfile; 
    		$(".explainBox .imgWrap .itemImg").attr("src" , imgUrl);
    		$(".explainText h1").text(result[0].infoDTO.itemName);
    		$(".explainText h4").text(result[0].infoAddressDTO.addressName);
    		var detailJson = JSON.parse(result[0].infoDTO.detail);
    		
    		var explane;
    		if(detailJson.key.indexOf('EXPLANE') != -1){
    			explane = detailJson.value[detailJson.key.indexOf('EXPLANE')];
    			$(".explainText p").text(explane);
    		}
    		var playtime;
    		var phone;
    		var dayoff;
    		var breaktime;
    		var checkin;
    		var checkout;
//    		detail 값 검색
    		
    		
    		if(detailJson.key.indexOf('PLAYTIME') != -1){
    			playtime = detailJson.value[detailJson.key.indexOf('PLAYTIME')];
    			if(playtime == "null"){
    				playtime = "-"
    			}
    		}
    		
    		if(detailJson.key.indexOf('CHECK_IN') != -1){
    			checkin = detailJson.value[detailJson.key.indexOf('CHECK_IN')];
    			if(checkin == "null"){
    				checkin = "-"
    			}
    		}
    		
    		if(detailJson.key.indexOf('CHECK_OUT') != -1){
    			checkout = detailJson.value[detailJson.key.indexOf('CHECK_OUT')];
    			if(checkout == "null"){
    				checkout = "-"
    			}
    		}
    		if(detailJson.key.indexOf('PHONE') != -1){
    			phone = detailJson.value[detailJson.key.indexOf('PHONE')];
    			if(phone == "null"){
    				phone = "-"
    			}
    		}
    		
    		if(detailJson.key.indexOf('DAYOFF') != -1){
    			dayoff = detailJson.value[detailJson.key.indexOf('DAYOFF')];
    			if(dayoff == "null"){
    				dayoff = "-"
    			}
    		}
    		
    		if(detailJson.key.indexOf('BREAKTIME') != -1){
    			breaktime = detailJson.value[detailJson.key.indexOf('BREAKTIME')];
    			if(breaktime == "null"){
    				breaktime = "-"
    			}
    		}
    		
    		
    		var innerHtml;
    		if (result[0].infoDTO.sort == "travel"){
    			innerHtml = '<div class="iconItem">' ;
    			innerHtml += '<img src="/resources/images/icon/userB.png" alt="">' ;
    			innerHtml += '<P>' + result[0].infoDTO.likeCnt + '</P></div>';
    			innerHtml += '<div class="iconItem">';
    			innerHtml += '<img src="/resources/images/icon/playtime.png" alt="">';
    			innerHtml += '<P>' + playtime + '</P></div>';
    			$(".iconWrap").html(innerHtml);
    		}else if(result[0].infoDTO.sort == "hotel"){
    			innerHtml = '<div class="iconItem">' ;
    			innerHtml += '<img src="/resources/images/icon/userB.png" alt="">' ;
    			innerHtml += '<P>' + result[0].infoDTO.likeCnt + '</P></div>';
    			innerHtml += '<div class="iconItem">';
    			innerHtml += '<img src="/resources/images/icon/playtime.png" alt="">';
    			innerHtml += '<P>' + checkin + ' ~ ' + checkout + '</P></div>';
    			innerHtml += '<div class="iconItem">';
    			innerHtml += '<img src="/resources/images/icon/oldphone.png" alt="">';
    			innerHtml += '<P>' + phone + '</P></div>';
    			$(".iconWrap").html(innerHtml);	
    		}else if(result[0].infoDTO.sort == "food"){
    			innerHtml = '<div class="iconItem">' ;
    			innerHtml += '<img src="/resources/images/icon/userB.png" alt="">' ;
    			innerHtml += '<P>' + result[0].infoDTO.likeCnt + '</P></div>';
    			innerHtml += '<div class="iconItem">';
    			innerHtml += '<img src="/resources/images/icon/playtime.png" alt="">';
    			innerHtml += '<P>' + playtime + '</P></div>';
    			innerHtml += '<div class="iconItem">';
    			innerHtml += '<img src="/resources/images/icon/breaktime.png" alt="">';
    			innerHtml += '<P>' + breaktime + '</P></div>';
    			innerHtml += '<div class="iconItem">';
    			innerHtml += '<img src="/resources/images/icon/close.png" alt="">';
    			innerHtml += '<P>' + dayoff + '</P></div>';
    			innerHtml += '<div class="iconItem">';
    			innerHtml += '<img src="/resources/images/icon/oldphone.png" alt="">';
    			innerHtml += '<P>' + phone + '</P></div>';
    			$(".iconWrap").html(innerHtml);	
    		}
    	}
    })
	modalOn()
}

const closeBtn = modal.querySelector(".cancelWrap")
closeBtn.addEventListener("click", e => {
    modalOff()
})

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("explainWrap")) {
        modalOff()
    }
})

window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})
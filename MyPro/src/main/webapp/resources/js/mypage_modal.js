
const modal = document.getElementById("modal");
    
function modalOn(inputID, value) {
    var innerHtml;
    var category;
    if (inputID == "email"){
        category = "Email" ;
    }else if(inputID == "phone"){
        category = "Phone";
    }else if(inputID == "password"){
        category = "Pw";
    }
    
    innerHtml = '<h3>'+ category +  ' 수정</h3>' ;
    
    if(category == "Pw"){
    	innerHtml += '<form action="/modify" method="POST" id="modifyPw">'
        innerHtml += '<input id="textInput" type="password" class="userPw" name="userPw" placeholder="현재 비밀번호">'
    	innerHtml += '<input id="textInput" type="password" class="pw" name="pw" placeholder="새 ' + category + '">';
        innerHtml += '<input id="textInput" type="password" class="pw2" name="pw2"  placeholder="새 ' + category + ' 확인">';
        innerHtml += '<input  type="button" value="변경" onclick="pwChange()">';
        innerHtml += '</form>'
    }else if(category == "Email"){
        	innerHtml += '<p>' + value + '</p>';
        	innerHtml += '<form action="/modifyEmail" method="POST" id="modifyEmail">'
        	innerHtml += '<input id="textInput" type="text" class="email" name="email" placeholder="새 ' + category + '">';
            innerHtml += '<input id="textInput" type="text" class="email2" name="email2"  placeholder="새 ' + category + ' 확인">';
            innerHtml += '<input  type="button" value="변경" onclick="emailChange()">';
            innerHtml += '</form>'
    }else if(category=="Phone"){
	    	innerHtml += '<p>' + value + '</p>';
	    	innerHtml += '<form action="/modifyPhone" method="POST" id="modifyPhone">'
	    	innerHtml += '<input id="textInput" type="text" class="phone" name="phone" placeholder="새 ' + category + '">';
	        innerHtml += '<input id="textInput" type="text" class="phone2" name="phone2"  placeholder="새 ' + category + ' 확인">';
	        innerHtml += '<input  type="button" value="변경" onclick="phoneChange()">';
    }
		    innerHtml += '<input id="cancellButtonInput" type="button" value="취소" onclick="cancellButton()">';
		    innerHtml += '<div class="phoneNot pwNot emailNot"></div>';
		    $(".explainBox .changeWrap").html(innerHtml);
		    modal.style.display = "flex";
		    document.body.style.overflow = 'hidden';
}
function emailChange() {
	if ($(".email").val() == "") {
		var emailFail="";
		emailFail = "<p class='emailFailc'>* 이메일을 입력해주세요.</p>"
		$(".emailNot").html(emailFail);
		$(".email").focus();
		return;
	}
	if ($(".email2").val() == "") {
		var emailFail="";
		emailFail = "<p class='emailFailc'>* 이메일을 입력해주세요.</p>"
		$(".emailNot").html(emailFail);
		$(".email2").focus();
		return;
	}
	if ($(".email2").val() != $(".email").val()) {
		emailFail = "<p class='emailFailc'>* 이메일을 서로다릅니다.</p>"
		$(".emailNot").html(emailFail);
		$(".email2").focus();
		return;
	}
	$("#modifyEmail").submit();
}
function phoneChange() {

	if ($(".phone").val() == "") {
		var phoneFail="";
		phoneFail = "<p class='phoneFailc'>* 전화번호를 입력해주세요.</p>"
		$(".phoneNot").html(phoneFail);
		$(".phone").focus();
		return;
	}
	if ($(".phone2").val() == "") {
		var phoneFail="";
		phoneFail = "<p class='phoneFailc'>* 전화번호를 입력해주세요.</p>"
		$(".phoneNot").html(phoneFail);
		$(".phone2").focus();
		return;
	}
	if ($(".phone2").val() != $(".phone").val()) {
		var phoneFail="";
		phoneFail = "<p class='phoneFailc'>* 전화번호가 서로 다릅니다.</p>"
		$(".phoneNot").html(phoneFail);
		$(".phone").focus();
		return;
	}
	$("#modifyPhone").submit();
}
function pwChange(){
	var pw = $('#pwjs').val();
	if ($(".userPw").val() != pw) {
		var pwFail="";
		pwFail = "<p class='pwFailc'>* 현재 비밀번호가 틀렸습니다 </p>"
		$(".pwNot").html(pwFail);
		$(".userPw").focus();
		return;
	}
	if ($(".pw").val() == "") {
		var pwFail="";
		pwFail = "<p class='pwFailc'>* 비밀번호를 입력해주세요.</p>"
		$(".pwNot").html(pwFail);
		$(".pw2").focus();
		return;
	}
	if ($(".pw2").val() == "") {
		var pwFail="";
		pwFail = "<p class='pwFailc'>* 비밀번호를 입력해주세요.</p>"
		$(".pwNot").html(pwFail);
		$(".pw2").focus();
		return;
	}
	if ($(".pw2").val() != $(".pw").val()) {
		var pwFail="";
		pwFail = "<p class='pwFailc'>* 새 비밀번호가 서로다릅니다.</p>"
		$(".pwNot").html(pwFail);
		$(".pw2").focus();
		return;
	}
	$("#modifyPw").submit();
}


function isModalOn() {
    return modal.style.display === "flex"
}

function modalOff() {
    modal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

function changeClick(inputID, value) {
    modalOn(inputID, value)
}
const closeBtn = modal.querySelector(".cancelWrap");
closeBtn.addEventListener("click", e => {
    modalOff()
})

function cancellButton(){
    modalOff()
}

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
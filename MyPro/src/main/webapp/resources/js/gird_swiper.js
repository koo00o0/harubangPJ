var swiper = new Swiper(".swiper-container", {
    slidesPerView: 4,
    slidesPerGroup : 4,
    slidesPerColumn: 3,
    grid: {
        rows: 3,
    },
    spaceBetween: 30,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
});


$(".menuWrap ul li").on("click", function(){
var filter = $(this).html().toLowerCase();
if(filter == "전체보기"){
    filter = "all";
}else if(filter == "여행지"){
    filter = "travel";
}else if(filter == "맛집"){
    filter = "food";
}else if(filter == "숙소"){
    filter = "hotel";
}
$(".menuWrap ul li")
$(".menuWrap ul li").removeClass("active");
$(this).addClass("active");

if(filter=="all"){
    $("[data-filter]").removeClass("non-swiper-slide").addClass("swiper-slide").attr("style", null).show();
swiper.destroy();
swiper = new Swiper(".swiper-container", {
    slidesPerView: 4,
    slidesPerGroup : 4,
    slidesPerColumn: 3,
    spaceBetween: 30,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
});
}
else {
    $(".swiper-slide").not("[data-filter='"+filter+"']").addClass("non-swiper-slide").removeClass("swiper-slide").hide();
    $("[data-filter='"+filter+"']").removeClass("non-swiper-slide").addClass("swiper-slide").attr("style", null).show();
    swiper.destroy();
    swiper = new Swiper(".swiper-container", {
        slidesPerView: 4,
        slidesPerGroup : 4,
        slidesPerColumn: 3,
        spaceBetween: 30,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
}
})
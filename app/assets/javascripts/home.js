// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $(".matching-clothing-box").hover(function(){
        $(this).find("div img").fadeOut(300);
    }, function(){
        $(this).find("div img").fadeIn(300);
    })
});

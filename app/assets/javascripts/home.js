// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $(".index-clothes-box").hover(function(){
        $(this).find("div img.main-image").fadeOut(300);
    }, function(){
        $(this).find("div img.main-image").fadeIn(300);
    });

    $('.want-it').click(function(){
        var wanted_clothes_id = $(this).context.value;
        if ($(this).context.checked) {
            $.post("/user_wanted_clothes",
              { wanted_clothes_id: wanted_clothes_id})
        }else {
            $.ajax({
                method: "DELETE",
                url: "/user_wanted_clothes/" + wanted_clothes_id,
                data:  { wanted_clothes_id: wanted_clothes_id }
            })
        }
    });

    var wanted_clothes_boxes = $('.index-clothes-box');
    $.each(wanted_clothes_boxes, function(index, wanted_clothes_box){
        var value = $(".want-it", wanted_clothes_box)[0];
        var wanted_clothes_id = value.value;
        $.get("/user_wanted_clothes/" + wanted_clothes_id,
          function(data){
              if (data["wanted"] === true){
                  $(value).prop('checked', true);
              }else{
                  $(value).prop('checked', false)
              }
          })
    });
});

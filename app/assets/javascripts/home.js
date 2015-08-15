// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $(".matching-clothing-box").hover(function(){
        $(this).find("div img.main-image").fadeOut(300);
    }, function(){
        $(this).find("div img.main-image").fadeIn(300);
    });


    $('ul.list-group input').click(function(){
        var wanted_clothing_id = $(this).context.value;
        var user_clothing_id =$(this).context.dataset.userClothingId;
        if ($(this).context.checked) {
            $.post("/clothings/" + user_clothing_id + "/clothing_wanted_clothings",
              { wanted_clothing_id: wanted_clothing_id})
        }else {
            $.ajax({
                method: "DELETE",
                url: "/clothings/" + user_clothing_id + "/clothing_wanted_clothings",
                data:  { wanted_clothing_id: wanted_clothing_id }
            })
        }
    });


    var wanted_clothing_boxes = $('.matching-clothing-box');
    $.each(wanted_clothing_boxes, function(index, wanted_clothing_box){
        var value = $("input", wanted_clothing_box)[0];
        var wanted_clothing_id = value.value;
        var user_clothing_id = value.dataset.userClothingId;
        $.get("/clothings/" + user_clothing_id + "/clothing_wanted_clothings",
          { wanted_clothing_id: wanted_clothing_id},
          function(data){
              if (data["result"] === true){
                  $(value).prop('checked', true);
                  if (data["match"] === true) {
                      var img = $("img.match", wanted_clothing_box).removeClass("hidden-img");
                  }
              }else{
                  $(value).prop('checked', false)
              }
          })
    });
});

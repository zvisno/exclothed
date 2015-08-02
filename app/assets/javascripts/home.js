// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $(".matching-clothing-box").hover(function(){
        $(this).find("div img").fadeOut(300);
    }, function(){
        $(this).find("div img").fadeIn(300);
    });
//  like some clothing by enabling a checkbox
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
//  render liked or not liked clothing
    var wanted_clothings = $('ul.list-group input');
    $.each(wanted_clothings, function(index, value){
        var wanted_clothing_id = value.value;
        var user_clothing_id = value.dataset.userClothingId;
        $.get("/clothings/" + user_clothing_id + "/clothing_wanted_clothings",
          { wanted_clothing_id: wanted_clothing_id},
          function(data, status){
              if (data["result"] === true){
                  $(value).prop('checked', true)
              }else{
                  $(value).prop('checked', false)
              }
          })
    })
});

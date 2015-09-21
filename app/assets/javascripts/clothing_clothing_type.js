$(document).ready(function(){
    $('.exchange-it').click(function(){
        var exchangeable_clothes_id = $(this).context.value;
        var user_clothes_id =$(this).context.dataset.userClothesId;
        if ($(this).context.checked) {
            $.post("/clothings/" + user_clothes_id + "/clothing_wanted_clothings",
              { wanted_clothing_id: exchangeable_clothes_id })
        }else {
            $.ajax({
                method: "DELETE",
                  url: "/clothings/" + user_clothes_id + "/clothing_wanted_clothings",
                  data:  { wanted_clothes_id: exchangeable_clothes_id }
            })
        }
    });

    var exchangeable_clothes_boxes = $('.exchangeable-clothes-container');
    $.each(exchangeable_clothes_boxes, function(index, exchangeable_clothes_box){
        var value = $(".exchange-it", exchangeable_clothes_box)[0];
        var exchangeable_clothes_id = value.value;
        var user_clothes_id = value.dataset.userClothesId;
        $.get("/clothings/" + user_clothes_id + "/clothing_wanted_clothings",
          { wanted_clothing_id: exchangeable_clothes_id },
          function(data){
              if (data["result"] === true){
                  $(value).prop('checked', true);
              }else{
                  $(value).prop('checked', false)
              }
          })
    });
});
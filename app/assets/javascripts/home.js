// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $('.item').click(function(){
      var clothing_id = $(this).attr('id');
//      console.log("beg");
////      $.get("/clothings/" + clothing_id +"/clothing_clothing_types", function(){
          $("#column").prepend("<%=j render 'clothing_clothing_types/show' %>");
      });
//  })
});

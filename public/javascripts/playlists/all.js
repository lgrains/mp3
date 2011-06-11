$(document).ready(function(){

  $("#artist").css("display","none");
  $("#min_rating").css("display","none");
  $("#artist_name").attr('checked', false)
  $("#minimum_rating").attr('checked', false)

  $("#artist_name").click(function(){
    if ($("#artist_name").is(":checked")){
      $("#artist").show("fast");
    }else{
      $("#artist").hide("fast");
    }
    });

  $("#minimum_rating").click(function(){
    if ($("#minimum_rating").is(":checked")){
      $("#min_rating").show("fast");
    }else{
      $("#min_rating").hide("fast");
    }
  });



});


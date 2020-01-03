$(document).on('turbolinks:load', function() {
  $('#profile-image-container').mouseover(function(){
    $("#control-container").css('display', 'inline')
  });

  $('#profile-image-container').mouseleave(function(){
    $("#control-container").css('display', 'none')
  })
});

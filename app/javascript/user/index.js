
$(document).on('turbolinks:load', function() {
  $('#login').click(function(){
    $("#register_form").css('display', 'none');
    $("#login_form").css('display', 'inline')
  })

  $("#register").click(function(){
    $("#register_form").css('display', 'inline');
    $("#login_form").css('display', 'none')
   });
});

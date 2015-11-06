$(document).ready(function() {
  $('.form__input').focus(function(event) {
    event.preventDefault;
    $('.form__input').removeClass('incorectName');
    $('.form__incorrect-div').hide('slow');
  });
});
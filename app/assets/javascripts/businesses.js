$(document).on('turbolinks:load',function(){

$('form').on('click', '.remove_fields', function(event) {
  $(this).closest('.input-field').remove();
  return event.preventDefault();
});

$('form').on('click', '.add_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});

});

$(function() {
  $('.add').bind('click', function(e) {
    e.preventDefault();
    var skill         = $('#skill').val();
    var current_user  = "<%= current_user.id %>";
    $.post('<%= skills_path %>', { 'skill[skill]': skill, 'current_user': current_user }, function(json) {
      if (json.status == 'success') {
        $('ul.categories').append('<li>' + skill + ' ' + json.destroy_link + '</li>');
        $('#skill').val('');
      }
    }, "json");
  });

  $('.delete').live('ajax:success', function(e) {
    if ($(this).hasClass('work')) {
     $(this).prev('ul').remove();
     $(this).remove();
    } else {
      $(this).closest('li').remove();
    }
  });
});

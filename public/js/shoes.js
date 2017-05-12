$(document).ready(function() {
  $(".delete").click(function() {
    var id = $(this).attr('id');
    httpRequest = new XMLHttpRequest();
    httpRequest.open('DELETE', '/recipes/' + id, true);
    httpRequest.send();
    $(this).parent().remove();
    $(this).remove();
  });

  $(".remove").click(function() {
    var instruction_id = $(this).attr('id');
    var ingredient_id = $(this).attr('alt');
    httpRequest = new XMLHttpRequest();
    httpRequest.open('DELETE', '/recipes/' + instruction_id + '/remove_from_instruction/' + ingredient_id);
    httpRequest.send();
    $(this).parent().remove();
    $(this).remove();
  });
});

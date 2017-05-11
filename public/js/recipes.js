$(document).ready(function() {
  $(".delete").click(function() {
    var id = $(this).attr('id');
    httpRequest = new XMLHttpRequest();
    httpRequest.open('DELETE', '/recipes/' + id, true);
    httpRequest.send();
    $(this).parent().remove();
    $(this).remove();
  });
});

//$(window).load(function() {
$(window).on('load',function(){
  $("#overlay").show();
  $("#myModal").modal('show');
});

document.getElementsByClassName("modal-link").onclick = function () {
         location.reload();
    };


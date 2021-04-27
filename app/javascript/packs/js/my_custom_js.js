$(document).ready(function(){
  $(".new-article-btn").click(function(){
    $("#show-articles").hide(1000);
    $("#new-article-form-div").show(1000);
  });
  $(document).on("mouseenter", ".edit-article", function(){

    $(this).css("cursor", "pointer");
    $(this).css("text-decoration", "underline");
  });
  $(document).on("mouseleave", ".edit-article", function(){
    $(this).css("cursor", "default");
    $(this).css("text-decoration", "none");
  });
  $(document).on("click", ".edit-article", function(){
    var id = this.id;
    $("#show-articles").hide(1000);
    $(".update-article-form-div").show(1000);
    var data_row =  $(this).closest("tr");
    $(".update-article-form-div form #title").val(data_row[0].cells[1].innerText);
    $(".update-article-form-div form #description").val(data_row[0].cells[2].innerText);
    $("#update-article-form").attr('action', "/articles/"+id ); 
  });
  $(".forget_email_mail_form").submit(function(){
    $('#exampleModal').modal('hide');
  });  
});
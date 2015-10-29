jQuery(function() {
  
  return $('#forum_category').change(function() {
    var contents = $('#forum_content_id').html();
    var category, options;
    category = $('#forum_category :selected').text();
    options = $(contents).filter("optgroup[label=\'" + category.trim() + "\']").html();
    if (options) {
      return $('#forum_content_id').html(options);
    } else {
      return $('#forum_content_id').empty();
    }
  });
});

jQuery(function() {
  var contenido;
  var commenting = false;

  var height = $('.forum-comments').height();
  $('.forum-comments').scrollTop(height);

  $('.edit-comment').click(function(){
    if (!commenting){
      commenting = true;
      well = $(this).parent()
      content = well.children("p");
      id = well.attr("data-filter");
      var width = content.css("width");
      var comment = $("<textarea id='edit-comment-text' class='form-control' autofocus>"+content.text()+"</textarea>").keypress(function(e){
        var key = e.which;
        if (key == 13){
          edit_val = $(this).val();

          $.ajax({
            url: '/comments/' + id,
            type: 'PUT',
            data: {content: edit_val},
            success: function(data){
              well.children('textarea').replaceWith("<p class='comment-content'>" + edit_val + "</p>");
              $('.forum-comments').append(well);
              commenting = false;
            }
          });
        }
      });
      content.replaceWith(comment);
      $('#edit-comment-text').css('width', width).css('background-color', 'transparent');
    } else {
      well.children('textarea').replaceWith("<p class='comment-content'>" + content.text() + "</p>");
      commenting = false;
    }
  });


});
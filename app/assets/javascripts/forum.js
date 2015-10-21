jQuery(function() {
  var contents;
  contents = $('#forum_content_id').html();
  return $('#forum_category').change(function() {
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
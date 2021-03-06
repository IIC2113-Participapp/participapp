(function ($) {
  // custom css expression for a case-insensitive contains()
  jQuery.expr[':'].Contains = function(a, i, m){
    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
  };

  function listFilter(list) {
    $('#search-bar')
      .change(function () {
        var filter = $(this).val();
        if(filter) {
          $(list).find("a:not(:Contains(" + filter + "))").parent().slideUp();
          $(list).find("a:Contains(" + filter + ")").parent().slideDown();
        } else {
          $(list).find("li").slideDown();
        }
        return false;
      })
    .keyup( function () {
      $(this).change();
    });
  }

  function tableFilter(table) {
    $('#search-bar')
      .change(function () {
        var filter = $(this).val();
        if(filter) {
          $(table).find("td:not(:Contains(" + filter + "))").parent().hide();
          $(table).find("td:Contains(" + filter + ")").parent().show();
        } else {
          $(table).find("tr").show();
        }
        return false;
      })
    .keyup( function () {
      $(this).change();
    });
  }

  $(function () {
    listFilter($(".search-list"));
    tableFilter($(".search-table"));
  });
}(jQuery));

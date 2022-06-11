$('.tab-contents .tab[id != "tab1"]').hide();

$('.tab-menu a').on('click', function(event) {
  $(".tab-contents .tab").hide();
  $(".tab-menu #active").removeAttr("id", "active");
  $(this).attr("id", "active");
  $($(this).attr("href")).show();
  event.preventDefault();
});
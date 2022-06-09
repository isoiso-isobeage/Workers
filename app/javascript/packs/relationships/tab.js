$('.tab-content .tab[id != "tab1"]').hide();

$('.tab-menu a').on('click', function(event) {
  $(".tab-content .tab").hide();
  $(".tab-menu #active").removeAttr("id", "active");
  $(this).attr("id", "active");
  $($(this).attr("href")).show();
  event.preventDefault();
});
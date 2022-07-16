// $(document).ready(function() {
//   $.when(
//     $('p').hide().slideDown(2000)
//   ).done(function() {
// 	$('h1').hide().fadeIn(6000);
// });

// })

$(function() {
	$.when(
		// 先に実行したい処理
		$('h1').hide(),
		$('.welcome').hide().slideDown(2000)
	).done(function() {
		// 後に実行したい処理
		$('h1').fadeIn(3000)
	});
});

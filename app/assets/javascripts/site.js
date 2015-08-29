$(document).on('ready page:load', function () {
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
	  $('body').fontFlex(14, 20, 70);
	$('.rated').raty({ path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	})
});
    $(':password').pwstrength();

// событие которое свварачивает и разворачивает меню на маленьких экранах
$('.responsive-button').on('click', function() {
	$('.standart-menu-block').slideToggle(300, function () {
		if ($(this).css('display') === 'none')
			$(this).removeAttr('style')
	});
});

$('.slide-menu-btn').on('click', function () {
	$(this).parent().find('.mobile-menu-block').slideToggle(300);
});

$('.additional-slider .prev-btn').on('click', function () {

	let nowSlide = $(this).parents('.slider-wrap').find('.active-slide').data('slide-number');
	let slideCount = $(this).parents('.slider-wrap').find('.slide-block').children().length - 1;
 	
 	let prevSlide = 0;

	if (nowSlide == 0) {
		prevSlide = slideCount;
	} else {
		prevSlide = nowSlide - 1;
	} 

	let slideArray = $(this).parents('.slider-wrap').find('.slide');
	$(slideArray).removeClass('active-slide');


	$.each(slideArray, function(index, value) {
		if ($(this).data('slide-number') == prevSlide) {
			$(this).addClass('active-slide');
		}	
	});	

	let thumbnailArray = $(this).parents('.additional-slider').find('.thumbnail-slide');
	$(thumbnailArray).removeClass('active-thumbnail');

	$.each(thumbnailArray, function(index, value) {
		if ($(this).data('thumbnail-number') == prevSlide) {
			$(this).addClass('active-thumbnail');
		}	
	});	
});

$('.additional-slider .next-btn').on('click', function () {

	let nowSlide = $(this).parents('.slider-wrap').find('.active-slide').data('slide-number');
	let slideCount = $(this).parents('.slider-wrap').find('.slide-block').children().length - 1;
 	
 	let nextSlide = 0;

	if (nowSlide == slideCount) {
		nextSlide = 0;
	} else {
		nextSlide = nowSlide + 1;
	} 

	let slideArray = $(this).parents('.slider-wrap').find('.slide');
	$(slideArray).removeClass('active-slide');


	$.each(slideArray, function(index, value) {
		if ($(this).data('slide-number') == nextSlide) {
			$(this).addClass('active-slide');
		}	
	});	

	let thumbnailArray = $(this).parents('.additional-slider').find('.thumbnail-slide');
	$(thumbnailArray).removeClass('active-thumbnail');

	$.each(thumbnailArray, function(index, value) {
		if ($(this).data('thumbnail-number') == nextSlide) {
			$(this).addClass('active-thumbnail');
		}	
	});	
});


$('.additional-slider .thumbnail-slide').on('click', function () {

	let slideNumber = $(this).data('thumbnail-number');

	let slideArray = $(this).parents('.additional-slider').find('.slide');
	$(slideArray).removeClass('active-slide');

	$.each(slideArray, function(index, value) {
		if ($(this).data('slide-number') == slideNumber) {
			$(this).addClass('active-slide');
		}	
	});	

	let thumbnailArray = $(this).parents('.additional-slider').find('.thumbnail-slide');
	$(thumbnailArray).removeClass('active-thumbnail');

	$.each(thumbnailArray, function(index, value) {
		if ($(this).data('thumbnail-number') == slideNumber) {
			$(this).addClass('active-thumbnail');
		}	
	});	

})

$('.additional-image .thumbnail-slide').on('click', function () {
	$('.additional-slider').css('display', 'block');

	$('body').css('overflow', 'hidden');

	let nowSlide = $(this).data('thumbnail-number');

	let slideArray = $(this).parents('.body-publication-block').find('.additional-slider').find('.slide');
	$(slideArray).removeClass('active-slide');

	$.each(slideArray, function(index, value) {
		if ($(this).data('slide-number') == nowSlide) {
			$(this).addClass('active-slide');
		};	
	});	

	let thumbnailArray = $(this).parents('.body-publication-block').find('.additional-slider').find('.thumbnail-slide');
	$(thumbnailArray).removeClass('active-thumbnail');

	$.each(thumbnailArray, function(index, value) {
		if ($(this).data('thumbnail-number') == nowSlide) {
			$(this).addClass('active-thumbnail');
		};	
	});	

});

$('.additional-slider .exit-btn').on('click', function () {
	$('.additional-slider').css('display', 'none');

	$('body').css('overflow', 'auto');
});
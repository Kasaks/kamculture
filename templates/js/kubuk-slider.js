// global variable
let startPoint;
let finalPoint;

// slider methods
let kubukSlider = {

	prevSlide: function() {
		let slideNow = $(this).parents('.viewport').find('.active-slide').data('slide-number');
		$(this).parents('.viewport').find('.active-slide').removeClass('active-slide');		

		let slidePrev = slideNow - 1;
		let slideCount = $(this).parents('.viewport').find('.slide-block').children().length;

		if (slidePrev < 0) {
			slidePrev = slideCount-1;
		}

		let slideArray = $(this).parents('.viewport').find('.slide');

		$.each(slideArray, function(index, value) {
			if ($(this).data('slide-number') == slidePrev) {
				$(this).addClass('active-slide');
			}
		})

		let circleBtnArray = $(this).parents('.viewport').find('.circle-btn');
		$(circleBtnArray).removeClass('active-circle-btn');

		$.each(circleBtnArray, function(index, value) {
			if ($(this).data('slide-to-number') == slidePrev) {
				$(this).addClass('active-circle-btn');
			}
		})
	},

	nextSlide: function() {
		let slideNow = $(this).parents('.viewport').find('.active-slide').data('slide-number');
		$(this).parent().parent().find('.active-slide').removeClass('active-slide');
		
		let slideNext = slideNow + 1;
		let slideCount = $(this).parents('.viewport').find('.slide-block').children().length;

		if (slideNext > slideCount-1) {
			slideNext = 0;
		}

		let slideArray = $(this).parents('.viewport').find('.slide');

		$.each(slideArray, function(index, value) {
			if ($(this).data('slide-number') == slideNext) {
				$(this).addClass('active-slide');
			}
		})

		let circleBtnArray = $(this).parents('.viewport').find('.circle-btn');
		$(circleBtnArray).removeClass('active-circle-btn');

		$.each(circleBtnArray, function(index, value) {
			if ($(this).data('slide-to-number') == slideNext) {
				$(this).addClass('active-circle-btn');
			}
		})
	},

	toSlide: function() {
		$(this).parents('.viewport').find('.active-slide').removeClass('active-slide');

		let slideTo = $(this).data('slide-to-number');

		let slideArray = $(this).parents('.viewport').find('.slide');

		$.each(slideArray, function(index, value) {
			if ($(this).data('slide-number') == slideTo) {
				$(this).addClass('active-slide');
			}
		})

		$(this).parent().find('.circle-btn').removeClass('active-circle-btn');
		$(this).addClass('active-circle-btn')
	},

	saveStartPoint: function(e) {
		e.preventDefault();
		e.stopPropagation();
		startPoint = e.changedTouches[0].pageX;
	},

	initSwipe: function(e) {
		e.preventDefault();
		e.stopPropagation();
		finalPoint = e.changedTouches[0].pageX;
		let slideNow = $(this).find('.active-slide').data('slide-number');	
		let slideArray = $(this).find('.slide');

		var xABS = Math.abs(startPoint - finalPoint);
		if (xABS > 100) {
			if (startPoint < finalPoint) {
				// свайп влево
				let slidePrev = slideNow - 1;
				let slideCount = $(this).find('.slide-block').children().length;
				$(slideArray).removeClass('active-slide')

				if (slidePrev < 0) {
					slidePrev = slideCount-1;
				}

				$.each(slideArray, function(index, value) {
					if ($(this).data('slide-number') == slidePrev) {
						$(this).addClass('active-slide');
					}
				})

				let circleBtnArray = $(this).find('.circle-btn');
				$(circleBtnArray).removeClass('active-circle-btn');

				$.each(circleBtnArray, function(index, value) {
					if ($(this).data('slide-to-number') == slidePrev) {
						$(this).addClass('active-circle-btn');
					}
				})
			} else {
				// свайп вправо
				let slideNext = slideNow + 1;
				let slideCount = $(this).find('.slide-block').children().length;
				$(slideArray).removeClass('active-slide')

				if (slideNext > slideCount-1) {
					slideNext = 0;
				}
				// console.log(slideNext)

				$.each(slideArray, function(index, value) {
					if ($(this).data('slide-number') == slideNext) {
						$(this).addClass('active-slide');
					}
				})

				let circleBtnArray = $(this).find('.circle-btn');
				$(circleBtnArray).removeClass('active-circle-btn');

				$.each(circleBtnArray, function(index, value) {
					if ($(this).data('slide-to-number') == slideNext) {
						$(this).addClass('active-circle-btn');
					}
				})
			}
		}
	}
}

// initialization event
$('.slider-section .prev-btn').on('click', kubukSlider.prevSlide);
$('.slider-section .next-btn').on('click', kubukSlider.nextSlide);
$('.slider-section .circle-btn').on('click', kubukSlider.toSlide);
$('.slider-section .viewport').on('touchstart', kubukSlider.saveStartPoint);
$('.slider-section .viewport').on('touchend', kubukSlider.initSwipe);
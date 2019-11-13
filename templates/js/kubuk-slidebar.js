// global variable
let slideCount = $('.slidebar-section .slides-block').children().length / $('.slidebar-section .conteiner').children().length; // общее число слайдов
let viewCount; // число слайдов видимых в окне viewport
// let startPoint;
// let finalPoint;

let kubukSlidebar = {

	rightTo: function() {
		let widthSlide = $(this).parents('.viewport').find('.slide').width();
		let slideNow = $(this).parents('.viewport').find('.slides-block').data('slide-now');
		if (viewCount == false) { // если переменная неопределена запрашиваем ее через функцию
			viewCount = kubukSlidebar.checkViewCount();
		}
		
		slideNow++;

		if (slideNow > (slideCount-viewCount)) { // если показан последний возможный слайд перемещаем лонту в начало
			slideNow = 0;
		}

		$(this).parents('.viewport').find('.slides-block').data('slide-now', slideNow);

		let transformWidth = -(slideNow * widthSlide);

		$(this).parents('.viewport').find('.slides-block').css({'transform': 'translate(' + transformWidth + 'px, 0)'});	
	},

	leftTo: function() {
		let widthSlide = $(this).parents('.viewport').find('.slide').width();
		let slideNow = $(this).parents('.viewport').find('.slides-block').data('slide-now');
		if (viewCount == false) { // если переменная неопределена запрашиваем ее через функцию
			viewCount = kubukSlidebar.checkViewCount();
		}

		slideNow--;

		if (slideNow < 0) { // если показан последний возможный слайд перемещаем лонту в начало
			slideNow = (slideCount-viewCount);
		}

		$(this).parents('.viewport').find('.slides-block').data('slide-now', slideNow);

		let transformWidth = -(slideNow * widthSlide);

		$(this).parents('.viewport').find('.slides-block').css({'transform': 'translate(' + transformWidth + 'px, 0)'});
	},

	autoWidth: function() {
		let widthViewport = $('.slidebar-section .viewport').width();

		viewCount = kubukSlidebar.checkViewCount();
		$('.slidebar-section .slides-block').css({'transform': 'translate(0 , 0)'});
		$('.slidebar-section .slides-block').data('slide-now', 0);
		let widthSlide = Math.ceil(widthViewport / viewCount);;
		let heightSlide = Math.floor(widthSlide / 1.33);

		$('.slidebar-section .viewport').height(heightSlide);
		$('.slidebar-section .viewport .slides-block').width(widthSlide*6);
	},

	checkViewCount: function() {
		let widthViewport = $('.slidebar-section .viewport').width();

		if (widthViewport > 0 && widthViewport <= 425) {
			viewCount = 1;
		}

		if (widthViewport > 425 && widthViewport <= 1024) {
			viewCount = 2;
		}

		if (widthViewport > 1024 && widthViewport <= 1440) {
			viewCount = 3;
		}

		if (widthViewport > 1440 && widthViewport <= 1920) {
			viewCount = 4;
		}

		return viewCount
	},

	saveStartPoint: function(e) {
		startPoint = e.changedTouches[0].pageX;
	},

	initSwipe: function(e) {
		finalPoint = e.changedTouches[0].pageX;

		let xABS = Math.abs(startPoint - finalPoint);
		if (xABS > 100) {
			if (startPoint < finalPoint) {
				// свайп влево
				let widthSlide = $(this).find('.slide').width();
				let slideNow = $(this).find('.slides-block').data('slide-now');
				if (viewCount == false) { // если переменная неопределена запрашиваем ее через функцию
					viewCount = kubukSlidebar.checkViewCount();
				}

				slideNow--;

				if (slideNow < 0) { // если показан последний возможный слайд перемещаем лонту в начало
					slideNow = (slideCount-viewCount);
				}

				$(this).find('.slides-block').data('slide-now', slideNow);

				let transformWidth = -(slideNow * widthSlide);

				$(this).find('.slides-block').css({'transform': 'translate(' + transformWidth + 'px, 0)'});
			} else {
				// свайп вправо
				let widthSlide = $(this).find('.slide').width();
				let slideNow = $(this).find('.slides-block').data('slide-now');
				if (viewCount == false) { // если переменная неопределена запрашиваем ее через функцию
					viewCount = kubukSlidebar.checkViewCount();
				}
				
				slideNow++;

				if (slideNow > (slideCount-viewCount)) { // если показан последний возможный слайд перемещаем лонту в начало
					slideNow = 0;
				}

				$(this).find('.slides-block').data('slide-now', slideNow);

				let transformWidth = -(slideNow * widthSlide);

				$(this).find('.slides-block').css({'transform': 'translate(' + transformWidth + 'px, 0)'});
			}
		}
	}
};
// initialization events
$(window).ready(kubukSlidebar.autoWidth);
$(window).on('resize', kubukSlidebar.autoWidth);
$('.slidebar-section .prev-btn').on('click', kubukSlidebar.leftTo);
$('.slidebar-section .next-btn').on('click', kubukSlidebar.rightTo);
$('.slidebar-section .viewport').on('touchstart', kubukSlidebar.saveStartPoint);
$('.slidebar-section .viewport').on('touchend', kubukSlidebar.initSwipe);
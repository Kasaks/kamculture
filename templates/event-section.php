<?php 
	$translit_title = Secondary_functions::translit_text($result['publication_title']);

	if (isset($result['event_date_start']))  {
		$dt_explode = explode(' ',$result['event_date_start']);

		list($year, $month, $day) = explode('-', $dt_explode[0]);
		list($hour, $minute, $second) = explode(':', $dt_explode[1]);

		$month = Secondary_functions::transormations_month($month);

		$event_date_start = $day.' '.$month.' '.$year.' '.$hour.':'.$minute;
	} else {
		$prefix = '';$year = '';$month = '';$day = '';$hour = ''; $minute = ''; $second = '';
	};

	if (isset($result['event_date_end']))  {
		$dt_explode = explode(' ',$result['event_date_end']);

		list($year, $month, $day) = explode('-', $dt_explode[0]);
		list($hour, $minute, $second) = explode(':', $dt_explode[1]);

		$month = Secondary_functions::transormations_month($month);

		$event_date_end = $day.' '.$month.' '.$year.' '.$hour.':'.$minute;
	} else {
		$prefix = '';$year = '';$month = '';$day = '';$hour = ''; $minute = ''; $second = '';
	};

	if ($result['event_cost'] == '0') {
		$result['event_cost'] = 'Бесплатно';
	};
?>

<section class="indent event-section">
		<div class="tab">
			<div class="publication-conteiner">
				<div class="head-event-section row flex-wrap">
					<div class="thumbnail-event responsive-card-2f"><img src="/images/<?=$result['publication_image']?>.jpg" alt="<?=$translit_title?>"></div>
					<div class="info-event responsive-card-2g">
						<div class="event-title"><h1><?=$result['publication_title']?></h1></div>
						<div class="line row flex-wrap vert-center">
							<div class="event-info event-category"><a href=""><i class="fas fa-archive"></i>  <?=$result['event_category']?></a></div>
							
							<div class="event-info event-date-start-end"><i class="far fa-calendar-alt"></i>  С <?=$event_date_start?> По <?=$event_date_end?></div>
						</div>
						<div class="line row vert-center flex-wrap">
							<div class="event-info event-geofence"><a href="#"><i class="fas fa-map-pin"></i>  <?=$result['geofence']?> автономный округ</a></div>
							<div class="event-info event-location"><a href="#"><i class="far fa-building"></i>  <?=$result['location']?></a></div>
						</div>
						<div class="line row vert-center flex-wrap">
							<div class="event-info event-age-limit age-limit age-limit-<?=$result['event_age_limit']?>"><?=$result['event_age_limit']?> +</div>
							<div class="event-info event-cost"><i class="fas fa-coins"></i>  <?=$result['event_cost']?></div>
						</div>
						
					</div>
				</div>
				<div class="body-event-section">
					<?=$result['event_text']?>
				</div>
				<div class="footer-event-section">
					<div class="event-contacts row flex-wrap">
						<div class="info-block responsive-card-2">
							<div class="title-info">Организатор мероприятия</div>
							<div class="organizer-name information"><a href="#"><i class="fas fa-user-tie"></i> <?=$result['organizer']?></a></div>
							<?php if ($result['organizer_phone'] != '') { ?>
								<div class="organizer-phone information"><i class="fas fa-phone"></i> <?=$result['organizer_phone']?></div>
							<?php
							}?>
							
						</div>
						
						<!-- Чиню организаторов для событий и вывожу сюда всю контактную инфу о организаторе -->
						<div class="info-block responsive-card-2">
							<div class="title-info">Место проведения мероприятия</div>
							<div class="location-name information"><a href="#"><i class="far fa-building"></i> <?=$result['location']?></a></div>
							<div class="location-phone information"><i class="fas fa-phone"></i> <?=$result['location_phone']?></div>
							<div class="location_address information"><i class="fas fa-map-marked-alt"></i> <?=$result['location_address']?></div>
							<div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d9596.839491548051!2d158.67390445!3d53.03456535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sru!2sru!4v1555310048993!5m2!1sru!2sru" width="800" height="600" frameborder="0" style="border:0" allowfullscreen></iframe></div>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
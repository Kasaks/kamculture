<?php




?>
<section class="indent publication-section">
	<div class="tab">
		<div class="publication-conteiner">
			<div class="head-publication-block line-block row flex-wrap">

				<div class="thumbnail responsive-card-2f">
					<img src="/images/<?=$result['publication']['id']?>/<?=$result['publication']['image'][0]?>.jpg" alt="<?=$result['publication']['title']?>">
				</div>
				
				<div class="main-info responsive-card-2g">
					<div class="main-title publication-title"><h3><?=$result['publication']['title']?></h3></div>
					<?php if ($publication_type_en == 'event') { ?>
						<div class="line row responsive-card-1">
							<div class="info"><a href="/<?=$publication_type_en?>/<?=$result['publication']['category_en']?>"><i class="fas fa-archive"></i> <?=$result['publication']['category']?></a></div>
							<div class="info"><i class="fas fa-user-alt"></i> <?=$result['event']['age_limit']?> +</div>
						</div>
						<div class="line row responsive-card-1">
							<div class="info"><i class="fas fa-map-pin"></i> <?=$result['event']['geofence']?></div>
						</div>
						<div class="line row responsive-card-1">
							<div class="info"><i class="fas fa-address-card"></i> <?=$result['event']['target_audience']?></div>
							<div class="info"><i class="fas fa-ticket-alt"></i> <?=$result['event']['visit_mode']?></div>
						</div>
						<div class="line row responsive-card-1">
							<div class="info"><a href="/organizations/<?=$result['event']['organizer_array']['organizer_id']?>"><i class="fas fa-user-tie"></i> <?=$result['event']['organizer_array']['organizer']?></a></div>
						</div>
						<div class="line row responsive-card-1">
							<div class="info"><a href="/organizations/<?=$result['event']['location_array']['location_id']?>"><i class="fas fa-building"></i> <?=$result['event']['location_array']['location']?></a></div>
						</div>
						<?php
					}?>
					
				 	<?php if ($publication_type_en == 'articles') { ?>
				 		<div class="line row responsive-card-1">
					 		<div class="info"><i class="fas fa-pencil-alt"></i> <?=$result['article']['author']?></div>
					 		<div class="info"><i class="fas fa-camera"></i> <?=$result['article']['author_photo']?></div>
				 		</div>
				 		<?php
				 	}?>

				 	<?php if ($publication_type_en == 'news') { 
				 		$dt_explode = explode(' ',$result['publication']['date']);
				 		list($year, $month, $day) = explode('-', $dt_explode[0]);

				 		$month = Secondary_functions::transormations_month($month);
				 		?>
				 		<div class="line row responsive-card-1">
				 			<div class="info"><i class="far fa-calendar-alt"></i> <?=$day?> <?=$month?> <?=$year?></div>
				 		</div>
				 		<?php
				 	}?>

				 	<?php if ($publication_type_en == 'organizations') { ?>
				 		<div class="line row responsive-card-1">
				 			<div class="info"><i class="fas fa-building"></i> <?=$result['organization']['type']?></div>
				 			<div class="info"><i class="fas fa-user-tie"></i> <?=$result['organization']['director']?></div>
				 		</div>
				 		<div class="line row responsive-card-1">
				 			<div class="info"><i class="fas fa-building"></i> <?=$result['organization']['address']?></div>
				 		</div>
				 		<div class="line row responsive-card-1">
				 			<div class="info"><i class="fas fa-user-tie"></i> <?=$result['organization']['phone']?></div>
				 		</div>
				 		<div class="line row responsive-card-1">
				 			<div class="info"><a href="http://<?=$result['organization']['site']?>"><i class="fas fa-user-tie"></i> <?=$result['organization']['site']?></a></div>
				 		</div>
				 		<div class="line row responsive-card-1">
				 			<div class="info"><a href="mailto:<?=$result['organization']['email']?>"><i class="fas fa-user-tie"></i> <?=$result['organization']['email']?></a></div>
				 		</div>
				 		<?php
				 		}
				 	?>

				 	<?php if (!empty($result['geofence'])) { ?>
				 		<div class="line row responsive-card-1">
				 			<div class="info"><i class="fas fa-map-pin"></i> <?=$result['geofence']?></div>
				 		</div>
				 		<?php
				 	}?> 	
					
					
					<?php if ($publication_type_en == 'news' && !empty($result['news']['phone'])) { 
						$phone = str_ireplace('(', '', $result['news']['phone']);
						$phone = str_ireplace(')', '', $phone);
						$phone = str_ireplace(' ', '', $phone);
						$phone = str_ireplace('-', '', $phone);
						?>
						<div class="line row responsive-card-1">
				 			<div class="info phone"><a href="tel:<?=$phone?>"><i class="fas fa-phone"></i> <?=$result['news']['phone']?></a></div>
				 		</div>
				 		<?php
				 	}?>		
					
				</div>

			</div>
			<div class="body-publication-block">

				<div class="line-block publication-text">
					<?=$result['publication']['text']?>
				</div>

				<?php if (count($result['publication']['image']) > 1) { ?>
					<div class="additional-image">
						<div class="title">Дополнительные материалы</div>
						<div class=" line-block thumbnail-slide-block row flex-wrap">
							<?php
								$k = 0;
								foreach ($result['publication']['image'] as $slide) { ?>
									<div class="thumbnail-slide" data-thumbnail-number="<?=$k?>"><img src="/images/<?=$result['publication']['id']?>/<?=$slide?>.jpg" alt=""></div>
									<?php
									$k++;
								 } 
							?>	
						</div>	
					</div>
					
					<div class="additional-slider">
						
						<div class="exit-wrap clearfix">
							<div class="exit-btn row">
								<i class="fas fa-times"></i>
							</div>
						</div>

						<div class="slider-wrap row flex-wrap hor-center">
							
							<div class="viewport slide-show-block responsive-card-1">

								<div class="slide-block">
									<?php
										$k = 0;
										foreach ($result['publication']['image'] as $slide) {
											if ($k == 0) { ?>
												<div class="slide row vert-center hor-center active-slide" data-slide-number="<?=$k?>"><img src="/images/<?=$slide?>.jpg" alt=""></div>
												<?php
												$k++;
											} else { ?>
												<div class="slide row vert-cente hor-centerr" data-slide-number="<?=$k?>"><img src="/images/<?=$result['publication']['id']?>/<?=$slide?>.jpg" alt=""></div>
												<?php
												$k++;
										 	}
										 } 
									?>
								</div>
								
							</div>	

							<div class="button-block row">
								<div class="prev-btn row vert-center hor-center"><i class="fas fa-chevron-left"></i></div>
								<div class="next-btn row vert-center hor-center"><i class="fas fa-chevron-right"></i></div>
							</div>
						</div>
					
						<div class="thumbnail-slide-block row flex-wrap">
							
							<?php
								$k = 0;
								foreach ($result['publication']['image'] as $slide) {
									if ($k == 0) { ?>
										<div class="thumbnail-slide hor-center active-thumbnail" data-thumbnail-number="<?=$k?>"><img src="/images/<?=$result['publication']['id']?>/<?=$slide?>.jpg" alt=""></div>
										<?php
										$k++;
									} else { ?>
										<div class="thumbnail-slide hor-center" data-thumbnail-number="<?=$k?>"><img src="/images/<?=$result['publication']['id']?>/<?=$slide?>.jpg" alt=""></div>
										<?php
										$k++;
								 	}
								 } 
							?>

							<div class="thumbnail-button-block">
								<div class="scroll-left-btn row hor-center vert-center"><i class="fas fa-chevron-left"></i></div>
								<div class="scroll-right-btn row hor-center vert-center"><i class="fas fa-chevron-right"></i></div>
							</div>	
							
						</div>	


							
					</div>	
					<?php
				}?>
				
				<?php if ($publication_type_en == 'event') { ?>
					<div class="line-block row flex-wrap ">
						<div class="line responsive-card-2">
							
							<div class="title">Информация</div>
							<?php
								$date_start = explode(' ',$result['event']['date_start']);
								$date_end = explode(' ',$result['event']['date_end']);

						 		list($date['start']['year'], $date['start']['month'], $date['start']['day']) = explode('-', $date_start[0]);
						 		list($date['start']['hour'], $date['start']['minute']) = explode(':', $date_start[1]);
						 		list($date['end']['year'], $date['end']['month'], $date['end']['day']) = explode('-', $date_end[0]);
						 		list($date['end']['hour'], $date['end']['minute']) = explode(':', $date_end[1]);

						 		$date['start']['month'] = Secondary_functions::transormations_month($date['start']['month']);
						 		$date['end']['month'] = Secondary_functions::transormations_month($date['end']['month']);

						 		if ($date_start[0] == $date_end[0]) {
						 			$date_print = '<i class="far fa-calendar-alt"></i> '.$date['start']['day'].' '.$date['start']['month'];
						 			$time_print = '<i class="fas fa-clock"></i>'.$date['start']['hour'].':'.$date['start']['minute'].' - '.$date['end']['hour'].':'.$date['end']['minute'];
						 		} else if ($date_start[0] < $date_end[0]) {
						 			$date_print = '<i class="far fa-calendar-alt"></i>' . $date['start']['day'].' '.$date['start']['month'].' - '.$date['end']['day'].' '.$date['end']['month'];
						 			$time_print = '<i class="fas fa-clock"></i>'.$date['start']['hour'].':'.$date['start']['minute'].' - '.$date['end']['hour'].':'.$date['end']['minute'];
						 		}

								?>

								<div class="info"><?=$date_print?></div>
								<div class="info"><?=$time_print?></div>

								<?php if ($result['event']['cost'] > 0) { ?>
									<div class="info"><i class="fas fa-coins"></i><?=$result['event']['cost']?> &#8381</div>
									<?php
								}
							?>
						</div>
						<!-- <div class="event-map responsive-card-2">
						
						</div>	 -->
					</div>
					<div class="line-block row flex-wrap">
						<div class="responsive-card-2">
							<div class="title">Организатор мероприятия</div>
							<div class="info"><a href="/organizations/<?=$result['event']['organizer_array']['organizer_id']?>"><i class="fas fa-user-alt"></i> <?=$result['event']['organizer_array']['organizer']?></a></div>
							<div class="info"><a href="tel:<?=$result['event']['organizer_array']['phone']?>"><i class="fas fa-phone"></i> <?=$result['event']['organizer_array']['phone']?></a></div>
							<div class="info"><a href="http://<?=$result['event']['organizer_array']['site']?>"><i class="fab fa-chrome"></i> <?=$result['event']['organizer_array']['site']?></a></div>
							<div class="info"><i class="fas fa-map-marked"></i> <?=$result['event']['organizer_array']['address']?></div>
						</div>
						<div class="responsive-card-2">
							<div class="title">Место проведения мероприятия</div>
							<div class="info"><a href="/organizations/<?=$result['event']['location_array']['location_id']?>"><i class="fas fa-building"></i> <?=$result['event']['location_array']['location']?></a></div>
							<div class="info"><i class="fas fa-map-marked"></i> <?=$result['event']['location_array']['address']?></div>
							<div class="info"><a href="tel:<?=$result['event']['location_array']['phone']?>"><i class="fas fa-phone"></i> <?=$result['event']['location_array']['phone']?></a></div>
							<div class="info"><a href="http://<?=$result['event']['location_array']['site']?>"><i class="fab fa-chrome"></i> <?=$result['event']['location_array']['site']?></a></div>
						</div>
					</div>
					<?php
				}?>
				
				<?php if ($publication_type_en == 'organizations') { ?>
					<div class="line-block row flex-wrap">
						<div class="title">Режим работы</div>
						<div class="info"><?=$result['organization']['work_mode']?></div>
					</div>
					<?php 
					}
				?>
				
				<!-- <div class="event-partner line">
					
				</div>
				 -->
			</div>
			<div class="foot-publication-block">
				
			</div>
		</div>
	</div>
</section>
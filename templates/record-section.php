<?php 
	$translit_title = Secondary_functions::translit_text($result[0]['record_title']);

	if (isset($result[0]['record_date'])){
		$dt_explode = explode(' ',$result[0]['record_date']);
		list($year, $month, $day) = explode('-', $dt_explode[0]);

		$month = Secondary_functions::transormations_month($month);
	};

?>

<section class="indent record-section">
		<div class="tab">
			<div class="publication-conteiner">
				<div class="head-record-block">
					<div class="title-record"><h1><?=$result[0]['record_title']?></h1></div>
					<div class="info-record row">
						<div class="record-author"><i class="fas fa-user-alt"></i> <?=$result[0]['record_author']?></div>
						<div class="record-category"><i class="fas fa-archive"></i> <?=$result[0]['record_category']?></div>
						<div class="record-date"><i class="far fa-clock"></i> <?=$day?> <?=$month?> <?=$year?></div>
					</div>
				</div>
				<div class="body-record-block clearfix">
					<?php if (count($result[0]['publication_image']) > 1 ) { ?>
						<div class="viewport slide-show-block">
							<div class="slide-block">
								<?php
								$slide_number= 0;
								foreach ($result[0]['image_name'] as $image_name) {
									?>
										<div class="slide <?php if ($slide_number == 0) echo'active-slide';?>" data-slide-number="<?=$slide_number?>"><img src="/images/<?=$image_name?>.jpg" alt="<?=$translit_title?>"></div>
									<?php
									$slide_number++;
								}; ?>
							</div>
							<div class="button-block row vert-center">
								<div class="prev-btn"><i class="fas fa-chevron-left"></i></div>
								<div class="next-btn"><i class="fas fa-chevron-right"></i></div>
							</div>
						</div>
					<?php
					} else { ?>
						<div class="thumbnail-record"><img src="/images/<?=$result[0]['image_name'][0]?>.jpg" alt="<?=$translit_title?>"></div>
						<?php
					} ?>
					
					<?=$result[0]['record_text']?>
				</div>
				<div class="footer-record-block"></div>
			</div>
		</div>
</section>
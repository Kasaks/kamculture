			<div class="body-section-block row flex-wrap">
				<?php if (is_array($result)) {
					foreach ($result as $item) {
						$title_translit = Secondary_functions::translit_text($item['publication_title']);

						if (isset($item['event_date']))  {
							$dt_explode = explode(' ',$item['event_date']);
							$prefix = $dt_explode[0];
							list($year, $month, $day) = explode('-', $dt_explode[1]);

							$month = Secondary_functions::transormations_month($month);
						} else {
							$prefix = '';
							$year = '';
							$month = '';
							$day = '';
						};

						if (isset($item['publication_text']) == true) {
							$text = Secondary_functions::trim_text($item['publication_text']);
						}


					?>
						<div class="card responsive-card-4">

							<div class="thumbnail-card">
								<a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$title_translit?>">
									<div class="conteiner-img"><img src="/images/<?=$item['publication_id']?>/<?=$item['publication_image']?>.jpg" alt="<?=$title_translit?>"></div>
									<div class="head-card-line card-line">
										<div class="date-time">
											<p class="day"><?=$prefix?> <?=$day?></p>
											<p class="mounth"><?=$month?></p>
											<p class="year"><?=$year?></p>
										</div>	
									</div>
									<div class="body-card-line card-line">
										<p class="categories"><?=$item['event_category']?></p>
										<p class="cost"><?php if ($item['event_visit_mode'] == "Цена билета"){ echo $item['event_cost'];} else $item['event_visit_mode'];?></p>
									</div>
								</a>
							</div>
							<div class="discription-card">
								<h3 class="title"><a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$title_translit?>"><?=$item['publication_title']?></a></h3>
								<div class="discription"><?=$text?></div>
								<div class="note row">
									<i class="fas fa-map-pin"></i>
									<div class="location"><?=$item['event_geofence']?></div>
								</div>
							</div>

						</div>
					<?php
					}
				} else echo 'Нет результатов запроса';?>
				
			</div>

		</div>
	</div>
</section>

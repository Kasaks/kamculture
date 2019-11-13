		<div class="body-section-block row flex-wrap">

			<?php
			if (is_array($result)) {
				$j = 0;

				foreach ($result as $item) {

					$translit_title = Secondary_functions::translit_text($item['publication_title']);

					$dt_explode = explode(' ',$item['publication_date']);
					list($year, $month, $day) = explode('-', $dt_explode[0]);

					$month = Secondary_functions::transormations_month($month);

					if ($j == 0) { ?>
						<div class="col responsive-card-3a">
							<div class="card">
								<div class="thumbnail-card">
									<a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$translit_title?>">
										<div class="conteiner-img"><img src="/images/<?=$item['publication_id']?>/<?=$item['publication_image']?>.jpg" alt="<?=$translit_title?>"></div> 
									</a>
								</div>
								<div class="discription-card">
									<h3 class="title"><a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
									<p class="discription"><?=$item['publication_text']?></p>
									<div class="date note row">
										<p class="day"><?=$day?></p>
										<p class="mounth"><?=$month?></p>
										<p class="year"><?=$year?></p>
									</div>
								</div>
							</div>
						</div> 
					<?php
					}
					
					if ($j > 0 && $j <= 3) {
						if ($j == 1) { ?>
							<div class="col responsive-card-3">
								<div class="card">
									<div class="discription-card">
										<h3 class="title"><a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
										<p class="discription"><?=$item['publication_text']?></p>
										<div class="date note row">
											<p class="day"><?=$day?></p>
											<p class="mounth"><?=$month?></p>
											<p class="year"><?=$year?></p>
										</div>
									</div>
								</div>
						<?php
						} else { ?>
							<div class="card">
								<div class="discription-card">
									<h3 class="title"><a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
									<p class="discription"><?=$item['publication_text']?></p>
									<div class="date note row">
										<p class="day"><?=$day?></p>
										<p class="mounth"><?=$month?></p>
										<p class="year"><?=$year?></p>
									</div>
								</div>
							</div>
						<?php
						} 
						if ($j == 3) { ?>
							</div>
						<?php
						}
					} 
						
					if ($j > 3 && $j <= 6) {
						if ($j == 4) { ?>
							<div class="col responsive-card-3">
								<div class="card">
									<div class="discription-card">
										<h3 class="title"><a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
										<p class="discription"><?=$item['publication_text']?></p>
										<div class="date note row">
											<p class="day"><?=$day?></p>
											<p class="mounth"><?=$month?></p>
											<p class="year"><?=$year?></p>
										</div>
									</div>
								</div>
						<?php
						} else { ?>
							<div class="card">
								<div class="discription-card">
									<h3 class="title"><a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
									<p class="discription"><?=$item['publication_text']?></p>
									<div class="date note row">
										<p class="day"><?=$day?></p>
										<p class="mounth"><?=$month?></p>
										<p class="year"><?=$year?></p>
									</div>
								</div>
							</div>
						<?php	
						}
						if ($j == 6) { ?>
							</div>
						<?php
						} 
					}
					$j ++;
				}
			} else echo 'Нет результатов запроса';
			?>
			</div>
		</div>
	</div>	
</section>
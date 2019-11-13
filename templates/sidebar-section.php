			<section class="sidebar-section responsive-card-2b">
				<div class="head-section-block">
					<h2 class="title font-size-10">Новые публикации</h2>
				</div>
				<div class="body-section-block">
					<?php if (is_array($result)) {

						foreach ($result as $item) {

							$translit_title = Secondary_functions::translit_text($item['publication_title']);
							$section_link = $item['publication_type_en'];

							if (isset($item['publication_text']) == true) {
								$text = Secondary_functions::trim_text($item['publication_text']);
							}

							?>
							<div class="card responsive-card-2h">
								<div class="discription-card">
									<h3 class="title"><a href="/<?=$section_link?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
									<p class="discription"><?=$text?></p>
									<p class="note">
										<?php 
										if (array_key_exists('publication_note', $item) === true){
											echo $item['publication_note'];
										}			
										?>
									</p>
								</div>
							</div>
							<?php
						} 
					} else echo 'Нет результатов запроса'?>
				</div>
			</section>
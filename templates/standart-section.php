							<!-- тело секции -->
							<div class="body-section-block <?php if ($publication_type_en == 'people') echo 'people-section';?> row flex-wrap">

								<?php if (is_array($result)) {

									foreach ($result as $item) {

									$translit_title = Secondary_functions::translit_text($item['publication_title']);

									if (isset($item['publication_text']) == true) {
										$text = Secondary_functions::trim_text($item['publication_text']);
									}

									?>

									<div class="card responsive-card-4">
										<div class="thumbnail-card">
											<a href="/<?=$publication_type_en?>/<?=$item['publication_id']?>/<?=$translit_title?>"><img src="/images/<?=$item['publication_id']?>/<?=$item['publication_image']?>.jpg" alt="<?=$translit_title?>"></a>
										</div>
										<div class="discription-card">
											<h3 class="title"><a href="/<?=$publication_type_en?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
											<p class="discription">
												<?php if(isset($text)) {
													echo $text;
												} ?>
											</p>
											<p class="note">
												
											</p>
										</div>
									</div>
									<?php
									} 
								} else echo 'Нет результатов запроса';?>

							</div>

						</div>
					</div>
				</section>
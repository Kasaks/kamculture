							<div class="body-section-block row flex-wrap">
								<?php if (is_array($result)) {
								 		foreach ($result as $item)
										{	
											$dt_explode = explode(' ',$item['publication_note']);
											list($year, $month, $day) = explode('-', $dt_explode[0]);

											$month = Secondary_functions::transormations_month($month);

											$translit_title = Secondary_functions::translit_text($item['publication_title']);

											if (isset($item['publication_text']) == true) {
												$text = Secondary_functions::trim_text($item['publication_text']);
											}

											?>

											<div class="card responsive-card-4">
												<div class="thumbnail-card">
													<a href="/<?=$section_link?>/<?= $item['publication_id']?>/<?= $translit_title ?>">
														<div class="conteiner-img"><img src="/images/<?=$item['publication_id']?>/<?=$item['publication_image']?>.jpg" alt="<?=$translit_title?>"></div> 
													</a>
												</div>
												<div class="discription-card">
													<h3 class="title"><a href="/<?=$section_link?>/<?= $item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
													<?php
													if (isset($page_name) == true && $page_name == 'index'){
														echo '';
													} else { ?>
														<div class="discription">
															 <?=$text?>
														</div>
													<?php
													}?>
													<div class="date note row">
														<p class="day"><?=$day?></p>
														<p class="mounth"><?=$month?></p>
														<p class="year"><?=$year?></p>
													</div>
												</div>
											</div>
											<?php
										}
									} else echo 'Нет результатов запроса';
								?>
							</div>
						</div>
					</div>
				</section>
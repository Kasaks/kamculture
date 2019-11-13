							<!-- тело секции -->
							<div class="body-section-block organization-section row vert-center flex-wrap">
								<?php if (is_array($result)) {
									foreach ($result as $item) {

									$organization_type_translit = Secondary_functions::translit_text($item['organization_type']);

									?>
										<div class="org-card responsive-card-4">
											<a href="/<?=$section_link?>/<?=$item['organization_type_en']?>">
												<div class="gradient-background"></div>
												<div class="thumbnail-card">
													<div class="org-conteiner-img"><img src="/images/<?=$item['image']?>.jpg" alt="<?=$organization_type_translit?>"></div>
												</div>
												<div class="discription-card">
													<h3><?=$item['organization_type']?></h3>
												</div>
											</a>
										</div>
									<?php
									}
								} else echo 'Нет результатов запроса';?>
							</div>

							
						</div>
					</div>
				</section>
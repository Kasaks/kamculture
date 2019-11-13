							<!-- тело секции  --> <!-- уникальная секция -->
							<div class="body-section-block gallery-section row flex-wrap">
								<div class="col responsive-card-2">
									
									<?php if (is_array($result)) {
										$count = 0;
										
										foreach ($result as $item) { 

											$translit_title = Secondary_functions::translit_text($item['publication_title']);

											if (isset($item['publication_text']) == true) {
												$text = Secondary_functions::trim_text($item['publication_text']);
											}

											if ($count < count($result)/2)  { ?>

											
											<div class="card row vert-center">
												<div class="thumbnail-card vertical-card">
													<a href="/<?=$item['publication_type_en']?>/<?=$item['publication_id']?>/<?=$translit_title?>">
														<div class="conteiner-img"><img src="/images/<?=$item['publication_id']?>/<?=$item['publication_image']?>.jpg" alt=""></div> 
													</a>
												</div>
												<div class="discription-card">
													<h3 class="title"><a href="/<?=$item['publication_type_en']?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
													<p class="discription"><?=$text?></p>
													<div class="note">
													</div>
												</div>
											</div>

											<?php
											}
											if ($count == count($result)/2) { ?> 
												</div>
												<div class="col responsive-card-2">
												<?php 
											} ?>

											<?php if ($count >= count($result)/2) { ?>

													<div class="card row vert-center">
														<div class="thumbnail-card vertical-card">
															<a href="/<?=$item['publication_type_en']?>/<?=$item['publication_id']?>/<?=$translit_title?>">
																<div class="conteiner-img"><img src="/images/<?=$item['publication_id']?>/<?=$item['publication_image']?>.jpg" alt=""></div> 
															</a>
														</div>
														<div class="discription-card">
															<h3 class="title"><a href="/<?=$item['publication_type_en']?>/<?=$item['publication_id']?>/<?=$translit_title?>"><?=$item['publication_title']?></a></h3>
															<p class="discription"><?=$item['publication_text']?></p>
															<div class="note">
															</div>
														</div>
													</div>												

											<?php
											}

										$count ++;
										}
									} ?>
								</div>
							</div>
						</div>
					</div>
				</section>
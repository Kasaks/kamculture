							<!-- тело секции -->
							<div class="body-section-block education-section row flex-wrap">
								
								<div class="head-line">
									<a href="/articles/educations">Статьи</a>
									<a href="/event/educate">События</a>
								</div>

								<div class="educate-card responsive-card-4">
									<a href="/organizations/<?=$result['organizations']['organization_type_en']?>">
										<div class="gradient-background"></div>
										<div class="thumbnail-card">
											<img src="/images/<?=$result['organizations']['image']?>.jpg" alt="">
										</div>
										<div class="discription-card">
											<h3><?=$result['organizations']['organization_type']?></h3>
										</div>
									</a>
								</div>

								<?php if (is_array($result['e-books'])) {
									$count = 0;
									foreach ($result['e-books'] as $item) {  ?>
										
											<div class="book-card responsive-card-4">
												<a href="">
												<div class="thumbnail-card">
													<img src="/images/e-book-1.jpg" alt="">
												</div>
												<div class="discription-card">
													<div class="author-book info"><?=$item['publication-title']?></div>
													<div class="title-book info"><h4><?=$item['publication-text']?></h4></div>
													<div class="category-book info"><?=$item['publication-category']?></div>
												</div>
												</a>
											</div>
										<?php
									}
								}
								?>

							</div>

						</div>
					</div>
				</section>
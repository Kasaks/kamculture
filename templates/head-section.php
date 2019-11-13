	<section class="indent">
		<div class="tab">
			<div class="conteiner">
				<div class="head-section-block">
					<a class="title" href="/<?=$section_link?>"><h2>
						<?php
							if (isset($section_title) === true)
								echo $section_title;
						?>
						</h2></a>
					<p class="discription">
						<?php
							if (isset($section_disctiption) === true)
								echo $section_disctiption;
						?>
					</p>
				</div>
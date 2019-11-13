
				<!-- Новости -->
				<?php
					$section_title = 'Новости';
					$section_link = '/news';

					$pdo = include($_SERVER["DOCUMENT_ROOT"]."/components/db.php");

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE record_post_type_id = 1 ORDER BY record_date DESC LIMIT 4');

				?>

				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/news-section.php")?>
				<!-- Галерея -->

				<?php
					$section_title = 'Галерея';
					$section_link = '/gallery';

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE `record_post_type_id` = 2 ORDER BY record_date LIMIT 4'); 

				?>

				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/standart-section.php")?>
				<!-- Хобби -->
				<?php
					$section_title = 'Хобби';
					$section_link = '/hobby';

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE `record_post_type_id` = 5 ORDER BY record_date LIMIT 4'); 

				?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/standart-section.php")?>
				<!-- Организации -->
				<?php
					$section_title = 'Организации';
					$section_link = '/organizations';

					$result = $pdo->query('SELECT * FROM dir_organizations_types where organization_type_main_block = true');					

				?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/organization-section.php")?>
				<!-- Люди -->
				<?php
					$section_title = 'Люди';
					$section_link = '/biographies';

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE `record_post_type_id` = 3 ORDER BY record_date LIMIT 4'); 
				?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/standart-section.php")?>
				<!-- Конкурсы -->
				<?php
					$section_title = 'Конкурсы';
					$section_link = '/contests';

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE `record_post_type_id` = 8 ORDER BY record_date LIMIT 4'); 
				?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/standart-section.php")?>
				<!-- Коллективы -->
				<?php
					$section_title = 'Коллективы';
					$section_link = '/collectivies';

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE `record_post_type_id` = 4 ORDER BY record_date LIMIT 4'); 
				?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/standart-section.php")?>
				<!-- Традиции -->
				<?php
					$section_title = 'Традиции';
					$section_link = '/traditions';

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE `record_post_type_id` = 7 ORDER BY record_date LIMIT 4'); 
				?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/standart-section.php")?>
				<!-- Памятники -->
				<?php
					$section_title = 'Памятники';
					$section_link = '/monuments';

					$result = $pdo->query('SELECT record_id, record_date, record_author, record_title, dir_images.image_name AS image_name FROM records INNER JOIN con_records_images ON records.record_id = con_records_images.records_images_record_id INNER JOIN dir_images ON con_records_images.records_images_image_id = dir_images.image_id WHERE `record_post_type_id` = 7 ORDER BY record_date LIMIT 4'); 
				?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/standart-section.php")?>
			</section>
			<!-- Слайдбар -->
			<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/sidebar-section.php")?>
		</div>

		
	</main>


<!-- Подвал -->
<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/footer.php")?>

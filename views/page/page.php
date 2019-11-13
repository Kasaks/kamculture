<!-- шапака сайта -->
<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/header.php")?>
				<!-- шапка секции -->
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/head-section.php")?>
				<!-- тело секции -->
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/".$publication_type_row['section_en']."-section.php")?>
				<!-- подвал секции -->
				<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/footer-section.php")?>
<!-- подвал сайта -->
<?php include($_SERVER["DOCUMENT_ROOT"]."/templates/footer.php")?>

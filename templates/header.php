<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php if (isset($page_title)) { ?>
		<title><?=$page_title?> | Портал культуры Камчатского края</title>
    <?php
    } else {?>
    	<title>Портал культуры Камчатского края</title>
	<?php
    }?>
    <link rel="stylesheet" type="text/css" href="/templates/css/style.css">
    <link rel="stylesheet" type="text/css" href="/templates/css/kubuk-slider.css">
    <link rel="stylesheet" type="text/css" href="/templates/css/kubuk-slidebar.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  </head>
  <body>

	<header>
		
		<div class="standart-menu-block">
			
			<div class="main-standart-block">

				<div class="conteiner row vert-center">
					
					<div class="logo">
						<a href="/"><img src="/templates/img/logo.png" alt="Портал культуры Камчатского края"></a>
					</div>

					<ul class="main-menu row vert-center">
						<li class="close-menu"><i class="fas fa-times"></i></li>
						<?php foreach ($main_menu_list as $item) {
							if (isset($now_uri) && $item['page_en'] == $now_uri) { ?>
								<li><a class="active-page" href="/<?=$item['page_en']?>"><?=$item['page']?></a></li>
							<?php
							} else { ?>
							<li><a href="/<?=$item['page_en']?>"><?=$item['page']?></a></li>
							<?php 
							}
						}?>			
					</ul>

				</div>

			</div>

			<div class="sub-standart-block">

				<div class="conteiner">
					
					<ul class="sub-menu row vert-center">
						<?php if (isset($sub_menu_list) && is_array($sub_menu_list)) { 
							foreach ($sub_menu_list as $item) { 
								if (isset($now_uri) && $item['publication_type_en'] == $now_uri) { ?>
									<li><a class="active-sub-page" href="/<?=$item['publication_type_en']?>"><?=$item['publication_type']?></a></li>
								<?php	
								} else { ?>
									<li><a href="/<?=$item['publication_type_en']?>"><?=$item['publication_type']?></a></li>
								<?php
								}
							}
						}?>
						
					</ul>

				</div>
				
			</div>

		</div>

		<div class="responsive-menu-block">

			<div class="conteiner row vert-center hor-center">
				
				<div class="logo">
					<a href="/"><img src="/templates/img/logo.png" alt="Портал культуры Камчатского края"></a>
				</div>

				<div class="responsive-button">
					<i class="fas fa-bars"></i>
				</div>

			</div>
			
		</div>

	</header>
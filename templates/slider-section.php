    <?php
      if (isset($section_title) == true && $section_title != '') { ?>
        <div class="tab">
          <div class="conteiner">
            <div class="head-section-block">
              <a class="title" href="#">
                <h2>
                    <?=$section_title?>
                </h2>
              </a>
              <?php
              if (isset($section_disctiption) === true) { ?>
              <p class="discription">
                <?=$section_disctiption;?>
              </p>
              <?php
              }?>
            </div>
          </div>
        </div>
    <?php
      } ?>
    <section class="slider-section">
      <div class="conteiner">
        <div class="viewport">
          <div class="slide-block">
            <?php if (is_array($result)) {
              $slide_number = 0;
                foreach ($result as $item) {
                  $translit_title = Secondary_functions::translit_text($item['publication_title']);
                ?>  
                  <div class="slide row <?php if ($slide_number == 0) echo 'active-slide'?>" data-slide-number="<?=$slide_number?>">
                    <a href="/<?=$item['publication_type_en']?>/<?=$item['publication_id']?>/<?=$translit_title?>">
                      <div class="slide-img-block" style="background-image:url('/images/<?=$item['publication_id']?>/<?=$item['publication_image']?>.jpg')"></div>
                      <div class="slide-gradient-block"></div>
                      <div class="slide-text-block">
                        <div class="slide-title"><?=$item['publication_title']?></div>
                        <div class="slide-discription"><?php if(isset($item['publication_text'])) echo $item['publication_text']?></div>
                      </div>
                    </a>
                  </div>
                <?php
                  $slide_number ++;
                }
            }?>
          </div>
          <div class="button-block row vert-center hor-center">
            <div class="prev-btn"><i class="fas fa-caret-left"></i></div>
            <?php 
            if (is_array($result)) {
                $slide_number = 0;
                foreach ($result as $item) {
                ?>
               
                    <?php 
                    if ($slide_number == 0) { ?>
                    <span class="circle-btn active-circle-btn" data-slide-to-number="<?=$slide_number?>"></span>
                    <?php
                    } else { ?>
                      <span class="circle-btn" data-slide-to-number="<?=$slide_number?>"></span>
                    <?php
                    }
                    $slide_number++;?>

                <?php
                }
            } ?>
            <div class="next-btn"><i class="fas fa-caret-right"></i></div>
          </div>
        </div>
      </div>
    </section>  

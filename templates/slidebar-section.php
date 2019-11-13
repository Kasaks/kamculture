    <section class="slidebar-section">
      <div class="conteiner">
        <div class="viewport">
          <div class="slides-block row vert-center" data-slide-now="0">
            <?php if (is_array($result)) {
                foreach ($result as $item) {
                   $title_translit = Secondary_functions::translit_text($item['publication_title']);
                ?>
                  <div class="slide">
                    <a href="/<?=$item['publication_type_en']?>/<?=$item['publication_id']?>/<?=$title_translit?>">
                      <img src="/images/<?=$item['publication_image']?>.jpg" alt="<?=$title_translit?>" class="slide-img">
                      <div class="slide-gradient"></div>
                      <div class="slide-info">
                        <div class="title-slide"><?=$item['publication_title']?></div>
                        <div class="discription-slide"><?php if(isset($item['publication_text'])) echo $item['publication_text'] ?></div>
                      </div>
                    </a>
                  </div>
                <?php
                }
            }?>
          </div>
          <div class="controls-block">
              <div class="prev-btn"><i class="fas fa-caret-left"></i></div>
              <div class="next-btn"><i class="fas fa-caret-right"></i></div>
          </div>
        </div>
      </div>
    </section>
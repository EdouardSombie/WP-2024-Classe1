<?php get_header() ?>

<main id="site-main">
    <div class="container">
        <div class="row">
            <div class="col-6 offset-3">
                <?php
                // Récuparation des champs custom (méthode ACF)
                //echo get_field('contenu_de_la_pop-up');

                get_template_part('template-parts/identity-card');
                ?>
            </div>
        </div>
    </div>
</main>

<?php get_footer() ?>
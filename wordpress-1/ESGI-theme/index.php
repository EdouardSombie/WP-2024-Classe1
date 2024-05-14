<?php get_header() ?>

<main id="site-main">
    <div class="container">
        <div class="row">
            <div class="col-6 offset-3">
                <?php
                get_template_part('template-parts/identity-card');

                // Si pas sur la page d'accueil : : afficher les 6 derniers articles
                if (!is_front_page()) {
                    // Récupération des 6 derniers articles
                    $args = [
                        'numberposts' => 6,
                        'orderby' => 'date',
                        'order' => 'DESC'
                    ];
                    $posts = get_posts($args);
                    echo '<ul>';
                    foreach ($posts as $p) { ?>
                        <li>
                            <a href="<?= get_permalink($p->ID) ?>">
                                <?= $p->post_title ?>
                                <time><?= wp_date('j F Y', strtotime($p->post_date))  ?></time>
                            </a>
                        </li>
                <?php }
                    echo '</ul>';
                }
                ?>
            </div>
        </div>
    </div>
</main>

<?php get_footer() ?>
<?php get_header() ?>

<main id="site-main">
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
</main>

<?php get_footer() ?>
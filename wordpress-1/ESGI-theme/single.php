<?php get_header() ?>

<main id="site-main">
    <h1><?= the_title() ?></h1>
    <div class="post-meta">
        <div class="post-author">
            <?= get_avatar($post->post_author) ?>
            <?= get_the_author_meta('nickname', $post->post_author) ?>
        </div>
        <time class="post-date">
            <!-- wordpress crée automatiquement la variable $post -->
            <?= wp_date('j F Y', strtotime($post->post_date)) ?>
        </time>
    </div>
    <div class="post-thumbnail">
        <?php the_post_thumbnail(); ?>
    </div>
    <div class="post-content">
        <?php the_content() ?>
    </div>
</main>

<?php get_footer() ?>
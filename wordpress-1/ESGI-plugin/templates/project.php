<?php get_header() ?>

<main id="site-main">
    <div>
        <div>
            <div>
                <h1><?= the_title() ?></h1>
                <div>
                    <?php the_post_thumbnail(); ?>
                </div>
                <div>
                    <?php the_content() ?>
                </div>
            </div>
        </div>
    </div>

</main>

<?php get_footer() ?>
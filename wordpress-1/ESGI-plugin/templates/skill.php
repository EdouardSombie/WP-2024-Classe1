<?php get_header() ?>
<?php
$skill = get_queried_object();
?>
<main id="site-main">
    <div>
        <div>
            <div>
                <h1><?= $skill->name ?></h1>
                <!-- <div>
                    <?php the_post_thumbnail(); ?>
                </div> -->
                <div>
                    <?= $skill->description ?>
                </div>
            </div>
        </div>
    </div>

</main>

<?php get_footer() ?>
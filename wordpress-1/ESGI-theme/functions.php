<?php

// Fonctionalités du thème

// Chargement de la feuille de style

add_action('wp_enqueue_scripts', 'esgi_enqueue_assets');
function esgi_enqueue_assets()
{
    wp_enqueue_style('main', get_stylesheet_uri());
}

<?php
/*
Plugin Name: ESGI-plugin
Plugin URI: https://esgi.fr
Description: Plugin d'ajout de post de type Project.
Author: ESGI team
Version: 1.0
Author URI: https://esgi.fr
*/

class ESGIPlugin
{

    public function __construct()
    {
        // Enregistrement d'un type de publication custom
        // Appel d'une méthode de classe grâce à un tableau [class, method]
        add_action('init', ['ESGIPlugin', 'registerProject']);

        // Définition du template par défaut à utiliser
        add_filter('template_include', ['ESGIPlugin', 'setTemplate']);

        // Déclaration d'un shortcode
        add_shortcode('skills-list', ['ESGIPlugin', 'showSkills']);

        // Inclusion d'ACF
        self::embedACF();
    }

    // Cette fonction appelée par un webhook doit être statique
    public static function registerProject()
    {
        $labels = [
            'name'                  => 'Projets',
            'singular_name'         => 'Projets',
            'menu_name'             => 'Projets',
            'name_admin_bar'        => 'Projet',
            'add_new'               => 'Ajouter un nouveau projet',
            'add_new_item'          => 'Ajouter un nouveau projet',
            'new_item'              => 'Nouveau projet',
            'edit_item'             => 'Modifier le projet',
            'view_item'             => 'Voir le projet',
            'all_items'             => 'Tous les projets',
            'search_items'          => 'Rechercher parmi les projets',
        ];
        $args = [
            'labels'             => $labels,
            'description'        => 'Type de post custom Projet.',
            'public'             => true,
            'publicly_queryable' => true,
            'show_ui'            => true,
            'show_in_menu'       => true,
            'query_var'          => true,
            'rewrite'            => array('slug' => 'project'),
            'capability_type'    => 'post',
            'has_archive'        => true,
            'hierarchical'       => false,
            'menu_position'      => 1,
            'supports'           => array('title', 'editor', 'author', 'thumbnail', 'custom-fields'),
            'show_in_rest'       => true,
            'menu_icon'          => 'dashicons-media-code',
        ];

        register_post_type('project', $args);

        // Déclaration d'une taxonomie personnalisée
        $labelsTaxonomy = [
            'name' => __('Skills'),
            'singular_name' => __('Skill'),
            'all_items' => __('Tous les Skills'),
            'add_new' => __('Ajouter un Skill', 'Skills'),
            'add_new_item' => __('Ajouter un Skill'),
            'edit_item' => __('Modifier un Skill'),
            'new_item' => __('Nouveaux Skills'),
            'view_item' => __('Voir le Skill'),
            'search_items' => __('Rechercher parmi les Skills'),
            'not_found' => __('Aucun Skill trouvé'),
            'not_found_in_trash' => __('Aucun Skill trouvé dans la corbeille'),
            'parent_item_colon' => ''
        ];

        $argsTaxonomy = array(
            'hierarchical'          => false,
            'labels'                => $labelsTaxonomy,
            'show_ui'               => true,
            'show_in_rest'            => true,
            'show_admin_column'     => true,
            'query_var'             => true,
            'rewrite'               => ['slug' => 'skill'],
        );

        register_taxonomy('skill', 'project', $argsTaxonomy);
    }

    public static function setTemplate($template)
    {
        if (is_single() && get_post_type() == 'project') {
            // Si le bon template n'existe pas dans le theme graphique
            if (!file_exists(get_template_directory() . '/single-project.php')) {
                $template = __DIR__ . '/templates/project.php';
            }
        }

        if (is_tax() && get_queried_object()->taxonomy == 'skill') {
            if (!file_exists(get_template_directory() . '/taxonomy-skill.php')) {
                $template = __DIR__ . '/templates/skill.php';
            }
        }

        return $template;
    }

    public static function showSkills($args)
    {
        $html = '';
        if (!empty($args['title'])) {
            $html .= '<h3>' . $args['title'] . '</h3>';
        }
        $args = [
            'taxonomy'   => 'skill',
            'hide_empty' => false
        ];
        $skills = get_terms($args);
        if (!empty($skills)) {
            $html .= '<ul>';
            foreach ($skills as $s) {
                $html .= '<li><a href="' . get_term_link($s) . '">' . $s->name . '</a></li>';
            }
            $html .= '</ul>';
        }
        return $html;
    }

    public static function embedACF()
    {

        if (!function_exists('is_plugin_active')) {
            include_once ABSPATH . 'wp-admin/includes/plugin.php';
        }

        // Check if ACF PRO is active
        if (is_plugin_active('advanced-custom-fields-pro/acf.php')) {
            // Abort all bundling, ACF PRO plugin takes priority
            return;
        }

        // Check if another plugin or theme has bundled ACF
        if (defined('MY_ACF_PATH')) {
            return;
        }

        define('MY_ACF_PATH', __DIR__ . '/includes/acf/');
        define('MY_ACF_URL', plugin_dir_url(__FILE__) . 'includes/acf/');

        // Include the ACF plugin.
        include_once(MY_ACF_PATH . 'acf.php');

        // Customize the URL setting to fix incorrect asset URLs.
        add_filter('acf/settings/url', 'my_acf_settings_url');
        function my_acf_settings_url($url)
        {
            return MY_ACF_URL;
        }

        // Ajout d'un champ related_posts sur les publications de type project
        if (function_exists('acf_add_local_field_group')) :

            $post_object_field = array(

                /* ... Insert generic settings here ... */
                'key' => 'field_related_posts',
                'label' => 'Articles en lien',
                'name' => 'related_posts',
                'type' => 'post_object',

                /* (mixed) Specify an array of post types to filter the available choices. Defaults to '' */
                'post_type' => 'post',

                /* (mixed) Specify an array of taxonomies to filter the available choices. Defaults to '' */
                'taxonomy' => '',

                /* (bool) Allow a null (blank) value to be selected. Defaults to 0 */
                'allow_null' => 0,

                /* (bool) Allow mulitple choices to be selected. Defaults to 0 */
                'multiple' => 1,

                /* (string) Specify the type of value returned by get_field(). Defaults to 'object'.
                Choices of 'object' (Post object) or 'id' (Post ID) */
                'return_format' => 'object',

            );

            acf_add_local_field_group(array(
                'key' => 'group_1',
                'title' => 'Champs des projets',
                'fields' => array(
                    $post_object_field
                ),
                'location' => array(
                    array(
                        array(
                            'param' => 'post_type',
                            'operator' => '==',
                            'value' => 'project',
                        ),
                    ),
                ),
            ));

        endif;
    }
}

new ESGIPlugin();

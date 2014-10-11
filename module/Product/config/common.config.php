<?php

return array(
    'view_manager' => array(
        'template_path_stack' => array(
            'product' => __DIR__ . '/../view',
        )
    ),
    'product_image' => array(
        'thumbnails' => array(
            'small' => array(
                'width' => 60,
                'height'=> 60,
                'upload_dir' => realpath('./public/data/small/'),
                'type' => 'jpg',
                'method' => 'outer',
            ),
            'medium' => array(
                'width' => 300,
                'height'=> 300,
                'upload_dir' => realpath('./public/data/medium/'),
                'type' => 'jpg',
                'method' => 'inner',                
            ),
            'big' => array(
                'width' => 800,
                'height'=> 600,
                'upload_dir' => realpath('./public/data/big/'),
                'type' => 'jpg',
                'method' => 'inner',                
            )
        ),
        'urls' => array(
            'small'  => '/data/small/%s.jpg',
            'medium' => '/data/medium/%s.jpg',
            'big'    => '/data/big/%s.jpg',
        )
    )
);
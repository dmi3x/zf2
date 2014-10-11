<?php

return array(
    'controllers' => array(
        'invokables' => array(
            'Product\Controller\Front' => 'Product\Controller\FrontController',
            'Product\Controller\Back'  => 'Product\Controller\BackController',
        ),
    ),
    'router' => array(
        'routes' => array(
            'home' => array(
                'type'    => 'literal',
                'options' => array(
                    'route'    => '/',
                    'defaults' => array(
                        'controller' => 'Product\Controller\Front',
                        'action'     => 'index',
                        'view'       => 'home'
                    ),
                ),
            ),
            'product' => array(
                'type'    => 'segment',
                'options' => array(
                    'route'    => '/product/[:id]',
                    'constraints' => array(
                        'id'     => '[0-9]+',
                    ),  
                    'defaults' => array(
                        'controller' => 'Product\Controller\Front',
                        'action'     => 'get',
                    ),                    
                )
            ),
            'cms-product' => array(
                'type'    => 'segment',
                'options' => array(
                    'route'    => '/cms/product[/][:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id'     => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Product\Controller\Back',
                        'action'     => 'index',
                    ),
                ),
            ),
        ),
    ),
);
<?php
/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * @NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */

return array(
    'db' => array(
        'driver'  => 'Pgsql',
        'database'=> 'catalog',
        'host'    => 'localhost',
    ),
    'service_manager' => array(
        'factories' => array(
            'Zend\Db\Adapter\Adapter' => 'Zend\Db\Adapter\AdapterServiceFactory',
            'Navigation' => 'Zend\Navigation\Service\DefaultNavigationFactory',
        ),
    ),
    'navigation' => array(
        'default' => array(
            array(
                'label' => 'Home',
                'route' => 'home',
                'resource' => 'home',
            ),
            array(
                'label' => 'Manage',
                'route' => 'cms-product',
                'resource' => 'cms-product',
            ),
            array(
                'label' => 'Login',
                'route' => 'zfcuser/login',
                'resource' => 'zfcuser/login',
            ), 
            array(
                'label' => 'Logout',
                'route' => 'zfcuser/logout',
                'resource' => 'zfcuser/logout',
            ),             
        )
    )    
);
<?php
/**
 * BjyAuthorize Module (https://github.com/bjyoungblood/BjyAuthorize)
 *
 * @link https://github.com/bjyoungblood/BjyAuthorize for the canonical source repository
 * @license http://framework.zend.com/license/new-bsd New BSD License
 */

return array(
    'bjyauthorize' => array(
        // default role for unauthenticated users
        'default_role'          => 'guest',

        // default role for authenticated users (if using the
        // 'BjyAuthorize\Provider\Identity\AuthenticationIdentityProvider' identity provider)
        'authenticated_role'    => 'user',

        // identity provider service name
        'identity_provider'     => 'BjyAuthorize\Provider\Identity\ZfcUserZendDb',

        // Role providers to be used to load all available roles into Zend\Permissions\Acl\Acl
        // Keys are the provider service names, values are the options to be passed to the provider
        'role_providers'        => array(                 
            'BjyAuthorize\Provider\Role\Config' => array(
                'guest' => array(),
                'user'  => array('children' => array(
                    'admin' => array(),
                )),
            ),            
        ),

        // Resource providers to be used to load all available resources into Zend\Permissions\Acl\Acl
        // Keys are the provider service names, values are the options to be passed to the provider
        'resource_providers' => array(
            'BjyAuthorize\Provider\Resource\Config' => array(
                'home'             => array(),
                'product'          => array(),
                'zfcuser'          => array(),
                'zfcuser/logout'   => array(),
                'zfcuser/login'    => array(),
                'zfcuser/register' => array(),
                'cms-product'      => array(),
            ),
        ),
//
//        // Rule providers to be used to load all available rules into Zend\Permissions\Acl\Acl
//        // Keys are the provider service names, values are the options to be passed to the provider
        'rule_providers'        => array(
            'BjyAuthorize\Provider\Rule\Config' => array(
                'allow' => array(
                    array(array(),        'home',             array()),
                    array(array(),        'product',          array()),
                    array(array('user'),  'zfcuser',          array()),
                    array(array('user'),  'zfcuser/logout',   array()),
                    array(array('guest'), 'zfcuser/login',    array()),
                    array(array('guest'), 'zfcuser/register', array()),
                    array(array('admin'), 'cms-product',      array()),
                ),
            ),
        ),

        // Guard listeners to be attached to the application event manager
        'guards' => array(
            'BjyAuthorize\Guard\Route' => array(
                array('route' => 'zfcuser',          'roles' => array('user')),
                array('route' => 'zfcuser/logout',   'roles' => array('user')),
                array('route' => 'zfcuser/login',    'roles' => array('guest')),
                array('route' => 'zfcuser/register', 'roles' => array('guest')),
                // Below is the default index action used by the ZendSkeletonApplication
                array('route' => 'home',             'roles' => array('guest', 'user')),
                array('route' => 'product',          'roles' => array()),
                array('route' => 'cms-product',      'roles' => array('admin')),
            ),
        ),
    ),
    
//    'unauthorized_strategy' => 'BjyAuthorize\View\RedirectionStrategy',

//    'view_manager' => array(
//        'template_map' => array(
//            'error/403' => __DIR__ . '/../view/error/403.phtml',
//            'zend-developer-tools/toolbar/bjy-authorize-role'
//                => __DIR__ . '/../view/zend-developer-tools/toolbar/bjy-authorize-role.phtml',
//        ),
//    ),
);

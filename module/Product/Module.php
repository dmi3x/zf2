<?php

namespace Product;

use Product\Model\Product;
use Product\Model\ProductTable;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\Stdlib\ArrayUtils;


class Module
{
    public function getConfig()
    {
        $config = array();

        $configFiles = array(
            __DIR__ . '/config/common.config.php',
            __DIR__ . '/config/router.config.php',
        );

        // Merge all module config options
        foreach($configFiles as $configFile) {
            $config = ArrayUtils::merge($config, include $configFile);
        }

        return $config;
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
    
    public function getViewHelperConfig()
    {
        return array(
            'factories' => array(
                'imageUrl' => function( $pluginManager ){
                    $config = $pluginManager->getServiceLocator()->get('config');
                    $helper = new \Product\View\Helper\Image( $config );
                    return $helper;
                }
            )
        );   
   }    
    
    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'Product\Model\ProductTable' => function($sm) {
                    $tableGateway = $sm->get('ProductTableGateway');
                    $table = new ProductTable($tableGateway);
                    return $table;
                },
                'ProductTableGateway' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Product());
                    return new TableGateway('products', $dbAdapter, null, $resultSetPrototype);
                },                       
            ),
            'invokables' => array(
                'product_image' => 'Imagine\Gd\Imagine',
            ), 
        );
    }
}

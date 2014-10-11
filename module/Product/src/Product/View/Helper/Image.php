<?php

namespace Product\View\Helper;

use Zend\View\Helper\AbstractHelper;

class Image extends AbstractHelper {
    
    protected $config;
    
    public function __construct( $config ) {
        $this->config = $config['product_image']['urls'];
    }
    
    public function __invoke( $productId, $size )
    {
        if( !isset( $this->config[$size] ) ) {
            throw new \Exception("Could not find size $size");
        }
        $tmpl = $this->config[$size];
        return sprintf( $tmpl, $productId );
    }
}
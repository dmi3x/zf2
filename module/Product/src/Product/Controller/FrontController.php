<?php

namespace Product\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;  

class FrontController extends AbstractActionController
{
    protected $productTable;
    
    public function getProductTable()
    {
        if (!$this->productTable) {
            $sm = $this->getServiceLocator();
            $this->productTable = $sm->get('Product\Model\ProductTable');
        }
        return $this->productTable;
    }
    
    public function indexAction()
    {
        return new ViewModel(array(
            'products' => $this->getProductTable()->fetchAll(),
        ));
    }
    
    public function getAction()
    {
        $id = (int) $this->params()->fromRoute('id', 0);
        $product = $this->getProductTable()->getItem( $id );
        if( !$product ) {
            $this->getResponse()->setStatusCode(404);
            return;
        }
        return new ViewModel(array(
            'product' => $product
        ));
    }    
}

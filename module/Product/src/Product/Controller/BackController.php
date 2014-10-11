<?php

namespace Product\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Product\Model\Product;         
use Product\Form\ProductForm;       

class BackController extends AbstractActionController
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
    
    public function addAction() 
    {
        $form = new ProductForm();        
        
        $request = $this->getRequest();
        if ($request->isPost()) {
            $product = new Product();
            $form->setInputFilter($product->getInputFilter());
            $post = array_merge_recursive(
                $request->getPost()->toArray(),
                $request->getFiles()->toArray()
            );
            $form->setData($post);
            if ($form->isValid()) {
                $product->exchangeArray($form->getData());
                $this->getProductTable()->saveItem($product);
                $file = $form->get('image')->getValue();
                $this->saveImage( $file, $product->productId );

                return $this->redirect()->toRoute('cms-product');
            }
        }
        return array('form' => $form);
    }
    
    public function editAction()
    {
        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute('cms-product', array(
                'action' => 'add'
            ));
        }

        try {
            $product = $this->getProductTable()->getItem($id);
        }
        catch (\Exception $ex) {
            return $this->redirect()->toRoute('cms-product', array(
                'action' => 'index'
            ));
        }

        $form  = new ProductForm();
        $form->bind($product);

        $request = $this->getRequest();
        
        if ($request->isPost()) {
            $filter = $product->getInputFilter();
            $filter->get('image')->setRequired( false );
            $form->setInputFilter($filter);            
            
            $post = array_merge_recursive(
                $request->getPost()->toArray(),
                $request->getFiles()->toArray()
            );
            $form->setData($post);
            $file = $form->get('image')->getValue();
            if ($form->isValid()) {
                $this->getProductTable()->saveItem($product);
                $this->saveImage( $file, $product->productId );
                return $this->redirect()->toRoute('cms-product');
            }
        }

        return array(
            'id'   => $id,
            'form' => $form,
        );
    }    
    
    public function deleteAction()
    {
        $id = (int)$this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute('cms-product');
        }
        $this->getProductTable()->deleteItem($id);
        $this->deleteImage($id);
        return $this->redirect()->toRoute('cms-product');
    }
    
    protected function getImageConfig()
    {
        $config = $this->getServiceLocator()->get('config');
        return $config['product_image']['thumbnails'];
    }
    
    /**
     * @todo implement it it model
     */
    protected function saveImage( $file, $productId ) 
    {
        if( empty($file['tmp_name']) ) {
            return;
        }
        $fileName = $file['tmp_name'];
        $thumbnails = $this->getImageConfig();
        
        foreach( $thumbnails as $thumb ) {
            $method = ( isset($thumb['method']) && $thumb['method'] == 'outer' ) 
                    ? \Imagine\Image\ImageInterface::THUMBNAIL_OUTBOUND
                    : \Imagine\Image\ImageInterface::THUMBNAIL_INSET;
            $size    = new \Imagine\Image\Box( $thumb['width'], $thumb['height'] );
            $path = $thumb['upload_dir'] . '/' . $productId . '.' . $thumb['type'];
            $imagine = new \Imagine\Gd\Imagine();
            $imagine->open($fileName)
                ->thumbnail($size, $method )
                ->save($path)
            ;
        }
    }

    protected function deleteImage( $productId ) 
    {
        $thumbnails = $this->getImageConfig();
        foreach( $thumbnails as $thumb ) {
            $path = $thumb['upload_dir'] . '/' . $productId . '.' . $thumb['type'];
            if( file_exists($path) ) {
                unlink( $path );
            }
        }
    }
}

<?php

namespace Product\Model;

use Zend\Db\TableGateway\TableGateway;

class ProductTable
{
    const SEQUENCE_NAME = '"products_productId_seq"';
    
    protected $tableGateway;
    
    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }

    public function getItem($id)
    {
        $rowset = $this->tableGateway->select(array('productId' => (int)$id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }

    public function saveItem(Product $product)
    {
        $data = array(
            'title'       => $product->title,
            'description' => $product->description,
            'price'       => $product->price,
        );

        $id = (int) $product->productId;
        if (!$id) {
            $this->tableGateway->insert($data);
            $product->productId = $this->getInsertId();
        } else {
            if ($this->getItem($id)) {
                $this->tableGateway->update($data, array('productId' => $id));
            } else {
                throw new \Exception('Product id does not exist');
            }
        }
    }

    public function deleteItem($id)
    {
        $this->tableGateway->delete( array('productId' => (int)$id) );
    }
    
    protected function getInsertId() 
    {
        return $this->tableGateway->getAdapter()->getDriver()
                    ->getLastGeneratedValue(self::SEQUENCE_NAME);
    }
}
<?php

namespace Product\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class Product implements InputFilterAwareInterface {
    
    public $productId;
    
    public $title;
    
    public $description;
    
    public $price;
    
    public $createdAt;
    
    public $image;
    
    protected $inputFilter; 
    
    public function exchangeArray( array $data )
    {
        foreach( $this as $property => $value ) {
            $this->{$property} = isset( $data[$property] ) ? $data[$property] : null;
        }
    }  
    
    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if ($this->inputFilter) {
            return $this->inputFilter;
        }
        
        $inputFilter = new InputFilter();

        $inputFilter->add(array(
            'name'     => 'productId',
            'required' => true,
            'filters'  => array(
                array('name' => 'Int'),
            ),
        ));

        $inputFilter->add(array(
            'name'     => 'title',
            'required' => true,
            'filters'  => array(
                array('name' => 'StripTags'),
                array('name' => 'StringTrim'),
            ),
            'validators' => array(
                array(
                    'name'    => 'StringLength',
                    'options' => array(
                        'encoding' => 'UTF-8',
                        'min'      => 1,
                        'max'      => 128,
                    ),
                ),
            ),
        ));

        $inputFilter->add(array(
            'name'     => 'description',
            'required' => true,
            'filters'  => array(
                array('name' => 'StringTrim'),
            ),
        ));

        $inputFilter->add(array(
            'name'     => 'image',
            'validators' => array(
                array(
                    'name'    => 'filemimetype',
                    'options' => array(
                        'mimeType' => 'image/jpeg,image/png,image/x-png'
                    ),
                )
            ),
        ));

        $this->inputFilter = $inputFilter;

        return $this->inputFilter;
    }    
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }    
}
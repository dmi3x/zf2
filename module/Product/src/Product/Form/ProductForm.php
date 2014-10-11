<?php

namespace Product\Form;

use Zend\Form\Form;

class ProductForm extends Form
{
    public function __construct( $name = 'product' )
    {
        parent::__construct( $name );

        $this->add(array(
            'name' => 'productId',
            'type' => 'Hidden',
        ));
        $this->add(array(
            'name' => 'title',
            'type' => 'Text',
            'options' => array(
                'label' => 'Title',
            ),
        ));
        $this->add(array(
            'name' => 'price',
            'type' => 'Number',
            'options' => array(
                'label' => 'Price',
            ),
        ));
        $this->add(array(
            'name' => 'description',
            'type' => 'Textarea',
            'options' => array(
                'label' => 'Description',
                'class' => 'texteditor',
            ),
        ));
        $this->add(array(
            'name' => 'image',
            'type' => 'File',
            'options' => array(
                'label' => 'Image',
            ),
        ));        
        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Save',
                'id' => 'submitbutton',
            ),
        ));
    }
}
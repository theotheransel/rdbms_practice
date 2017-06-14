<?php
    $db = new PDO('mysql:host=localhost;dbname=shoppingcart;charset=utf8',
                'Ansel', '');
    
    //error handling
    if(!$db->beginTransaction()) {
        echo 'Connection Failed';
        die();
    }
    
    

<?php
    ;
    
    //error handling
    if(!($db = new PDO('mysql:host=localhost;dbname=shoppingcart;charset=utf8',
                'Ansel', ''))) {
        echo 'Connection Failed';
        die();
    }
    
    

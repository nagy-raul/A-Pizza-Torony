<?php
declare(strict_types=1);

// Állítsd be az argumentumokat
$_POST['data'] = '{
                    "key": "value",
                    "key2": "value2",
                    "key3": "value3",
                    "key4": "value4",
                    "key5": "value5",
                    "key6": "value6"
                  }';

// Töltsd be a php fájlt a hibakereséshez
require_once('./booking.php');
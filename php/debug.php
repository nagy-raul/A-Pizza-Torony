<?php
declare(strict_types=1);

// Állítsd be az argumentumokat
$_POST['data'] = '{
                    "name": "John Doe",
                    "email": "john@gmail.com",
                    "address": "Hagyma u. 23, Makó, 6900",
                    "paymentMethod": "bankkártya",
                    "cardName": "John Doe",
                    "cardNumber": "1234-5678-9012-3456",
                    "cardExpiry": "12/25",
                    "cardCVV": "123",
                    "osszeg": 1000
                  }';

// Töltsd be a php fájlt a hibakereséshez
require_once('./order.php');
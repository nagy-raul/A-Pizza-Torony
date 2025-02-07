<?php
declare(strict_types=1);

$_POST['data'] = '{
    "password": "Jelszo2",
    "showPassword": true,
    "email": "balazslehel@gmail.com"
}';
require_once('./login.php');

$_POST['data'] = '{"name":"Vékony Marcell","email":"vekonymarcell@gmail.hu","countryCode":"36","phone":"566575675","password":"Jelszo3"}';
require_once('./register.php');

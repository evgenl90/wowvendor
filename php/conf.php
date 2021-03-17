<?php 

define('HOST', 'localhost');
define('USER', 'root');
define('PASSWORD', '');
define('DB', 'wowvendor');


$mysqli = new mysqli(HOST, USER, PASSWORD, DB);
if ($mysqli->connect_errno) {
    echo "Нет подключения к базе данных!";
    exit();
}
$mysqli->set_charset('utf8');
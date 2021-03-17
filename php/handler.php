<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/php/conf.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/php/functions.php');


if(!isset($_POST['rock_position']) || trim($_POST['rock_position']) === ''){
    echo json_encode(['error'=> "Нет позиции препятствия"],true);
    die();
}
if(!isset($_POST['race_time']) || trim($_POST['race_time']) === ''){
    echo json_encode(['error'=> "Время забега не передано"],true);
    die();
}
if(!isset($_POST['jump_distance']) || trim($_POST['jump_distance']) === ''){
    echo json_encode(['error'=> "Дистанция на которой персонаж совершил прыжок отсутствует"],true);
    die();
}
if(!isset($_POST['rock_size']) || trim($_POST['rock_size']) === ''){
    echo json_encode(['error'=> "Размер препятствия не передан"],true);
    die();
}
if(!isset($_POST['is_win']) || trim($_POST['is_win']) === ''){
    echo json_encode(['error'=> "Результат забега не передан"],true);
    die();
}


$sql = "INSERT INTO race_results SET ";
$sql .= " `rock_position`                   = " . escape_db($_POST['rock_position']);
$sql .= ",  `race_time`                  = " . escape_db($_POST['race_time']);
$sql .= ",  `jump_distance`                  = " . escape_db($_POST['jump_distance']);
$sql .= ",  `rock_size`                  = " . escape_db($_POST['rock_size']);
$sql .= ",  `is_win`                  = " . escape_db($_POST['is_win']);


if(!$mysqli->query($sql)){
    echo json_encode(['error'=> "Не удалось добавить результаты забега!"],true);
    die();
}

echo json_encode(['success'=> 'Результаты забега успешно добавлены!'],true);

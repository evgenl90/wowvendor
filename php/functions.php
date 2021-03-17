<?php


function escape_db($value) {
    global $mysqli;
    return "'".$mysqli->real_escape_string($value)."'";
}

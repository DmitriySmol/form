<?php 
error_reporting(-1);
ini_set('display_errors',1);
header('Content-Type: text/html; charset=utf-8');
session_start();

//конфиги
include_once './config.php';
include_once './variables.php';
include_once './modules/default.php';


//загрузка страниц
include './controllers/'.$_GET['controllers'].'/'.$_GET['page'].'.php';
include './view/default/index.tpl';

?>
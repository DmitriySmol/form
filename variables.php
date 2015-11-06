<?php

$allowed = array('main','errors','news','aboutus','contacts','errors','static','game1','program1','file1', 'cab');

if(!isset($_GET['controllers']) ) {
    $_GET['controllers'] = 'static';
} elseif (!in_array($_GET['controllers'], $allowed)) {
    header('Location: /index.php?controllers=errors&page=404');
    exit();
}

if(!isset($_GET['page']) ) {
    $_GET['page'] = 'auth'; //если не указана страница, то загружаем main
}

$link = mysqli_connect(DB_LOCAL, DB_LOGIN, DB_PASS, DB_NAME);

?>
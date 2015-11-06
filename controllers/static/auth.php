<?php 

if (isset($_POST['login'], $_POST['pass'], $_POST['confirm_pass'])) {

    //записываем данные из формы в переменные
    $login = $_POST['login'];
    $pass = $_POST['pass'];
    $confirm_pass = $_POST['confirm_pass'];

    $arr = array($login, $pass, $confirm_pass);

    $errors = array();

    //прогоняем массив из пользовательских данных через удаление пробелов, тегов, экранирование символов 
    foreach ($arr as $key => $value) {
        $key = trim($value);
        $key = stripslashes($value);
        $key = strip_tags($value);
        $key = htmlspecialchars($value);
    }

    //если пустые записываем значения в массив с ошибками
    if(empty($login)) {
        $errors['login'] = 'Заполните имя';
    }
    if(empty($pass)) {
        $errors['pass'] = 'Заполните пароль';
    }
    if(empty($confirm_pass)) {
        $errors['confirm_pass'] = 'Подтвердите пароль';
    }
    if($pass !== $confirm_pass) {
        $errors['not_equal'] = 'Пароли не совпадают';
    }

    //функция на проверку длины
    function length($value,$min,$max) {
        if(mb_strlen($value) < $min || mb_strlen($value) > $max ) {
            // $errors['wrong_numbers'] = 'Неверное количество символов';         
            return false;
        }
    }

    //если не пустые проверяем длину, если не проходит записваем ошибки в массив
    if (!empty($login) && !empty($pass) && !empty($confirm_pass)) {
        
        if(!length($login, 2, 30)) {
          $errors['wrong_numbers_login'] = 'Неверное количество символов';
        }  

        if (!length($pass, 3, 30)) {
          $errors['wrong_numbers_pass'] = 'Неверное количество символов';
        }

        if (!length($confirm_pass, 3, 30)) {
          $errors['wrong_numbers_confirm_pass'] = 'Неверное количество символов';
        } 

    }
    

    //если массив с ошибками пуст записываем значения в БД
    if(!count($errors)) {
        mysqli_query($link,"
        INSERT INTO `users` SET
        `login`  = '".mysqli_real_escape_string($link,$login)."',
        `pass`   = '".mysqli_real_escape_string($link,$pass)."'
        " );

            //указываем логин в куки, и пересылаем на страницу аутентификации
            setcookie("user_info", $login, time()+3600*24*30*3 );
            header('Location:index.php?controllers=static&page=auth');
            exit();
    } else {

        //если ошбики есть записываем ошибки в сессию
        $_SESSION['errors'] = $errors;
        $errors = $_SESSION['errors'];

    }

}


?>
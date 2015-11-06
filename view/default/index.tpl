<!DOCTYPE html>
<html lang="ru-RU">
  <head>
    <meta charset="utf-8">
    <meta name="author" content="Dmitriy Smolyarenko">
    <title></title>
    <link rel="shortcut icon" href="http://faviconka.ru/ico/faviconka_ru_283.ico" type="image/x-icon">
    <link rel="icon" href="http://faviconka.ru/ico/faviconka_ru_283.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/font/font.css">
    <link rel="stylesheet" href="css/index.css">
  </head>
  <body>
  <div class="wrapper">
      <header class="header">
      </header>
      <nav>
        <ul class="nav-ul">
          <li class="nav-li">
            <div class="enter">
              <a href="/index.php?controllers=static&page=auth">Войти</a>
            </div>
          </li>
          <li class="nav-li">
            <div class="enter">
            <?php
                if (isset($_COOKIE['user_info'])) {
                    echo "Здравствуйте, ".@$_COOKIE['user_info']."!";
                    echo "<a class='exit' href='index.php?controllers=static&page=coockie&exit'>Выйти</a>";
                }
            ?>
            </div>
          </li>
        </ul>
      </nav>
      <article class="main">

      <?php 
      include $_GET['controllers'].'/'.$_GET['page'].'.tpl';
      ?>

      </article>
      <footer class="footer-big">
      </footer>
    <script src="js/vendor/jquery-1.11.3.min.js"></script>

    <script src="js/main.js"></script> 
  </body>
</html>
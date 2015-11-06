<?php

setcookie("user_info","", time()-3600 );
header('Location: index.php?controllers=static&page=auth');

?>
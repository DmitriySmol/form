<div class="form">
  <form action="" method="post" class="form-ajax">
      <label for="">Ваше имя:</label>
      <input type="text" name="login" class="form__input">
      
      <?php 
      if (isset($errors)) {
          foreach ($errors as $key => $value) {

              if ($key === 'wrong_numbers_login') {
                  echo "<div class='form__incorrect-div'><div class='form__incorrect-div-triangle'></div>".$errors['wrong_numbers_login']."</div>"; 
                  break;
              }

              if ($key === 'login') {
                  echo "<div class='form__incorrect-div'><div class='form__incorrect-div-triangle'></div>".$errors['login']."</div>"; 
              }

          }
      }
      ?>

      <label for="">Пароль:</label>
      <input type="password" name="pass" class="form__input">
      
      <?php 
      if (isset($errors)) {
          foreach ($errors as $key => $value) {
              
              if ($key === 'wrong_numbers_pass') {
                  echo "<div class='form__incorrect-div'><div class='form__incorrect-div-triangle'></div>".$errors['wrong_numbers_pass']."</div>"; 
                  break;               
              }

              if ($key === 'pass') {
                  echo "<div class='form__incorrect-div'><div class='form__incorrect-div-triangle'></div>".$errors['pass']."</div>"; 
              }
          }
      } 
      ?>

      <label for="">Повторите пароль</label>
      <input type="password" name="confirm_pass" class="form__input">
      <?php 
      if (isset($errors)) {
          foreach ($errors as $key => $value) {
              
              if ($key === 'wrong_numbers_confirm_pass') {
                  echo "<div class='form__incorrect-div'><div class='form__incorrect-div-triangle'></div>".$errors['wrong_numbers_confirm_pass']."</div>"; 
                  break;               
              }

              if ($key === 'confirm_pass') {
                  echo "<div class='form__incorrect-div'><div class='form__incorrect-div-triangle'></div>".$errors['confirm_pass']."</div>"; 
                  break;
              } elseif ($key === 'not_equal') {
                  echo "<div class='form__incorrect-div'><div class='form__incorrect-div-triangle'></div>".$errors['not_equal']."</div>"; 
                 }

              }
      }
      ?>

      <input type="submit" class="sbm">
  </form>
</div>
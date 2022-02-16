<!DOCTYPE html>
<html lang="en">
<html>
    <head>
        <title>Start: A D-tier Adventure</title>
        <link rel="stylesheet" href="style.css">

        <!--fonts-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Red+Hat+Mono:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="header">
            <h1>Start: A D-tier Adventure</h1>
        </div>
        <?php
            // require('connect.php');
        ?>
        <main>
            main cont -> the game
            <?php
            require('game.php');
            ?>
        </main>
        <?php
            include('foot.html');
        ?>
    </body>
</html>
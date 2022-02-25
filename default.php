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
            require('connect.php');
        ?>
        <main>
            <!-- main cont -> the game -->
            <!-- <div class="gamedisp"> -->

            <?php
            //display game text  
            // if(isset($_SESSION['cuttxt'])){
            //     echo($_SESSION['curtxt']); 
            // }else{
                require("game.php");
            // }
                     
            ?>

            <!-- </div> -->
            <!-- <form action="game.php" method="POST">
            <table>
                <tr>
                    <td>
                        <input type="button" class="btn" name="StoryID" value="Next">
                    </td>
                </tr>        
            </table>
        </form>             -->
        </main>
        <?php
            include('foot.html');
        ?>
    </body>
</html>
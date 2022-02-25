<?php

    if(isset($_SESSION['cnt']) && $_SESSION['cnt'] < 2){
        $_SESSION['cnt']++;
    }
    else{
        $_SESSION['cnt'] = 1;
    }

    if(isset($_POST['StoryID'])){
        if($_POST['StoryID'] != 1){
            $_SESSION['lastcurtxt'] = $_SESSION['curtxt'];
        }
    
        //get text for game
        $sql_get = 'SELECT
                        StoryText
                    FROM
                        story
                    WHERE
                        StoryID = '.$_POST['StoryID'];
    
    
        
        $r = $pdo->query($sql_get);
        $curtxt = $r->fetch();

        $_SESSION['curtxt'] = $curtxt[0];
    
    
        echo('<div class="gametext">');
    
        //display game text  
        if($_POST['StoryID'] != 1){
            echo(">> ".$_SESSION['lastcurtxt']."<br><br>");
        }
        echo(">> ".$_SESSION['curtxt']."<br><br>");

        echo('
        </div>
        <form action="default.php" method="POST">
        <table>
            <tr>
                <td>
                    <input type="hidden" name="StoryID" value="'.$_SESSION['cnt'].'">
                    <input type="submit" class="btn" value="Next">
                </td>
            </tr>        
        </table>
    </form>          
        ');
    }
    else{
        echo('
        </div>
        <form action="default.php" method="POST">
        <table>
            <tr>
                <td>
                    <input type="hidden" name="StoryID" value="'.$_SESSION['cnt'].'">
                    <input type="submit" class="btn" value="Start">
                </td>
            </tr>        
        </table>
    </form>          
        ');
    }

    

?>
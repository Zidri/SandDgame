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
                        StoryID = :StoryID';
    
    
    
        // prepare
        $sql_get = $pdo->prepare($sql_get);
    
        //set StoryID as String
        // $StoryIDStr = strval($_POST['StoryID']);

        // sanatize
        $StoryID = filter_var($_POST['StoryID'],FILTER_SANITIZE_STRING);

        // bind
        $sql_get->bindparam(':StoryID',$StoryID);

        // execute
        // $r = $pdo->query($sql_get);
        $r = $sql_get->execute();
        echo($r);
        // $curtxt = $r->fetch();
        // $curtxt = $r->fetch();
        // echo("story >> ".$curtxt['StoryText']);

        //set text to session var
        // $_SESSION['curtxt'] = $curtxt;
        // echo($_SESSION['curtxt']);
    
        echo('<div class="gametext">');
    
        //display game text  
        if($StoryID != 1){
            echo(">> ".$_SESSION['lastcurtxt']."<br>");
        }
        echo($_SESSION['curtxt']);

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
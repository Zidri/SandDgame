<?php
    // require('connect.php');

    if(isset($_SESSION['cnt'])){
        $_SESSION['cnt']++;
    }
    else{
        $_SESSION['cnt'] = 0;
    }

    if(isset($_POST['StoryID'])){
        
    
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
        $StoryIDStr = strval($_POST['StoryID']);

        // sanatize
        $StoryID = filter_var($StoryIDStr,FILTER_SANITIZE_STRING);
    
        // bind
        $sql_get->bindparam(':StoryID',$StoryID);
    
        // execute
        $curtxt = $sql_get->execute();
    
        //set text to session var
        $_SESSION['curtxt'] = $curtxt;
        // echo($_SESSION['curtxt']);
    
        //header("Location: songsadmin.php");
    
        echo('
        <div class="gametext">
    
        ');
    
        //display game text  
        echo($_SESSION['curtxt']);

        echo('
        </div>
        <form action="default.php" method="POST">
        <table>
            <tr>
                <td>
                    <!--<input type="submit" class="btn" name="next" value="Next">-->
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
                    <!--<input type="submit" class="btn" name="next" value="Next">-->
                    <input type="hidden" name="StoryID" value="'.$_SESSION['cnt'].'">
                    <input type="submit" class="btn" value="Next">
                </td>
            </tr>        
        </table>
    </form>          
        ');
    }

    

?>
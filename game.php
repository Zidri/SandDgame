<?php

    if(isset($_POST['StoryID'])){
        $IDar = str_split($_POST['StoryID']);
        $_SESSION['cnt'] = intval($IDar[1]);

        if($_SESSION['cnt']<3){
            $_SESSION['cnt']++;
        }
        else{
            $_SESSION['cnt'] = 1;
        }

        $_SESSION['alpha'] = $IDar[0];
    }
    
    if(isset($_POST['StoryID'])){
        // echo($_POST['StoryID']);
        if($_POST['StoryID'] != 'A1'){
            if(isset( $_SESSION['lastcurtxt'])){
                $_SESSION['pastcurtxt'] = $_SESSION['lastcurtxt'];
            }
            $_SESSION['lastcurtxt'] = $_SESSION['curtxt'];
        }
        else{
            unset($_SESSION['pastcurtxt']);
            unset($_SESSION['lastcurtxt']);
        }
    
        //get choices for game
        $sql_getchoice = 'SELECT
                        Options, StoryID, ChoiceStoryID
                    FROM
                        choices
                    WHERE
                        StoryID = "'.$_POST['StoryID'].'"';
    
        $r = $pdo->query($sql_getchoice);

        $choice = $r->fetch();
        
        //pull all options not just first

        // print_r($choice);

        if(!empty($choice) && isset($choice)){
            $choicetxt = $choice[0];
            $choicepnt = $choice[2];

            // for($i = 0; $i < count($choice); $i++){
                // echo($choice[1][0]);
            // }
        }
        
    
        //get text for game
        $sql_gettxt = 'SELECT
                        StoryText,StoryEnd
                    FROM
                        story
                    WHERE
                        StoryID = "'.$_POST['StoryID'].'"';
    
    
        
        $r = $pdo->query($sql_gettxt);
        $story = $r->fetch();

        $_SESSION['curtxt'] = $story[0];
        $_SESSION['end'] = $story[1];
    
    
        echo('<div class="gamedisp"><div class="gametext">');
    
        //display game text  
        if(isset($_SESSION['lastcurtxt'])){
            if(isset($_SESSION['pastcurtxt'])){
                echo(">> ".$_SESSION['pastcurtxt']."<br><br>");
            }
            echo(">> ".$_SESSION['lastcurtxt']."<br><br>");
        }
        echo(">> ".$_SESSION['curtxt']."<br><br>");
        
        if(isset($choicepnt)){
            
        echo('
            </div>
            <form action="default.php" method="POST">
            <table>
                <tr>');
                    // for(int i = 0; i < $choicenum; i++){
                        //print multiple option buttons
                        echo('<td>
                        <input type="hidden" name="StoryID" value="'.$choicepnt.'">
                        <input type="submit" class="btn" id="centerbtn" value="'.$choicetxt.'">
                        </td>');
                    // }                   

                echo('</tr>        
            </table>
            </form>
            </div>          
        ');
        }
        else if($_SESSION['end'] != 1){
            echo('
            </div>
            <form action="default.php" method="POST">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="StoryID" value="'.$_SESSION['alpha'].$_SESSION['cnt'].'">
                        <input type="submit" class="btn" value="Next">
                    </td>
                </tr>        
            </table>
            </form>
            </div>          
        ');
        }
        else{
            echo('
            </div>
            <form action="default.php" method="POST">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="StoryID" value="A1">
                        <input type="submit" class="btn" value="Restart">
                    </td>
                </tr>        
            </table>
        </form>    
        </div>      
        ');
        }
        

    }
    else{
        echo('
        </div>
        <form action="default.php" method="POST">
        <table>
            <tr>
                <td>
                    <input type="hidden" name="StoryID" value="A1">
                    <input type="submit" class="btn" value="Start">
                </td>
            </tr>        
        </table>
    </form>    
    </div>      
        ');
    }

    

?>
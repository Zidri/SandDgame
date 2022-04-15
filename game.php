<?php

    //check for storyID
    if(isset($_POST['StoryID'])){

        // echo("ID -> ".$_POST['StoryID']."<br>");

        //send to B2 after J2
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "J3"){
            $_POST['StoryID'] = "B2";           
        }

        //send to P1 after O6
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "O6"){
            $_POST['StoryID'] = "P1";           
        }

        //send to N1 after O11
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "O11"){
            $_POST['StoryID'] = "N1";           
        }

        //flower shop count
        if( $_POST['StoryID'] == 'M1' || 
            $_POST['StoryID'] == 'N2' || 
            $_POST['StoryID'] == 'N4' || 
            $_POST['StoryID'] == 'N3' || 
            $_POST['StoryID'] == 'N5'){

            if(isset($_SESSION['flowerCnt'])){
                if($_SESSION['flowerCnt'] > 6){
                $_SESSION['flowerCnt']++;
            }
            else{
                $_POST['StoryID'] = "P1";  //send to ending
            }
            }
            else{
                $_SESSION['flowerCnt'] = 1;
            }

        }

        //set haveCard? bool
        if($_POST['StoryID'] == 'N2' || $_POST['StoryID'] == 'N5' ){
            $_SESSION['haveCard'] = true;
        }

        //set haveKey? bool
        if($_POST['StoryID'] == 'N3' || $_POST['StoryID'] == 'N4' ){
            $_SESSION['haveKey'] = true;
        }

        //set tryDoor? bool
        if($_POST['StoryID'] ==  ""){
            $_SESSION['tryDoor'] = true;
        }

        //open door after grabing key
        if(($_POST['StoryID'] == 'N3' || $_POST['StoryID'] == 'N4') && isset($_SESSION['tryDoor']) && $_SESSION['tryDoor']){
            $_POST['StoryID'] = "O2";    //send to door
        }

        //split posted ID by chars
        $IDar = str_split($_POST['StoryID']);

        // print_r($IDar);

        //set cnt to posted ID num
        $_SESSION['cnt'] = intval($IDar[1]);
        //set alpha using posted ID letter
        $_SESSION['alpha'] = $IDar[0];

        //reset cnt at 3 -> production only
        if(isset($_SESSION['cnt'])/*$_SESSION['cnt']<3*/){
            $_SESSION['cnt']++;
        }
        else{
            $_SESSION['cnt'] = 1;
        }

        
    }
    
    
    if(isset($_POST['StoryID'])){    
        //show current ID
        echo($_POST['StoryID']);
        //set prev texts so user can still view them
        if($_POST['StoryID'] != 'A1'){            
            if(isset( $_SESSION['lastcurtxt'])){
                //set text before last if exists
                $_SESSION['pastcurtxt'] = $_SESSION['lastcurtxt'];                
            }
            //set last text if not at beginning
            $_SESSION['lastcurtxt'] = $_SESSION['curtxt'];            
        }
        else{
            //unset prev text if at begining
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


            //run through all options
            $optcnt = 0;
            while($choice = $r->fetch()){
                $options[$optcnt] = $choice;
                // echo("<br>".$optcnt."->".$options[$optcnt][2]."<br>");                
                $optcnt++;         
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

        //set game text ending bool
        $_SESSION['curtxt'] = $story[0];
        $_SESSION['end'] = $story[1];
    
    
        echo('<div class="gamedisp"><div class="gametext">');
    
        
        //display past text if possible
        if(isset($_SESSION['lastcurtxt'])){
            if(isset($_SESSION['pastcurtxt'])){
                echo(">> ".$_SESSION['pastcurtxt']."<br><br>");
            }
            echo(">> ".$_SESSION['lastcurtxt']."<br><br>");
        }
        //display current game text  
        echo('<div id = "newtxt">>> '.$_SESSION["curtxt"].'</div><br><br>');
        
        //check if options exist
        if(!empty($optcnt)){
            
        echo('
            </div>
            <div  id="gamebtn"> 
            ');

                //display multiple buttons
                for($i=0;$i<$optcnt;$i++){           
                    echo(
                        '<form action="default.php" method="POST">
                        <table>
                            <tr>
                            <td>
                        <input type="hidden" name="StoryID" class = "btn" value="'.$options[$i][2].'">
                        <input type="submit" class="btn" value="'.$options[$i][0].'">
                            </td>
                            </tr>        
                        </table>
                        </form>
            ');
                }                   

                echo('
            </div>  
            </div>        
        ');
        }
        //check if it's an ending
        else if($_SESSION['end'] != 1){
            echo('
            </div>   
            <div  id="gamebtn">         
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
        //show restart button if ending
        else{
            //unset session vars
            unset($_SESSION['PastID']);
            unset($_SESSION['StoryID']);
            unset($_SESSION['haveCard']);
            unset($_SESSION['haveKey']);
            unset($_SESSION['tryDoor']);
            unset($_SESSION['flowerCnt']);

            echo('
            </div>
            <div  id="gamebtn"> 
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
        </div>     
        ');
        }       
    }
    //if there's no storyID -> show start button
    else{
        echo('
        </div>
        <div  id="gamebtn">
        <form action="default.php" method="POST">
        <table>
            <tr>
                <td>
                    <input type="hidden" name="StoryID" value="A1">
                    <input type="submit" class="Startbtn" id="Centerbtn" value="Start">
                </td>
            </tr>        
        </table>
    </form>    
    </div>     
    </div> 
        ');
    }

    

?>
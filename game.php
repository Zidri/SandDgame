<?php

    //check for storyID
    if(isset($_POST['StoryID'])){

        // echo("ID -> ".$_POST['StoryID']."<br>");

        //send to B2 after J2
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "J3"){
            $_POST['StoryID'] = "B2";           
        }

        //send to J5 after M2
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "M2"){
            $_POST['StoryID'] = "J5";           
        }

        //send to P1 after O6
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "O6"){
            $_POST['StoryID'] = "P1";           
        }

        //send to N1 after O11
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "O11"){
            $_POST['StoryID'] = "N1";           
        }

        //set talk to civilians as true
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "D1"){
            $_SESSION['TalkCivilians'] = true;           
        }

        //send to H22 after H1 if talked to civilians
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "H1" && !isset($_SESSION['TalkCivilians'])){
            $_POST['StoryID'] = "H22";         
        }


        //score trivia minigame
        //score question 1
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S6"){
            $_SESSION['TriviaQ1'] = true;
            $_POST['StoryID'] = "S8";         
        }
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S7"){
            $_SESSION['TriviaQ1'] = false;
            $_POST['StoryID'] = "S8";         
        }
        //jump to reaction to q1
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S9" && $_SESSION['TriviaQ1']){
            $_POST['StoryID'] = "S11";         
        }
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S9" && !$_SESSION['TriviaQ1']){
            $_POST['StoryID'] = "S10";         
        }
        //jump to question 2 after wrong answer reaction
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S11" && !$_SESSION['TriviaQ1']){
            $_POST['StoryID'] = "S12";         
        }

        //score question 2
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S15"){
            $_SESSION['TriviaQ2'] = true;
            $_POST['GusAns'] = true;
            $_POST['StoryID'] = "S19";         
        }
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S17"){
            $_SESSION['TriviaQ2'] = true;
            $_POST['GusAns'] = false;
            $_POST['StoryID'] = "S19";         
        }
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S18"){
            $_SESSION['TriviaQ2'] = false;
            $_POST['GusAns'] = false;
            $_POST['StoryID'] = "S19";         
        }
        //jump to reaction to q2
        //wrong
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S20" && !$_SESSION['TriviaQ2']){
            $_POST['StoryID'] = "S21";         
        }
        //jump to question 3 after wrong answer reaction
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S22" && !$_SESSION['TriviaQ2']){
            $_POST['StoryID'] = "S24";         
        }
        //gus answered
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S20" && $_SESSION['TriviaQ2']){
            $_POST['StoryID'] = "S22";         
        }  
        //jump to question 3 after Gus answers reaction
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S23" && $_SESSION['TriviaQ2'] && $_POST['GusAns']){
            $_POST['StoryID'] = "S24";         
        }      
        //right
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S20" && !$_SESSION['TriviaQ2']){
            $_POST['StoryID'] = "S23";         
        }

        //check number of wrong answers
        //all wrong
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S" && 
        (isset($_SESSION['TriviaQ1']) && isset($_SESSION['TriviaQ2']) && isset($_SESSION['TriviaQ3'])) &&
         !$_SESSION['TriviaQ1'] && !$_SESSION['TriviaQ2'] && !$_SESSION['TriviaQ3']){
            $_POST['StoryID'] = "S";         
        }
        //one right
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S" && 
        isset($_SESSION['TriviaQ1']) && isset($_SESSION['TriviaQ2']) && isset($_SESSION['TriviaQ3']) &&
        ($_SESSION['TriviaQ1'] && !$_SESSION['TriviaQ2'] && !$_SESSION['TriviaQ3']) || 
        (!$_SESSION['TriviaQ1'] && $_SESSION['TriviaQ2'] && !$_SESSION['TriviaQ3']) || 
        (!$_SESSION['TriviaQ1'] && !$_SESSION['TriviaQ2'] && $_SESSION['TriviaQ3'])){
            $_POST['StoryID'] = "S";         
        }
        //two right
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S" && 
        (isset($_SESSION['TriviaQ1']) && isset($_SESSION['TriviaQ2']) && isset($_SESSION['TriviaQ3'])) &&
        ($_SESSION['TriviaQ1'] && $_SESSION['TriviaQ2'] && !$_SESSION['TriviaQ3']) || 
        ($_SESSION['TriviaQ1'] && !$_SESSION['TriviaQ2'] && $_SESSION['TriviaQ3']) || 
        (!$_SESSION['TriviaQ1'] && $_SESSION['TriviaQ2'] && $_SESSION['TriviaQ3'])){
            $_POST['StoryID'] = "S";         
        }
        //all right
        if(isset($_POST['StoryID']) && $_POST['StoryID'] == "S" && 
        (isset($_SESSION['TriviaQ1']) && isset($_SESSION['TriviaQ2']) && isset($_SESSION['TriviaQ3'])) && 
        ($_SESSION['TriviaQ1'] && $_SESSION['TriviaQ2'] && $_SESSION['TriviaQ3'])){
            $_POST['StoryID'] = "S";         
        }


        //flower shop count
        if( $_POST['StoryID'] == 'M1' || 
            $_POST['StoryID'] == 'N2' || 
            $_POST['StoryID'] == 'N4' || 
            $_POST['StoryID'] == 'N3' || 
            $_POST['StoryID'] == 'N5' ||
            $_POST['StoryID'] == 'O4' ||
            $_POST['StoryID'] == 'O12'){

            if(isset($_SESSION['flowerCnt'])){
                if($_SESSION['flowerCnt'] == 4){
                    $_POST['StoryID'] = "P1";  //send to ending                
                }
                else{
                    $_SESSION['flowerCnt'] += 1;
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
        if($_POST['StoryID'] ==  'O7'){
            $_SESSION['tryDoor'] = true;
        }

        //open door after grabing key
        if(($_POST['StoryID'] == 'N3' || $_POST['StoryID'] == 'N4') && isset($_SESSION['tryDoor']) && $_SESSION['tryDoor']){
            $_POST['StoryID'] = "O12";    //send to door
        }

        //open door after if haskey
        if($_POST['StoryID'] == 'O12' && isset($_SESSION['haveKey']) && $_SESSION['haveKey']){
            $_POST['StoryID'] = "R1";    //send to door opening
        }



        //set cnt to posted ID num
        $_SESSION['cnt'] = substr($_POST['StoryID'],1);
        
        //set alpha using posted ID letter
        $_SESSION['alpha'] = str_split($_POST['StoryID'])[0];

        //increment cnt
        if(isset($_SESSION['cnt'])){
            $_SESSION['cnt']++;
        }
        else{
            $_SESSION['cnt'] = 1;
        }

        
    }
    
    
    if(isset($_POST['StoryID'])){    
        //show current ID
        echo($_POST['StoryID']."\t");

        //show flower cnt
        if(isset($_SESSION['flowerCnt'])){
            
            echo($_SESSION['flowerCnt']);
        }

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
            unset($_SESSION['haveCard']);
            unset($_SESSION['haveKey']);
            unset($_SESSION['tryDoor']);
            unset($_SESSION['flowerCnt']);
            unset($_SESSION['TalkCivilians']);

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
        //unset session vars
        unset($_SESSION['PastID']);
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
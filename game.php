<?php
    require('connect.php');

    if(isset($_SESSION['cnt'])){
        $_SESSION['cnt']++;
    }
    else{
        $_SESSION['cnt'] = 0;
    }

    //get text for game
    $sql_get = 'SELECT StoryText 
                FROM story 
                WHERE StoryID = :StoryID';



    // prepare
    $sql_get = $pdo->prepare($sql_get);

    // sanatize
    $storyid = filter_var($_POST['storyid'],FILTER_SANITIZE_NUMBER_INT);

    // bind
    $sql_get->bindparam(':storyid',$storyid);

    // execute
    $curtxt = $sql_get->execute();

    //set text to session var
    $_SESSION['curtxt'] = $curtxt;
    echo($_SESSION['curtxt']);

    //header("Location: songsadmin.php");

    echo('
    <div class="gametext">

    ');

    //display game text  
    echo($_SESSION['curtxt']);

    echo('
    </div>
    <form action="game.php" method="POST">
    <table>
        <tr>
            <td>
                <input type="button" class="btn" name="next" value="Next">
                <input type="hidden" name="storyid" value="'.$_SESSION['cnt'].'">
            </td>
        </tr>        
    </table>
</form>          
    ');

?>
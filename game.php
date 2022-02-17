<?php
    require('connect.php');

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

    
?>
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
    $sql_get->execute();

    header("Location: songsadmin.php");

    
?>
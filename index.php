<?php
$errorMessage = "";
include("inc/functions.php");
$conn = connectToDB();

if($_SERVER['REQUEST_METHOD'] == "POST")
{
  // somone used the submit of the form to send data wich can be stored in the database
  //var_dump($_POST);
  // check what the user has filled in or selected...
  // what to do when the user hasn't filled in anything or selected
  $comment = $_POST['comment'];
  if($comment == "")
  {
    // this should be an error..
    $errorMessage = "Oops, you forgot something.";
  }
  else
  {
    $errorMessage = "Thank you for rating.";
    // the query
    $insertQuery = "insert into `rating` (`ratingId`,`heroId`,`rating`, `ratingDate`, `ratingReview`) values (null,'".$_POST['heroId']."','".$_POST['rating']."','".time()."','".$_POST['comment']."')";
    //die($insertQuery);
  }
}
/*
get teams from database
*/

$teams = array();
$sql = "SELECT *  FROM `team` order by `teamName` desc";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $teams[] = $row;
    }
}

$heroes = array();
if(isset($_GET['teamId']))
{
    $teamId = $_GET['teamId'];
    $sql = "SELECT *  FROM `hero` WHERE teamId = " . $teamId;
}
else {
    $sql = "SELECT *  FROM `hero`";
}

$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $heroes[] = $row;
    }
}

 ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="description" content="DC Heroes">
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet" type="text/css" />
	<title>DC Heroes</title>
</head>
<body>
	<header id="header">
  <div id="picturebox">
      <a href="index.php"><img width="110" src="images/dc.gif"></a>
  </div>
      <div id="logo">
      <a href="index.php">DC Heroes</a>
    </div>
	</header>

	<div id="main-container">

    <div id="main-left">
                <h2>Teams</h2>
                <?php
                foreach ($teams as $team) {
                    echo "<h2><a href=\"index.php?teamId=" . $team['teamId'] . "\">"  . $team['teamName'] . "</a></h2>";
                }
                ?>

            </div>

            <div id="main-center">
              <?php
                    foreach ($heroes as $hero) {

                        echo "<h5><a href='index.php?heroId=" . $hero['heroId'] . "'>";
                        echo $hero['heroName'];
                        echo "</a></h5>";
                        echo "<img src='images/" . $hero['heroImage'] . "' />";
                        echo "<p class=\"heroDescription\">" . $hero['heroDescription'] . "</p>";
                    }
                    ?>

                </div>

                <div id="main-right">
                      <?php
                      // get info from a hero. use heroId from the url
                      if(isset($_GET['heroId']))
                      {
                      //  die("boehoe");
                        $id = $_GET['heroId'];
                        //
                        $sql2 = "select * from `hero` where `heroId` = " . $id;
                        $result2 = $conn->query($sql2);
                        if ($result2->num_rows > 0) {
                            while ($row2 = $result2->fetch_assoc()) {
                                $hero = $row2;
                            }
                        }
                      //  var_dump($sql2);
                      //  var_dump($hero);
                      }

                      ?>
                            <h4><?php echo $hero['heroName']; ?></h4>
                      <img src='Images/<?php echo $hero['heroImage']; ?>' />
                      <p><?php echo $hero['heroDescription']; ?></p>
                      <br />
                      <h6>Hero Powers</h6>
                      <div class = "heropower"><?php echo $hero['heroPower']; ?></div>
                      <br />
                      <?php
                      if(!$errorMessage == "")
                      {
                        echo $errorMessage;
                      }
                      ?>
                      <div id="warning">!Please fill in the rating and review!</div>
                      <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" class="frmRate">
                            <fieldset>
                              <div class="rate">
                                     <input type="radio" id="rating10" name="rating" value="10" />
                                     <label class="lblRating" for="rating10" title="5 stars"></label>

                                     <input type="radio" id="rating8" name="rating" value="8" />
                                     <label class="lblRating" for="rating8" title="4 stars"></label>
                                     <input type="radio" id="rating6" name="rating" value="6" />
                                     <label class="lblRating" for="rating6" title="3 stars"></label>
                                     <input type="radio" id="rating4" name="rating" value="4" />
                                     <label class="lblRating" for="rating4" title="2 stars"></label>
                                     <input type="radio" id="rating2" name="rating" value="2" />
                                     <label class="lblRating" for="rating2" title="1 star"></label>
                                     <input type="radio" id="rating0" name="rating" value="0" />
                                     <label class="lblRating" for="rating0" title="No star"></label>
                           </div>
                                   <div class="divSubmit">
                             Review:
                                       <input type="hidden" name="heroId" value="<?php echo $hero['heroId']; ?>"/>
                              <textarea name="comment" rows="5" cols="40"></textarea>
                              <input type="submit" name="submitRating" value="Rate Hero"/>
                              <br/>
                                   </div>
                               </fieldset>
                  </div>
                </form>

	</div>
  <div id="footerindex">
  Made by Daan Hertogs    |     ROC Ter AA     | © 2018
  </div>

</body>
</html>

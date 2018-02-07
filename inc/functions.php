<?php
/*
Get teams from database
*/
function connectToDB()
{
    $host    = "localhost"; // naam / locatie database server
    $user    = "root"; // gebruikersnaam om in te loggen op de database server
    $pass    = ""; // wachtwoord usbw voor usb webserver
    $dB        = "dc-heroes"; // naam van de database

    $conn = new mysqli($host, $user, $pass, $dB);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }else{
        return $conn;
    }
}
?>

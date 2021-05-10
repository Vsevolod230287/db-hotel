<?php

// definisco server con il database
$servername = 'localhost';
$username ='root';
$password = 'root';
$dbname = 'db hotel';

//mi connetto al database
$conn = new mysqli($servername, $username, $password, $dbname);

//controllo la connessione
if ($conn && $conn ->connect_error) {
    echo "Connection failed: " . $conn->connect_error;
}

?>

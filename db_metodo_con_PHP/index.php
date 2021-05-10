<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>DB Hotel</title>
</head>
<body>
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

  if ($_GET['id']) {
      $stmt = $conn->prepare("SELECT * FROM `stanze` WHERE `id` = ?");
      $stmt->bind_param("i", $_GET['id']);
      $stmt->execute();
      $rows = $stmt->get_result();
      while ($row = $rows->fetch_assoc()) {?>
  <div class="">
    <div class="">

    </div>
    <div class="">
      <strong>id</strong>
      <?= $row['id'] ?>
    </div>
    <div class="">
      <strong>room_number</strong>
      <?= $row['room_number'] ?>
    </div>
    <div class="">
      <strong>floor</strong>
      <?= $row['floor'] ?>
    </div>
    <div class="">
      <strong>beds</strong>
      <?= $row['beds'] ?>
    </div>
  </div>

  <?php
      }
  } else {
      ?>


  <table>
    <th>
      <tr>
        <th>id</th>
        <th>room_number</th>
        <th>floor</th>
      </tr>
    </th>
    <tbody>




      <?php

    $sql = "SELECT * FROM `stanze`";   // la variabile query
    $result = $conn->query($sql);    // salvo il resultato della query in result

    if ($result && $result->num_rows > 0) {  // se l'oggetto restituito dalla query a righe, record
        // la fetch_assoc associa ad ogni ciclo un record(riga), esce dal ciclo quando finiscono le righe
        while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= $row['id'] ?></td>
        <td><a href="/PHP/db-hotel/metodo_con_PHP/?id=<?= $row['id']  ?>"><?= $row['room_number'] ?></a></td>
        <td><?= $row['floor'] ?></td>
      </tr>
      <?php }
    } elseif ($result) { ?>
      <tr>
        <td colspan="6">Nessun risultato</td>
      </tr>
      <?php
    } else { ?>
      <tr>
        <td colspan="6">Errore nella selezione</td>
      </tr>
      <?php
    } ?>


    </tbody>
  </table>
  <?php
  }
    $conn->close();
    ?>

</body>
</html>

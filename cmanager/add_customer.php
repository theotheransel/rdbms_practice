<?php 
    include('includes/database.php');
    if ($_POST) {
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $name = $_POST['Name'];
        $address1 = $_POST['Address1'];
        $address2 = $_POST['Address2'];
        $statement = $db->prepare("INSERT INTO Users (Name) "
                . "VALUES (:name)");
        $statement->bindParam(":name", $name);
        try {
            $statement->execute();
            $db->commit();
            $db->beginTransaction();
            $statement = $db->prepare("SELECT MAX(UserID) AS 'UserID' FROM Users WHERE Name=:name");
            $statement->bindParam(":name", $name);
            $statement->execute();
            $db->commit();
            $db->beginTransaction();
            $result = 0;
            while($row = $statement->fetch()) {
                $result += $row['UserID'];
            }
            
            $statement = $db->prepare("INSERT INTO useraddresses (UserID, Address1, Address2) "
                . "VALUES (:userID, :address1, :address2)");
                        
            $statement->bindParam(":userID", $result);
            $statement->bindParam(":address1", $address1);
            $statement->bindParam(":address2", $address2);
            $statement->execute();

            $db->commit();
            
        } catch (PDOException $ex) {
            echo 'error' . $ex->getMessage();
        } 
}

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <title>CManager | Add Customer</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumbotron-narrow.css" rel="stylesheet">
      
  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a href="index.php">Home</a></li>
            <li role="presentation" class="active"><a href="add_customer.php">Add Customer</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Store CManager</h3>
      </div>

      <div class="row marketing">
        <div class="col-lg-12">
          <h2>Add Customer</h2>
          <form role='form' method='post' action='add_customer.php'>
            <div class="form-group">
              <label>Name</label>
              <input name='Name' type="text" class="form-control" placeholder="Customer Name">
            </div>
            <div class="form-group">
              <label>Address1</label>
              <input name='Address1' type="text" class="form-control" placeholder="address line 1">
            </div>
              <div class="form-group">
              <label>Address2</label>
              <input name='Address2' type="text" class="form-control" placeholder="address line 2">
            </div>
            <input type="submit" class="btn btn-default" value='Add Customer'/>
          </form>
        </div>

        <div class="col-lg-6">
        </div>
      </div>

      <footer class="footer">
        <p>&copy; 2016 Company, Inc.</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
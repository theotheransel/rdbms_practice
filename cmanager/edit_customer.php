<?php 
    include('includes/database.php');
    $id = $_GET['id'];
    $query = $db->prepare("SELECT * FROM users INNER JOIN useraddresses ON "
            . "users.UserID=useraddresses.UserID WHERE users.UserID=:userid");
    $query->bindparam(":userid", $id);
    try {
        $query->execute();
        $db->commit();
    } catch (PDOException $ex) {
        echo $ex->getMessage() . ' on line ' . $ex->getLine();
    }
    
    while ($row = $query->fetch()) {
                $name = $row['Name'];
                $address1 = $row['Address1'];
                $address2 = $row['Address2'];
            }
   
?>
<?php
    
    if ($_POST) {
        
        if (isset($_POST['deleteUser']) && (is_numeric($_POST['deleteUser']))) {
        $userid = $_GET['id'];
        try {
            $db->beginTransaction();
            $statement = $db->prepare("DELETE FROM Users WHERE "
                    . "UserID=:id");
            $statement->bindParam(":id", $userid);
            $statement->execute();
            $db->commit();
        } catch (PDOException $ex) {
            echo 'Couldn\'t delete: '. $ex->getMessage();
        }
        $msg = "Customer Deleted";
        header('location:index.php?msg='.urlencode($msg).'');
        exit;
        }

        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $name = $_POST['Name'];
        $address1 = $_POST['Address1'];
        $address2 = $_POST['Address2'];
        $id = $_GET['id'];
        try {
            $db->beginTransaction();
            $statement = $db->prepare("UPDATE Users, useraddresses SET "
                    . "Users.Name=:name, useraddresses.Address1=:address1, "
                    . "useraddresses.Address2=:address2 WHERE "
                    . "Users.UserID=:id AND useraddresses.UserID=:id");
            $statement->bindParam(":name", $name);
            $statement->bindParam(":address1", $address1);
            $statement->bindParam(":address2", $address2);
            $statement->bindParam(":id", $id);
            $statement->execute();
            $db->commit();
            $db->begintransaction();  
        }
        
        catch (PDOException $ex) {
            echo 'error: ' . $ex->getMessage();
        }
        $msg = "Customer Updated";
        header('location:index.php?msg='.urlencode($msg).'');
        exit;
    }
    
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <title>CManager | Edit Customer</title>

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
            <li role="presentation" class="active"><a href="add_customer.php">Edit Customer</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Store CManager</h3>
      </div>

      <div class="row marketing">
        <div class="col-lg-12">
          <h2>Edit Customer</h2>
          <form role='form' method='post' action='edit_customer.php?id=<?php
          echo $id;
          ?>'>
            <div class="form-group">
              <label>Name</label>
              <input name='Name' type="text" class="form-control" value='<?php echo $name; ?>' placeholder="Customer Name">
            </div>
            <div class="form-group">
              <label>Address1</label>
              <input name='Address1' type="text" class="form-control" value='<?php echo $address1; ?>' placeholder="address line 1">
            </div>
              <div class="form-group">
              <label>Address2</label>
              <input name='Address2' type="text" class="form-control" value='<?php echo $address2; ?>' placeholder="address line 2">
            </div>
            <input type="submit" class="btn btn-default" value='Update Customer'/>
            
          </form>
          <form role='form' method='post' action='edit_customer.php?id=<?php
          echo $id;
          ?>'>
              <button type="submit" class="btn btn-danger" name="deleteUser" value="<?php echo $id ?>">Delete Customer</button>
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
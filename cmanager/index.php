<?php include('includes/database.php');?>
<?php 
    $query = "SELECT * FROM users "
            . "INNER JOIN useraddresses ON useraddresses.userID=users.userID "
            . "ORDER BY users.Name";
    
    //getting results
    $result = $db->query($query) or die($db->errorinfo()[1] . $db->errorinfo()[2]);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <title>CManager | Dashboard</title>

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
            <li role="presentation" class="active"><a href="index.php">Home</a></li>
            <li role="presentation"><a href="add_customer.php">Add Customer</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Store CManager</h3>
      </div>

      <div class="row marketing">
        <div class="col-lg-12">
		<?php if(null !== (filter_input(INPUT_GET, 'msg'))){
			echo '<div class="msg">'.filter_input(INPUT_GET, 'msg').'</div>';
		}
		?>
          <h2>Customers</h2>
          <table class="table table-striped">
              <tr>
                  <th>Customer Name</th>
                  <th>Address</th>
                  <th>Address 2</th>
                  <th></th>
                  
              </tr>
                  <?php if($result->RowCount() > 0) {
                      
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                          $output = '<tr>';
                          $output .= '<td>'. $row['Name']. '</td>';
                          $output .= '<td>'. $row['Address1'] .'</td>';
                          $output .= '<td>'. $row['Address2'] .'</td>';
                          $output .= '<td>' .'<a href=edit_customer.php?id='. $row["UserID"].' class="btn btn-default btn-sm">Edit</a>'.'</td>';
                          $output .= '</tr>';
                          echo $output;
                      }                     
                      }
                      else {
                          echo 'Sorry, no customers found.';
                      }
                  ?>
          </table>
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

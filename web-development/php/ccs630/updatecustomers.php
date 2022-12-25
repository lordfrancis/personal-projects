<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>Lord Francis<br>Navarro<br></span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="index.php"><i class="fas fa-table"></i><span style="margin-left: 10px;">Manage Customer</span></a></li>
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
                <div class="text-center d-none d-md-inline"></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content" style="margin-top: 20px;">
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Manage Customers</h3>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Customer List</p>
                        </div>
                        <div class="card-body">
                           
                            <div class="table-responsive table mt-2" id="dataTables" role="grid" aria-describedby="dataTable_info">
                                <table class="table dataTable my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>First Name</th>
                                            <th>Middle Name</th>
                                            <th>Last Name</th>
                                            <th>Street</th>
                                            <th>City</th>
                                            <th>Country</th>
                                            <th>Post Code</th>
                                             <th>Phone Number</th>
                                            <th>Job Title</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><img class="rounded-circle mr-2" width="30" height="30" src="assets/img/avatars/avatar1.jpeg">Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>33</td>
                                            <td>2008/11/28</td>
                                            <td>$162,700</td>
                                            <td> <button type="button" class="btn btn-primary">Update</button> <button type="button" class="btn btn-danger"> Delete </button>
                                        </tr>
                                    </tbody>
                                
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                   
                                </div>
                                <div class="col-md-6">
                                   <button class="btn btn-danger d-inline-block float-right" type="button" style="margin-left: 10px;" name="deleteBtn" id="deleteBtn">Delete</button> <button class="btn btn-warning d-inline-block float-right" type="button" style="margin-left: 10px;" name="updateBtn" id="updateBtn">Update</button> <button class="btn btn-success d-inline-block float-right" type="button" style="margin-left: 10px;" name="addBtn" id="addBtn" data-toggle="modal" href="#modal1" >Add Customer</button>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- MODAL 1 -->
        <div class="modal fade" role="dialog" tabindex="-1" id="modal1">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title">Add New Customer</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                    <div class="modal-body">
                        <form method="post" action="custDb.php" name="adduserform" id="adduserform">
                            <div class="form-group"><input class="form-control" type="text" name="fname" placeholder="Firstname"></div>
                            <div class="form-group"><input class="form-control" type="text" name="mname" placeholder="Middle Name"></div>
                            <div class="form-group"><input class="form-control" type="text" name="lname" placeholder="Last Name"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Street" name="street"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="City" name="city"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Country" name="country"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Postcode" name="postcode"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Phone Number" name="pnum"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Job Title" name="jobtitle"></div>
                    </div>
                    <div class="modal-footer"><button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button><input type="submit" class="btn btn-primary" id="addCustomer" name="addCustomer" type="button"></div>
                    </form>
                </div>
            </div>
        </div>
        <!-- END OF MODAL 1 -->

            <?php

            $userId =  $_GET['id'];

            
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "ccs_630_test";

            // Create connection
             $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
                if ($conn->connect_error) {
                 die("Connection failed: " . $conn->connect_error);
             }

             $sql = "SELECT first_name, last_name, middle_name, street_name, city, country, postcode, phone_number, job_title FROM customers where customer_id=".$userId;
             $result = mysqli_query($conn, $sql);

             $fname;
             $mname; $lname; $email; $cnum; $username; $password;

             if (mysqli_num_rows($result) > 0) {
              // output data of each row
              while($row = mysqli_fetch_assoc($result)) {
                    $fname = $row["first_name"];
                    $lname = $row["last_name"];
                    $mname = $row["middle_name"];
                    $sname = $row["street_name"];
                    $city = $row["city"];
                    $country = $row["country"];
                    $postcode = $row["postcode"];
                    $pnum = $row["phone_number"];
                    $job_title = $row["job_title"];

              }
                } else {
              echo "0 results";
            }   
        ?>
        

               <!-- MODAL 2 -->
        <div class="modal fade" role="dialog" tabindex="-1" id="modal2">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title">Update Customer</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                    <div class="modal-body">
                        <form method="post" action="updateDB.php" name="updatecustomerform" id="updatecustomerform">

                            <input type="hidden" id="custId" name="custId" value="<?php  echo $userId ?>">
                            <div class="form-group"><input class="form-control" type="text" name="fname" placeholder="Firstname" value="<?php  echo $fname ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" name="mname" placeholder="Middle Name" value="<?php  echo $mname ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" name="lname" placeholder="Last Name" value="<?php  echo $lname ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Street" name="street" value="<?php  echo $sname ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="City" name="city" value="<?php  echo $city ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Country" name="country" value="<?php  echo $country ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Postcode" name="postcode" value="<?php  echo $postcode ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Phone Number" name="pnum" value="<?php  echo $pnum ?>"></div>
                            <div class="form-group"><input class="form-control" type="text" placeholder="Job Title" name="jobtitle" value="<?php  echo $job_title ?>"></div>
                    </div>
                    <div class="modal-footer"><button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button><input type="submit" class="btn btn-primary" id="updateCustomer" name="updateCustomer" type="button"></div>
                    </form>
                </div>
            </div>
        </div>
        <!-- END OF MODAL 2 -->

            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © Brand 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

    <script>
     $(document).ready( function () {
         $('#modal2').modal('show');
         setDataTable();
         deleteButton();
       
           
        });

      function setDataTable(){
        $('#dataTable').DataTable({
                "processing": true,
                "serverSide": true,
                "ajax": "custData.php",
                "columnDefs": [{
                        "targets": [0],
                        "visible": false,
                        "searchable": false
                    }],
                "pageLength": 5,
                "lengthMenu": [5,10,20]    
            });

        var table = $('#dataTable').DataTable();

         $('#dataTable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });


          $('#deleteBtn').click( function () {
                var row = table.row('.selected').index();
                var rowData = table.row(row,1).data();
                var idString = rowData[0].toString();


                if (confirm('Are you sure you want to remove this customer?')) {
                       $.ajax({
                        type: "POST",
                        url: "removecustomer.php",
                        datatype:'text',
                        data: {
                            id: idString
                        }
                        })
                        .done(function (msg) {
                            alert("Data Saved: " + msg);
                            location.reload();
                        });

                } else {
                  // Do nothing!
                  console.log('Thing was not saved to the database.');
                }        
         });

           $('#updateBtn').click( function () {
                var row = table.row('.selected').index();
                var rowData = table.row(row,1).data();
                var idString = rowData[0].toString();

                window.open("staff_updateusers.php?id="+ idString, "_self");


         });

    }
    </script>

</body>

</html>
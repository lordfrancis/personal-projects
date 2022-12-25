<?php

/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simple to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See http://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - http://datatables.net/license_mit
 */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */

// DB table to use
$table = 'customers';

// Table's primary key
$primaryKey = 'customer_id';

// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
    array( 'db' => 'customer_id', 'dt' => 0 ),
    array( 'db' => 'first_name',  'dt' => 1 ),
    array( 'db' => 'middle_name', 'dt' => 2 ),
    array( 'db' => 'last_name', 'dt' => 3 ),
    array( 'db' => 'street_name', 'dt' => 4),
    array( 'db' => 'city', 'dt' => 5),
    array( 'db' => 'country', 'dt' => 6),
    array( 'db' => 'postcode', 'dt' => 7),
    array( 'db' => 'phone_number', 'dt' => 8),
    array( 'db' => 'job_title', 'dt' => 9)      
);

// SQL server connection information
// $sql_details = array(
//     'user' => 'ccs_630_user',
//     'pass' => '12345678x',
//     'db'   => 'ccs_630_test',
//     'host' => '45.62.239.237'
// );

$sql_details = array(
    'user' => 'root',
    'pass' => '',
    'db'   => 'ccs_630_test',
    'host' => 'localhost'
);


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */

require( 'ssp.class.php' );

echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns)
);
?>
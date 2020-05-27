<?php

function format_errors($errors)
{
    echo 'Error information: ';
    foreach ($errors as $error) {
        echo 'SQLSTATE: ' . $error['SQLSTATE'] . '';
        echo 'Code: ' . $error['code'] . '';
        echo 'Message: ' . $error['message'] . '';
    }
}
 ?>

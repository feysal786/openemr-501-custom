<?php
//  OpenEMR MySQL Config

$host	= 'MYSQL_HOST';
$port	= 'MYSQL_PORT';
$login	= 'MYSQL_USER';
$pass	= 'MYSQL_PASSWORD';
$dbase	= 'MYSQL_DATABASE';

//Added ability to disable
//utf8 encoding - bm 05-2009

global $disable_utf8_flag;
$disable_utf8_flag = false;

$sqlconf = array();
global $sqlconf;
$sqlconf["host"]= $host;
$sqlconf["port"] = $port;
$sqlconf["login"] = $login;
$sqlconf["pass"] = $pass;
$sqlconf["dbase"] = $dbase;

// $config=1 means that this site is already configured.
// i.e. it has a DB already setup, and the sites directory already has content.

// DO NOT TOUCH THIS:
$config = 1; 

?>

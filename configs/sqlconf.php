<?php
//  OpenEMR MySQL Config

$host	= 'SQLHOST';
$port	= 'SQLPORT';
$login	= 'LOGIN';
$pass	= 'PASSWORD';
$dbase	= 'DBNAME';

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

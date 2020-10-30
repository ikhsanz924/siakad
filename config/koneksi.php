<?php
date_default_timezone_set('Asia/Jakarta');
$server = "localhost";
$username = "root";
$password = "";
$database = "siakad";

$koneksi = mysqli_connect($server,$username,$password,$database); 
mysqli_connect($server,$username,$password,$database);

if (mysqli_connect_errno()){
	echo "<h1>Koneksi database gagal : " . mysqli_connect_error() . "</h1>";
	exit();
}
function anti_injection($data){
  global $koneksi;
  $filter = mysqli_real_escape_string($koneksi, stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  return $filter;  
}

function average($arr){
   if (!is_array($arr)) return false;
   return array_sum($arr)/count($arr);
}

function cek_session_admin(){
	$level = $_SESSION[level];
	if ($level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_guru(){
	$level = $_SESSION[level];
	if ($level != 'guru' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_keuangan(){
	$level = $_SESSION[level];
	if ($level != 'keuangan' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_manmutu(){
	$level = $_SESSION[level];
	if ($level != 'manmutu' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_lsp(){
	$level = $_SESSION[level];
	if ($level != 'kurikulum' AND $level != 'lsp' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_kesiswaan(){
	$level = $_SESSION[level];
	if ($level != 'kesiswaan' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_bkk(){
	$level = $_SESSION[level];
	if ($level != 'bkk' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_humas(){
	$level = $_SESSION[level];
	if ($level != 'humas' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_subrayon(){
	$level = $_SESSION[level];
	if ($level != 'kurikulum' AND $level != 'subrayon' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}
function cek_session_sarpras(){
	$level = $_SESSION[level];
	if ($level != 'sarpras' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_tu(){
	$level = $_SESSION[level];
	if ($level != 'sarpras' AND $level != 'tu' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}

function cek_session_kurikulum(){
	$level = $_SESSION[level];
	if ($level != 'kurikulum' AND $level != 'superuser' AND $level != 'kepala'){
		echo "<script>document.location='index.php';</script>";
	}
}
function cek_session_siswa(){
	$level = $_SESSION[level];
	if ($level == ''){
		echo "<script>document.location='index.php';</script>";
	}
}



?>
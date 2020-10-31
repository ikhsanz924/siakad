<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Jadwal Kegiatan Rekruitasi </h3>
                  <?php if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=jadwalrekrut&act=tambahjadwalrekrut'>Tambahkan Data Dokumen</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Nama Kegiatan</th>
                        <th>Tanggal</th>
                        <?php if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){ ?>
                        <th style='width:70px'>Action</th>
                        <?php } ?>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM dokumen_jadwal_rekruitasi");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[nm_dokumen]</td>
                              <td>$r[tanggal]</td>";
                              if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){
                        echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=jadwalrekrut&act=detailjadwalrekrut&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=jadwalrekrut&act=editjadwalrekrut&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=jadwalrekrut&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }else{
                                echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=jadwalrekrut&act=detailjadwalrekrut&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM dokumen_jadwal_rekruitasi where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=jadwalrekrut';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET[act]=='tambahjadwalrekrut'){
  if (isset($_POST[tambah])){
      $day1 = strtotime($_POST["ac"]);
      $day1 = date('Y-m-d', $day1);
      $dir_file = 'jadwal_kegiatan_rekruitasi/';
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_file . $filenamee;
      
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"INSERT INTO dokumen_jadwal_rekruitasi(file_jadwal,nm_dokumen, tanggal) VALUES('$filenamee','$_POST[ab]','$day1')");
          }
      }else{
          mysqli_query($koneksi,"INSERT INTO dokumen_jadwal_rekruitasi (nm_dokumen, tanggal)  VALUES('$_POST[ab]','$day1')");
        }
        echo "<script>document.location='index.php?view=jadwalrekrut';</script>";
  }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Jadwal Rekrutasi</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-6'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>File Dokumen</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='ax' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Nama Kegiatan</th>               <td><input type='text' class='form-control' name='ab'></td></tr>
                    <tr><th scope='row'>Tanggal</th>               <td><input type='date' class='form-control' name='ac'></td></tr>
                  </tbody>
                  </table>
                </div>
                <div style='clear:both'></div>
                        <div class='box-footer'>
                          <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                          <a href='index.php?view=jadwalrekrut'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                        </div> 
              </div>
            </form>
            </div>";
}elseif($_GET[act]=='editjadwalrekrut'){
  if (isset($_POST[update])){
      $day1 = strtotime($_POST["ac"]);
      $day1 = date('Y-m-d', $day1);
      $dir_file = 'jadwal_kegiatan_rekruitasi/';
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_file . $filenamee;
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"UPDATE dokumen_jadwal_rekruitasi SET  file_jadwal = '$filenamee', nm_dokumen = '$_POST[ab]', tanggal = '$day1' WHERE id = $_POST[id]");
        }
      }else{
          mysqli_query($koneksi,"UPDATE dokumen_jadwal_rekruitasi SET nm_dokumen = '$_POST[ab]', tanggal = '$day1' WHERE id = $_POST[id]");
      }
      echo "<script>document.location='index.php?view=jadwalrekrut';</script>";
  }

    $detail = mysqli_query($koneksi,"SELECT * FROM dokumen_jadwal_rekruitasi where id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
    echo    "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data File TUK</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>Ganti File Dokumen</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='ax' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Nama Kegiatan</th>               <td><input type='text' class='form-control' value='$s[nm_dokumen]' name='ab'></td></tr>
                    <tr><th scope='row'>Tanggal</th>           <td><input type='date' class='form-control' value='$s[tanggal]' name='ac'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}elseif($_GET[act]=='detailjadwalrekrut'){
    $detail = mysqli_query($koneksi,"SELECT*FROM dokumen_jadwal_rekruitasi WHERE id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
  
    echo "<div class='col-xs-12'>  
    <div class='box'>
      <div class='box-header'>
        <h3 class='box-title'>Dokumen Kegiatan</h3>
      </div><!-- /.box-header -->
      <div class='box-body'>
          <div style='padding:10px;'>
            <embed src='jadwal_kegiatan_rekruitasi/$s[file_jadwal]' quality='high' name='fb' allowScriptAccess='always' allowFullScreen='true' pluginpage='http://www.adobe.com/go/getreader' type='application/pdf' width='100%' height='1100'></embed>
          </div>
      </div><!-- /.box-body -->
    </div><!-- /.box -->
  </div>";
}  
?>
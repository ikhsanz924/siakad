<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Hasil Notulensi Rapat Sub Rayon </h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=hasilnotulensi&act=tambahnotulensi'>Tambahkan Data Hasil Notulensi</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Judul Notulensi</th>
                        <th>Tanggal</th>
                        <th>Tempat</th>
                        <th>Keterangan</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM hasil_notulensi");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[judul_notulensi]</td>
                              <td>$r[tanggal]</td>
                              <td>$r[tempat]</td>
                              <td>$r[keterangan]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=hasilnotulensi&act=detailhasilnotulensi&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=hasilnotulensi&act=edithasilnotulensi&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=hasilnotulensi&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }else{
                                echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=jadwalujian&act=detailjadwalujian&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM hasil_notulensi where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=hasilnotulensi';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET[act]=='tambahnotulensi'){
  if (isset($_POST[tambah])){
      $day1 = strtotime($_POST["ac"]);
      $day1 = date('Y-m-d', $day1);
      $dir_file = 'hasil_notulensi/';
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_file . $filenamee;
      
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"INSERT INTO hasil_notulensi(file_notulensi, judul_notulensi, tanggal, tempat, keterangan) VALUES('$filenamee','$_POST[ab]','$day1','$_POST[ad]','$_POST[ae]')");
          }
      }else{
          mysqli_query($koneksi,"INSERT INTO hasil_notulensi(judul_notulensi, tanggal, tempat, keterangan)  VALUES('',$_POST[ab]','$day1','$_POST[ad]','$_POST[ae]')");
        }
        echo "<script>document.location='index.php?view=hasilnotulensi';</script>";
  }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Hasil Notulensi</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-6'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>File Notulensi</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='ax' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Judul Notulensi</th>               <td><input type='text' class='form-control' name='ab'></td></tr>
                    <tr><th scope='row'>Tanggal</th>                  <td><input type='date' class='form-control' name='ac'></td></tr>
                    <tr><th scope='row'>Tempat</th>                  <td><input type='text' class='form-control' name='ad'></td></tr>
                    <tr><th scope='row'>Keterangan</th>                  <td><input type='text' class='form-control' name='ae'></td></tr>
                  </tbody>
                  </table>
                </div>
                <div style='clear:both'></div>
                        <div class='box-footer'>
                          <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                          <a href='index.php?view=hasilnotulensi'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                        </div> 
              </div>
            </form>
            </div>";
}elseif($_GET[act]=='edithasilnotulensi'){
  if (isset($_POST[update])){
      $day1 = strtotime($_POST["ac"]);
      $day1 = date('Y-m-d', $day1);
      $dir_file = 'hasil_notulensi/';
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_file . $filenamee;
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"UPDATE hasil_notulensi SET  file_notulensi = '$filenamee', judul_notulensi = '$_POST[ab]', tanggal = '$day1', tempat = '$_POST[ad]', keterangan = '$_POST[ae]'WHERE id = $_POST[id]");
        }
      }else{
          mysqli_query($koneksi,"UPDATE hasil_notulensi SET judul_notulensi = '$_POST[ab]', tanggal = '$day1', tempat = '$_POST[ad]', keterangan = '$_POST[ae]'WHERE id = $_POST[id]");
      }
      echo "<script>document.location='index.php?view=hasilnotulensi';</script>";
  }

    $detail = mysqli_query($koneksi,"SELECT * FROM hasil_notulensi where id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
    echo    "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Hasil Notulensi</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>Ganti File Notulensi</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='ax' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Semester</th>               <td><input type='text' class='form-control' value='$s[judul_notulensi]' name='ab'></td></tr>
                    <tr><th scope='row'>Tanggal</th>           <td><input type='date' class='form-control' value='$s[tanggal]' name='ac'></td></tr>
                    <tr><th scope='row'>Tempat</th>               <td><input type='text' class='form-control' value='$s[tempat]' name='ad'></td></tr>
                    <tr><th scope='row'>Keterangan</th>               <td><input type='text' class='form-control' value='$s[keterangan]' name='ae'></td></tr>
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
}elseif($_GET[act]=='detailhasilnotulensi'){
    $detail = mysqli_query($koneksi,"SELECT*FROM hasil_notulensi WHERE id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
  
    echo "<div class='col-xs-12'>  
    <div class='box'>
      <div class='box-header'>
        <h3 class='box-title'>Hasil Notulensi</h3>
      </div><!-- /.box-header -->
      <div class='box-body'>
          <div style='padding:10px;'>
            <embed src='hasil_notulensi/$s[file_notulensi]' quality='high' name='fb' allowScriptAccess='always' allowFullScreen='true' pluginpage='http://www.adobe.com/go/getreader' type='application/pdf' width='100%' height='1100'></embed>
          </div>
      </div><!-- /.box-body -->
    </div><!-- /.box -->
  </div>";
}  
?>
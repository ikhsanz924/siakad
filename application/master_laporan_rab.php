<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Laporan RAB</h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=laporanrab&act=tambah'>Tambahkan Data Arsip</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Dokumen RAB</th>
                        <th>tanggal</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM laporan_rab");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[nm_rab]</td>
                              <td>$r[tanggal]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=laporanrab&act=detail&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=laporanrab&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=laporanrab&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }else{
                                echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=laporanrab&act=detail&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM laporan_rab where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=laporanrab';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET[act]=='tambah'){
  if (isset($_POST[tambah])){$day1 = strtotime($_POST["c"]);
    $day1 = date('Y-m-d', $day1);
    $dir_file = 'laporan_rab/';
    $filename = basename($_FILES['a']['name']);
    $filenamee = date("Ymd").'-'.basename($_FILES['a']['name']);
    $uploadfile = $dir_file . $filenamee;
    
    if ($filename != ''){      
      if (move_uploaded_file($_FILES['a']['tmp_name'], $uploadfile)) {
        mysqli_query($koneksi,"INSERT INTO laporan_rab(file_rab, nm_rab, tanggal) VALUES('$filenamee','$_POST[b]','$day1')");
        }
    }else{
        mysqli_query($koneksi,"INSERT INTO laporan_rab(nm_rab, tanggal)  VALUES('$_POST[b]','$day1')");
      }
      echo "<script>document.location='index.php?view=laporanrab';</script>";
  }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data RAB</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-6'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>File RAB</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='a' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Judul RAB</th>               <td><input type='text' class='form-control' name='b'></td></tr>
                    <tr><th scope='row'>Tanggal</th>               <td><input type='date' class='form-control' name='c'></td></tr>
                  </tbody>
                  </table>
                </div>
                <div style='clear:both'></div>
                        <div class='box-footer'>
                          <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                          <a href='index.php?view=dataarsip'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                        </div> 
              </div>
            </form>
            </div>";
}elseif($_GET[act]=='edit'){
  if (isset($_POST[update])){
    $day1 = strtotime($_POST["c"]);
    $day1 = date('Y-m-d', $day1);
    $dir_file = 'laporan_rab/';
    $filename = basename($_FILES['a']['name']);
    $filenamee = date("Ymd").'-'.basename($_FILES['a']['name']);
    $uploadfile = $dir_file . $filenamee;
    if ($filename != ''){      
      if (move_uploaded_file($_FILES['a']['tmp_name'], $uploadfile)) {
        mysqli_query($koneksi,"UPDATE laporan_rab SET  file_rab = '$filenamee', nm_rab = '$_POST[b]', tanggal = '$day1' WHERE id = $_POST[id]");
      }
    }else{
        mysqli_query($koneksi,"UPDATE laporan_rab SET nm_rab = '$_POST[b]', tanggal = '$day1' WHERE id = $_POST[id]");
    }
    echo "<script>document.location='index.php?view=laporanrab';</script>";
}

  $detail = mysqli_query($koneksi,"SELECT * FROM laporan_rab where id='$_GET[id]'");
  $s = mysqli_fetch_array($detail);
  echo    "<div class='col-md-12'>
            <div class='box box-info'>
              <div class='box-header with-border'>
                <h3 class='box-title'>Edit Data Laporan RAB</h3>
              </div>
            <div class='box-body'>
            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
              <div class='col-md-12'>
                <table class='table table-condensed table-bordered'>
                <tbody>
                <tr><th scope='row'>Ganti File RAB</th>             <td><div style='position:relative;''>
                <a class='btn btn-primary' href='javascript:;'>
                  <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                  <input type='file' class='files' name='a' onchange='$("#upload-file-info").html($(this).val());'>
                <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
              </div>
              </td></tr>
                  <tr><th scope='row'>Nama Dokumen</th>               <td><input type='text' class='form-control' value='$s[nm_rab]' name='b'></td></tr>
                  <tr><th scope='row'>Tanggal</th>           <td><input type='date' class='form-control' value='$s[tanggal]' name='c'></td></tr>
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
}elseif($_GET[act]=='detail'){
    $detail = mysqli_query($koneksi,"SELECT*FROM laporan_rab WHERE id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
  
    echo "<div class='col-xs-12'>  
    <div class='box'>
      <div class='box-header'>
        <h3 class='box-title'>File Laporan RAB</h3>
      </div><!-- /.box-header -->
      <div class='box-body'>
          <div style='padding:10px;'>
            <embed src='laporan_rab/$s[file_rab]' quality='high' name='fb' allowScriptAccess='always' allowFullScreen='true' pluginpage='http://www.adobe.com/go/getreader' type='application/pdf' width='100%' height='1100'></embed>
          </div>
      </div><!-- /.box-body -->
    </div><!-- /.box -->
  </div>";
}  
?>
<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Surat Masuk & Keluar</h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=surat&act=tambah'>Tambahkan Data Arsip</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Dokumen Surat</th>
                        <th>Jenis Surat</th>
                        <th>Tanggal</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM surat");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[nm_dokumen]</td>
                              <td>$r[jenis_surat]</td>
                              <td>$r[tanggal]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=laporanmutu&act=detail&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=laporanmutu&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=laporanmutu&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }else{
                                echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=laporanmutu&act=detail&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM laporan_mutu where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=laporanmutu';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET[act]=='tambah'){
  if (isset($_POST[tambah])){
      
      $day1 = strtotime($_POST["d"]);
      $day1 = date('Y-m-d', $day1);
      $dir_file = 'surat/';
      $filename = basename($_FILES['a']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['a']['name']);
      $uploadfile = $dir_file . $filenamee;
      
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['a']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"INSERT INTO surat(file_dokumen, nm_dokumen, jenis_surat, tanggal) VALUES('$filenamee','$_POST[b]','$_POST[c]','$day1')");
          }
      }else{
          mysqli_query($koneksi,"INSERT INTO surat(nm_dokumen, jenis_surat, tanggal)  VALUES('$_POST[b]','$_POST[c]','$day1')");
        }
        echo "<script>document.location='index.php?view=surat';</script>";
  }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Surat</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-6'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>File Surat</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='a' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Judul Surat</th>               <td><input type='text' class='form-control' name='b'></td></tr>
                    <tr><th scope='row'>Jenis Surat</th>               <td><select name='c'>
                                                                          <option value='Surat Masuk'>Surat Masuk</option>
                                                                          <option value='Surat Keluar'>Surat Keluar</option></select></td></tr>
                    <tr><th scope='row'>Tanggal</th>               <td><input type='date' class='form-control' name='d'></td></tr>
                  </tbody>
                  </table>
                </div>
                <div style='clear:both'></div>
                        <div class='box-footer'>
                          <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                          <a href='index.php?view=surat'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                        </div> 
              </div>
            </form>
            </div>";
}elseif($_GET[act]=='edit'){
  if (isset($_POST[update])){

      $day1 = strtotime($_POST["c"]);
      $day1 = date('Y-m-d', $day1);
      $dir_file = 'surat/';
      $filename = basename($_FILES['a']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_file . $filenamee;
      if ($filename != ' '){      
        if (move_uploaded_file($_FILES['a']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"UPDATE surat SET  nm_dokumen = '$filenamee', tahun = '$_POST[ab]' WHERE id = $_POST[id]");
        }
      }else{
          mysqli_query($koneksi,"UPDATE surat SET tahun = '$_POST[ab]' WHERE id = $_POST[id]");
      }
      echo "<script>document.location='index.php?view=dataarsip';</script>";
  }

    $detail = mysqli_query($koneksi,"SELECT * FROM arsip_dudi where id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
    echo    "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Data File Laporan Mutu</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>Ganti File Arsip</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='a' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Juduk Laporan</th>           <td><input type='text' class='form-control' value='$s[nm_dokumen]' name='b'></td></tr>
                    <tr><th scope='row'>Tanggal</th>           <td><input type='text' class='form-control' value='$s[tanggal]' name='c'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php?view=laporanmutu'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}elseif($_GET[act]=='detail'){
    $detail = mysqli_query($koneksi,"SELECT*FROM surat WHERE id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
  
    echo "<div class='col-xs-12'>  
    <div class='box'>
      <div class='box-header'>
        <h3 class='box-title'>File Dokumen</h3>
      </div><!-- /.box-header -->
      <div class='box-body'>
          <div style='padding:10px;'>
            <embed src='surat/$s[file_dokumen]' quality='high' name='fb' allowScriptAccess='always' allowFullScreen='true' pluginpage='http://www.adobe.com/go/getreader' type='application/pdf' width='100%' height='1100'></embed>
          </div>
      </div><!-- /.box-body -->
    </div><!-- /.box -->
  </div>";
}  
?>
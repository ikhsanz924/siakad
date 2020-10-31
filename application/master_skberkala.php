<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data SK Berkala </h3>
                  <?php if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=skberkala&act=tambahskberkala'>Tambahkan Data SK Berkala</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>No Surat</th>
                        <th>Judul Surat</th>
                        <th>Jenis Surat</th>
                        <th>Tanggal</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM sk_berkala");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[no_surat]</td>
                              <td>$r[judul_surat]</td>
                              <td>$r[jenis_surat]</td>
                              <td>$r[tanggal]</td>
                              <td><center>";
                              if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){
                        echo "<a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=skberkala&act=detailskberkala&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=skberkala&act=editskberkala&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=skberkala&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }else{
                                echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=skberkala&act=detailskberkala&id=$r[id]'><span class='glyphicon glyphicon-search'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM sk_berkala where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=skberkala';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET[act]=='tambahskberkala'){
  if (isset($_POST[tambah])){
      $dir_file = 'sk_berkala/';
      $day1 = strtotime($_POST["ae"]);
      $day1 = date('Y-m-d', $day1); 
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_file . $filenamee;
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"INSERT INTO sk_berkala(no_surat, judul_surat, jenis_surat, file_surat, tanggal) VALUES('$_POST[ab]','$_POST[ac]','$_POST[ad]','$filenamee','$day1')");  
        }
      }else{
        mysqli_query($koneksi,"INSERT INTO sk_berkala(no_surat, judul_surat, jenis_surat, tanggal) VALUES('$_POST[ab]','$_POST[ac]','$_POST[ad]','$day1')");
        }
        echo "<script>document.location='index.php?view=skberkala';</script>";
  }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data SK Berkala</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-6'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <tr><th scope='row'>Nomor Surat</th>               <td><input type='text' class='form-control' name='ab'></td></tr>
                    <tr><th scope='row'>Judul Surat</th>                  <td><input type='text' class='form-control' name='ac'></td></tr>
                    <tr><th scope='row'>Jenis Surat</th>               <td><input type='text' class='form-control' name='ad'></td></tr>
                    <tr><th scope='row'>Tanggal</th>                  <td><input type='date' class='form-control' name='ae'></td></tr>
                    <tr><th scope='row'>File SK Berkala</th>             <td><div style='position:relative;''>
                    <a class='btn btn-primary' href='javascript:;'>
                      <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                      <input type='file' class='files' name='ax' onchange='$("#upload-file-info").html($(this).val());'>
                    <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                  </div>
                  </td></tr>
                  </tbody>
                  </table>
                </div>
                <div style='clear:both'></div>
                        <div class='box-footer'>
                          <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                          <a href='index.php?view=skberkala'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                        </div> 
              </div>
            </form>
            </div>";
}elseif($_GET[act]=='editjadwalujian'){
  if (isset($_POST[update])){
    
      $dir_file = 'jadwal_ujian/';
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("Ymd").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_file . $filenamee;
      
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"UPDATE jadwal_ujian SET  nm_ujian = '$filenamee', semester = '$_POST[ab]', tahun = '$_POST[ac]' WHERE id ='$_POST[id]'");
        }
      }else{
          mysqli_query($koneksi,"UPDATE jadwal_ujian SET semester = '$_POST[ab]', tahun = '$_POST[ac]' WHERE id ='$_POST[id]'");
      }
      echo "<script>document.location='index.php?view=jadwalujian';</script>";
  }

    $detail = mysqli_query($koneksi,"SELECT * FROM jadwal_ujian where id='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
    echo    "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Data File Jadwal Ujian</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>Ganti File Jadwal</th>             <td><div style='position:relative;''>
                  <a class='btn btn-primary' href='javascript:;'>
                    <span class='glyphicon glyphicon-search'></span> Browse..."; ?>
                    <input type='file' class='files' name='ax' onchange='$("#upload-file-info").html($(this).val());'>
                  <?php echo "</a> <span style='width:155px' class='label label-info' id='upload-file-info'></span>
                </div>
                </td></tr>
                    <tr><th scope='row'>Semester</th>               <td><input type='text' class='form-control' value='$s[semester]' name='ab'></td></tr>
                    <tr><th scope='row'>Tahun</th>           <td><input type='text' class='form-control' value='$s[tahun]' name='ac'></td></tr>
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
}elseif($_GET[act]=='detailskberkala'){
  $detail = mysqli_query($koneksi,"SELECT*FROM sk_berkala WHERE id='$_GET[id]'");
  $s = mysqli_fetch_array($detail);

  echo "<div class='col-xs-12'>  
  <div class='box'>
    <div class='box-header'>
      <h3 class='box-title'>Isi SK Berkala</h3>
    </div><!-- /.box-header -->
    <div class='box-body'>
        <div style='padding:10px;'>
          <embed src='sk_berkala/$s[file_surat]' quality='high' name='fb' allowScriptAccess='always' allowFullScreen='true' pluginpage='http://www.adobe.com/go/getreader' type='application/pdf' width='100%' height='1100'></embed>
        </div>
    </div><!-- /.box-body -->
  </div><!-- /.box -->
</div>";
}  
?>
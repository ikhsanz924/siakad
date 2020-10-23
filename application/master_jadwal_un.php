<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Jadwal UN</h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=jadwalun&act=tambah'>Tambahkan Data</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Jam</th>
                        <th>Mata Pelajaran</th>
                        <th>Sesi</th>
                        <th>Keterangan</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM jadwal_un");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[tanggal]</td>
                              <td>$r[dari_jam] - $r[sampai_jam]</td>
                              <td>$r[mata_pelajaran]</td>
                              <td>$r[sesi]</td>
                              <td>$r[keterangan]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=jadwalun&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=jadwalun&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM jadwal_un where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=jadwalun';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET[act]=='edit'){
  if (isset($_POST[update])){
    $day1 = strtotime($_POST["a"]);
    $day1 = date('Y-m-d', $day1);
    $time1 = strtotime($_POST["b"]);
    $time1 = date('H:i', $time1);
    $time2 = strtotime($_POST["c"]);
    $time2 = date('H:i', $time2);
      mysqli_query($koneksi,"UPDATE jadwal_un SET tanggal = '$day1',
                                       dari_jam = ' $time1',
                                       sampai_jam = '$time2',
                                       mata_pelajaran = '$_POST[d]',
                                       sesi = '$_POST[e]',
                                       keterangan = '$_POST[f]' where id='$_POST[id]'");
    echo "<script>document.location='index.php?view=jadwalun';</script>";
  }
  $edit = mysqli_query($koneksi,"SELECT * FROM jadwal_un where id='$_GET[id]'");
  $s = mysqli_fetch_array($edit);
  echo "<div class='col-md-12'>
            <div class='box box-info'>
              <div class='box-header with-border'>
                <h3 class='box-title'>Edit Data Jadwal UN</h3>
              </div>
            <div class='box-body'>
            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
              <div class='col-md-12'>
                <table class='table table-condensed table-bordered'>
                <tbody>
                  <input type='hidden' name='id' value='$s[id]'>
                  <tr><th scope='row'>Tanggal</th>          <td><input type='date' class='form-control' value='$s[tanggal]' name='a'></td></tr>
                  <tr><th scope='row'>Dari Jam</th>        <td><input type='time' class='form-control' value='$s[dari_jam]' name='b'></td></tr>
                  <tr><th scope='row'>Sampai Jam</th>              <td><input type='time' class='form-control' value='$s[sampai_jam]' name='c'></td></tr>
                  <tr><th scope='row'>Mata Pelajaran</th>               <td><input type='text' class='form-control' value='$s[mata_pelajaran]' name='d'></td></tr>
                  <tr><th scope='row'>Sesi</th>                <td><input type='text' class='form-control' value='$s[sesi]' name='e'></td></tr>
                  <tr><th scope='row'>Keterangan</th>                <td><input type='text' class='form-control' value='$s[keterangan]' name='f'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='update' class='btn btn-info'>Update</button>
                  <a href='index.php?view=panitiapenyelenggara'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}elseif($_GET[act]=='tambah'){
  if (isset($_POST[tambah])){
      $day1 = strtotime($_POST["a"]);
      $day1 = date('Y-m-d', $day1);
      $time1 = strtotime($_POST["b"]);
      $time1 = date('H:i', $time1);
      $time2 = strtotime($_POST["c"]);
      $time2 = date('H:i', $time2);
      mysqli_query($koneksi,"INSERT INTO jadwal_un VALUES('','$day1','$time1','$time2','$_POST[d]','$_POST[e]','$_POST[f]')");
      echo "<script>document.location='index.php?view=jadwalun';</script>";
  }

  echo "<div class='col-md-12'>
            <div class='box box-info'>
              <div class='box-header with-border'>
                <h3 class='box-title'>Tambah Jadwal UN</h3>
              </div>
            <div class='box-body'>
            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
              <div class='col-md-12'>
                <table class='table table-condensed table-bordered'>
                <tbody>
                <tr><th scope='row'>Tanggal</th>          <td><input type='date' class='form-control' name='a'></td></tr>
                <tr><th scope='row'>Dari Jam</th>        <td><input type='time' class='form-control' name='b'></td></tr>
                <tr><th scope='row'>Sampai Jam</th>              <td><input type='time' class='form-control' name='c'></td></tr>
                <tr><th scope='row'>Mata Pelajaran</th>               <td><input type='text' class='form-control' name='d'></td></tr>
                <tr><th scope='row'>Sesi</th>                <td><input type='text' class='form-control' name='e'></td></tr>
                <tr><th scope='row'>Keterangan</th>                <td><input type='text' class='form-control' name='f'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                  <a href='index.php?view=jadwalun'><button class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}
?>
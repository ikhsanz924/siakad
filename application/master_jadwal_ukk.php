<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Jadwal UKK</h3>
                  <?php if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=jadwalukk&act=tambah'>Tambahkan Data</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Nama Sekolah</th>
                        <th>Jurusan</th>
                        <th>Waktu Pelaksanaan</th>
                        <th>Penyelenggara</th>
                        <?php if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){
                        echo "<th>Action</th>";
                        } ?>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM jadwal_ukk");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[nama_sekolah]</td>
                              <td>$r[jurusan]</td>
                              <td>$r[dari_tanggal] - $r[sampai_tanggal]</td>
                              <td>$r[penyelenggara]</td>";
                              if($_SESSION[level]!='kepala' AND $_SESSION[level]!='guru' AND $_SESSION[level]!='siswa'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=jadwalukk&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=jadwalukk&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM jadwal_ukk where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=jadwalukk';</script>";
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
    $day1 = strtotime($_POST["c"]);
    $day1 = date('Y-m-d', $day1);
    $day2 = strtotime($_POST["d"]);
    $day2 = date('Y-m-d', $day2);
      mysqli_query($koneksi,"UPDATE jadwal_ukk SET nama_sekolah = '$_POST[a]',
                                       jurusan = ' $$_POST[b]',
                                       dari_tanggal = '$day1',
                                       sampai_tanggal = '$day2',
                                       penyelenggara = '$_POST[e]'
                                        where id='$_POST[id]'");
    echo "<script>document.location='index.php?view=jadwalukk';</script>";
  }
  $edit = mysqli_query($koneksi,"SELECT * FROM jadwal_ukk where id='$_GET[id]'");
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
                  <tr><th scope='row'>Nama Sekolah</th>          <td><input type='text' class='form-control' value='$s[nama_sekolah]' name='a'></td></tr>
                  <tr><th scope='row'>Jurusan</th>          <td><input type='text' class='form-control' value='$s[jurusan]' name='b'></td></tr>
                  <tr><th scope='row'>Dari Tanggal</th>        <td><input type='date' class='form-control' value='$s[dari_tanggal]' name='c'></td></tr>
                  <tr><th scope='row'>Sampai Tanggal</th>              <td><input type='date' class='form-control' value='$s[sampai_tanggal]' name='d'></td></tr>
                  <tr><th scope='row'>Penyelenggara</th>               <td><input type='text' class='form-control' value='$s[penyelenggara]' name='e'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='update' class='btn btn-info'>Update</button>
                  <a href='index.php?view=jadwalukk'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}elseif($_GET[act]=='tambah'){
  if (isset($_POST[tambah])){
    $day1 = strtotime($_POST["c"]);
    $day1 = date('Y-m-d', $day1);
    $day2 = strtotime($_POST["d"]);
    $day2 = date('Y-m-d', $day2);
      mysqli_query($koneksi,"INSERT INTO jadwal_ukk VALUES('','$_POST[a]','$_POST[b]','$day1','$day2','$_POST[e]')");
      echo "<script>document.location='index.php?view=jadwalukk';</script>";
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
                <tr><th scope='row'>Nama Sekolah</th>          <td><input type='text' class='form-control'  name='a'></td></tr>
                <tr><th scope='row'>Jurusan</th>          <td><input type='text' class='form-control'  name='b'></td></tr>
                <tr><th scope='row'>Dari Tanggal</th>        <td><input type='date' class='form-control'  name='c'></td></tr>
                <tr><th scope='row'>Sampai Tanggal</th>              <td><input type='date' class='form-control'  name='d'></td></tr>
                <tr><th scope='row'>Penyelenggara</th>               <td><input type='text' class='form-control'  name='e'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                  <a href='index.php?view=jadwalukk'><button class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}
?>
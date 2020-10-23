<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Pengawas Silang</h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=pengawassilang&act=tambah'>Tambahkan Data</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Asal Sekolah</th>
                        <th>Tempat Pengawas</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM pengawas_silang");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[nama]</td>
                              <td>$r[asal_sekolah]</td>
                              <td>$r[tempat_pengawas]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=pengawassilang&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=pengawassilang&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM pengawas_silang where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=pengawassilang';</script>";
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
      mysqli_query($koneksi,"UPDATE pengawas_silang SET nama = '$_POST[a]',
                                       asal_sekolah = '$_POST[b]',
                                       tempat_pengawas = '$_POST[c]',
                                       where id='$_POST[id]'");
    echo "<script>document.location='index.php?view=pengawassilang';</script>";
  }
  $edit = mysqli_query($koneksi,"SELECT * FROM pengawas_silang where id='$_GET[id]'");
  $s = mysqli_fetch_array($edit);
  echo "<div class='col-md-12'>
            <div class='box box-info'>
              <div class='box-header with-border'>
                <h3 class='box-title'>Edit Data Pengawas Silang</h3>
              </div>
            <div class='box-body'>
            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
              <div class='col-md-12'>
                <table class='table table-condensed table-bordered'>
                <tbody>
                  <input type='hidden' name='id' value='$s[id]'>
                  <tr><th scope='row'>Nama</th>          <td><input type='text' class='form-control' value='$s[nama]' name='a'></td></tr>
                  <tr><th scope='row'>Asal Sekolah</th>        <td><input type='text' class='form-control' value='$s[asal_sekolah]' name='b'></td></tr>
                  <tr><th scope='row'>Tempat Pengawas</th>              <td><input type='text' class='form-control' value='$s[tempat_pengawas]' name='c'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='update' class='btn btn-info'>Update</button>
                  <a href='index.php?view=pengawassilang'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}elseif($_GET[act]=='tambah'){
  if (isset($_POST[tambah])){
      mysqli_query($koneksi,"INSERT INTO pengawas_silang VALUES('','$_POST[a]','$_POST[b]','$_POST[c]')");
      echo "<script>document.location='index.php?view=pengawassilang';</script>";
  }

  echo "<div class='col-md-12'>
            <div class='box box-info'>
              <div class='box-header with-border'>
                <h3 class='box-title'>Tambah Data Panitia Penyelenggara</h3>
              </div>
            <div class='box-body'>
            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
              <div class='col-md-12'>
                <table class='table table-condensed table-bordered'>
                <tbody>
                <tr><th scope='row'>Nama</th>          <td><input type='text' class='form-control' name='a'></td></tr>
                <tr><th scope='row'>Asal Sekolah</th>        <td><input type='text' class='form-control' name='b'></td></tr>
                <tr><th scope='row'>Tempat Pengawas</th>              <td><input type='text' class='form-control' name='c'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                  <a href='index.php?view=pengawassilang'><button class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}
?>
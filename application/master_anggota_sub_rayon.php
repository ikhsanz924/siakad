<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Anggota Sub Rayon </h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=anggotasubrayon&act=tambah'>Tambahkan Data</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Nama Sekolah</th>
                        <th>Alamat</th>
                        <th>Nama Kepala Sekolah</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM anggota_sub_rayon");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[nama_sekolah]</td>
                              <td>$r[alamat]</td>
                              <td>$r[nama_kepala]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=anggotasubrayon&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=anggotasubrayon&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM anggota_sub_rayon where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=anggotasubrayon';</script>";
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
      mysqli_query($koneksi,"UPDATE anggota_sub_rayon SET nama_sekolah = '$_POST[a]',
                                       nama_kepala = '$_POST[b]',
                                       alamat = '$_POST[c]' where id='$_POST[id]'");
    echo "<script>document.location='index.php?view=anggotasubrayon';</script>";
  }
  $edit = mysqli_query($koneksi,"SELECT * FROM anggota_sub_rayon where id='$_GET[id]'");
  $s = mysqli_fetch_array($edit);
  echo "<div class='col-md-12'>
            <div class='box box-info'>
              <div class='box-header with-border'>
                <h3 class='box-title'>Edit Data Anggota Sub Rayon</h3>
              </div>
            <div class='box-body'>
            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
              <div class='col-md-12'>
                <table class='table table-condensed table-bordered'>
                <tbody>
                  <input type='hidden' name='id' value='$s[id]'>
                  <tr><th scope='row'>Nama Sekolah</th>          <td><input type='text' class='form-control' value='$s[nama_sekolah]' name='a'></td></tr>
                  <tr><th scope='row'>Nama Kepala Sekolah</th>        <td><input type='text' class='form-control' value='$s[nama_kepala]' name='b'></td></tr>
                  <tr><th scope='row'>Alamat</th>              <td><input type='text' class='form-control' value='$s[golongan]' name='c'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='update' class='btn btn-info'>Update</button>
                  <a href='index.php?view=anggotasubrayon'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}elseif($_GET[act]=='tambah'){
  if (isset($_POST[tambah])){
      mysqli_query($koneksi,"INSERT INTO anggota_sub_rayon (nama_sekolah, nama_kepala, alamat) VALUES('$_POST[a]','$_POST[b]','$_POST[c]')");
      echo "<script>document.location='index.php?view=anggotasubrayon';</script>";
  }

  echo "<div class='col-md-12'>
            <div class='box box-info'>
              <div class='box-header with-border'>
                <h3 class='box-title'>Tambah Data Anggota Sub Rayon</h3>
              </div>
            <div class='box-body'>
            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
              <div class='col-md-12'>
                <table class='table table-condensed table-bordered'>
                <tbody>
                  <tr><th scope='row'>Nama Sekolah</th>          <td><input type='text' class='form-control' name='a'></td></tr>
                  <tr><th scope='row'>Nama Kepala Sekolah</th>        <td><input type='text' class='form-control' name='b'></td></tr>
                  <tr><th scope='row'>Alamat</th>              <td><input type='text' class='form-control' name='c'></td></tr>
                </tbody>
                </table>
              </div>
            </div>
            <div class='box-footer'>
                  <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                  <a href='index.php?view=anggotasubrayon'><button class='btn btn-default pull-right'>Cancel</button></a>
                  
                </div>
            </form>
          </div>";
}
?>
<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Riwayat Keuangan Siswa </h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=riwayatkeuangan&act=tambah'>Tambahkan Data</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th style='width:40px'>No</th>
                        <th>NISN</th>
                        <th>Nama</th>
                        <th>Kelas</th>
                        <th>Jurusan</th>
                        <th>Tanggal Bayar</th>
                        <?php if($_SESSION[level]!='kepala'){ ?>
                        <th style='width:70px'>Action</th>
                        <?php } ?>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                   $tampil = mysqli_query($koneksi,"SELECT * FROM riwayat_keuangan_siswa");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    echo "<tr><td>$no</td>
                              <td>$r[nisn]</td>
                              <td>$r[nama]</td>
                              <td>$r[kelas]</td>
                              <td>$r[jurusan]</td>
                              <td>$r[tanggal_bayar]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=riwayatkeuangan&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=riwayatkeuangan&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM riwayat_keuangan_siswa where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=riwayatkeuangan';</script>";
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
        mysqli_query($koneksi,"UPDATE riwayat_keuangan_siswa SET kelas = '$_POST[a]',
                                         jurusan = '$_POST[b]',
                                         tanggal_bayar = '$_POST[c]'
                                         where id='$_POST[id]'");
      echo "<script>document.location='index.php?view=riwayatkeuangan';</script>";
    }
    $edit = mysqli_query($koneksi,"SELECT * FROM riwayat_keuangan_siswa where id='$_GET[id]'");
    $s = mysqli_fetch_array($edit);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Riwayat Keuangan Siswa</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <input type='hidden' name='id' value='$s[id]'>
                  <tr><th scope='row'>Jurusan</th>               <td><select class='form-control' name='a'> 
                                                                          <option value='0' selected>- Pilih Jurusan -</option>"; 
                                                                            $jurusan = mysqli_query($koneksi,"SELECT * FROM jurusan");
                                                                            while($a = mysqli_fetch_array($jurusan)){
                                                                                echo "<option value='$a[kode_jurusan]'>$a[nama_jurusan]</option>";
                                                                            }
                                                                         echo "</select></td></tr>
                   <tr><th scope='row'>Kelas</th>               <td><select class='form-control' name='b'> 
                                                                         <option value='0' selected>- Pilih Kelas -</option>"; 
                                                                           $kelas = mysqli_query($koneksi,"SELECT * FROM kelas");
                                                                           while($a = mysqli_fetch_array($kelas)){
                                                                               echo "<option value='$a[kode_kelas]'>$a[nama_kelas]</option>";
                                                                           }
                                                                        echo "</select></td></tr>
                    <tr><th scope='row'>Tanggal Bayar</th>          <td><input type='date' class='form-control' value='$s[tanggal_bayar]' name='c'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php?view=dataalumni'><button class='btn btn-default pull-right'>Cancel</button></a>
                  </div>
              </form>
            </div>";
}elseif($_GET[act]=='tambah'){
    if (isset($_POST[tambah])){
      $tambahnama = mysqli_query($koneksi,"SELECT nama FROM siswa where nisn='$_POST[a]'");
      $nama = mysqli_fetch_array($tambahnama);
      $hp = mysqli_fetch_array($tambahhp);
        mysqli_query($koneksi,"INSERT INTO riwayat_keuangan_siswa(nisn, nama, kelas, jurusan, tanggal_bayar) VALUES('$_POST[a]','$nama[nama]','$_POST[b]','$_POST[c]','$_POST[d]')");
        echo "<script>document.location='index.php?view=riwayatkeuangan';</script>";
    }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Riwayat Keuangan Siswa</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>NISN</th>               <td><select id='searchnipd' class='form-control' name='a'> 
                                                                  <option value='0' selected>- Pilih NISN -</option>"; 
                                                                    $nipd = mysqli_query($koneksi,"SELECT * FROM siswa");
                                                                    while($a = mysqli_fetch_array($nipd)){
                                                                        echo "<option value='$a[nisn]'>$a[nisn] - $a[nama]</option>";
                                                                    }
                                                                echo "</select></td></tr>
                    <tr><th scope='row'>Jurusan</th>               <td><select class='form-control' name='b'> 
                                                                          <option value='0' selected>- Pilih Jurusan -</option>"; 
                                                                            $jurusan = mysqli_query($koneksi,"SELECT * FROM jurusan");
                                                                            while($a = mysqli_fetch_array($jurusan)){
                                                                                echo "<option value='$a[kode_jurusan]'>$a[nama_jurusan]</option>";
                                                                            }
                                                                         echo "</select></td></tr>
                   <tr><th scope='row'>Kelas</th>               <td><select class='form-control' name='c'> 
                                                                         <option value='0' selected>- Pilih Kelas -</option>"; 
                                                                           $kelas = mysqli_query($koneksi,"SELECT * FROM kelas");
                                                                           while($a = mysqli_fetch_array($kelas)){
                                                                               echo "<option value='$a[kode_kelas]'>$a[nama_kelas]</option>";
                                                                           }
                                                                        echo "</select></td></tr>
                    <tr><th scope='row'>Tanggal Bayar</th>          <td><input type='date' class='form-control'  name='d'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                    <a href='index.php?view=riwayatkeuangan'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.css" rel="stylesheet"></script>

<script>
  $("#searchnipd").chosen();
  $("#searchpembimbing").chosen();
</script>
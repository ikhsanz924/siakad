<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Prakrin </h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=dataprakrin&act=tambah'>Tambahkan Data</a>
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
                        <th>Tempat</th>
                        <th>Tanggal Pengumpulan</th>
                        <th>Keterangan</th>
                        <?php if($_SESSION[level]!='kepala'){ ?>
                        <th style='width:70px'>Action</th>
                        <?php } ?>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                   $tampil = mysqli_query($koneksi,"SELECT * FROM data_prakrin");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    echo "<tr><td>$no</td>
                              <td>$r[nim]</td>
                              <td>$r[nama]</td>
                              <td>$r[kelas]</td>
                              <td>$r[tempat]</td>
                              <td>$r[tanggal_pengumpulan]</td>
                              <td>$r[keterangan]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=dataprakrin&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=dataprakrin&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM data_prakrin where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=dataprakrin';</script>";
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
        mysqli_query($koneksi,"UPDATE data_prakrin SET kelas = '$_POST[a]',
                                         tempat = '$_POST[b]',
                                         tanggal_pengumpulan = '$_POST[c]',
                                         keterangan = '$_POST[d]'
                                         where id='$_POST[id]'");
      echo "<script>document.location='index.php?view=dataprakrin';</script>";
    }
    $edit = mysqli_query($koneksi,"SELECT * FROM data_prakrin where id='$_GET[id]'");
    $s = mysqli_fetch_array($edit);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Prakrin</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <input type='hidden' name='id' value='$s[id]'>
                    <tr><th scope='row'>Kelas</th>               <td><select class='form-control' name='a'> 
                                                                          <option value='0' selected>- Pilih Kelas -</option>"; 
                                                                            $kelas = mysqli_query($koneksi,"SELECT * FROM kelas");
                                                                            while($a = mysqli_fetch_array($kelas)){
                                                                              if ($a[kode_kelas] == $s[kode_kelas]){
                                                                                echo "<option value='$a[kode_kelas]' selected>$a[kode_kelas]</option>";
                                                                              }else{
                                                                                echo "<option value='$a[kode_kelas]'>$a[kode_kelas]</option>";
                                                                              }
                                                                            }
                                                                         echo "</select></td></tr>
                    <tr><th scope='row'>Tempat</th>           <td><input type='text' class='form-control' name='b' value='$s[tempat]'></td></tr>
                    <tr><th scope='row'>Tanggal Pengumpulan</th>          <td><input type='date' class='form-control' value='$s[tanggal_pengumpulan]' name='c'></td></tr>
                    <tr><th scope='row'>Keterangan</th>           <td><input type='text' class='form-control' name='d' value='$s[keterangan]'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php?view=dataprakrin'><button class='btn btn-default pull-right'>Cancel</button></a>
                  </div>
              </form>
            </div>";
}elseif($_GET[act]=='tambah'){
    if (isset($_POST[tambah])){
      $tambahnama = mysqli_query($koneksi,"SELECT nama FROM siswa where nisn='$_POST[a]'");
      $nama = mysqli_fetch_array($tambahnama);
        mysqli_query($koneksi,"INSERT INTO data_prakrin(nim, nama, kelas, tempat, tanggal_pengumpulan, keterangan) VALUES('$_POST[a]','$nama[nama]','$_POST[b]','$_POST[c]','$_POST[d]','$_POST[e]')");
        echo "<script>document.location='index.php?view=dataprakrin';</script>";
    }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Prakrin</h3>
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
                    <tr><th scope='row'>Kelas</th>               <td><select class='form-control' name='b'> 
                                                                          <option value='0' selected>- Pilih Kelas -</option>"; 
                                                                            $kelas = mysqli_query($koneksi,"SELECT * FROM kelas");
                                                                            while($a = mysqli_fetch_array($kelas)){
                                                                                echo "<option value='$a[kode_kelas]'>$a[nama_kelas]</option>";
                                                                            }
                                                                         echo "</select></td></tr>
                    <tr><th scope='row'>Tempat</th>           <td><input type='text' class='form-control' name='c'></td></tr>
                    <tr><th scope='row'>Tanggal Pengumpulan</th>          <td><input type='date' class='form-control'  name='d'></td></tr>
                    <tr><th scope='row'>Keterangan</th>           <td><input type='text' class='form-control' name='e'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                    <a href='index.php?view=dataprakrin'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
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
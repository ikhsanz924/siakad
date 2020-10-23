<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Peminjaman Barang </h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=peminjamanbarang&act=tambah'>Tambahkan Data</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th style='width:40px'>No</th>
                        <th>Nama Barang</th>
                        <th>Tanggal</th>
                        <th>Penanggung Jawab</th>
                        <th>Jam Pinjam</th>
                        <th>Jam Dikembalikan</th>
                        <?php if($_SESSION[level]!='kepala'){ ?>
                        <th style='width:70px'>Action</th>
                        <?php } ?>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                   $tampil = mysqli_query($koneksi,"SELECT * FROM data_peminjaman_barang");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    echo "<tr><td>$no</td>
                              <td>$r[nama_barang]</td>
                              <td>$r[tanggal_pinjam]</td>
                              <td>$r[penanggung_jawab]</td>
                              <td>$r[jam_pinjam]</td>
                              <td>$r[jam_kembali]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=peminjamanbarang&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=peminjamanbarang&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM data_peminjaman_barang where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=peminjamanbarang';</script>";
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
      $time1 = strtotime($_POST["d"]);
      $time1 = date('H:i', $time1);
      $time2 = strtotime($_POST["e"]);
      $time2 = date('H:i', $time2);
        mysqli_query($koneksi,"UPDATE data_peminjaman_barang SET nama_barang = '$_POST[a]',
                                         tanggal_pinjam = '$day1',
                                         penanggung_jawab = '$_POST[b]',
                                         jam_pinjam = '$time1',
                                         jam_kembali ='$time2'
                                         where id='$_POST[id]'");
      echo "<script>document.location='index.php?view=peminjamanbarang';</script>";
    }
    $edit = mysqli_query($koneksi,"SELECT * FROM data_peminjaman_barang where id='$_GET[id]'");
    $s = mysqli_fetch_array($edit);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Pengembalian Barang</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <input type='hidden' name='id' value='$s[id]'>
                  <tr><th scope='row'>Nama Barang</th>               <td><select class='form-control' name='a'> 
                                                                  <option value='0' selected>Pilih Barang</option>"; 
                                                                  $barang = mysqli_query($koneksi,"SELECT * FROM pengadaan_barang");
                                                                  while($a = mysqli_fetch_array($barang)){
                                                                    if ($a[nm_alat] == $s[nm_barang]){
                                                                      echo "<option value='$a[nm_alat]' selected>$a[nm_alat]</option>";
                                                                    }else{
                                                                      echo "<option value='$a[nm_alat]'>$a[nm_alat]</option>";
                                                                    }
                                                                  }
                                                              echo "</select></td></tr>
                  <tr><th scope='row'>Tanggal</th>          <td><input type='date' class='form-control' value='$s[tanggal_pinjam]'  name='c'></td></tr>
                  <tr><th scope='row'>Penanggung Jawab</th>           <td><input type='text' class='form-control' value='$s[penanggung_jawab]' name='b'></td></tr>
                  <tr><th scope='row'>Jam Pinjam</th>           <td><input type='time' class='form-control' value='$s[jam_pinjam]' name='d'></td></tr>
                  <tr><th scope='row'>Jam Dikembalikan</th>           <td><input type='time' class='form-control' value='$s[jam_kembali]' name='e'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php?view=peminjamanbarang'><button class='btn btn-default pull-right'>Cancel</button></a>
                  </div>
              </form>
            </div>";
}elseif($_GET[act]=='tambah'){
    if (isset($_POST[tambah])){
      $day1 = strtotime($_POST["c"]);
      $day1 = date('Y-m-d', $day1);
      $time1 = strtotime($_POST["d"]);
      $time1 = date('H:i', $time1);
      $time2 = strtotime($_POST["e"]);
      $time2 = date('H:i', $time2);
        mysqli_query($koneksi,"INSERT INTO data_peminjaman_barang (nama_barang, tanggal_pinjam, penanggung_jawab, jam_pinjam, jam_kembali) VALUES('$_POST[a]','$day1','$_POST[b]','$time1','$time2')");
        echo "<script>document.location='index.php?view=peminjamanbarang';</script>";
    }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Peminjaman Barang</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>Nama Barang</th>               <td><select id='searchbarang' class='form-control' name='a'> 
                                                              <option value='0' selected>- Pilih Barang -</option>"; 
                                                              $alat = mysqli_query($koneksi,"SELECT * FROM pengadaan_barang");
                                                              while($a = mysqli_fetch_array($alat)){
                                                              echo "<option value='$a[nm_alat]'>$a[id] - $a[nm_alat]</option>";}
                echo "</select></td></tr>
                    <tr><th scope='row'>Tanggal</th>          <td><input type='date' class='form-control'  name='c'></td></tr>
                    <tr><th scope='row'>Penanggung Jawab</th>           <td><input type='text' class='form-control' name='b'></td></tr>
                    <tr><th scope='row'>Jam Pinjam</th>           <td><input type='time' class='form-control' name='d'></td></tr>
                    <tr><th scope='row'>Jam Dikembalikan</th>           <td><input type='time' class='form-control' name='e'></td></tr>                 
                    </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                    <a href='index.php?view=peminjamanbarang'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.css" rel="stylesheet"></script>

<script>
  $("#searchbarang").chosen();
  $("#searchpembimbing").chosen();
</script>
<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Gaji Pegawai</h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=gajipegawai&act=tambah'>Tambahkan Data</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th style='width:40px'>No</th>
                        <th>NIP</th>
                        <th>Nama</th>
                        <th>Tanggal</th>
                        <th>Gaji Pokok Mengajar</th>
                        <th>Tunjangan Jabatan</th>
                        <th>Tunjangan Wali Kelas</th>
                        <th>Tunjangan Kajur</th>
                        <th>Tunjangan Kalab</th>
                        <th>Potongan Sosial</th>
                        <th>Total</th>
                        <?php if($_SESSION[level]!='kepala'){ ?>
                        <th style='width:70px'>Action</th>
                        <?php } ?>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                   $tampil = mysqli_query($koneksi,"SELECT * FROM gaji_pegawai");
                   $total =  mysqli_query($koneksi,"SELECT gaji_pokok_mengajar, 
                                                    tunjangan_jabatan, tunjangan_wali,
                                                    tunjangan_kajur, tunjangan_kalab, 
                                                    potongan_sosial,(gaji_pokok_mengajar+tunjangan_jabatan+
                                                    tunjangan_wali+tunjangan_kajur+tunjangan_kalab-potongan_sosial) as total
                                                    FROM gaji_pegawai");
                    
                   $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                      $t =mysqli_fetch_array($total);
                    echo "<tr><td>$no</td>
                              <td>$r[nip]</td>
                              <td>$r[nama]</td>
                              <td>$r[tanggal]</td>
                              <td>Rp.";echo number_format($r['gaji_pokok_mengajar']); echo"</td>
                              <td>Rp.";echo number_format($r['tunjangan_jabatan']); echo"</td>
                              <td>Rp.";echo number_format($r['tunjangan_wali']); echo"</td>
                              <td>Rp.";echo number_format($r['tunjangan_kajur']); echo"</td>
                              <td>Rp.";echo number_format($r['tunjangan_kalab']); echo"</td>
                              <td>Rp.";echo number_format($r['potongan_sosial']); echo"</td>
                              <td>Rp.";echo number_format($t['total']); echo"</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=gajipegawai&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=gajipegawai&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM gaji_pegawai where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=gajipegawai';</script>";
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
        mysqli_query($koneksi,"UPDATE gaji SET kelas = '$_POST[a]',
                                         instansi = '$_POST[b]',
                                         nilai = '$_POST[c]',
                                         keterangan = '$_POST[d]'
                                         where id='$_POST[id]'");
      echo "<script>document.location='index.php?view=nilaiukklsp';</script>";
    }
    $edit = mysqli_query($koneksi,"SELECT * FROM nilai_ukk_lsp where id='$_GET[id]'");
    $s = mysqli_fetch_array($edit);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Nilai UKK LSP</h3>
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
                    <tr><th scope='row'>instansi</th>           <td><input type='text' class='form-control' name='b' value='$s[instansi]'></td></tr>
                    <tr><th scope='row'>nilai</th>          <td><input type='number' class='form-control' value='$s[nilai]' name='c'></td></tr>
                    <tr><th scope='row'>Keterangan</th>           <td><input type='text' class='form-control' name='d' value='$s[keterangan]'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php?view=nilaiukklsp'><button class='btn btn-default pull-right'>Cancel</button></a>
                  </div>
              </form>
            </div>";
}elseif($_GET[act]=='tambah'){
    if (isset($_POST[tambah])){
      $day1 = strtotime($_POST["b"]);
      $day1 = date('Y-m-d', $day1);
      $tambahnama = mysqli_query($koneksi,"SELECT nama_guru FROM guru where nip='$_POST[a]'");
      $nama = mysqli_fetch_array($tambahnama);
        mysqli_query($koneksi,"INSERT INTO gaji_pegawai(nip, nama, tanggal, gaji_pokok_mengajar, tunjangan_jabatan, tunjangan_wali, tunjangan_kajur, tunjangan_kalab, potongan_sosial) VALUES('$_POST[a]','$nama[nama_guru]','$day1','$_POST[c]','$_POST[d]','$_POST[e]','$_POST[f]','$_POST[g]','$_POST[h]')");
        echo "<script>document.location='index.php?view=gajipegawai';</script>";
    }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Gaji Pegawai</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                  <tr><th scope='row'>NIP|Nama</th>               <td><select id='searchnipd' class='form-control' name='a'> 
                                                                  <option value='0' selected>- Pilih NIP -</option>"; 
                                                                    $nip = mysqli_query($koneksi,"SELECT * FROM guru");
                                                                    while($a = mysqli_fetch_array($nip)){
                                                                        echo "<option value='$a[nip]'>$a[nip] - $a[nama_guru]</option>";
                                                                    }
                                                                echo "</select></td></tr>
                    <tr><th scope='row'>Tanggal</th>                       <td><input type='Date' class='form-control' name='b'></td></tr>
                    <tr><th scope='row'>Gaji Pokok Mengajar</th>           <td><input type='number' class='form-control' name='c'></td></tr>
                    <tr><th scope='row'>Tunjangan Jabatan</th>             <td><input type='number' class='form-control' name='d'></td></tr>
                    <tr><th scope='row'>Tunjangan Wali Kelas</th>             <td><input type='number' class='form-control' name='e'></td></tr>
                    <tr><th scope='row'>Tunjangan Kajur</th>             <td><input type='number' class='form-control' name='f'></td></tr>
                    <tr><th scope='row'>Tunjangan Kalab</th>             <td><input type='number' class='form-control' name='g'></td></tr>
                    <tr><th scope='row'>Potongan Sosial</th>          <td><input type='number' class='form-control'  name='h'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                    <a href='index.php?view=nilaiukklsp'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}
?>
<script src="assets/autoNumeric.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.css" rel="stylesheet"></script>

<script>
  new AutoNumeric('#gaji',{
    digitGroupSeparator: '.'
  });
</script>

<script>
  $("#searchnipd").chosen();
  $("#searchpembimbing").chosen();
</script>
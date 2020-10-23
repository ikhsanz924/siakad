 <?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Rincian Anggaran</h3>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=rinciananggaran&act=tambah'>Tambahkan Data </a>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th style='width:30px'>No</th>
                        <th>Nama</th>
                        <th>Jabatan</th>
                        <th>Honor</th>
                        <th>Keterangan</th>
                        <th style='width:70px'>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM rincian_anggaran");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    echo "<tr><td>$no</td>
                              <td>$r[nama]</td>
                              <td>$r[jabatan]</td>
                              <td>Rp.$r[honor]</td>
                              <td>$r[keterangan]</td>
                              <td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=rinciananggaran&act=edit&id=$r[id]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=rinciananggaran&hapus=$r[id]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM rincian_anggaran where id='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=rinciananggaran';</script>";
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
        mysqli_query($koneksi,"UPDATE rincian_anggaran SET nama = '$_POST[a]',
                                                          jabatan = ' $_POST[b]',
                                                          honor = '$_POST[c]',
                                                          keterangan = '$_POST[d]' where id='$_POST[id]'");
        
      echo "<script>document.location='index.php?view=rinciananggaran';</script>";
      
    }
    $edit = mysqli_query($koneksi,"SELECT * FROM rincian_anggaran where id='$_GET[id]'");
    $s = mysqli_fetch_array($edit);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Anggaran</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='$s[id]'>
                    <tr><th width='120px' scope='row'>Nama</th> <td><input type='text' class='form-control' name='a' value='$s[nama]'> </td></tr>
                    <tr><th scope='row'>Jabatan</th>           <td><input type='text' class='form-control' name='b' value='$s[jabatan]'></td></tr>
                    <tr><th scope='row'>Honor</th>           <td><input type='number' class='form-control' name='c' value='$s[honor]'></td></tr>
                    <tr><th scope='row'>Keterangan</th>              <td><input type='text' class='form-control' name='d' value='$s[keterangan]'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php?view=guru'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}elseif($_GET[act]=='tambah'){
    if (isset($_POST[tambah])){
      mysqli_query($koneksi,"INSERT INTO rincian_anggaran(nama, jabatan, honor, keterangan) VALUES('$_POST[a]','$_POST[b]','$_POST[c]','$_POST[d]')");
      echo "<script>document.location='index.php?view=rinciananggaran';</script>";
    }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Rincian Anggaran</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <tr><th scope='row'>Nama</th>               <td><input type='text' class='form-control' name='a'></td></tr>
                    <tr><th scope='row'>Jabatan</th>           <td><input type='text' class='form-control' name='b'></td></tr>
                    <tr><th scope='row'>Honor</th>           <td><input type='number' class='form-control' name='c'></td></tr>
                    <tr><th scope='row'>Keterangan</th>              <td><input type='text' class='form-control' name='d'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                    <a href='index.php?view=rinciananggaran'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}
?>
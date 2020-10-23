<div class="modal fade" id="kode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Validasi Pendaftaran</h4>
      </div>
      <div class="modal-body">
        <form action='index.php?view=home&cek' method='POST'>
          <div class='form-group'>
            <label for='inputEmail3' class='col-sm-3 control-label'>Kode Aktivasi</label>
            <div class='col-sm-9'>
              <div style='background:#fff;' class='input-group col-sm-10'>
                <input type='text' class='required form-control' placeholder='Masukkan Kode aktivasi disini...' name='kode' required>
                <br><br><br></div>
            </div>
          </div>
      </div>
      <div style='clear:both' class="modal-footer">
        <button type="submit" name='submit' class="btn btn-primary btn-sm">Proses Kode</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="kode1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Form Pendaftaran Kode Aktivasi</h4>
      </div>
      <div class="modal-body">
        <form  method='POST'>
          <div class='form-group'>
            <label for='inputEmail3' class='col-sm-3 control-label'>NISN</label>
            <div class='col-sm-9'>
              <div style='background:#fff;' class='input-group col-sm-10'>
                <input type='number' class='required form-control' placeholder='NISN' name='a' required>
                <br><br><br></div>
            </div>
            <label for='inputEmail3' class='col-sm-3 control-label'>Nama Siswa</label>
            <div class='col-sm-9'>
              <div style='background:#fff;' class='input-group col-sm-10'>
                <input type='text' class='required form-control' placeholder='Nama Siswa' name='b' required>
                <br><br><br></div>
            </div>
            <label for='inputEmail3' class='col-sm-3 control-label'>Nomor Handphone</label>
            <div class='col-sm-9'>
              <div style='background:#fff;' class='input-group col-sm-10'>
                <input type='number' class="required number form-control" placeholder='No.Hp' name='c' minlength="11" required>
                <br><br><br></div>
            </div>
          </div>

      </div>
      <div style='clear:both' class="modal-footer">
        <button type="submit" name='tambah' class="btn btn-primary btn-sm">Submit</button>
      </div>
      </form>
      <?php
      if (isset($_POST[tambah])) {
            mysqli_query($koneksi, "INSERT INTO psb_daftar_aktivasi(nisn, nama_siswa, no_hp) VALUES('$_POST[a]','$_POST[b]','$_POST[c]')");
            echo "<script>document.location='pendaftaran-sukses.mu';</script>";
          }
      ?>
    </div>
  </div>
</div>
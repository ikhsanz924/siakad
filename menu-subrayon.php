<section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="<?php echo $foto; ?>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><?php echo $nama; ?></p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header" style='color:#fff; text-transform:uppercase; border-bottom:2px solid #00c0ef'>MENU <?php echo $level; ?></li>
            <li><a href="index.php"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Sub Rayon</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=anggotasubrayon"><i class="fa fa-circle-o"></i>Anggota Sub Rayon</a></li>
                <li><a href="index.php?view=panitiapenyelenggara"><i class="fa fa-circle-o"></i>Panitia Penyelenggara UN,UKK</a></li>
                <li><a href="index.php?view=pengawassilang"><i class="fa fa-circle-o"></i>Pengawas Silang</a></li>
                <li><a href="index.php?view=rinciananggaran"><i class="fa fa-circle-o"></i>Rincian Anggaran  Sub Rayon</a></li>
                <li><a href="index.php?view=jadwalun"><i class="fa fa-circle-o"></i>Jadwal UN</a></li>
                <li><a href="index.php?view=jadwalukk"><i class="fa fa-circle-o"></i>Jadwal UKK</a></li>
                <li><a href="index.php?view=hasilnotulensi"><i class="fa fa-circle-o"></i>Hasil Notulen Rapat Sub Rayon</a></li>
                <li><a href="index.php?view=tuk"><i class="fa fa-circle-o"></i>Verifikasi Tempat Kerja</a></li>
              </ul>
            </li>
          </ul>
          
        </section>
      
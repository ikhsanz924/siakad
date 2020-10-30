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
              <a href="#"><i class="fa fa-th"></i> <span>Komite</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
              <li><a href="index.php?view=laporanrab"><i class="fa fa-circle-o"></i>Upload Laporan RAB</a></li>
              <li><a href="index.php?view=saldokomite"><i class="fa fa-circle-o"></i>Laporan Saldo Komite</a></li>
              <li><a href="index.php?view=gajipegawai"><i class="fa fa-circle-o"></i>Data Gaji Guru</a></li>
              <li><a href="index.php?view=riwayatkeuangan"><i class="fa fa-circle-o"></i>SPP Komite Murid</a></li>
              </ul>
            </li>
            
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>BOSDA</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">            
                <li><a href="index.php?view=laporanrab"><i class="fa fa-circle-o"></i> Upload laporan RAB</a></li>
                <li><a href="index.php?view=raportcetakuts"><i class="fa fa-circle-o"></i> Upload laporan BKP</a></li>
              </ul>
            </li>
          </ul>
          
        </section>
      
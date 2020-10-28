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
              <a href="#"><i class="fa fa-th"></i> <span>Keuangan</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
              <li><a href="index.php?view=test"><i class="fa fa-circle-o"></i> Data Uang Masuk</a></li>
                <li><a href="index.php?view=raportcetakuts"><i class="fa fa-circle-o"></i> Data laporan BOSDA</a></li>
                <li><a href="index.php?view=riwayatkeuangan"><i class="fa fa-circle-o"></i> Riwayat Keuangan Siswa</a></li>
              </ul>
            </li>
            
          </ul>
          
        </section>
      
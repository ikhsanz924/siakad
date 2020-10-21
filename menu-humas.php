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
              <a href="#"><i class="fa fa-th"></i> <span>Humas</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=kelompokmapel"><i class="fa fa-circle-o"></i>Nilai UKK</a></li>
                <li><a href="index.php?view=matapelajaran"><i class="fa fa-circle-o"></i>Data PKL</a></li>
                <li><a href="index.php?view=jadwalpelajaran"><i class="fa fa-circle-o"></i>Arsip MOU & DUDI</a></li>
                <li><a href="index.php?view=bahantugas"><i class="fa fa-circle-o"></i>Data Sertifikat</a></li>
              </ul>
            </li>
          </ul>
          
        </section>
      
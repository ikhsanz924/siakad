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
              <a href="#"><i class="fa fa-user"></i> <span>Data Pengguna</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=siswa"><i class="fa fa-circle-o"></i> Data Siswa</a></li>
                <li><a href="index.php?view=guru"><i class="fa fa-circle-o"></i> Data Guru</a></li>
                <li><a href="index.php?view=wakilkepala"><i class="fa fa-circle-o"></i> Data Kepala Sekolah</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Data Master</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=kelas"><i class="fa fa-circle-o"></i> Data Kelas</a></li>
                <li><a href="index.php?view=matapelajaran"><i class="fa fa-circle-o"></i> Data Mata Pelajaran</a></li>
                <li><a href="index.php?view=jadwalpelajaran"><i class="fa fa-circle-o"></i> Data Jadwal Pelajaran</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class="fa fa-th-large"></i> <span>Data Absensi</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=absensiswa"><i class="fa fa-circle-o"></i> Absensi Siswa</a></li>
                <li><a href="index.php?view=absenguru"><i class="fa fa-circle-o"></i> Absensi Guru</a></li>
              </ul>
            </li>
           <!-- <li><a href="index.php?view=bahantugas"><i class="fa fa-file"></i><span>Bahan dan Tugas</span></a></li>
            <li><a href="index.php?view=soal"><i class="fa fa-users"></i><span>Quiz / Ujian Online</span></a></li>
            <li><a href="index.php?view=journalkbm"><i class="fa fa-tags"></i><span>Journal KBM</span></a></li>
            <li><a href="index.php?view=forum"><i class="fa fa-th-list"></i> <span>Forum Diskusi</span></a></li>
            <li><a href="index.php?view=raportcetak"><i class="fa fa-calendar"></i> <span>Laporan Nilai</span></a></li>
            <li><a href="index.php?view=dokumentasi"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li><a href="index.php?view=dokumentasi"><i class="fa fa-book"></i> <span>Documentation</span></a></li> -->
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Kurikulum</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=matapelajaran"><i class="fa fa-circle-o"></i> Data Mata Pelajaran</a></li>
                <li><a href="index.php?view=jadwalpelajaran"><i class="fa fa-circle-o"></i> Data Jadwal Pelajaran</a></li>
                <li><a href="index.php?view=guru"><i class="fa fa-circle-o"></i>Data Guru</a></li>
                <li><a href="index.php?view=skberkala"><i class="fa fa-circle-o"></i>Upload SK Berkala</a></li>
                <li><a href="index.php?view=jadwalujian"><i class="fa fa-circle-o"></i>Jadwal Ujian</a></li>
                <li><a href="index.php?view=jadwalpengawas"><i class="fa fa-circle-o"></i>Jadwal Pengawas</a></li>
              </ul>
            </li>
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
            	<!--
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Manajemen Mutu</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=siswa"><i class="fa fa-circle-o"></i>Arsip</a></li>
              </ul>
            </li>
          -->
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Humas</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=nilaiukkdudi"><i class="fa fa-circle-o"></i>Nilai UKK</a></li>
                <li><a href="index.php?view=datatempatprakrin"><i class="fa fa-circle-o"></i>Data Tempat Prakrin</a></li>
                <li><a href="index.php?view=dataprakrin"><i class="fa fa-circle-o"></i>Data Prakrin</a></li>
                <li><a href="index.php?view=dataarsip"><i class="fa fa-circle-o"></i>Arsip MOU & DUDI</a></li>
                <li><a href="index.php?view=sertifikatprakerin"><i class="fa fa-circle-o"></i>Data Sertifikat</a></li>
              </ul>
            </li>
			<!--
            <li class="treeview">
              <a href="#"><i class="fa fa-send"></i> <span>SMS Gateway</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=sms"><i class="fa fa-circle-o"></i> Send SMS</a></li>
                <li><a href="index.php?view=broadcast"><i class="fa fa-circle-o"></i> Broadcast SMS</a></li>
                <li><a href="index.php?view=autoreply"><i class="fa fa-circle-o"></i> Autoreply</a></li>
                <li><a href="index.php?view=smstoweb"><i class="fa fa-circle-o"></i> Inbox SMS2WEB</a></li>
                <li><a href="index.php?view=outboxautoreply"><i class="fa fa-circle-o"></i> Outbox Autoreply</a></li>
              </ul>
            </li>
            -->
			<li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Bursa Kerja Khusus</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=dataalumni"><i class="fa fa-circle-o"></i> Data Kerja Alumni</a></li>
                <li><a href="index.php?view=jadwalrekrut"><i class="fa fa-circle-o"></i> Jadwal Kegiatan Rekruitasi</a></li>
              </ul>
            </li>

            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Kesiswaan</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=psbmenu"><i class="fa fa-circle-o"></i> Absen Siswa</a></li>
                <li><a href="index.php?view=psbhalaman"><i class="fa fa-circle-o"></i> Data Siswa Bimbingan</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Manajemen Mutu</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=laporanmutu"><i class="fa fa-circle-o"></i>Arsip</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Lembaga Sertifikasi Profesi</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=tuk"><i class="fa fa-circle-o"></i> Verifikasi Tempat Kerja</a></li>
                <li><a href="index.php?view=nilaiukklsp"><i class="fa fa-circle-o"></i> Nilai UKK</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Komite</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
              <li><a href="index.php?view=laporanrab"><i class="fa fa-circle-o"></i>Upload Laporan RAB</a></li>
              <li><a href="index.php?view=saldokomite"><i class="fa fa-circle-o"></i>Laporan Saldo Komite</a></li>
              <li><a href="index.php?view=gajipegawai"><i class="fa fa-circle-o"></i>Data Gaji Pegawai</a></li>
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
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Tata Usaha</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=pengadaan"><i class="fa fa-circle-o"></i>Pengadaan Barang</a></li>
                <li><a href="index.php?view=surat"><i class="fa fa-circle-o"></i>Upload Surat Masuk & Keluar</a></li>
                <li><a href="index.php?view=peminjamanbarang"><i class="fa fa-circle-o"></i>Peminjaman Barang</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Sarana & Prasarana</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=gedung"><i class="fa fa-circle-o"></i> Data Gedung</a></li>
                <li><a href="index.php?view=ruangan"><i class="fa fa-circle-o"></i> Data Ruangan</a></li>
                <li><a href="index.php?view=peminjamanbarang"><i class="fa fa-circle-o"></i>Peminjaman Barang</a></li>
              </ul>
            </li>
          </ul>
        </section>
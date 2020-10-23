-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2020 at 03:41 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_guru`
--

CREATE TABLE `absensi_guru` (
  `id_absensi_guru` int(5) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kode_kehadiran` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `absensi_siswa`
--

CREATE TABLE `absensi_siswa` (
  `id_absensi_siswa` int(5) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kehadiran` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi_siswa`
--

INSERT INTO `absensi_siswa` (`id_absensi_siswa`, `kodejdwl`, `nisn`, `kode_kehadiran`, `tanggal`, `waktu_input`) VALUES
(1, 0, '2121312312312', 'S', '2020-03-09', '2020-03-09 21:09:51'),
(2, 0, '444444444444444', 'H', '2020-03-09', '2020-03-09 21:09:51'),
(3, 0, '4123123123123', 'H', '2020-03-09', '2020-03-09 21:09:51'),
(4, 0, '2121312312312', 'H', '2020-03-10', '2020-03-09 21:11:11'),
(5, 0, '444444444444444', 'S', '2020-03-10', '2020-03-09 21:11:11'),
(6, 0, '4123123123123', 'H', '2020-03-10', '2020-03-09 21:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(5) NOT NULL,
  `nama_agama` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `nama_agama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Hindu'),
(4, 'Budha');

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `id` int(11) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `nama` varchar(120) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `angkatan` int(5) NOT NULL,
  `tempat_kerja` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `anggota_sub_rayon`
--

CREATE TABLE `anggota_sub_rayon` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nip` int(20) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `asal_sekolah` varchar(255) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota_sub_rayon`
--

INSERT INTO `anggota_sub_rayon` (`id`, `nama`, `nip`, `golongan`, `asal_sekolah`, `alamat`) VALUES
(1, 'test', 2147483647, 'IV-B', 'Darul Hikam', 'Komp Kopo Permai II Blok 13 B No.11');

-- --------------------------------------------------------

--
-- Table structure for table `arsip_dudi`
--

CREATE TABLE `arsip_dudi` (
  `id` int(11) NOT NULL,
  `nm_dokumen` varchar(100) NOT NULL,
  `tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arsip_dudi`
--

INSERT INTO `arsip_dudi` (`id`, `nm_dokumen`, `tahun`) VALUES
(1, '20201005-SISTEM_INFORMASI_AKADEMIK_PADA_SEKOLAH_D.pdf', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `data_kerja_alumni`
--

CREATE TABLE `data_kerja_alumni` (
  `id` int(11) NOT NULL,
  `nisn` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `tahun_lulus` year(4) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_kerja_alumni`
--

INSERT INTO `data_kerja_alumni` (`id`, `nisn`, `nama`, `jurusan`, `alamat`, `no_hp`, `tahun_lulus`, `keterangan`) VALUES
(2, '9991268756', 'AAD SIROJUDIN', 'TKJ1', '082385418021', 'SMKN4 Bandung', 2012, 'Kerja');

-- --------------------------------------------------------

--
-- Table structure for table `data_peminjaman_barang`
--

CREATE TABLE `data_peminjaman_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `penanggung_jawab` varchar(255) NOT NULL,
  `jam_pinjam` time NOT NULL,
  `jam_kembali` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_peminjaman_barang`
--

INSERT INTO `data_peminjaman_barang` (`id`, `nama_barang`, `tanggal_pinjam`, `penanggung_jawab`, `jam_pinjam`, `jam_kembali`) VALUES
(3, 'Staples', '2020-10-16', 'Ikhsan', '16:32:00', '20:32:00'),
(4, 'Printer', '2020-10-16', 'Ikhsan', '16:40:00', '19:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `data_prakrin`
--

CREATE TABLE `data_prakrin` (
  `id` int(11) NOT NULL,
  `nim` varchar(100) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `tanggal_pengumpulan` date NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_prakrin`
--

INSERT INTO `data_prakrin` (`id`, `nim`, `nama`, `kelas`, `tempat`, `tanggal_pengumpulan`, `keterangan`) VALUES
(3, '14422', 'AAD SIROJUDIN', 'X.TKJ.1', 'SMKN4 Bandungs', '2020-10-02', '1');

-- --------------------------------------------------------

--
-- Table structure for table `data_tempat_prakrin`
--

CREATE TABLE `data_tempat_prakrin` (
  `id` int(11) NOT NULL,
  `nipd` varchar(100) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `tempat_prakrin` varchar(255) NOT NULL,
  `alamat_prakrin` text NOT NULL,
  `pembimbing_industri` varchar(255) NOT NULL,
  `pembimbing_sekolah` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_jadwal_rekruitasi`
--

CREATE TABLE `dokumen_jadwal_rekruitasi` (
  `id` int(11) NOT NULL,
  `file_jadwal` varchar(255) NOT NULL,
  `nm_dokumen` varchar(255) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumen_jadwal_rekruitasi`
--

INSERT INTO `dokumen_jadwal_rekruitasi` (`id`, `file_jadwal`, `nm_dokumen`, `tanggal`) VALUES
(1, '20201014-ArcheAge Dailies - Dailies.pdf', 'test', '2020-10-14');

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_tuk`
--

CREATE TABLE `dokumen_tuk` (
  `id` int(11) NOT NULL,
  `file_tuk` varchar(255) NOT NULL,
  `nm_dokumen` varchar(255) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokumen_tuk`
--

INSERT INTO `dokumen_tuk` (`id`, `file_tuk`, `nm_dokumen`, `tanggal`) VALUES
(2, '20200725-20200309-test.pdf', 'test', '2020-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `elearning`
--

CREATE TABLE `elearning` (
  `id_elearning` int(10) NOT NULL,
  `id_kategori_elearning` int(5) NOT NULL,
  `kodejdwl` int(5) NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `file_upload` text NOT NULL,
  `tanggal_tugas` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elearning`
--

INSERT INTO `elearning` (`id_elearning`, `id_kategori_elearning`, `kodejdwl`, `nama_file`, `file_upload`, `tanggal_tugas`, `tanggal_selesai`, `keterangan`) VALUES
(13, 1, 7, 'File Upload Materi 1', 'Contoh_Kasus_AHP.docx', '2015-12-09 08:07:15', '0000-00-00 00:00:00', ''),
(22, 2, 7, 'Tugas Untuk Siswa Kelompok yang Malas', 'cover_Pidana_korupsi.docx', '2015-12-09 22:37:51', '2015-12-23 13:07:09', 'Tolong Dikerjakan, Kalau Tidak Maka nilai Raport anda merah..'),
(23, 2, 7, 'Tugas Pertama ', 'Surat-Keterangan-Kepsek.docx', '2015-12-13 15:02:00', '2016-01-22 15:02:00', 'Selesaikan Secepatnya,..!'),
(24, 1, 5, 'Bahan Untuk Tugas Semester 2', 'journal_profile_matching_beasiswa.pdf', '2016-02-23 09:04:22', '2016-12-23 11:04:22', 'Bahan Untuk Tugas Semester 2 ini tolong dipelajari karena akan banyak keluar di ujian semester nanti.'),
(25, 2, 5, 'Tugas Semester 1 Tahun Ajaran 2015/2016', 'Metode-Profile-Matching.pdf', '2015-12-23 09:11:15', '2016-04-25 09:11:15', 'Silahkan Dijawab dan unutk jawaban di upload disini paling lambat sesuai tanggal selesai..'),
(26, 1, 13, 'Bahan Unutk Peljaran Besok', '20160311072304-Tugas_laura.docx', '2016-03-11 07:22:32', '2016-03-11 07:22:32', ''),
(27, 2, 13, 'Tugas Unutk Dikumpul Besok 12 Maret 2016', '20160311072502-Aturan Main Projects.docx', '2016-03-11 07:24:16', '2016-03-13 07:24:16', ''),
(28, 1, 13, 'kjbkjbkbk', '20160311143928-HITUNG NILAI RAPORT.docx', '2016-03-11 14:39:09', '2016-03-11 14:39:09', 'kjbkbk');

-- --------------------------------------------------------

--
-- Table structure for table `elearning_jawab`
--

CREATE TABLE `elearning_jawab` (
  `id_elearning_jawab` int(5) NOT NULL,
  `id_elearning` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `file_tugas` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elearning_jawab`
--

INSERT INTO `elearning_jawab` (`id_elearning_jawab`, `id_elearning`, `nisn`, `keterangan`, `file_tugas`, `waktu`) VALUES
(3, 25, '9991268756', 'Ini buk Guru tugas dari saya, Tolong diperiksa,..', '20160309112015-Nilai_Siswa_9982679070.pdf', '2016-03-09 11:20:15'),
(4, 27, '9991268756', 'Ini Tugas saya buk..', '20160311072733-Pengembangan Members.txt', '2016-03-11 07:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `forum_komentar`
--

CREATE TABLE `forum_komentar` (
  `id_forum_komentar` int(10) NOT NULL,
  `id_forum_topic` int(10) NOT NULL,
  `nisn_nip` varchar(20) NOT NULL,
  `isi_komentar` text NOT NULL,
  `waktu_komentar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_komentar`
--

INSERT INTO `forum_komentar` (`id_forum_komentar`, `id_forum_topic`, `nisn_nip`, `isi_komentar`, `waktu_komentar`) VALUES
(1, 3, '9980707189', 'Senangi dulu pelajaran yang diharapkan nilainya bagus. Tanpa menyenangi pelajaran tersebut, maka hasil yang diperoleh melalui belajar tidak akan maksimal. Paling tidak, jangan sampai membenci pelajarannya. Hal ini karena akan tidak mungkin seseorang bisa betah lama-lama belajar materi suatu mata pelajaran yang dibencinya, apalagi untuk memahaminya.', '2015-12-12 05:09:15'),
(7, 1, '9980722436', 'Hallo teman teman, Numpang share lowongan ya. lagi di butuhkan segera nih buat posisi Full Time Web Developer/ Web Programmer.', '2016-02-26 00:34:01'),
(13, 1, '9991268756', 'Kami hanya ingin berdoa, ingin beribadah dan menjalankan ibadat kami. Kami tidak pernah menggangu apalagi berusaha untuk mengganggu umat beragama lain apalagi melakukan kristenisasi. Berpikir untuk itu saja kami tidak pernah.', '2016-03-09 10:38:51'),
(12, 1, '195704111980032004', 'Kami cuma ingin memiliki rumah ibadat agar kami dapat berdoa kepada Tuhan kami dengan khusuk. Dosakah itu? apakah itu terlarang di negara yag berazaskan Pancasila ini? Dimanakah rasa damai dan keadilan itu? Masih adakah toleransi di negara ini?', '2016-03-09 10:36:22'),
(3, 3, '9980722436', 'Milikilah rasa ingin tahu yang besar, karena hanya orang-orang yang memiliki rasa ingin tahu yang besar dalam banyak hal lah yang akan selalu senang dalam belajar, dan selalu ingin mempelajari dan memahami hal-hal baru dan banyak hal yang ia temui.', '2015-12-11 17:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

CREATE TABLE `forum_topic` (
  `id_forum_topic` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `judul_topic` varchar(255) NOT NULL,
  `isi_topic` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_topic`
--

INSERT INTO `forum_topic` (`id_forum_topic`, `kodejdwl`, `judul_topic`, `isi_topic`, `waktu`) VALUES
(1, 33, 'Cara Unutk Memahami Rumus Pitagoras dengan mudah.', 'Dalam matematika, teorema Pythagoras adalah suatu keterkaitan dalam geometri Euklides antara tiga sisi sebuah segitiga siku-siku. Teorema ini dinamakan menurut nama filsuf dan matematikawan Yunani abad ke-6 SM, Pythagoras. . Pythagoras mendapat kredit karena ialah yang pertama membuktikan kebenaran universal dari teorema ini melalui pembuktian matematis.', '2015-12-11 08:08:18'),
(2, 7, 'Rumus untuk menghitung pendapatan perkapita', 'Pendapatan per kapita adalah jumlah (nilai) barang dan jasa rata-rata yang tersedia bagi setiap penduduk suatu negara pada suatu periode tertentu.\r\n\r\nPendapatan per kapita dapat digunakan untuk membandingkan kesejahteraan atau standar hidup suatu negara dari tahun ke tahun. Dengan melakukan perbandingan seperti itu, kita dapat mengamati apakah kesejahteraan masyarakat pada suatu negara secara rata-rata telah meningkat. Pendapatan per kapita yang meningkat merupakan salah satu tanda bahwa rata-rata kesejahteraan penduduk telah meningkat. Pendapatan per kapita menunjukkan pula apakah pembangunan yang telah dilaksanakan oleh pemerintah telah berhasil, berapa besar keberhasilan tersebut, dan akibat apa yang timbul oleh peningkatan tersebut.', '2015-12-12 13:13:27'),
(3, 7, 'Cara Mendapatkan Nilai Bagus Dan Menjadi Juara Kelas Di Sekolah', 'Bagaimana caranya agar nilai rapor mata pelajaran di sekolah hasilnya baik dan bagus sehingga syukur-syukur bisa menjadi juara kelas ? Ikuti tips di bawah ini yang didasarkan pada sebuah pengalaman nyata bertahun-tahun dari berbagai sumber. \r\n\r\nPerlu untuk digaris-bawahi, tak dibutuhkan otak yang pintar atau jenius untuk mendapatkan nilai yang bagus di sekolah ataupun untuk menjadi seorang juara kelas. Seseorang yang kemampuan otaknya biasa-biasa saja akan bisa memperoleh hasil yang bagus asalkan ia memiliki niat, kemauan, maupun sikap yang tepat dalam mewujudkan ambisinya.', '2015-12-11 16:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `gaji_pegawai`
--

CREATE TABLE `gaji_pegawai` (
  `id` int(11) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Jabatan` varchar(255) NOT NULL,
  `Kinerja` varchar(255) NOT NULL,
  `Transport` varchar(255) NOT NULL,
  `Tunjangan` varchar(255) NOT NULL,
  `Kasbon` varchar(255) NOT NULL,
  `Nominal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gaji_pegawai`
--

INSERT INTO `gaji_pegawai` (`id`, `Nama`, `Jabatan`, `Kinerja`, `Transport`, `Tunjangan`, `Kasbon`, `Nominal`) VALUES
(1, 'Ahmad', 'Guru BK', 'Baik', 'Rp.500.000', 'Rp.3.000.000', 'Rp.1.000.000', 'Rp.4.500.000');

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `kode_gedung` varchar(10) NOT NULL,
  `nama_gedung` varchar(100) NOT NULL,
  `jumlah_lantai` varchar(20) NOT NULL,
  `panjang` varchar(20) NOT NULL,
  `tinggi` varchar(20) NOT NULL,
  `lebar` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gedung`
--

INSERT INTO `gedung` (`kode_gedung`, `nama_gedung`, `jumlah_lantai`, `panjang`, `tinggi`, `lebar`, `keterangan`, `aktif`) VALUES
('G001', 'Gedung A', '2', '100', '50', '50', '', 'Y'),
('G002', 'Gedung B', '3', '50', '80', '30', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `id_golongan` int(5) NOT NULL,
  `nama_golongan` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `golongan`
--

INSERT INTO `golongan` (`id_golongan`, `nama_golongan`, `keterangan`) VALUES
(1, 'IV/a', 'Golongan IV/a');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_guru` varchar(150) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(50) NOT NULL,
  `niy_nigk` varchar(50) NOT NULL,
  `nuptk` varchar(50) NOT NULL,
  `id_status_kepegawaian` int(5) NOT NULL,
  `id_jenis_ptk` int(5) NOT NULL,
  `pengawas_bidang_studi` varchar(150) NOT NULL,
  `id_agama` int(5) NOT NULL,
  `alamat_jalan` varchar(255) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `nama_dusun` varchar(100) NOT NULL,
  `desa_kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tugas_tambahan` varchar(100) NOT NULL,
  `id_status_keaktifan` int(5) NOT NULL,
  `sk_cpns` varchar(150) NOT NULL,
  `tanggal_cpns` date NOT NULL,
  `sk_pengangkatan` varchar(150) NOT NULL,
  `tmt_pengangkatan` date NOT NULL,
  `lembaga_pengangkatan` varchar(150) NOT NULL,
  `id_golongan` int(5) NOT NULL,
  `keahlian_laboratorium` varchar(150) NOT NULL,
  `sumber_gaji` varchar(150) NOT NULL,
  `nama_ibu_kandung` varchar(100) NOT NULL,
  `id_status_pernikahan` int(5) NOT NULL,
  `nama_suami_istri` varchar(100) NOT NULL,
  `nip_suami_istri` varchar(30) NOT NULL,
  `pekerjaan_suami_istri` varchar(100) NOT NULL,
  `tmt_pns` date NOT NULL,
  `lisensi_kepsek` varchar(20) NOT NULL,
  `jumlah_sekolah_binaan` int(5) NOT NULL,
  `diklat_kepengawasan` varchar(20) NOT NULL,
  `mampu_handle_kk` varchar(20) NOT NULL,
  `keahlian_breile` varchar(20) NOT NULL,
  `keahlian_bahasa_isyarat` varchar(20) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `kewarganegaraan` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `password`, `nama_guru`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nik`, `niy_nigk`, `nuptk`, `id_status_kepegawaian`, `id_jenis_ptk`, `pengawas_bidang_studi`, `id_agama`, `alamat_jalan`, `rt`, `rw`, `nama_dusun`, `desa_kelurahan`, `kecamatan`, `kode_pos`, `telepon`, `hp`, `email`, `tugas_tambahan`, `id_status_keaktifan`, `sk_cpns`, `tanggal_cpns`, `sk_pengangkatan`, `tmt_pengangkatan`, `lembaga_pengangkatan`, `id_golongan`, `keahlian_laboratorium`, `sumber_gaji`, `nama_ibu_kandung`, `id_status_pernikahan`, `nama_suami_istri`, `nip_suami_istri`, `pekerjaan_suami_istri`, `tmt_pns`, `lisensi_kepsek`, `jumlah_sekolah_binaan`, `diklat_kepengawasan`, `mampu_handle_kk`, `keahlian_breile`, `keahlian_bahasa_isyarat`, `npwp`, `kewarganegaraan`, `foto`) VALUES
('55544423232131', 'test', 'Endah', 1, 'Bandung', '1982-09-17', '', '', '', 0, 2, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 1, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('111133336666', 'test', 'Idgham', 1, 'Jakarta', '1980-02-10', '', '', '', 0, 2, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 1, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('666644442222', 'test', 'Ahyana', 1, 'Yogyakarta', '1982-09-17', '', '', '', 0, 2, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 1, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('725527625', 'test', 'Fidel', 0, '', '0000-00-00', '', '', '', 0, 2, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 1, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('123443211234', 'test', 'Enny Setiani', 2, 'Mojokerto', '1975-08-23', '', '', '', 0, 2, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 1, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('1112223334444', 'TEST', 'Fitri', 1, 'Bandung', '1986-03-10', '', '', '', 0, 0, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 1, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('222244446666', 'test', 'Sugeng', 2, 'Lampung', '1992-06-15', '', '', '', 0, 0, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 1, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('333366669999', 'test', 'Sri', 2, 'Solo', '1978-09-21', '', '', '', 0, 2, '', 0, '', '00', '00', '', '', '', 0, '', '', '', '', 0, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('444422221111', 'test', 'Supri', 1, 'Tegal', '1989-10-15', '', '', '', 0, 2, '', 1, '', '00', '00', '', '', '', 0, '', '', '', '', 0, '', '0000-00-00', '', '0000-00-00', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('197712282006042005', '9218814438', 'Nabila', 2, 'Situjuh Batur,50Kota', '1977-12-28', '1374025104571989', '', '3560755657300033', 3, 2, '', 1, 'Jl.Khatib Sulaiman, Situjuh Batur', '0', '0', '', 'Situjuah Batua', 'Kec. Situjuah Limo Nagari', 26263, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/005-5D/BKD-2006', '2006-04-01', '813/005-5D/BKD-2006', '2006-04-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Hj. Zulbaidah Ham', 1, 'Satria Irandi', '', 'Peternak', '2007-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470836202000', 'INDONESIA', '');

-- --------------------------------------------------------

--
-- Table structure for table `halaman`
--

CREATE TABLE `halaman` (
  `id_halaman` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `judul_seo` varchar(255) NOT NULL,
  `isi_halaman` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `status` enum('psb','journal') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `halaman`
--

INSERT INTO `halaman` (`id_halaman`, `judul`, `judul_seo`, `isi_halaman`, `username`, `status`) VALUES
(1, 'Selamat Datang di Sistem Pendaftaran Siswa Baru', 'selamat-datang-di-sistem-pendaftaran-siswa-baru', 'Sistem PSB online atau sistem informasi aplikasi penerimaan siswa baru online merupakan produk layanan aplikasi perangkat lunak  yang online real time dan 100%   berbasis web. Sistem   ini   berusaha   memenuhi kebutuhan   masyarakat khususnya  bagi orangtua  dan  calon  siswa  untuk  dapat melaksanakan  pendaftaran  ke sekolah dengan  aman  dan  tertib  dengan menyediakan  fitur  otomasi  proses penerimaan  siswa  baru secara  langsung  menggunakan  media internet,  mulai  dari proses pendaftaran, proses seleksi, hingga pengumuman hasil penerimaan siswa secara langsung nyata melalui internet.\r\n\r\nYayasan lokomedia.web.id didirikan di Padang dengan Akte Notaris Leurentia Siti Nyoman tertanggal 6 Maret 1996.Pada tahun pertama ini dibukalah taman kanak-kanak dan plygroup dengan murid berjumlah 73 orang dan kampusnya berlokasi di jalan Thamrin No.22-25\r\n', 'admin', 'psb'),
(2, 'Prosedur Pendaftaran Siswa Baru', 'prosedur-pendaftaran-siswa-baru', 'Melakukan  pendaftaran secara online melalui website psb.dek.sch.id\nMembayar uang pendaftaran sebesar Rp 60.000,00 ke Rekening Sekolah :\nNo Rekening : xxxxxxxxxxxxxx\nAtas Nama : BPN 010 SMAK PADANG\nBRI UNIT PASAR BARU PADANG\n\n<b>Note : Bagi Bapak/Ibuk yang sudah melakukan pembayaran dan konfirmasi harap segera megirim pesan ke nomor 082384116431</b>\n\nUntuk Metode Tansfer.\ndengan format pesan : [jenis metode pembaran] [no_rekening] [nama anak/nama pesera] [nomor_konfirmasi]\nContoh Pesan Metode Transfer : Transfer 111112318923 Annisa Mardatilah QC401\n\nUntuk Metode Setoran.\nInvite/Add ID What\'sApp dengan nomor 081267771344\ndengan format pesan : Kirim foto bukti slip setoran dan nama anak/peserta serta nomor konfirmasi\nContoh Format Pesan Whatsapp : [foto bukti slip setor] Annisa Mardatillah QC401\n\nMenyerahkan berkas dan ketentuan sebagai berikut apabila calon siswa dinyatakan lulus tes online.\nFoto kopi  rapor yang sudah dilegalisasi dari semester I - IV (1 rangkap)\nMemperlihatkan rapor asli\nSehat jasmani dan rohani (diperiksa di  SMK SMAK)\nTidak Buta Warna (diperiksa di SMK SMAK Padang)\nPas foto  warna terbaru ukuran 2x3 sebanyak 2 lembar dan 3X4 sebanyak 3 lembar', 'admin', 'psb');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_notulensi`
--

CREATE TABLE `hasil_notulensi` (
  `id` int(11) NOT NULL,
  `file_notulensi` varchar(255) NOT NULL,
  `judul_notulensi` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil_notulensi`
--

INSERT INTO `hasil_notulensi` (`id`, `file_notulensi`, `judul_notulensi`, `tanggal`, `tempat`, `keterangan`) VALUES
(1, '20200725-20200309-test.pdf', 'test', '2020-07-25', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `identitas_sekolah`
--

CREATE TABLE `identitas_sekolah` (
  `id_identitas_sekolah` int(5) NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `nss` varchar(50) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `kode_pos` int(7) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kabupaten_kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `website` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `identitas_sekolah`
--

INSERT INTO `identitas_sekolah` (`id_identitas_sekolah`, `nama_sekolah`, `npsn`, `nss`, `alamat_sekolah`, `kode_pos`, `no_telpon`, `kelurahan`, `kecamatan`, `kabupaten_kota`, `provinsi`, `website`, `email`) VALUES
(1, 'SMA NEGERI 7 BANDAR LAMPUNG', '10301989', '4232322', 'JL. PRABOWO, S.Kom, M.Kom', 26175, '0751-190285', 'Linggar Jati', 'TANJUNG ', 'BANDAR LAMPUNG', 'LAMPUNG', 'SMK7NBDL.SCH.ID', 'dankrez48@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pelajaran`
--

CREATE TABLE `jadwal_pelajaran` (
  `kodejdwl` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_pelajaran` varchar(10) NOT NULL,
  `kode_ruangan` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `paralel` varchar(10) NOT NULL,
  `jadwal_serial` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `hari` varchar(20) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal_pelajaran`
--

INSERT INTO `jadwal_pelajaran` (`kodejdwl`, `id_tahun_akademik`, `kode_kelas`, `kode_pelajaran`, `kode_ruangan`, `nip`, `paralel`, `jadwal_serial`, `jam_mulai`, `jam_selesai`, `hari`, `aktif`) VALUES
(5, 20161, 'X.MIPA.1', 'MK02', 'R003', '195806161984000001', '', '', '23:00:00', '23:30:00', 'Senin', 'Ya'),
(13, 20161, 'X.MIPA.1', 'MK01', 'R003', '195704111980032004', '', '', '09:00:00', '11:30:00', 'Senin', 'Ya'),
(14, 20161, 'X.MIPA.1', 'MK03', 'R004', '195806161984032002', '', '', '08:00:00', '10:30:00', 'Selasa', 'Ya'),
(33, 20162, 'X.MIPA.1', 'MK15', 'R001', '195806161984000002', '00', '00', '08:00:00', '10:00:00', 'Senin', 'Ya'),
(34, 20202021, 'X.TKJ.1', 'KWU10TKJ', 'R001', '1112223334444', '', '', '08:15:00', '10:45:00', 'Senin', 'Ya'),
(35, 20202021, '0', 'WAN10TKJ', 'R001', '222244446666', '', '', '10:45:00', '15:45:00', 'Senin', 'Ya'),
(36, 20202021, 'X.TKJ.1', 'WAN10TKJ', 'R001', '222244446666', '', '', '10:45:00', '15:45:00', 'Senin', 'Ya'),
(37, 20202021, 'X.TKJ.1', 'TLJ10TKJ', 'R001', '197712282006042005', '', '', '08:15:00', '11:30:00', 'Selasa', 'Ya'),
(38, 20202021, 'X.TKJ.1', 'KWU10TKJ', 'R001', '1112223334444', '', '', '12:30:00', '14:45:00', 'Selasa', 'Ya'),
(39, 20202021, 'X.TKJ.1', 'PPKN10TKJ', 'R001', '333366669999', '', '', '02:45:00', '16:00:00', 'Selasa', 'Ya'),
(40, 20202021, 'X.TKJ.1', 'ASJ10TKJ', 'R001', '197712282006042005', '', '', '08:00:00', '11:30:00', 'Rabu', 'Ya'),
(41, 20202021, 'X.TKJ.1', 'MTK110TKJ', 'R001', '1112223334444', '', '', '12:30:00', '14:00:00', 'Rabu', 'Ya'),
(42, 20202021, 'X.TKJ.1', 'AIJ', 'R001', '444422221111', '', '', '14:15:00', '15:45:00', 'Rabu', 'Ya'),
(43, 20202021, 'X.TKJ.1', 'ASJ10TKJ', 'R001', '197712282006042005', '', '', '08:00:00', '10:00:00', 'Kamis', 'Ya'),
(44, 20202021, 'X.TKJ.1', 'PAI10TKJ', 'R001', '111133336666', '', '', '10:45:00', '11:30:00', 'Kamis', 'Ya'),
(45, 20202021, 'X.TKJ.1', 'PJO10TKJ', 'R001', '666644442222', '', '', '12:15:00', '14:15:00', 'Kamis', 'Ya'),
(46, 20202021, 'X.TKJ.1', 'ENG10TKJ', 'R001', '123443211234', '', '', '14:15:00', '15:00:00', 'Kamis', 'Ya'),
(47, 20202021, 'X.TKJ.1', 'MTK110TKJ', 'R001', '725527625', '', '', '15:00:00', '16:00:00', 'Kamis', 'Ya'),
(48, 20202021, 'X.TKJ.1', 'ENG10TKJ', 'R001', '123443211234', '', '', '08:00:00', '09:15:00', 'Jumat', 'Ya'),
(49, 20202021, 'X.TKJ.1', 'BI10TKJ', 'R001', '197712282006042005', '', '', '09:15:00', '11:30:00', 'Jumat', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pengawas`
--

CREATE TABLE `jadwal_pengawas` (
  `id` int(11) NOT NULL,
  `nm_ujian` varchar(255) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_pengawas`
--

INSERT INTO `jadwal_pengawas` (`id`, `nm_ujian`, `semester`, `tahun`) VALUES
(2, '20200720-20200309-test.pdf', 'Genap', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ujian`
--

CREATE TABLE `jadwal_ujian` (
  `id` int(11) NOT NULL,
  `nm_ujian` varchar(255) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal_ujian`
--

INSERT INTO `jadwal_ujian` (`id`, `nm_ujian`, `semester`, `tahun`) VALUES
(16, '20200308-test.pdf', 'Genap', 2020),
(17, '20200308-test.pdf', 'test', 2020),
(18, '20200720-CV-Inggris.jpg', 'test', 0000);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ukk`
--

CREATE TABLE `jadwal_ukk` (
  `id` int(11) NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `dari_tanggal` date NOT NULL,
  `sampai_tanggal` date NOT NULL,
  `penyelenggara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_ukk`
--

INSERT INTO `jadwal_ukk` (`id`, `nama_sekolah`, `jurusan`, `dari_tanggal`, `sampai_tanggal`, `penyelenggara`) VALUES
(1, 'Darul Hikam', 'IPA', '2020-07-25', '2020-07-31', 'Darul Hikam');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_un`
--

CREATE TABLE `jadwal_un` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `dari_jam` time NOT NULL,
  `sampai_jam` time NOT NULL,
  `mata_pelajaran` varchar(255) NOT NULL,
  `sesi` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_un`
--

INSERT INTO `jadwal_un` (`id`, `tanggal`, `dari_jam`, `sampai_jam`, `mata_pelajaran`, `sesi`, `keterangan`) VALUES
(5, '2020-07-22', '22:00:00', '23:00:00', 'Matematika', '1 ', 'UN');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_essai`
--

CREATE TABLE `jawaban_essai` (
  `id_jawaban_essai` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `id_pertanyaan_essai` int(10) NOT NULL,
  `jawaban_essai` text NOT NULL,
  `waktu_tugas` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jawaban_essai`
--

INSERT INTO `jawaban_essai` (`id_jawaban_essai`, `nisn`, `id_pertanyaan_essai`, `jawaban_essai`, `waktu_tugas`) VALUES
(1, '0000261141', 1, 'abdurrahman wahid (Gus Dur)', '2016-03-05 14:16:15'),
(2, '0000261141', 2, '1. Udin Sedunia\r\n2. Sopan Sopian\r\n3. Inul Daratista\r\n4. Angelina Sondak\r\n5. Ruhut Sitompul', '2016-03-05 14:16:11'),
(3, '0000261141', 3, 'Di Kota Padang, Sumatera Barat Kota Padang', '2016-03-05 14:16:08'),
(4, '0000261141', 6, 'Wr Supratman', '2016-03-05 14:16:04'),
(5, '0000240365', 10, '359', '2016-03-05 14:15:41'),
(6, '0000240365', 9, 'PRABOWO, S.Kom, M.Kom', '2016-03-05 14:15:51'),
(7, '9991268756', 10, 'Jawaban dari soal no 1..', '2016-03-09 03:39:36'),
(8, '9991268756', 9, 'Jawaban soal no 2,..', '2016-03-09 03:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_objektif`
--

CREATE TABLE `jawaban_objektif` (
  `id_jawaban_objektif` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `id_pertanyaan_objektif` int(10) NOT NULL,
  `jawaban` varchar(2) NOT NULL,
  `waktu_objektif` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jawaban_objektif`
--

INSERT INTO `jawaban_objektif` (`id_jawaban_objektif`, `nisn`, `id_pertanyaan_objektif`, `jawaban`, `waktu_objektif`) VALUES
(21, '0000261141', 5, 'a', '2016-03-05 14:16:54'),
(20, '0000261141', 1, 'b', '2016-03-05 14:16:51'),
(19, '0000261141', 2, 'c', '2016-03-05 14:16:48'),
(18, '0000240365', 6, 'a', '2016-03-05 14:22:49'),
(22, '0000240365', 8, 'e', '2016-03-05 14:16:40'),
(23, '9991268756', 8, 'a', '2016-03-09 03:39:51'),
(24, '9991268756', 6, 'b', '2016-03-09 03:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id_jenis_kelamin` int(5) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id_jenis_kelamin`, `jenis_kelamin`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ptk`
--

CREATE TABLE `jenis_ptk` (
  `id_jenis_ptk` int(5) NOT NULL,
  `jenis_ptk` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_ptk`
--

INSERT INTO `jenis_ptk` (`id_jenis_ptk`, `jenis_ptk`, `keterangan`) VALUES
(1, 'Tenaga Administrasi Sekolah', ''),
(2, 'Guru Mapel', ''),
(3, 'Guru BK', ''),
(4, 'Guru Kelas', '');

-- --------------------------------------------------------

--
-- Table structure for table `journal_list`
--

CREATE TABLE `journal_list` (
  `id_journal` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_ke` varchar(50) NOT NULL,
  `materi` text NOT NULL,
  `keterangan` text NOT NULL,
  `waktu_input` datetime NOT NULL,
  `users` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_list`
--

INSERT INTO `journal_list` (`id_journal`, `kodejdwl`, `hari`, `tanggal`, `jam_ke`, `materi`, `keterangan`, `waktu_input`, `users`) VALUES
(1, 33, 'Jumat', '2016-07-08', '1', 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisannn.', 'Sebagai pendidik kita tentunya harus mempersiapkan segala sesuatu yang berhubungan dengan administrasi untuk mengajar...dalam kesempatan ini kami akan mencoba membuat draft jurnal kelas', '2016-07-08 08:08:37', '195806161984000002'),
(2, 33, 'Jumat', '2016-07-08', '2', 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisane.', 'Jurnal pembelajaran harian merupakan salah satu perangkat pembelajaran yang diperlukan oleh guru guna mencatat pelaksanaan pembelajaran setiap hari. jurnal pembelajaran dapat membantu proses sejauh mana kita telah mengajar serta menghandle siapa saja murid/guru yang tidak masuk atau yang tidak mengikuti proses KBM.', '2016-07-08 09:11:24', '195806161984000002'),
(5, 33, 'Jumat', '2016-07-08', '3', 'Berikut ini merupakan contoh dari enkripsi RSA dan dekripsinya. Parameter yang digunakan disini berupa bilangan kecil.', 'RSA di bidang kriptografi adalah sebuah algoritma pada enkripsi public key. RSA merupakan algoritma pertama yang cocok untuk digital signature seperti halnya ekripsi, dan salah satu yang paling maju dalam bidang kriptografi public key. RSA masih digunakan secara luas dalam protokol electronic commerce, dan dipercaya dalam mengamnkan dengan menggunakan kunci yang cukup panjang.', '2016-07-08 10:33:39', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(10) NOT NULL,
  `nama_jurusan` varchar(255) NOT NULL,
  `nama_jurusan_en` varchar(255) NOT NULL,
  `bidang_keahlian` varchar(150) NOT NULL,
  `kompetensi_umum` varchar(150) NOT NULL,
  `kompetensi_khusus` varchar(150) NOT NULL,
  `pejabat` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `nama_jurusan_en`, `bidang_keahlian`, `kompetensi_umum`, `kompetensi_khusus`, `pejabat`, `jabatan`, `keterangan`, `aktif`) VALUES
('TKJ1', 'TEKNIK KOMPUTER DAN JARINGAN', '', 'WEB,KONFIGURASI,LAN', 'Menguasai Semua Bidang Keahlian', 'Menguasai Semua Bidang TKJ', 'AIZA NABILLA HASAN', 'Ketua Jurusan', '', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_elearning`
--

CREATE TABLE `kategori_elearning` (
  `id_kategori_elearning` int(5) NOT NULL,
  `nama_kategori_elearning` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_elearning`
--

INSERT INTO `kategori_elearning` (`id_kategori_elearning`, `nama_kategori_elearning`) VALUES
(1, 'Bahan'),
(2, 'Tugas');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_quiz_ujian`
--

CREATE TABLE `kategori_quiz_ujian` (
  `id_kategori_quiz_ujian` int(5) NOT NULL,
  `kategori_quiz_ujian` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_quiz_ujian`
--

INSERT INTO `kategori_quiz_ujian` (`id_kategori_quiz_ujian`, `kategori_quiz_ujian`) VALUES
(1, 'Quiz Online'),
(2, 'Ujian Online');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `kode_kehadiran` varchar(5) NOT NULL,
  `nama_kehadiran` varchar(20) NOT NULL,
  `nilai` int(2) NOT NULL,
  `bobot` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`kode_kehadiran`, `nama_kehadiran`, `nilai`, `bobot`) VALUES
('H', 'Hadir', 1, '1'),
('I', 'Izin', 1, '0.5'),
('S', 'Sakit', 1, '0.5'),
('A', 'Alpa', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `kode_ruangan` varchar(10) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `nip`, `kode_jurusan`, `kode_ruangan`, `nama_kelas`, `aktif`) VALUES
('X.TKJ.1', '666644442222', 'TKJ1', 'R001', 'Kelas X TKJ 1', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_mata_pelajaran`
--

CREATE TABLE `kelompok_mata_pelajaran` (
  `id_kelompok_mata_pelajaran` int(5) NOT NULL,
  `jenis_kelompok_mata_pelajaran` varchar(50) NOT NULL,
  `nama_kelompok_mata_pelajaran` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelompok_mata_pelajaran`
--

INSERT INTO `kelompok_mata_pelajaran` (`id_kelompok_mata_pelajaran`, `jenis_kelompok_mata_pelajaran`, `nama_kelompok_mata_pelajaran`) VALUES
(1, 'A', 'Kelompok A (Umum)'),
(2, 'B', 'Kelompok B (Umum)'),
(3, 'C', 'Kelompok C (Peminatan)');

-- --------------------------------------------------------

--
-- Table structure for table `kompetensi_dasar`
--

CREATE TABLE `kompetensi_dasar` (
  `id_kompetensi_dasar` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `ranah` enum('pengetahuan','keterampilan','sikap') NOT NULL,
  `kompetensi_dasar` text NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kompetensi_dasar`
--

INSERT INTO `kompetensi_dasar` (`id_kompetensi_dasar`, `kodejdwl`, `ranah`, `kompetensi_dasar`, `waktu_input`) VALUES
(1, 33, 'pengetahuan', 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisannn.', '2016-07-03 08:10:13'),
(2, 33, 'keterampilan', 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisane.', '2016-07-03 09:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `kode_kurikulum` int(5) NOT NULL,
  `nama_kurikulum` varchar(255) NOT NULL,
  `status_kurikulum` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`kode_kurikulum`, `nama_kurikulum`, `status_kurikulum`) VALUES
(1, 'Kurikulum 2013', 'Ya'),
(2, 'Kurikulum 2016', 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `level_user`
--

CREATE TABLE `level_user` (
  `id` int(11) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level_user`
--

INSERT INTO `level_user` (`id`, `level`) VALUES
(1, 'tu'),
(2, 'keuangan'),
(3, 'lsp'),
(4, 'kesiswaan'),
(5, 'bkk'),
(6, 'humas'),
(7, 'subrayon'),
(8, 'manmutu'),
(9, 'kepala'),
(10, 'superuser'),
(11, 'kurikulum');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_pelajaran` varchar(20) NOT NULL,
  `id_kelompok_mata_pelajaran` int(3) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kode_kurikulum` int(5) NOT NULL,
  `namamatapelajaran` varchar(150) NOT NULL,
  `namamatapelajaran_en` varchar(150) NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `kompetensi_umum` text NOT NULL,
  `kompetensi_khusus` text NOT NULL,
  `jumlah_jam` varchar(20) NOT NULL,
  `sesi` varchar(50) NOT NULL,
  `urutan` int(3) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_pelajaran`, `id_kelompok_mata_pelajaran`, `kode_jurusan`, `nip`, `kode_kurikulum`, `namamatapelajaran`, `namamatapelajaran_en`, `tingkat`, `kompetensi_umum`, `kompetensi_khusus`, `jumlah_jam`, `sesi`, `urutan`, `aktif`) VALUES
('BI10TKJ', 1, 'TKJ1', '55544423232131', 1, 'Bahasa Indonesia', '', '', '', '', '', '', 0, 'Ya'),
('ENG10TKJ', 1, 'TKJ1', '123443211234', 1, 'Bahasa Inggris', '', '', '', '', '', '', 0, 'Ya'),
('PAI10TKJ', 1, 'TKJ1', '111133336666', 1, 'Pendidikan Agama Islam', '', '1 TKJ', '', '', '', '', 0, 'Ya'),
('PJO10TKJ', 1, 'TKJ1', '666644442222', 1, 'Penjas Orkes', '', '', '', '', '', '', 0, 'Ya'),
('AIJ', 3, 'TKJ1', '444422221111', 1, 'Administrsai Infrastruktur Jaringan', '', '1 TKJ', '', '', '', '', 0, 'Ya'),
('ASJ10TKJ', 3, 'TKJ1', '197712282006042005', 1, 'Administrasi Sistem Jaringan', '', '1 TKJ', '', '', '', '', 0, 'Ya'),
('MTK110TKJ', 1, 'TKJ1', '1112223334444', 1, 'Matematika', '', '', '', '', '', '', 0, 'Ya'),
('PPKN10TKJ', 1, 'TKJ1', '333366669999', 1, 'Pendidikan Pancasila dan Kewarganegaraan', '', '1 TKJ', '', '', '', '', 0, 'Ya'),
('TLJ10TKJ', 3, 'TKJ1', '197712282006042005', 1, 'Teknologi Layanan Jaringan', '', '1 TKJ', '', '', '', '', 0, 'Ya'),
('KWU10TKJ', 1, 'TKJ1', '1112223334444', 1, 'Produk Kreatif dan Kewirausahaan', '', '1 TKJ', '', '', '4', '', 0, 'Ya'),
('WAN10TKJ', 3, 'TKJ1', '222244446666', 1, 'Teknologi Jaringan Berbasis Luas/WAN', '', '1 TKJ', '', '', '', '', 0, 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `nama_menu` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `urutan` int(3) NOT NULL,
  `status` enum('psb','journal') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_parent`, `nama_menu`, `icon`, `link`, `aktif`, `urutan`, `status`) VALUES
(1, 0, 'Beranda', 'home', 'index.mu', 'Ya', 1, 'psb'),
(2, 0, 'Aturan & Prosedur', 'th-list', 'halaman-prosedur-pendaftaran-siswa-baru.mu', 'Ya', 2, 'psb'),
(3, 0, 'Jadwal Pelaksanaan', 'calendar', '#', 'Ya', 3, 'psb'),
(4, 0, 'Alur Pendaftaran', 'retweet', '#', 'Ya', 4, 'psb');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_extrakulikuler`
--

CREATE TABLE `nilai_extrakulikuler` (
  `id_nilai_extrakulikuler` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kegiatan` text NOT NULL,
  `nilai` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_extrakulikuler`
--

INSERT INTO `nilai_extrakulikuler` (`id_nilai_extrakulikuler`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `kegiatan`, `nilai`, `deskripsi`, `user_akses`, `waktu_input`) VALUES
(1, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Mandi-mandii', 87, 'Kegiatan mandi-mandi dilaksanakan di lubuak minturun bersamaan dengan perayaan ulang tahun sekolah.', '1', '2016-04-29 10:11:10'),
(2, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Bakar ayam.', 95, 'Memiliki keterampilan Mengidentifikasi, menyajikan model matematika dan menyelesaikan masalah keseharian.				', '1', '2016-04-29 07:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_keterampilan`
--

CREATE TABLE `nilai_keterampilan` (
  `id_nilai_keterampilan` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kd` varchar(5) NOT NULL,
  `nilai1` float NOT NULL,
  `nilai2` float NOT NULL,
  `nilai3` float NOT NULL,
  `nilai4` float NOT NULL,
  `nilai5` float NOT NULL,
  `nilai6` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_keterampilan`
--

INSERT INTO `nilai_keterampilan` (`id_nilai_keterampilan`, `kodejdwl`, `nisn`, `kd`, `nilai1`, `nilai2`, `nilai3`, `nilai4`, `nilai5`, `nilai6`, `deskripsi`, `user_akses`, `waktu`) VALUES
(1, 5, '9991268756', '4.1', 75, 70, 78, 85, 78, 72, 'Mengabstraksi teks cerita pendek, baik secara lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(2, 5, '9998218087', '1', 88, 90, 98, 96, 0, 0, '', '1', '2016-04-11 18:26:32'),
(3, 5, '9998215055', '1', 67, 98, 76, 90, 0, 0, '', '1', '2016-04-11 18:26:32'),
(4, 5, '9998214335', '1', 87, 88, 0, 0, 0, 0, '', '1', '2016-04-11 18:26:32'),
(5, 5, '9998214151', '1', 89, 0, 0, 90, 0, 0, '', '1', '2016-04-11 18:26:32'),
(6, 5, '9997515863', '1', 89, 80, 88, 0, 0, 0, '', '1', '2016-04-11 18:26:32'),
(7, 5, '9991268756', '4.2', 87, 90, 94, 93, 88, 83, 'Mengabstraksi teks cerita ulang, baik secara lisan maupun tulisan ', '1', '2016-04-14 08:03:27'),
(8, 5, '9998218087', '2', 88, 93, 90, 99, 0, 0, '', '1', '2016-04-14 08:03:27'),
(9, 5, '9998215055', '2', 78, 87, 89, 79, 0, 0, '', '1', '2016-04-14 08:03:27'),
(10, 5, '9991268756', '4.3', 89, 89, 98, 95, 79, 77, 'Mengabstraksi teks pantun, baik secara lisan maupun tulisan', '1', '2016-04-14 08:03:57'),
(11, 5, '9998218087', '3', 78, 87, 89, 88, 0, 0, '', '1', '2016-04-14 08:03:57'),
(12, 5, '9998215055', '3', 70, 78, 87, 90, 0, 0, '', '1', '2016-04-14 08:03:57'),
(13, 5, '9991268756', '4.4', 90, 89, 87, 90, 85, 90, 'Menginterpretasi makna teks pantun, baik secara lisan maupun tulisan ', '1', '2016-04-14 08:04:20'),
(14, 5, '9998218087', '4', 87, 88, 83, 89, 0, 0, '', '1', '2016-04-14 08:04:20'),
(15, 5, '9991268756', '4.5', 99, 87, 98, 95, 96, 91, 'Menyunting teks cerita ulang, sesuai dengan struktur dan kaidah teks baik secara lisan maupun tulisan', '1', '2016-04-14 08:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_pengetahuan`
--

CREATE TABLE `nilai_pengetahuan` (
  `id_nilai_pengetahuan` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kd` varchar(5) NOT NULL,
  `nilai1` float NOT NULL,
  `nilai2` float NOT NULL,
  `nilai3` float NOT NULL,
  `nilai4` float NOT NULL,
  `nilai5` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_pengetahuan`
--

INSERT INTO `nilai_pengetahuan` (`id_nilai_pengetahuan`, `kodejdwl`, `nisn`, `kd`, `nilai1`, `nilai2`, `nilai3`, `nilai4`, `nilai5`, `deskripsi`, `user_akses`, `waktu`) VALUES
(1, 5, '9991268756', '4.1', 89, 90, 89, 95, 90, 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(2, 5, '9998218087', '4.1', 90, 88, 90, 98, 96, 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(3, 5, '9998215055', '', 98, 67, 98, 76, 90, '', '1', '2016-04-11 18:26:32'),
(4, 5, '9998214335', '', 88, 87, 88, 0, 0, '', '1', '2016-04-11 18:26:32'),
(5, 5, '9998214151', '', 0, 89, 0, 0, 90, '', '1', '2016-04-11 18:26:32'),
(6, 5, '9997515863', '', 80, 89, 80, 88, 0, '', '1', '2016-04-11 18:26:32'),
(7, 5, '9991268756', '4.2', 90, 87, 90, 94, 94, 'Membandingkan teks cerita pendek, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:03:27'),
(8, 5, '9998218087', '4.2', 93, 88, 93, 90, 99, 'Menganalisis teks cerita ulang, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:03:27'),
(9, 5, '9998215055', '', 87, 78, 87, 89, 79, '', '1', '2016-04-14 08:03:27'),
(10, 5, '9991268756', '4.3', 89, 89, 89, 98, 95, 'Menganalisis teks pantun, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:03:57'),
(11, 5, '9998218087', '', 87, 78, 87, 89, 88, '', '1', '2016-04-14 08:03:57'),
(12, 5, '9998215055', '', 78, 70, 78, 87, 90, '', '1', '2016-04-14 08:03:57'),
(13, 5, '9991268756', '4.4', 89, 90, 89, 87, 90, 'Membandingkan teks cerita ulang, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:04:20'),
(14, 5, '9998218087', '', 88, 87, 88, 83, 89, '', '1', '2016-04-14 08:04:20'),
(15, 5, '9991268756', '4.5', 87, 90, 87, 78, 90, 'Menganalisis teks cerita ulang, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:04:36'),
(16, 5, '9998218087', '', 98, 99, 98, 89, 90, 'Menganalisis teks pantun, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:04:36'),
(18, 5, '9991268756', '4.6', 90, 89, 90, 98, 78, 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisan', '1', '2016-04-30 10:50:43'),
(19, 34, '2121312312312', '5', 80, 60, 50, 70, 0, '', '1', '2020-03-11 14:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_pertanyaan_essai`
--

CREATE TABLE `nilai_pertanyaan_essai` (
  `id_nilai_pertanyaan_essai` int(5) NOT NULL,
  `id_quiz_ujian` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `nilai_essai` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_pertanyaan_essai`
--

INSERT INTO `nilai_pertanyaan_essai` (`id_nilai_pertanyaan_essai`, `id_quiz_ujian`, `nisn`, `nilai_essai`) VALUES
(1, 1, '0000261141', 80),
(2, 4, '0000240365', 70),
(4, 4, '9991268756', 80);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_prestasi`
--

CREATE TABLE `nilai_prestasi` (
  `id_nilai_prestasi` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `jenis_kegiatan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_prestasi`
--

INSERT INTO `nilai_prestasi` (`id_nilai_prestasi`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `jenis_kegiatan`, `keterangan`, `user_akses`, `waktu_input`) VALUES
(2, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Jalan-jalan sore', 'Memiliki keterampilan merencanakan dan melaksanakan percobaan interferensi gelombang cahaya 				', '1', '2016-04-29 08:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_sikap`
--

CREATE TABLE `nilai_sikap` (
  `id_nilai_sikap` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `positif` text NOT NULL,
  `negatif` text NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('spiritual','sosial') NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_sikap`
--

INSERT INTO `nilai_sikap` (`id_nilai_sikap`, `kodejdwl`, `nisn`, `positif`, `negatif`, `deskripsi`, `status`, `user_akses`, `waktu`) VALUES
(1, 5, '9999152999', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-18 16:38:53'),
(2, 5, '9998218087', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-18 16:38:53'),
(3, 5, '9999152999', 'Nilai Sosial Posisitf,..', 'Nilai Sosial Negatif,..', 'Nilai Deskripsi Sosial,..', 'sosial', '1', '2016-04-18 16:39:53'),
(4, 5, '9998218087', 'Nilai Sosial Posisitf 2,..', 'Nilai Sosial Negatif 2,..', 'Nilai Deskripsi Sosial 2,..', 'sosial', '1', '2016-04-18 16:39:53'),
(5, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:12:48'),
(6, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:12:48'),
(7, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:05'),
(8, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:05'),
(9, 5, '9998218087', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:05'),
(10, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:34'),
(11, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:34'),
(12, 5, '9998218087', 'Isi dengan Nilai Positif,..', 'Isi dengan Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:34'),
(13, 5, '9999152999', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:34'),
(14, 5, '9991268756', 'Isi dengan Nilai Sosial Posisitf 2,..', 'Isi dengan Nilai Sosial Negatif 2,..', 'Isi dengan Nilai Deskripsi Sosial 2,..', 'sosial', '1', '2016-04-29 20:14:07'),
(15, 5, '9998218087', 'Nilai Sosial Posisitf 2,..', 'Nilai Sosial Negatif 2,..', '', 'sosial', '1', '2016-04-29 20:14:07'),
(16, 5, '9999152999', 'Nilai Sosial Posisitf,..', 'Nilai Sosial Negatif,..', 'Nilai Deskripsi Sosial,..', 'sosial', '1', '2016-04-29 20:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_sikap_semester`
--

CREATE TABLE `nilai_sikap_semester` (
  `id_nilai_sikap_semester` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `spiritual_predikat` varchar(2) NOT NULL,
  `spiritual_deskripsi` text NOT NULL,
  `sosial_predikat` varchar(2) NOT NULL,
  `sosial_deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_sikap_semester`
--

INSERT INTO `nilai_sikap_semester` (`id_nilai_sikap_semester`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `spiritual_predikat`, `spiritual_deskripsi`, `sosial_predikat`, `sosial_deskripsi`, `user_akses`, `waktu_input`) VALUES
(1, 20161, '9991268756', 'X.MIPA.1', 'A', 'Pertahankan Nilai anda,..', 'B', 'Tingkatkan Nilai anda,..', '1', '2016-04-28 10:10:16'),
(2, 20161, '0151379251', 'X.MIPA.1', 'C', 'Tolong Perbaiki Sikap anda,..', 'D', 'Anda Tidak Berutak,..', '1', '2016-04-28 10:10:16'),
(3, 20161, '0004107204', 'X.MIPA.1', 'A', 'Pertahankan Nilai anda,..', 'C', 'Tolong Perbaiki Sikap anda,..', '1', '2016-04-28 10:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_ukk_dudi`
--

CREATE TABLE `nilai_ukk_dudi` (
  `id` int(11) NOT NULL,
  `nisn` varchar(100) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `nilai` int(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai_ukk_dudi`
--

INSERT INTO `nilai_ukk_dudi` (`id`, `nisn`, `nama`, `kelas`, `instansi`, `nilai`, `keterangan`) VALUES
(1, '9991268756', 'AAD SIROJUDIN', 'X.TKJ.1', 'SMKN4 Bandung', 91, 'Kompeten');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_uts`
--

CREATE TABLE `nilai_uts` (
  `id_nilai_uts` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `angka_pengetahuan` float NOT NULL,
  `deskripsi_pengetahuan` text NOT NULL,
  `angka_keterampilan` float NOT NULL,
  `deskripsi_keterampilan` text NOT NULL,
  `waktu_input_uts` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_uts`
--

INSERT INTO `nilai_uts` (`id_nilai_uts`, `kodejdwl`, `nisn`, `angka_pengetahuan`, `deskripsi_pengetahuan`, `angka_keterampilan`, `deskripsi_keterampilan`, `waktu_input_uts`) VALUES
(1, 5, '9991268756', 85, '', 90, '', '2016-04-15 17:54:05'),
(2, 5, '9998218087', 74, '', 83, '', '2016-04-15 17:54:05'),
(3, 13, '9999152999', 89, '', 90, '', '2016-04-21 18:52:57'),
(4, 14, '9999152999', 85, '', 79, '', '2016-04-21 18:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `panitia_penyelenggara`
--

CREATE TABLE `panitia_penyelenggara` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nip` int(50) NOT NULL,
  `golongan` varchar(20) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `asal_instansi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `panitia_penyelenggara`
--

INSERT INTO `panitia_penyelenggara` (`id`, `nama`, `nip`, `golongan`, `jabatan`, `asal_instansi`) VALUES
(2, 'admin', 2147483647, 'IV-B', 'Guru', 'Darul Hikam');

-- --------------------------------------------------------

--
-- Table structure for table `pengadaan_barang`
--

CREATE TABLE `pengadaan_barang` (
  `id` int(11) NOT NULL,
  `nm_alat` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengadaan_barang`
--

INSERT INTO `pengadaan_barang` (`id`, `nm_alat`, `stock`) VALUES
(1, 'Staples', '30'),
(2, 'Printer', '20');

-- --------------------------------------------------------

--
-- Table structure for table `pengawas_silang`
--

CREATE TABLE `pengawas_silang` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `asal_sekolah` varchar(255) NOT NULL,
  `tempat_pengawas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengawas_silang`
--

INSERT INTO `pengawas_silang` (`id`, `nama`, `asal_sekolah`, `tempat_pengawas`) VALUES
(1, 'admin', 'Darul Hikam', 'SMKN4 Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian_barang`
--

CREATE TABLE `pengembalian_barang` (
  `id` int(11) NOT NULL,
  `nm_alat` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `nm_penerima` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengembalian_barang`
--

INSERT INTO `pengembalian_barang` (`id`, `nm_alat`, `tanggal`, `nm_penerima`) VALUES
(1, 'Staples', '12/03/2020', 'Ahmad');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_essai`
--

CREATE TABLE `pertanyaan_essai` (
  `id_pertanyaan_essai` int(11) NOT NULL,
  `id_quiz_ujian` int(5) NOT NULL,
  `pertanyaan_essai` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan_essai`
--

INSERT INTO `pertanyaan_essai` (`id_pertanyaan_essai`, `id_quiz_ujian`, `pertanyaan_essai`) VALUES
(1, 1, 'Siapakah Nama Presiden ke 5 Indonesia ?'),
(2, 1, 'Sebutkan Nama-nama Pahlawan Revolusi ?'),
(3, 1, 'Dimanakah Terjadinya Perjanjian Linggarjati ?'),
(5, 2, 'Sebutkan Arti Sila Ke 2 ?'),
(6, 2, 'Siapa Nama Pencipta Lagu Indonesia Raya ?'),
(9, 4, 'Siapa Nama Kepa Sekolah Kita ?'),
(10, 4, 'Berapakah Hasil 234 + 125 ?'),
(11, 5, 'kbkbkjbkjbkbk');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_objektif`
--

CREATE TABLE `pertanyaan_objektif` (
  `id_pertanyaan_objektif` int(11) NOT NULL,
  `id_quiz_ujian` int(11) NOT NULL,
  `pertanyaan_objektif` text NOT NULL,
  `jawab_a` varchar(255) NOT NULL,
  `jawab_b` varchar(255) NOT NULL,
  `jawab_c` varchar(255) NOT NULL,
  `jawab_d` varchar(255) NOT NULL,
  `jawab_e` varchar(255) NOT NULL,
  `kunci_jawaban` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan_objektif`
--

INSERT INTO `pertanyaan_objektif` (`id_pertanyaan_objektif`, `id_quiz_ujian`, `pertanyaan_objektif`, `jawab_a`, `jawab_b`, `jawab_c`, `jawab_d`, `jawab_e`, `kunci_jawaban`) VALUES
(1, 1, 'Gubernur Tertua di Sumbar ?', 'Udin Sedunia', 'Saipul Jamil', 'Roma Irama', 'Fauzi Bahar', '', 'd'),
(2, 1, 'Nama-nama Pahlawan Indonesia ?', 'PRABOWO', 'Taufik Hidayat', 'Ahmad Yani', 'Jokowi', '', 'c'),
(3, 1, 'Dimana Terjadinya Pembunuhan Sukarno ?', 'Padang', 'Payakumbuh', 'Bukit Tinggi', 'Semua Benar', '', 'a'),
(5, 1, 'Sebutkan Arti Sila Ke 2 ?', 'Keadilan Bagi Indonedia', 'Kerakyatan yang dipimpin Ndeso', 'Berjuang Untuk Jadi Lebih Baik', 'Kemanusiaan yang adil dan Beradap', '', 'd'),
(6, 4, 'Siapa Nama Pencipta Lagu Indonesia Raya ?', 'Dewiit Safitri', 'Ahmad Dani', 'Aura Kasih', 'Wr.Supratman', '', 'd'),
(8, 4, 'Siapakah nama Presiden ke 2 Indonesia ?', 'Joko Widodo', 'Susilo Bambang Yudoyono', 'Abdulrahman Wahid', 'Megawati', 'Soeharto', 'e');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_penilaian`
--

CREATE TABLE `pertanyaan_penilaian` (
  `id_pertanyaan_penilaian` int(5) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `status` enum('diri','teman') NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan_penilaian`
--

INSERT INTO `pertanyaan_penilaian` (`id_pertanyaan_penilaian`, `pertanyaan`, `status`, `waktu_input`) VALUES
(1, 'Bagaimana kenyamanan anda di sekolah ini pada |namamatapelajaran| ?', 'diri', '2016-07-03 04:17:29'),
(2, 'Bagaimana kenyamanan anda tehadap teman di sekolah ini ?', 'diri', '2016-07-03 08:12:17'),
(4, 'Apa perbuatan jahat yang pernah teman anda ini lakukan ?', 'teman', '2016-07-08 05:08:10'),
(5, 'Apakah dia teman yang baik?', 'teman', '2016-07-08 08:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_penilaian_jawab`
--

CREATE TABLE `pertanyaan_penilaian_jawab` (
  `id_pertanyaan_penilaian_jawab` int(10) NOT NULL,
  `id_pertanyaan_penilaian` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `nisn_teman` varchar(20) NOT NULL,
  `jawaban` text NOT NULL,
  `status` enum('diri','teman') NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `waktu_jawab` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan_penilaian_jawab`
--

INSERT INTO `pertanyaan_penilaian_jawab` (`id_pertanyaan_penilaian_jawab`, `id_pertanyaan_penilaian`, `nisn`, `nisn_teman`, `jawaban`, `status`, `kode_kelas`, `waktu_jawab`) VALUES
(23, 2, '9991268756', '', 'jjjj', 'diri', 'X.MIPA.1', '2016-07-08 15:57:55'),
(12, 4, '9991268756', '0151379251', 'fff', 'teman', 'X.MIPA.1', '2016-07-08 15:21:34'),
(11, 5, '9991268756', '0151379251', 'eee', 'teman', 'X.MIPA.1', '2016-07-08 15:21:34'),
(15, 5, '9991268756', '0004107204', 'aaaa', 'teman', 'X.MIPA.1', '2016-07-08 15:23:05'),
(16, 4, '9991268756', '0004107204', 'bbbb', 'teman', 'X.MIPA.1', '2016-07-08 15:23:05'),
(17, 5, '9991268756', '9998218087', 'ttt', 'teman', 'X.MIPA.1', '2016-07-08 15:23:34'),
(18, 4, '9991268756', '9998218087', 'yyy', 'teman', 'X.MIPA.1', '2016-07-08 15:23:34'),
(24, 1, '9991268756', '', 'kkkk', 'diri', 'X.MIPA.1', '2016-07-08 15:57:55'),
(25, 5, '9991268756', '0007105659', 'hhh', 'teman', 'X.MIPA.1', '2016-07-08 15:58:39'),
(26, 4, '9991268756', '0007105659', 'nnn', 'teman', 'X.MIPA.1', '2016-07-08 15:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `predikat`
--

CREATE TABLE `predikat` (
  `id_predikat` int(5) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `nilai_a` int(3) NOT NULL,
  `nilai_b` int(3) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predikat`
--

INSERT INTO `predikat` (`id_predikat`, `kode_kelas`, `nilai_a`, `nilai_b`, `grade`, `keterangan`) VALUES
(1, '0', 86, 100, 'A', 'Sangat Baik'),
(2, '0', 79, 85, 'B', 'Baik'),
(3, '0', 77, 78, 'C', 'Cukup'),
(4, '0', 0, 77, 'D', 'Kurang'),
(7, 'X.MIPA.1', 85, 100, 'A', 'Sangat Baik'),
(8, 'X.MIPA.1', 70, 84, 'B', 'Baik'),
(9, 'X.MIPA.1', 50, 69, 'C', 'Cukup'),
(10, 'X.MIPA.1', 0, 49, 'D', 'Kurang');

-- --------------------------------------------------------

--
-- Table structure for table `psb_aktivasi`
--

CREATE TABLE `psb_aktivasi` (
  `id_aktivasi` int(10) NOT NULL,
  `kode_pendaftaran` varchar(50) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `status` enum('sma','smk','smp') NOT NULL,
  `proses` int(2) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psb_aktivasi`
--

INSERT INTO `psb_aktivasi` (`id_aktivasi`, `kode_pendaftaran`, `nama_lengkap`, `status`, `proses`, `waktu_input`) VALUES
(1, 'SMA-20160701085110', 'PRABOWO', 'sma', 1, '2016-06-21 12:11:45'),
(2, 'SMK-20160701085110', 'Dewiit Safitri', 'smk', 1, '2016-06-21 15:04:57'),
(3, 'SMA-20160701085111', 'Tommy Utama', 'sma', 1, '2016-07-01 03:13:12'),
(4, 'SMP-20160701094107', 'Willy Fernando', 'smp', 0, '2016-07-01 09:27:54'),
(5, 'SMK-20200506004604', 'Ikhsan', 'smk', 1, '2020-05-06 00:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `psb_daftar_aktivasi`
--

CREATE TABLE `psb_daftar_aktivasi` (
  `id` int(11) NOT NULL,
  `nisn` int(50) DEFAULT NULL,
  `nama_siswa` varchar(50) DEFAULT NULL,
  `no_hp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `psb_daftar_aktivasi`
--

INSERT INTO `psb_daftar_aktivasi` (`id`, `nisn`, `nama_siswa`, `no_hp`) VALUES
(1, 1231231, 'aaa', 123123123),
(2, 1231231, 'Ikhsan', 1),
(3, 1231231, 'aaa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `psb_pendaftaran`
--

CREATE TABLE `psb_pendaftaran` (
  `id_pendaftaran` int(10) NOT NULL,
  `kode_pendaftaran` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nama_panggilan` varchar(120) NOT NULL,
  `no_induk` varchar(50) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_agama` int(5) NOT NULL,
  `anak_ke` varchar(10) NOT NULL,
  `jumlah_saudara` varchar(10) NOT NULL,
  `status_dalam_keluarga` varchar(100) NOT NULL,
  `alamat_siswa` text NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `berat_badan` int(5) NOT NULL,
  `tinggi_badan` int(5) NOT NULL,
  `golongan_darah` varchar(5) NOT NULL,
  `penyakit_pernah_diderita` varchar(255) DEFAULT NULL,
  `diterima_dikelas` varchar(50) NOT NULL,
  `diterima_tanggal` date NOT NULL,
  `sekolah_asal` varchar(255) NOT NULL,
  `alamat_sekolah_asal` text NOT NULL,
  `nama_ayah` varchar(150) NOT NULL,
  `tempat_lahir_ayah` text NOT NULL,
  `tanggal_lahir_ayah` date NOT NULL,
  `agama_ayah` int(5) NOT NULL,
  `pendidikan_ayah` varchar(100) NOT NULL,
  `pekerjaan_ayah` varchar(255) NOT NULL,
  `alamat_rumah_ayah` text NOT NULL,
  `telpon_rumah_ayah` varchar(15) NOT NULL,
  `alamat_kantor_ayah` text NOT NULL,
  `telpon_kantor_ayah` varchar(15) NOT NULL,
  `nama_ibu` varchar(150) NOT NULL,
  `tempat_lahir_ibu` text NOT NULL,
  `tanggal_lahir_ibu` date NOT NULL,
  `agama_ibu` int(5) NOT NULL,
  `pendidikan_ibu` varchar(100) NOT NULL,
  `pekerjaan_ibu` varchar(255) NOT NULL,
  `alamat_rumah_ibu` text NOT NULL,
  `telpon_rumah_ibu` varchar(15) NOT NULL,
  `alamat_kantor_ibu` text NOT NULL,
  `telpon_kantor_ibu` varchar(15) NOT NULL,
  `nama_wali` varchar(150) NOT NULL,
  `alamat_wali` text NOT NULL,
  `no_telpon_wali` varchar(15) NOT NULL,
  `status` enum('sma','smk','smp') NOT NULL,
  `waktu_daftar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psb_pendaftaran`
--

INSERT INTO `psb_pendaftaran` (`id_pendaftaran`, `kode_pendaftaran`, `nama`, `nama_panggilan`, `no_induk`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `id_agama`, `anak_ke`, `jumlah_saudara`, `status_dalam_keluarga`, `alamat_siswa`, `no_telpon`, `berat_badan`, `tinggi_badan`, `golongan_darah`, `penyakit_pernah_diderita`, `diterima_dikelas`, `diterima_tanggal`, `sekolah_asal`, `alamat_sekolah_asal`, `nama_ayah`, `tempat_lahir_ayah`, `tanggal_lahir_ayah`, `agama_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `alamat_rumah_ayah`, `telpon_rumah_ayah`, `alamat_kantor_ayah`, `telpon_kantor_ayah`, `nama_ibu`, `tempat_lahir_ibu`, `tanggal_lahir_ibu`, `agama_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `alamat_rumah_ibu`, `telpon_rumah_ibu`, `alamat_kantor_ibu`, `telpon_kantor_ibu`, `nama_wali`, `alamat_wali`, `no_telpon_wali`, `status`, `waktu_daftar`) VALUES
(1, 'SMA-20160701085110', 'PRABOWO', 'Robby', '5675345', 1, 'Padang', '1989-06-05', 1, '3', '5', 'Anak Kandung', 'Jl. Angkasa Puri, Perundam 4, Blok C No 2', '081267771344', 75, 170, 'O', 'Tdak Pernah', '1', '2016-06-22', 'SMP N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Nafnizon (Alm)', 'Payakumbuh', '1975-04-12', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0752461692', 'Muro Paiti, Kapur IX', '0752786512', 'Yeni Ermawaty', 'Padang', '1974-01-18', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0752461692', '-', '0', 'Tommy Utama', 'Jl.Ulak Karang Padang', '081266881226', 'sma', '2016-06-22 12:11:45'),
(3, 'SMK-20160701085110', 'Dewiit Safitri', 'Dewi', '5674322', 1, 'Gumarang', '1989-02-12', 1, '3', '5', 'Anak Kandung', 'Jl. Linggar Jati, Padang', '082173054501', 60, 170, 'AB', 'Tdak Pernah', '1', '2016-06-22', 'SMP N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Sukarni', 'Gumarang', '1976-12-01', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0753456790', 'Muro Paiti, Kapur IX', '0753445566', 'Mama Dewi', 'Gumarang', '1973-11-11', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0753456790', '-', '0', 'Adeil Putra', 'Jl.Ulak Karang, Padang', '082190871234', 'smk', '2016-06-22 15:04:57'),
(5, 'SMA-20160701085111', 'Tommy Utama', 'Tommy', '5674327', 1, 'Padang', '1985-08-18', 1, '1', '5', 'Anak Kandung', 'Jl. Simpang DPR, Padang', '081266881226', 70, 160, 'AB', 'Tdak Pernah', '1', '2016-07-01', 'SMA N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Sunandar', 'Payakumbuh', '0004-12-05', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0752461645', 'Muro Paiti, Kapur IX', '0752897855', 'Yunimar', 'Padang', '0000-00-00', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0752461645', '-', '0', 'Willy Fernando', 'Jl.Ulak Karang, Padang', '082167771233', 'sma', '2016-07-01 11:19:36'),
(7, 'SMK-20200506004604', 'Ikhsan', 'Ikhsan', '23123123123', 1, 'bandung', '2020-05-07', 1, '4', '3', 'aaa', 'aaaaaaaaaa', '1231231231231', 50, 154, 'O', '', '', '0000-00-00', 'Darul Hikam', 'aaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaa', '0000-00-00', 1, 'aaaaaaaaaa', 'aaaaaaaaaaaaaaa', 'aaaaaaaaaaa', '123123123', 'aaaaaaaaaaaaaaa', '123123123', 'aaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaa', '0000-00-00', 1, 'aaaaaaaaaaaaa', 'aaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaa', '123123123', 'aaaaaaaaaaaaaa', '123123123123', 'a', 'aaa', '102391239123', 'smk', '2020-05-06 21:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `psb_pendaftaran_saudara`
--

CREATE TABLE `psb_pendaftaran_saudara` (
  `id_saudara` int(10) NOT NULL,
  `id_pendaftaran` int(10) NOT NULL,
  `nama_saudara` varchar(150) NOT NULL,
  `umur_saudara` int(5) NOT NULL,
  `pendidikan_saudara` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psb_pendaftaran_saudara`
--

INSERT INTO `psb_pendaftaran_saudara` (`id_saudara`, `id_pendaftaran`, `nama_saudara`, `umur_saudara`, `pendidikan_saudara`) VALUES
(1, 1, 'Willy Fernando', 29, 'S1'),
(2, 1, 'Randy Komara', 25, 'SMA'),
(3, 1, 'Laura Hikmah Izzatin', 18, 'SMA'),
(4, 3, 'Lira Virna', 15, 'SMP'),
(5, 3, 'Airin Stewano', 13, 'SD'),
(10, 5, 'Randy Komara', 25, 'SMA'),
(9, 5, 'Willy Fernando', 28, 'S1'),
(11, 5, 'Laura Hikmah Izzatin', 19, 'SMA'),
(12, 0, 'a', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_ujian`
--

CREATE TABLE `quiz_ujian` (
  `id_quiz_ujian` int(5) NOT NULL,
  `id_kategori_quiz_ujian` int(5) NOT NULL,
  `kodejdwl` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `batas_waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_ujian`
--

INSERT INTO `quiz_ujian` (`id_quiz_ujian`, `id_kategori_quiz_ujian`, `kodejdwl`, `keterangan`, `batas_waktu`) VALUES
(4, 1, 5, 'Quiz Online Nilai Akhir Matematika', '2016-04-25 08:54:42'),
(5, 1, 5, 'hhhb', '2016-03-11 16:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `rincian_anggaran`
--

CREATE TABLE `rincian_anggaran` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `honor` int(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rincian_anggaran`
--

INSERT INTO `rincian_anggaran` (`id`, `nama`, `jabatan`, `honor`, `keterangan`) VALUES
(1, 'admin', '  admin', 1000000, '');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_keuangan_siswa`
--

CREATE TABLE `riwayat_keuangan_siswa` (
  `id` int(11) NOT NULL,
  `nisn` varchar(100) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `tanggal_bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_keuangan_siswa`
--

INSERT INTO `riwayat_keuangan_siswa` (`id`, `nisn`, `nama`, `kelas`, `jurusan`, `tanggal_bayar`) VALUES
(1, '9991268756', 'AAD SIROJUDIN', 'TKJ1', 'X.TKJ.1', '2020-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kode_ruangan` varchar(10) NOT NULL,
  `kode_gedung` varchar(10) NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `kapasitas_belajar` int(5) NOT NULL,
  `kapasitas_ujian` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kode_ruangan`, `kode_gedung`, `nama_ruangan`, `kapasitas_belajar`, `kapasitas_ujian`, `keterangan`, `aktif`) VALUES
('R001', 'G001', 'A.1', 35, 30, '', ''),
('R002', 'G001', 'A.2', 40, 35, '', ''),
('R003', 'G002', 'B.1', 34, 29, '', ''),
('R004', 'G002', 'B.2', 45, 40, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat_prakerin`
--

CREATE TABLE `sertifikat_prakerin` (
  `id` int(11) NOT NULL,
  `nm_sertifikat` varchar(255) NOT NULL,
  `tahun` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sertifikat_prakerin`
--

INSERT INTO `sertifikat_prakerin` (`id`, `nm_sertifikat`, `tahun`) VALUES
(1, 'test.pdf', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `id_sesi` int(5) NOT NULL,
  `nama_sesi` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`id_sesi`, `nama_sesi`, `keterangan`, `aktif`) VALUES
(1, 'Semester 1', '', 'Ya'),
(2, 'Semester 2', '', 'Ya'),
(3, 'Semester 3', '', 'Ya'),
(4, 'Semester 4', '', 'Ya'),
(5, 'Semester 5', '', 'Ya'),
(6, 'Semester 6', '', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(10) NOT NULL,
  `nipd` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(120) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(50) NOT NULL,
  `id_agama` int(5) NOT NULL,
  `kebutuhan_khusus` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `dusun` varchar(100) NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `jenis_tinggal` varchar(100) NOT NULL,
  `alat_transportasi` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `skhun` varchar(50) NOT NULL,
  `penerima_kps` varchar(20) NOT NULL,
  `no_kps` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `nama_ayah` varchar(150) NOT NULL,
  `tahun_lahir_ayah` int(4) NOT NULL,
  `pendidikan_ayah` varchar(50) NOT NULL,
  `pekerjaan_ayah` varchar(100) NOT NULL,
  `penghasilan_ayah` varchar(100) NOT NULL,
  `kebutuhan_khusus_ayah` varchar(100) NOT NULL,
  `no_telpon_ayah` varchar(15) NOT NULL,
  `nama_ibu` varchar(150) NOT NULL,
  `tahun_lahir_ibu` int(4) NOT NULL,
  `pendidikan_ibu` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(100) NOT NULL,
  `penghasilan_ibu` varchar(100) NOT NULL,
  `kebutuhan_khusus_ibu` varchar(100) NOT NULL,
  `no_telpon_ibu` varchar(15) NOT NULL,
  `nama_wali` varchar(150) NOT NULL,
  `tahun_lahir_wali` int(4) NOT NULL,
  `pendidikan_wali` varchar(50) NOT NULL,
  `pekerjaan_wali` varchar(100) NOT NULL,
  `penghasilan_wali` varchar(50) NOT NULL,
  `angkatan` int(5) NOT NULL,
  `status_awal` varchar(20) NOT NULL,
  `status_siswa` enum('Aktif','Tidak Aktif') NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `id_sesi` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nipd`, `password`, `nama`, `id_jenis_kelamin`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `nik`, `id_agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `telepon`, `hp`, `email`, `skhun`, `penerima_kps`, `no_kps`, `foto`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `kebutuhan_khusus_ayah`, `no_telpon_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `kebutuhan_khusus_ibu`, `no_telpon_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `status_awal`, `status_siswa`, `tingkat`, `kode_kelas`, `kode_jurusan`, `id_sesi`) VALUES
(1, '14422', '9991268756', 'AAD SIROJUDIN', 1, '9991268756', 'BUKITTINGGI', '1999-11-14', '1306066910090000', 1, 'Tidak ada', 'PERUMNAS KUBANG PUTIH JL. MERPATI NO.301', '0', '0', '', 'KUBANG PUTIAH', 'Kec. Banuhampu', 26181, '', 'Sepeda motor', '0751-7835083', '082385418021', 'AAD.SIROJUDIN04@GMAIL.COM', '2-12-02-002-002-7   ', 'TIDAK', '', '', 'WASLIM', 1968, 'SMP / sederajat', 'Lainnya', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'TETI MURNI', 1973, 'SMP / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Tidak Aktif', '(SLTA)', 'X.TKJ.1', 'MIPA', 1),
(63, '14423', '0151379251', 'AL FAJRI', 1, '0151379251', 'BUKITTINGGI', '2015-06-27', '1375012610990000', 1, 'Tidak ada', 'JALAN PANORAMA NO 4B', '4', '2', '', 'PANORAMA', 'Kec. Mandiangin Koto Selayan', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '75221487', '085766422330', 'AYI.ALFAJRI@YAHOO.COM', '2-12-02-001-007-2   ', 'TIDAK', '', '', 'EFDIWARMAN', 1964, 'SMA / sederajat', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'ASYULIANTI', 1969, 'SMA / sederajat', '', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(105, '14424', '0004107204', 'ANDRE THOMOK SIDABUTAR', 1, '0004107204', 'LUBUK BASUNG', '2000-05-16', '', 1, 'Tidak ada', 'MANGGIS GANTING', '0', '0', '', 'MANGGIS', 'Kec. Mandiangin Koto Selayan', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '', '', '2/12/2002', 'TIDAK', '', '', 'UNTUNG SARAGI SIDABUTAR', 1966, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'RONA TAMPUBOLON', 1977, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(143, '14425', '9998218087', 'ANNISA SERLINA', 2, '9998218087', 'PEKAN KAMIS', '2000-10-15', '1306095510000000', 1, 'Tidak ada', 'GANTING KOTO TANGAN', '0', '0', 'KOTO TANGAH', 'KOTO TANGAH', 'Kec. Tilatang Kamang', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083180361912', '', '2/12/2002', 'TIDAK', '', '', 'NOVIARDI', 1965, 'SMA / sederajat', 'Petani', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'SESNIAR', 1966, 'SMA / sederajat', 'Lainnya', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(214, '14426', '0007105659', 'DAVIN FERDIANSYAH', 1, '0007105659', 'PADANG', '2000-09-06', '1312060609020000', 1, 'Tidak ada', 'JORONG KAMPUNG ALANG', '0', '0', '', 'MUARO KIAWAI', 'Kec. Gunung Tuleh', 26371, 'Kost', 'Angkutan umum/bus/pete-pete', '', '', '', '2/12/2002', 'TIDAK', '', '', 'SYAHRIAL', 1962, 'S1', 'PNS/TNI/Polri', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '', 'DESMINAR', 1965, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(242, '14427', '0000267795', 'DHINDA AMALIA KIFLIA', 2, '0000267795', 'Bukittinggi', '2000-03-01', '1375034103000000', 1, 'Tidak ada', 'JL.Puding Mas no.33-Tabek Gadang-Aur Kuning-Bukittinggi', '1', '2', 'Tabek Gadang', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '0752-31089', '081261631384', 'dhindaamaliakiflianainggolan@yahoo.co.id', '2/12/2002', 'TIDAK', '', '', 'Zulkifli Nainggolan', 1966, 'SMA / sederajat', 'Wiraswasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'Delfiani', 1972, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(335, '14428', '0007011100', 'FARID NAJAH ALDI', 1, '0007011100', 'Jakarta', '2000-04-12', '1306071204000000', 1, 'Tidak ada', 'Tanah  Nyariang', '0', '0', '', 'Batu Taba', 'Kec. Ampek Angkek', 0, 'Bersama orang tua', '', '', '085263312034', '', '2/12/2002', 'TIDAK', '', '', 'endrisman', 1971, 'SMA / sederajat', 'Wiraswasta', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'Reni', 1972, 'D1', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(369, '14429', '0000261160', 'FELLYA KHAIRANI MONEVY', 2, '0000261160', 'BUKITTINGGI', '2000-07-07', '1306074707000000', 1, 'Tidak ada', 'JORONG PARIT PUTUS,NAGARI AMPANG GADANG,Kec.AMPEK ANGKEK,Kab.AGAM', '0', '0', 'PARIT PUTUS', 'AMPANG GADANG', 'Kec. Ampek Angkek', 0, 'Bersama orang tua', 'Sepeda motor', '', '089629288677', 'FELLYAKHAIRANIMONEVY@YAHOO.co.id', '2-12-02-            ', 'TIDAK', '', '', 'MEDMON HAIKAL', 1969, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'EVI YENDRIANI', 1975, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(378, '14430', '9991261263', 'FERNANDO PRATAMA', 1, '9991261263', 'BUKITTINGGI', '1999-11-08', '1306060811990000', 1, 'Tidak ada', 'JLN.BANUHAMPU RAYA NO.246 PERUMNAS KUBANG PUTIH', '0', '0', '', 'KUBANG PUTIH', 'Kec. Banuhampu', 26181, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '0752-7835136', '08126695672', '', '2/12/2002', 'TIDAK', '', '', 'MUKHLIS', 1970, 'SMA / sederajat', 'Wiraswasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '', 'NENY FEBRIDAL', 1974, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(391, '14431', '9994930260', 'FIRA WARZUKNI', 2, '9994930260', 'KAPECONG', '1999-10-23', '1306151606100010', 1, 'Tidak ada', 'TARUSAN JR HALALANG', '0', '0', '', 'TARUSAN', 'Kec. Kamang Magek', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083180050317', '', '2/12/2002', 'TIDAK', '', '', 'JUFRIAL', 1967, 'SMP / sederajat', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'NURAINI', 1967, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(393, '14432', '9991262828', 'FISKA AGNESIA IVONNE', 2, '9991262828', 'BUKITTINGGI', '1999-08-17', '1375035708990000', 1, 'Tidak ada', 'JL BERMAWI GG SIKUMBANG NO.40', '1', '5', '', 'PAKAN LABUAH', 'Kec. Aur Birugo Tigo Baleh', 26134, 'Bersama orang tua', 'Sepeda motor', '0752-33128', '081270018525', 'fiskaivonne@yahoo.co.id', '2/12/2002', 'TIDAK', '', '', 'DOLLY IVONNE', 1972, 'S1', 'Wirausaha', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'NERITA ROZA', 1972, 'S1', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(402, '14433', '9991261271', 'FRANKI MAYSI SAPUTRA', 1, '9991261271', 'BUKITTINGGI', '1999-12-22', '1375032212990000', 1, 'Tidak ada', 'JLN PROF M.YAMIN SH/GG.BAMBU KUNING', '1', '1', '', 'AUR KUNING', 'Kec. Aur Birugo Tigo Baleh', 26131, 'Bersama orang tua', 'Jalan kaki', '81267286572', '085835880099', '', '2/12/2002', 'TIDAK', '', '', 'SYAMSI', 1968, 'SMA / sederajat', 'Buruh', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'RAMAINI', 1976, 'SMP / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(425, '14434', '9998214151', 'HABIB NAZLAL FURQANI ZA', 1, '9998214151', 'BUKITTINGGI', '1999-12-25', '1306072512990000', 1, 'Tidak ada', 'SURAU GADANG', '0', '0', '', 'BATU TABA', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '082170223340', '', '2/12/2002', 'TIDAK', '', '', 'ZAINAL ABIDIN', 1973, '', 'Lainnya', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'MASNI KAUSAR', 1975, 'SMP / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(601, '14582', '0000282457', 'MAULANA IMAM MUTTAQIN', 1, '0000282457', 'BUKITTINGGI', '2000-11-23', '1375022311200000', 1, 'Tidak ada', 'JL LAMBAH', '0', '0', '', 'LAMBAH', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085263191812', '', '2/15/2008', 'TIDAK', '', '', 'AMUL HUSNI', 1959, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'INANG IDAWATI', 1960, 'D3', 'Sudah Meninggal', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(632, '14436', '0126523169', 'MIFTAHUL RIZKI', 1, '0126523169', 'BUKITTINGGI', '2012-07-11', '1375011108000000', 1, 'Tidak ada', 'JALAN BADAR MALANG,GURUN TANJUNG', '1', '5', '', 'PAKAN KURAI', 'Kec. Guguk Panjang', 26112, 'Bersama orang tua', 'Sepeda motor', '', '082390845212', '', '2/12/2002', 'TIDAK', '', '', 'ARMEN', 1971, 'SMA / sederajat', 'Pedagang Besar', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'SUSI LENI KAMLA', 1977, 'D3', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(713, '14437', '9997515863', 'MUHAMMAD IRSYAD', 1, '9997515863', 'KOTO PANJANG', '1999-03-27', '1306142703990000', 1, 'Tidak ada', 'KOTO PANJANG JORONG KUBANG DUO KOTO PANJANG', '0', '0', '', 'BUKIK BATABUAH', 'Kec. Candung', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '081363189725', '', '2-15-08-08-326-048-9', 'TIDAK', '', '', 'GUSTIAR', 1963, 'S1', '', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'BUSRA LINDA YANI', 1972, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(743, '14438', '9991261719', 'MUSLIM NURHIDAYAT', 1, '9991261719', 'BUKITTINGGI', '1999-07-29', '1375012907990000', 1, 'Tidak ada', 'JL Diponegoro Parak Tinggi', '5', '4', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 26117, 'Bersama orang tua', 'Jalan kaki', '83180593526', '083180593526', '', '2/15/2008', 'TIDAK', '', '', 'erman', 1963, 'SD / sederajat', 'Pedagang Kecil', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'YURNALIS', 1972, 'SD / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(760, '14439', '0000240365', 'NABILA PUTRI DEAN', 2, '0000240365', 'BUKITTINGGI', '2000-05-27', '1375018705000000', 1, 'Tidak ada', 'JL.JAMBAK MUKO', '0', '0', '', 'BUKIK APIK PUHUN', 'Kec. Guguk Panjang', 26114, 'Bersama orang tua', 'Jalan kaki', '752625226', '083180668265', '', '2/12/2002', 'TIDAK', '', '', 'ALDIAN RIYADI', 1973, 'SMA / sederajat', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '082173054501', 'DEFNI ANOM', 1975, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', 'SILVIANA', 1979, 'SMA / sederajat', 'Tidak bekerja', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(761, '14440', '9998214335', 'NABILA QOTHRUNNADAA', 2, '9998214335', 'Pasanehan', '1999-12-07', '1306076308030000', 1, 'Tidak ada', 'Pasanehan,Lasi,Kec.Candung', '0', '0', '', 'Lasi', 'Kec. Candung', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '081363178970', '', '2/12/2002', 'TIDAK', '', '', 'Edi Karnadi S.pd', 1970, 'S1', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'NOVA', 1973, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(865, '14441', '9998215055', 'PRATIWI RAHMA MAGHFIRA', 2, '9998215055', 'BUKITTINGGI', '1999-12-18', '130606581299000', 1, 'Tidak ada', 'JORONG AIA KACIAK', '0', '0', '', 'KUBANG PUTIAH', 'Kec. Banuhampu', 26181, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085375748022', 'tiwimaghfira18@gmail.com', '2/12/2002', 'YA', '35ab1t26138A06', '', 'FIDDAFEN', 1962, 'SMA / sederajat', 'Petani', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'SUSI FEBRIANTI', 1972, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(873, '14442', '0002882643', 'PUTRI  UTARI', 2, '0002882643', 'BUKITTINGGI', '2000-01-23', '1306106301000000', 1, 'Tidak ada', 'Jorong Sungai Cubadak', '0', '0', 'Jl. Prof. M. Yamin .SH', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 26117, 'Kost', 'Jalan kaki', '', '081374725376', 'putriazelra@yahoo.com', 'DN-08 DI 1710210    ', 'TIDAK', '', '', 'Dalneri', 1970, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'GUSNITA AHMAD', 1968, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(915, '14443', '0009170412', 'RAHMATNOFRIYANDI', 1, '0009170412', 'BUKITTINGGI', '2000-11-17', '1375011711000000', 1, 'Tidak ada', 'JL.SUTAN SYAHRIR NO.11C TAROK DIPO BUKITTINGGI', '2', '2', '', 'TAROK DIPO', 'Kec. Guguk Panjang', 26117, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '082386228422', 'rahmat_novri_yandi@yahoo.com', '2-12-02-002-318-3   ', 'TIDAK', '', '', 'ASRIL', 1958, 'SD / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', 'KASMABUTI', 1965, 'SD / sederajat', 'Pedagang Kecil', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(948, '14525', '0005405460', 'RAUDHATUL JANNAH', 2, '0005405460', 'Bukittinggi', '2000-06-15', '1375015506000000', 1, 'Tidak ada', 'Jalan Darussalam', '1', '5', '', 'Pakan Kurai', 'Kec. Guguk Panjang', 26112, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '081994204238', '', '2/12/2002', 'TIDAK', '', '', 'Sabir', 1959, 'SMA / sederajat', 'Pedagang Kecil', 'Kurang dari Rp. 500,000', 'Tidak ada', '', 'Husnimar', 1959, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'Nurlian', 1938, 'SMP / sederajat', 'Tidak bekerja', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(961, '14445', '0007675125', 'RELA AUFALIA', 2, '0007675125', 'MEDAN', '2000-10-09', '1271104910000000', 1, 'Tidak ada', 'JL.ANGKU SALASAI NO.31 PINCURAN BARU JORONG LIMO KAMPUANG-SUNGAI PUA', '0', '0', 'JORONG LIMO KAMPUANG', 'SUNGAI PUA', 'Kec. Sungai Pua', 0, 'Wali', 'Angkutan umum/bus/pete-pete', '', '085206810208', '', '2/12/2002', 'TIDAK', '', '', 'SAHRIL KOTO', 1965, '', 'Wiraswasta', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'DESYETI SIKUMBANG', 1969, '', 'Tidak bekerja', '', 'Tidak ada', '', 'WIWIT', 1976, '', 'Tidak bekerja', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1057, '14446', '9991384898', 'SALIHUL FAJRI', 1, '9991384898', 'BUKITTINGGI', '1999-09-20', '1375022009990000', 1, 'Tidak ada', 'JL.H.MISKIN', '5', '3', 'PALOLOK', 'CAMPAGO IPUH', 'Kec. Mandiangin Koto Selayan', 26121, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085766069641', '', '2-12-02-001-255-2   ', 'TIDAK', '', '', 'SUYERMAN S SOS', 1959, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'MAYESTI SPD', 1963, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1077, '14447', '9991260829', 'SERGIO ROSARIANO WANGGE', 1, '9991260829', 'BUKITTINGGI', '1999-10-13', '1306071310990000', 1, 'Tidak ada', 'ranah jorong batang buo', '0', '0', '', 'biaro gadang', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Mobil pribadi', '', '081993589050', 'sergiowangge@gmail.com', '2-12-02-102-019-6   ', 'TIDAK', '', '', 'Patrisius Fransiskus Wangge', 1969, 'D1', 'Wiraswasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '', 'Triwahyuni', 1971, 'S1', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1088, '14448', '0007011850', 'SHINTA TRIANA', 2, '0007011850', 'BUKITTINGGI', '2000-01-20', '1306076001000000', 1, 'Tidak ada', 'AMPANG GADANG,AMPEK ANGKEK,AGAM', '0', '0', 'AMPANG GADANG', 'DESA AMPANG GADANG', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '7527834143', '081363343066', 'SHINTATRIANA11@YAHOO.CO.ID', '2/12/2002', 'TIDAK', '', '', 'EFENDI', 1961, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'ERNAWATI', 1966, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1115, '14528', '9993841192', 'SUCI RAHMA ANNISA', 2, '9993841192', 'Bukittinggi', '1999-08-11', '1306065108990000', 1, 'Tidak ada', 'koto baru kubang putiah', '0', '0', 'koto baru', 'kubang putiah', 'Kec. Banuhampu', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085364646559', '', '2/12/2002', 'YA', '35aazj26138A04', '', 'irwan ichsan(ALM)', 1960, 'Lainnya', 'Lainnya', '', 'Tidak ada', '', 'Yenni Aulia', 1968, 'SMA / sederajat', 'Tidak bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1139, '14450', '0000423077', 'SYIFA KEMALA', 2, '0000423077', 'BUKITTINGGI', '2000-04-06', '1375014604000000', 1, 'Tidak ada', 'JL.BUKITCANGANG NO 4C', '1', '4', '', 'BUKIK CANGANG KAYU RAMANG', 'Kec. Guguk Panjang', 26116, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083180016182', '', '2/12/2002', 'TIDAK', '', '', 'ANSAR', 1954, 'SMP / sederajat', 'Pedagang Besar', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'NOVI ERITA', 1966, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'ANSAR', 1954, 'SMP / sederajat', 'Pedagang Besar', 'Rp. 1,000,000 - Rp. 1,999,999', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1151, '14452', '0000261542', 'THARIFA ANNSA ONNY', 2, '0000261542', 'BUKITTINGGI', '2000-09-13', '1375035309000000', 1, 'Tidak ada', 'JL.BIRUGO INDAH I', '2', '1', '', 'ABTB', 'Kec. Aur Birugo Tigo Baleh', 26138, '', 'Sepeda motor', '', '089621383202', '', '2/12/2002', 'TIDAK', '', '', 'ONNI BERLIAN', 1971, 'D3', 'Wiraswasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'YULIANTI SYAFRI', 1972, 'D3', 'Karyawan Swasta', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1171, '14453', '0002731714', 'ULFA RAHAYU', 2, '0002731714', 'PAYAKUMBUH', '2000-12-19', '1306075912000000', 1, 'Tidak ada', 'RANAH JORONG BATANG BUO', '0', '0', '', 'BIARO GADANG', 'Kec. Ampek Angkek', 26191, '', 'Angkutan umum/bus/pete-pete', '', '085263851637', '', '2/12/2002', 'TIDAK', '', '', 'ARMANSYAH', 1961, 'SMP / sederajat', 'Wiraswasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'ALFI YETRI', 1965, 'SMA / sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1246, '14454', '0000282184', 'YULI ATHIYA SYAFITRI', 2, '0000282184', 'BUKITTINGGI', '2000-01-10', '1375035001000000', 1, 'Tidak ada', 'Jl. Prof. M. Yamin,SH Gang Kemuning No. 32 B', '2', '1', '', 'AUR KUNING', 'Kec. Aur Birugo Tigo Baleh', 26131, 'Bersama orang tua', 'Jalan kaki', '0752-32492', '082169885383', '', '2/12/2002', 'TIDAK', '', '', 'Drs. YUHARMEN', 1971, 'S1', 'Pedagang Kecil', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'SESMALINDA,SE', 1972, 'S1', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1250, '14455', '9991263477', 'YULIA RAHMI', 2, '9991263477', 'BUKITTINGGI', '1999-07-31', '1375017107990000', 1, 'Tidak ada', 'JLN.SUTAN SYAHRIL NO62E', '1', '3', '', 'TAROK DIPO', 'Kec. Guguk Panjang', 26117, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085364112596', '', '2/12/2002', 'TIDAK', '', '', 'SYAFRIL(ALM)', 0, '', '', '', 'Tidak ada', '', 'TENTIYENORA', 1957, 'SD / sederajat', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1260, '14456', '9999152999', 'ZAMRATUL KHAIRANI', 2, '9999152999', 'BUKITTINGGI', '1999-10-18', '', 1, 'Tidak ada', 'BATANG BUO', '0', '0', '', 'AMPEK ANGKEK', 'Kec. Ampek Angkek', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '', '', '2/12/2002', 'TIDAK', '', '', 'SYAMSURIZAL', 1963, 'SD / sederajat', 'Wiraswasta', 'Kurang dari Rp. 500,000', 'Tidak ada', '', 'NOVERNI', 1966, 'SD / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', 'MASRIL HAKIM', 1959, 'S1', 'PNS/TNI/Polri', 'Rp. 5,000,000 - Rp. 20,000,000', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1268, '14457', '0000261141', 'ZILVA MARDHIYAH', 2, '0000261141', 'bukittinggi', '2000-05-21', '', 1, 'Tidak ada', 'gadut,pekan kamis,tilatang kamang', '0', '0', 'guguak', 'kambing 7', 'Kec. Tilatang Kamang', 26152, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083170943756', 'zilvamardhiyah80@gmail.com', '2/15/2008', 'TIDAK', '', '', 'DRS.AFRIZAL S.Si', 1960, '', '', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'ELFIMARIDA S.Pd', 1969, '', 'PNS/TNI/Polri', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1270, '1111232131', 'test', 'Argabinta', 1, '2121312312312', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', 'X.TKJ.1', 'TKJ1', 0),
(1271, '2222222222', 'test', 'Ahmad Yudistria', 1, '444444444444444', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', 'X.TKJ.1', 'TKJ1', 0),
(1272, '5512312312', 'test', 'Akbar', 1, '4123123123123', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', 'X.TKJ.1', 'TKJ1', 0),
(1273, '5523123123', 'test', 'ALDRIAN SYAVIRO M', 1, '666423123123', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', 'X.TKJ.1', 'TKJ1', 0),
(1274, '5123123123', 'test', 'ARMAN RIYANTO', 1, '15123123123', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', '0', '0', 0),
(1275, '5512312312', 'test', 'ARMAN RIYANTO', 1, '76886868686', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', 'X.TKJ.1', '0', 0),
(1276, '231231231', 'test', 'Japri', 1, '141231231232', '', '2020-03-06', '', 1, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', 'X.TKJ.1', 'TKJ1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sk_berkala`
--

CREATE TABLE `sk_berkala` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `judul_surat` varchar(255) NOT NULL,
  `jenis_surat` varchar(255) NOT NULL,
  `file_surat` varchar(255) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id_sms` int(5) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms_autoreply`
--

CREATE TABLE `sms_autoreply` (
  `id_autoreply` int(5) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `isi_pesan` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_autoreply`
--

INSERT INTO `sms_autoreply` (`id_autoreply`, `keyword`, `isi_pesan`, `waktu`) VALUES
(1, 'REG INFO', 'Diharapkan kepada semua orang tua lebih memperhatikan pergaulan anak-anaknya.', '2016-04-23 08:16:22'),
(2, 'REG KEGIATAN', 'Kegiatan Pramuka 27-04-2016, Kegiatan Paskibra 12-05-2016, Kegiatan Maraton Bersama Guru 16-05-2016.', '2016-04-23 09:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `sms_inbox`
--

CREATE TABLE `sms_inbox` (
  `id` int(11) NOT NULL,
  `pesan` text DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `modem` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms_outbox`
--

CREATE TABLE `sms_outbox` (
  `id_outbox` int(5) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `pesan` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_keaktifan`
--

CREATE TABLE `status_keaktifan` (
  `id_status_keaktifan` int(5) NOT NULL,
  `nama_status_keaktifan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_keaktifan`
--

INSERT INTO `status_keaktifan` (`id_status_keaktifan`, `nama_status_keaktifan`, `keterangan`) VALUES
(1, 'Aktif', ''),
(2, 'Tidak Aktif', '');

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE `status_kepegawaian` (
  `id_status_kepegawaian` int(5) NOT NULL,
  `status_kepegawaian` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_kepegawaian`
--

INSERT INTO `status_kepegawaian` (`id_status_kepegawaian`, `status_kepegawaian`, `keterangan`) VALUES
(1, 'Tenaga Honor Sekolah\n', ''),
(2, 'Guru Honor Sekolah\n', ''),
(3, 'PNS\r\n', ''),
(4, 'GTY/PTY\r\n', ''),
(5, 'CPNS\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `status_pernikahan`
--

CREATE TABLE `status_pernikahan` (
  `id_status_pernikahan` int(5) NOT NULL,
  `status_pernikahan` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_pernikahan`
--

INSERT INTO `status_pernikahan` (`id_status_pernikahan`, `status_pernikahan`, `keterangan`) VALUES
(1, 'Menikah', ''),
(2, 'Belum Menikah', '');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id_tahun_akademik` int(5) NOT NULL,
  `nama_tahun` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id_tahun_akademik`, `nama_tahun`, `keterangan`, `aktif`) VALUES
(20202021, 'Semester Ganjil 2020/2021', '2020/2021', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `password` text COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telpon` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `jabatan` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'sekolah',
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telpon`, `jabatan`, `level`, `aktif`) VALUES
(1, 'admin', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'Administrator', 'admin@sman3bukittinggi.sch.id', '081267771344', 'Kepala IT', 'superuser', 'Y'),
(2, '196209051987031007', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'Drs. Amri Jaya, M.Pd', 'amri.jaya@gmail.com', '082173054501', 'Kepala Sekolah', 'kepala', 'Y'),
(3, '198710052010012011', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'Meliya Defrina', 'dankrez48@gmail.com', '0751461692', 'Tenaga Administrasi Sekolah', 'manmutu', 'Y'),
(107, '196812211997022002', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'Darmawati', 'boncelius92@gmail.com', '23123132132131', 'Guru', 'subrayon', 'Y'),
(108, 'humas', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'Humas', 'humas@gmail.com', '1231231231', 'humas', 'humas', 'Y'),
(109, 'bkk', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'bkk', 'bkk@gmail.com', '1231231231', 'bkk', 'bkk', 'Y'),
(110, 'kesiswaan', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'kesiswaan', 'kesiswaan@gmail.com', '123123123123123', 'kesiswaan', 'kesiswaan', 'Y'),
(111, 'lsp', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'lsp', 'lsp@gmail.com', '12312312312312', 'lsp', 'lsp', 'Y'),
(112, 'keuangan', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'keuangan', 'keuangan@gmail.com', '2312312313221', 'keuangan', 'keuangan', 'Y'),
(113, 'tu', 'ff594f8cf10ca2e3ad4279375f0d0e688a7eca861000e7ecc63ae4b105c8be7bcb57e8c1172ea460c462c6f715508dc356fd964cf41644682db1feffd466769a', 'tu', 'tu@gmail.com', '123123123123', 'tu', 'tu', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users_aktivitas`
--

CREATE TABLE `users_aktivitas` (
  `id_users_aktivitas` int(10) NOT NULL,
  `identitas` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `browser` varchar(50) NOT NULL,
  `os` varchar(50) NOT NULL,
  `status` enum('siswa','guru','superuser') NOT NULL,
  `jam` time NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_aktivitas`
--

INSERT INTO `users_aktivitas` (`id_users_aktivitas`, `identitas`, `ip_address`, `browser`, `os`, `status`, `jam`, `tanggal`) VALUES
(1, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '10:59:57', '2016-04-13'),
(2, '9991268756', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:00:27', '2016-04-13'),
(3, '9994030915', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:01:44', '2016-04-14'),
(4, '9975540740', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:20:43', '2016-04-14'),
(5, '195901241986032002', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '11:21:04', '2016-04-14'),
(6, '0006223671', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:18:06', '2016-04-15'),
(7, '195912121986021004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:32', '2016-04-15'),
(8, '197110292005011003', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:40', '2016-04-15'),
(9, '196109191988031006', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:49', '2016-04-16'),
(10, '196202191990032001', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:19:02', '2016-04-16'),
(11, '9999344284', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:24', '2016-04-16'),
(12, '9980725248', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:32', '2016-04-16'),
(13, '0006223671', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:42', '2016-04-16'),
(14, '2', '', ' Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:13:43', '2016-04-23'),
(15, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:15:28', '2016-04-23'),
(16, '1', '', ' Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:27:20', '2016-04-23'),
(17, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:34:28', '2016-04-23'),
(18, '9980708111', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '06:36:21', '2016-04-23'),
(19, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:37:05', '2016-04-23'),
(20, '9994030915', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '06:41:40', '2016-04-23'),
(21, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:43:49', '2016-04-23'),
(22, '9991268756', '::1', 'Firefox 46.0', 'Windows 7', 'siswa', '06:46:06', '2016-04-23'),
(23, '1', '', ' Chrome 49.0.2623.112', 'Windows 7', 'superuser', '07:02:03', '2016-04-23'),
(24, '9980708111', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:21:03', '2016-04-23'),
(25, '9980720559', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:21:21', '2016-04-23'),
(26, '9991268756', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:22:01', '2016-04-23'),
(27, '9999152999', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:29:17', '2016-04-23'),
(28, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '08:40:14', '2016-04-23'),
(29, '1', '', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '08:45:52', '2016-04-23'),
(30, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:13:18', '2016-04-16'),
(31, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '03:12:26', '2016-04-15'),
(32, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:13:18', '2016-04-14'),
(33, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '03:12:26', '2016-04-13'),
(34, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '07:13:18', '2016-04-14'),
(35, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '05:12:26', '2016-04-13'),
(36, '1', '36.68.12.49', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '10:32:19', '2016-04-23'),
(48, '1', '114.4.79.250', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '15:08:36', '2016-04-27'),
(47, '1', '36.84.224.134', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:17:00', '2016-04-27'),
(40, '195704111980032004', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '07:50:45', '2016-04-27'),
(41, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '07:54:08', '2016-04-27'),
(42, '9980708111', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '07:55:08', '2016-04-27'),
(43, '9980722436', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '07:55:23', '2016-04-27'),
(44, '198605012009011001', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '07:55:38', '2016-04-27'),
(45, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '07:55:51', '2016-04-27'),
(46, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '08:01:10', '2016-04-27'),
(49, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '20:16:59', '2016-04-27'),
(50, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '08:27:54', '2016-04-28'),
(51, '198710052010012011', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:41:56', '2016-04-28'),
(52, '195704111980032004', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:42:15', '2016-04-28'),
(53, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '13:12:06', '2016-04-28'),
(54, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '13:30:48', '2016-04-28'),
(55, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '19:15:10', '2016-04-28'),
(56, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:02:22', '2016-04-29'),
(57, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '22:37:57', '2016-04-29'),
(58, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '22:41:40', '2016-04-29'),
(59, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '23:09:20', '2016-04-29'),
(60, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '23:20:06', '2016-04-29'),
(61, '195704111980032004', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:14:36', '2016-04-30'),
(62, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '06:14:55', '2016-04-30'),
(63, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:18:35', '2016-04-30'),
(64, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:19:47', '2016-04-30'),
(65, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:00:28', '2016-04-30'),
(66, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '10:01:25', '2016-04-30'),
(67, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:01:44', '2016-04-30'),
(68, '2', '::1', 'Chrome 50.0.2661.87', 'Windows 7', '', '10:02:29', '2016-04-30'),
(69, '196209051987031007', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:02:51', '2016-04-30'),
(70, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:37:52', '2016-04-30'),
(71, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:58:18', '2016-04-30'),
(72, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '12:57:17', '2016-04-30'),
(74, '1', '::1', 'Chrome 50.0.2661.94', 'Windows 7', 'superuser', '20:17:11', '2016-05-04'),
(75, '1', '::1', 'Chrome 50.0.2661.94', 'Windows 7', 'superuser', '22:34:59', '2016-05-11'),
(76, '1', '::1', 'Chrome 50.0.2661.102', 'Windows 7', 'superuser', '07:21:10', '2016-06-02'),
(77, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '22:52:32', '2016-06-19'),
(78, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:06:29', '2016-06-22'),
(79, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:45:59', '2016-06-22'),
(80, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '07:40:52', '2016-06-23'),
(81, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:41:34', '2016-06-23'),
(82, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '04:56:37', '2016-06-29'),
(83, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '08:46:48', '2016-07-01'),
(84, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:32:49', '2016-07-02'),
(85, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:37:49', '2016-07-03'),
(86, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:24:00', '2016-07-04'),
(87, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '12:24:55', '2016-07-04'),
(88, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:38:17', '2016-07-04'),
(89, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '16:41:51', '2016-07-04'),
(90, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:45:25', '2016-07-05'),
(91, '195704111980032004', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '09:59:50', '2016-07-05'),
(92, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '10:12:22', '2016-07-05'),
(93, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '10:34:34', '2016-07-05'),
(94, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '08:09:08', '2016-07-08'),
(95, '195806161984000002', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '11:15:49', '2016-07-08'),
(96, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:32:28', '2016-07-08'),
(97, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:30:18', '2016-07-08'),
(98, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '13:31:00', '2016-07-08'),
(99, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:49:22', '2016-07-08'),
(100, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '13:50:02', '2016-07-08'),
(101, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:27:03', '2016-07-08'),
(102, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '15:54:51', '2016-07-08'),
(103, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:36:38', '2016-07-09'),
(104, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '06:12:14', '2016-07-09'),
(105, '2', '::1', 'Chrome 51.0.2704.103', 'Windows 7', '', '06:18:50', '2016-07-09'),
(106, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:27:53', '2016-07-09'),
(107, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:57:52', '2016-07-09'),
(108, '195806161984000002', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '07:01:50', '2016-07-09'),
(109, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:41:14', '2016-07-10'),
(110, '195806161984000001', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'guru', '17:47:13', '2018-01-22'),
(111, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '17:51:31', '2018-01-22'),
(112, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '17:54:24', '2018-01-22'),
(113, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '12:50:32', '2018-01-24'),
(114, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '13:00:21', '2018-01-24'),
(115, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:26:38', '2020-02-29'),
(116, '195704111980032004', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'guru', '21:27:28', '2020-02-29'),
(117, '195806161984000016', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'guru', '21:58:50', '2020-02-29'),
(118, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:01:39', '2020-02-29'),
(119, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:11:48', '2020-03-04'),
(120, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:17:56', '2020-03-04'),
(121, '3', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:24:05', '2020-03-04'),
(122, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:24:10', '2020-03-04'),
(123, '3', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:24:16', '2020-03-04'),
(124, '3', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:26:13', '2020-03-04'),
(125, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:34:33', '2020-03-04'),
(126, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:39:16', '2020-03-04'),
(127, '3', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:39:54', '2020-03-04'),
(128, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:40:27', '2020-03-04'),
(129, '107', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '21:42:13', '2020-03-05'),
(130, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:42:24', '2020-03-05'),
(131, '107', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:43:14', '2020-03-05'),
(132, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:43:30', '2020-03-05'),
(133, '107', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '21:46:40', '2020-03-05'),
(134, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:47:50', '2020-03-05'),
(135, '108', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '21:50:12', '2020-03-05'),
(136, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:50:37', '2020-03-05'),
(137, '109', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '21:52:07', '2020-03-05'),
(138, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:53:07', '2020-03-05'),
(139, '110', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '21:55:17', '2020-03-05'),
(140, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:55:26', '2020-03-05'),
(141, '111', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '21:56:57', '2020-03-05'),
(142, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '21:58:25', '2020-03-05'),
(143, '112', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:00:05', '2020-03-05'),
(144, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:00:18', '2020-03-05'),
(145, '113', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:01:52', '2020-03-05'),
(146, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:03:14', '2020-03-05'),
(147, '113', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:11:56', '2020-03-05'),
(148, '112', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:12:59', '2020-03-05'),
(149, '111', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:14:04', '2020-03-05'),
(150, '110', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:14:52', '2020-03-05'),
(151, '109', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:15:23', '2020-03-05'),
(152, '108', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:16:07', '2020-03-05'),
(153, '107', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:17:00', '2020-03-05'),
(154, '3', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:19:07', '2020-03-05'),
(155, '113', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '22:32:27', '2020-03-05'),
(156, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '22:33:54', '2020-03-05'),
(157, '113', '::1', 'Chrome 80.0.3987.122', 'Windows 10', '', '23:01:26', '2020-03-05'),
(158, '1', '::1', 'Chrome 80.0.3987.122', 'Windows 10', 'superuser', '12:53:18', '2020-03-06'),
(159, '197712282006042005', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'guru', '20:59:05', '2020-03-09'),
(160, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '21:00:13', '2020-03-09'),
(161, '197712282006042005', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'guru', '21:02:21', '2020-03-09'),
(162, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '21:03:00', '2020-03-09'),
(163, '2121312312312', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'siswa', '21:04:30', '2020-03-09'),
(164, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '21:05:01', '2020-03-09'),
(165, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '21:09:33', '2020-03-09'),
(166, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '01:11:56', '2020-03-10'),
(167, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '15:30:32', '2020-03-13'),
(168, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '19:32:13', '2020-03-15'),
(169, '1', '::1', 'Chrome 80.0.3987.132', 'Windows 10', 'superuser', '19:40:11', '2020-03-15'),
(170, '1', '::1', 'Chrome 80.0.3987.149', 'Windows 10', 'superuser', '22:18:30', '2020-05-04'),
(171, '1', '::1', 'Chrome 81.0.4044.129', 'Windows 10', 'superuser', '00:44:30', '2020-05-06'),
(172, '1', '::1', 'Chrome 81.0.4044.138', 'Windows 10', 'superuser', '21:36:24', '2020-05-06'),
(173, '1', '::1', 'Chrome 81.0.4044.138', 'Windows 10', 'superuser', '20:45:08', '2020-07-20'),
(174, '1', '::1', 'Chrome 81.0.4044.138', 'Windows 10', 'superuser', '20:37:53', '2020-07-22'),
(175, '1', '::1', 'Chrome 85.0.4183.102', 'Windows 10', 'superuser', '20:40:58', '2020-09-29'),
(176, '1', '::1', 'Chrome 85.0.4183.102', 'Windows 10', 'superuser', '20:20:12', '2020-10-01'),
(177, '1', '::1', 'Chrome 85.0.4183.121', 'Windows 10', 'superuser', '00:48:02', '2020-10-13'),
(178, '1', '::1', 'Chrome 85.0.4183.121', 'Windows 10', 'superuser', '22:45:35', '2020-10-15'),
(179, '1', '::1', 'Chrome 85.0.4183.121', 'Windows 10', 'superuser', '22:31:09', '2020-10-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_guru`
--
ALTER TABLE `absensi_guru`
  ADD PRIMARY KEY (`id_absensi_guru`);

--
-- Indexes for table `absensi_siswa`
--
ALTER TABLE `absensi_siswa`
  ADD PRIMARY KEY (`id_absensi_siswa`);

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anggota_sub_rayon`
--
ALTER TABLE `anggota_sub_rayon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indexes for table `arsip_dudi`
--
ALTER TABLE `arsip_dudi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_kerja_alumni`
--
ALTER TABLE `data_kerja_alumni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_peminjaman_barang`
--
ALTER TABLE `data_peminjaman_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_prakrin`
--
ALTER TABLE `data_prakrin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_tempat_prakrin`
--
ALTER TABLE `data_tempat_prakrin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumen_jadwal_rekruitasi`
--
ALTER TABLE `dokumen_jadwal_rekruitasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumen_tuk`
--
ALTER TABLE `dokumen_tuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elearning`
--
ALTER TABLE `elearning`
  ADD PRIMARY KEY (`id_elearning`);

--
-- Indexes for table `elearning_jawab`
--
ALTER TABLE `elearning_jawab`
  ADD PRIMARY KEY (`id_elearning_jawab`);

--
-- Indexes for table `forum_komentar`
--
ALTER TABLE `forum_komentar`
  ADD PRIMARY KEY (`id_forum_komentar`);

--
-- Indexes for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`id_forum_topic`);

--
-- Indexes for table `gaji_pegawai`
--
ALTER TABLE `gaji_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gedung`
--
ALTER TABLE `gedung`
  ADD PRIMARY KEY (`kode_gedung`);

--
-- Indexes for table `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `halaman`
--
ALTER TABLE `halaman`
  ADD PRIMARY KEY (`id_halaman`);

--
-- Indexes for table `hasil_notulensi`
--
ALTER TABLE `hasil_notulensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identitas_sekolah`
--
ALTER TABLE `identitas_sekolah`
  ADD PRIMARY KEY (`id_identitas_sekolah`);

--
-- Indexes for table `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  ADD PRIMARY KEY (`kodejdwl`);

--
-- Indexes for table `jadwal_pengawas`
--
ALTER TABLE `jadwal_pengawas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_ujian`
--
ALTER TABLE `jadwal_ujian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_ukk`
--
ALTER TABLE `jadwal_ukk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_un`
--
ALTER TABLE `jadwal_un`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jawaban_essai`
--
ALTER TABLE `jawaban_essai`
  ADD PRIMARY KEY (`id_jawaban_essai`);

--
-- Indexes for table `jawaban_objektif`
--
ALTER TABLE `jawaban_objektif`
  ADD PRIMARY KEY (`id_jawaban_objektif`);

--
-- Indexes for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indexes for table `jenis_ptk`
--
ALTER TABLE `jenis_ptk`
  ADD PRIMARY KEY (`id_jenis_ptk`);

--
-- Indexes for table `journal_list`
--
ALTER TABLE `journal_list`
  ADD PRIMARY KEY (`id_journal`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `kategori_elearning`
--
ALTER TABLE `kategori_elearning`
  ADD PRIMARY KEY (`id_kategori_elearning`);

--
-- Indexes for table `kategori_quiz_ujian`
--
ALTER TABLE `kategori_quiz_ujian`
  ADD PRIMARY KEY (`id_kategori_quiz_ujian`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`kode_kehadiran`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `kelompok_mata_pelajaran`
--
ALTER TABLE `kelompok_mata_pelajaran`
  ADD PRIMARY KEY (`id_kelompok_mata_pelajaran`);

--
-- Indexes for table `kompetensi_dasar`
--
ALTER TABLE `kompetensi_dasar`
  ADD PRIMARY KEY (`id_kompetensi_dasar`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`kode_kurikulum`);

--
-- Indexes for table `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kode_pelajaran`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `nilai_extrakulikuler`
--
ALTER TABLE `nilai_extrakulikuler`
  ADD PRIMARY KEY (`id_nilai_extrakulikuler`);

--
-- Indexes for table `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  ADD PRIMARY KEY (`id_nilai_keterampilan`);

--
-- Indexes for table `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  ADD PRIMARY KEY (`id_nilai_pengetahuan`);

--
-- Indexes for table `nilai_pertanyaan_essai`
--
ALTER TABLE `nilai_pertanyaan_essai`
  ADD PRIMARY KEY (`id_nilai_pertanyaan_essai`);

--
-- Indexes for table `nilai_prestasi`
--
ALTER TABLE `nilai_prestasi`
  ADD PRIMARY KEY (`id_nilai_prestasi`);

--
-- Indexes for table `nilai_sikap`
--
ALTER TABLE `nilai_sikap`
  ADD PRIMARY KEY (`id_nilai_sikap`);

--
-- Indexes for table `nilai_sikap_semester`
--
ALTER TABLE `nilai_sikap_semester`
  ADD PRIMARY KEY (`id_nilai_sikap_semester`);

--
-- Indexes for table `nilai_ukk_dudi`
--
ALTER TABLE `nilai_ukk_dudi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_uts`
--
ALTER TABLE `nilai_uts`
  ADD PRIMARY KEY (`id_nilai_uts`);

--
-- Indexes for table `panitia_penyelenggara`
--
ALTER TABLE `panitia_penyelenggara`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengadaan_barang`
--
ALTER TABLE `pengadaan_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengawas_silang`
--
ALTER TABLE `pengawas_silang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembalian_barang`
--
ALTER TABLE `pengembalian_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertanyaan_essai`
--
ALTER TABLE `pertanyaan_essai`
  ADD PRIMARY KEY (`id_pertanyaan_essai`);

--
-- Indexes for table `pertanyaan_objektif`
--
ALTER TABLE `pertanyaan_objektif`
  ADD PRIMARY KEY (`id_pertanyaan_objektif`);

--
-- Indexes for table `pertanyaan_penilaian`
--
ALTER TABLE `pertanyaan_penilaian`
  ADD PRIMARY KEY (`id_pertanyaan_penilaian`);

--
-- Indexes for table `pertanyaan_penilaian_jawab`
--
ALTER TABLE `pertanyaan_penilaian_jawab`
  ADD PRIMARY KEY (`id_pertanyaan_penilaian_jawab`);

--
-- Indexes for table `predikat`
--
ALTER TABLE `predikat`
  ADD PRIMARY KEY (`id_predikat`);

--
-- Indexes for table `psb_aktivasi`
--
ALTER TABLE `psb_aktivasi`
  ADD PRIMARY KEY (`id_aktivasi`);

--
-- Indexes for table `psb_daftar_aktivasi`
--
ALTER TABLE `psb_daftar_aktivasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `psb_pendaftaran`
--
ALTER TABLE `psb_pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- Indexes for table `psb_pendaftaran_saudara`
--
ALTER TABLE `psb_pendaftaran_saudara`
  ADD PRIMARY KEY (`id_saudara`);

--
-- Indexes for table `quiz_ujian`
--
ALTER TABLE `quiz_ujian`
  ADD PRIMARY KEY (`id_quiz_ujian`);

--
-- Indexes for table `rincian_anggaran`
--
ALTER TABLE `rincian_anggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_keuangan_siswa`
--
ALTER TABLE `riwayat_keuangan_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_ruangan`);

--
-- Indexes for table `sertifikat_prakerin`
--
ALTER TABLE `sertifikat_prakerin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`id_sesi`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `sk_berkala`
--
ALTER TABLE `sk_berkala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id_sms`);

--
-- Indexes for table `sms_autoreply`
--
ALTER TABLE `sms_autoreply`
  ADD PRIMARY KEY (`id_autoreply`);

--
-- Indexes for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_outbox`
--
ALTER TABLE `sms_outbox`
  ADD PRIMARY KEY (`id_outbox`);

--
-- Indexes for table `status_keaktifan`
--
ALTER TABLE `status_keaktifan`
  ADD PRIMARY KEY (`id_status_keaktifan`);

--
-- Indexes for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  ADD PRIMARY KEY (`id_status_kepegawaian`);

--
-- Indexes for table `status_pernikahan`
--
ALTER TABLE `status_pernikahan`
  ADD PRIMARY KEY (`id_status_pernikahan`);

--
-- Indexes for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id_tahun_akademik`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `users_aktivitas`
--
ALTER TABLE `users_aktivitas`
  ADD PRIMARY KEY (`id_users_aktivitas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_guru`
--
ALTER TABLE `absensi_guru`
  MODIFY `id_absensi_guru` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absensi_siswa`
--
ALTER TABLE `absensi_siswa`
  MODIFY `id_absensi_siswa` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `id_agama` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anggota_sub_rayon`
--
ALTER TABLE `anggota_sub_rayon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arsip_dudi`
--
ALTER TABLE `arsip_dudi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_kerja_alumni`
--
ALTER TABLE `data_kerja_alumni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_peminjaman_barang`
--
ALTER TABLE `data_peminjaman_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_prakrin`
--
ALTER TABLE `data_prakrin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_tempat_prakrin`
--
ALTER TABLE `data_tempat_prakrin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dokumen_jadwal_rekruitasi`
--
ALTER TABLE `dokumen_jadwal_rekruitasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dokumen_tuk`
--
ALTER TABLE `dokumen_tuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `elearning`
--
ALTER TABLE `elearning`
  MODIFY `id_elearning` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `elearning_jawab`
--
ALTER TABLE `elearning_jawab`
  MODIFY `id_elearning_jawab` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `forum_komentar`
--
ALTER TABLE `forum_komentar`
  MODIFY `id_forum_komentar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `id_forum_topic` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gaji_pegawai`
--
ALTER TABLE `gaji_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `golongan`
--
ALTER TABLE `golongan`
  MODIFY `id_golongan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `halaman`
--
ALTER TABLE `halaman`
  MODIFY `id_halaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hasil_notulensi`
--
ALTER TABLE `hasil_notulensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `identitas_sekolah`
--
ALTER TABLE `identitas_sekolah`
  MODIFY `id_identitas_sekolah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  MODIFY `kodejdwl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `jadwal_pengawas`
--
ALTER TABLE `jadwal_pengawas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadwal_ujian`
--
ALTER TABLE `jadwal_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jadwal_ukk`
--
ALTER TABLE `jadwal_ukk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jadwal_un`
--
ALTER TABLE `jadwal_un`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jawaban_essai`
--
ALTER TABLE `jawaban_essai`
  MODIFY `id_jawaban_essai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jawaban_objektif`
--
ALTER TABLE `jawaban_objektif`
  MODIFY `id_jawaban_objektif` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id_jenis_kelamin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_ptk`
--
ALTER TABLE `jenis_ptk`
  MODIFY `id_jenis_ptk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `journal_list`
--
ALTER TABLE `journal_list`
  MODIFY `id_journal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori_elearning`
--
ALTER TABLE `kategori_elearning`
  MODIFY `id_kategori_elearning` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori_quiz_ujian`
--
ALTER TABLE `kategori_quiz_ujian`
  MODIFY `id_kategori_quiz_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelompok_mata_pelajaran`
--
ALTER TABLE `kelompok_mata_pelajaran`
  MODIFY `id_kelompok_mata_pelajaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kompetensi_dasar`
--
ALTER TABLE `kompetensi_dasar`
  MODIFY `id_kompetensi_dasar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `kode_kurikulum` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `level_user`
--
ALTER TABLE `level_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `nilai_extrakulikuler`
--
ALTER TABLE `nilai_extrakulikuler`
  MODIFY `id_nilai_extrakulikuler` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  MODIFY `id_nilai_keterampilan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  MODIFY `id_nilai_pengetahuan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `nilai_pertanyaan_essai`
--
ALTER TABLE `nilai_pertanyaan_essai`
  MODIFY `id_nilai_pertanyaan_essai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nilai_prestasi`
--
ALTER TABLE `nilai_prestasi`
  MODIFY `id_nilai_prestasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai_sikap`
--
ALTER TABLE `nilai_sikap`
  MODIFY `id_nilai_sikap` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `nilai_sikap_semester`
--
ALTER TABLE `nilai_sikap_semester`
  MODIFY `id_nilai_sikap_semester` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nilai_ukk_dudi`
--
ALTER TABLE `nilai_ukk_dudi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nilai_uts`
--
ALTER TABLE `nilai_uts`
  MODIFY `id_nilai_uts` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `panitia_penyelenggara`
--
ALTER TABLE `panitia_penyelenggara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengadaan_barang`
--
ALTER TABLE `pengadaan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengawas_silang`
--
ALTER TABLE `pengawas_silang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengembalian_barang`
--
ALTER TABLE `pengembalian_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pertanyaan_essai`
--
ALTER TABLE `pertanyaan_essai`
  MODIFY `id_pertanyaan_essai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pertanyaan_objektif`
--
ALTER TABLE `pertanyaan_objektif`
  MODIFY `id_pertanyaan_objektif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pertanyaan_penilaian`
--
ALTER TABLE `pertanyaan_penilaian`
  MODIFY `id_pertanyaan_penilaian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pertanyaan_penilaian_jawab`
--
ALTER TABLE `pertanyaan_penilaian_jawab`
  MODIFY `id_pertanyaan_penilaian_jawab` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `predikat`
--
ALTER TABLE `predikat`
  MODIFY `id_predikat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `psb_aktivasi`
--
ALTER TABLE `psb_aktivasi`
  MODIFY `id_aktivasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `psb_daftar_aktivasi`
--
ALTER TABLE `psb_daftar_aktivasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `psb_pendaftaran`
--
ALTER TABLE `psb_pendaftaran`
  MODIFY `id_pendaftaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `psb_pendaftaran_saudara`
--
ALTER TABLE `psb_pendaftaran_saudara`
  MODIFY `id_saudara` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `quiz_ujian`
--
ALTER TABLE `quiz_ujian`
  MODIFY `id_quiz_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rincian_anggaran`
--
ALTER TABLE `rincian_anggaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `riwayat_keuangan_siswa`
--
ALTER TABLE `riwayat_keuangan_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sertifikat_prakerin`
--
ALTER TABLE `sertifikat_prakerin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sesi`
--
ALTER TABLE `sesi`
  MODIFY `id_sesi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1277;

--
-- AUTO_INCREMENT for table `sk_berkala`
--
ALTER TABLE `sk_berkala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id_sms` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_autoreply`
--
ALTER TABLE `sms_autoreply`
  MODIFY `id_autoreply` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_outbox`
--
ALTER TABLE `sms_outbox`
  MODIFY `id_outbox` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_keaktifan`
--
ALTER TABLE `status_keaktifan`
  MODIFY `id_status_keaktifan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  MODIFY `id_status_kepegawaian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status_pernikahan`
--
ALTER TABLE `status_pernikahan`
  MODIFY `id_status_pernikahan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id_tahun_akademik` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20202022;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `users_aktivitas`
--
ALTER TABLE `users_aktivitas`
  MODIFY `id_users_aktivitas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

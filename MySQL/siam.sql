-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2022 at 03:35 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siam`
--

-- --------------------------------------------------------

--
-- Table structure for table `ajar_dosen`
--

CREATE TABLE `ajar_dosen` (
  `id_ajar` int(20) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `id_kelas` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ajar_dosen`
--

INSERT INTO `ajar_dosen` (`id_ajar`, `nip`, `id_kelas`) VALUES
(1, '19880605210', 1),
(2, '19850711910', 2),
(3, '19890302111', 3),
(4, '19890615221', 4),
(5, '19880605210', 5),
(6, '19850711910', 6),
(7, '19890302111', 7),
(8, '19890615221', 8);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` char(20) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `telp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT 'tetap',
  `tgl_mulai_kerja` varchar(50) DEFAULT NULL,
  `id_jurusan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `alamat`, `kota`, `provinsi`, `telp`, `email`, `status_pegawai`, `tgl_mulai_kerja`, `id_jurusan`) VALUES
('19850711910', 'Budi Santosa', 'L', 'Malang', '11-Jul-85', 'Jl Jakarta no 11', 'Malang', 'Jawa Timur', '085268372781', 'budi@gmail.com', 'Kontrak', '17-Mar-15', 'P11'),
('19880605210', 'Reny Kusuma ', 'P', 'Blitar', '5-Jun-88', 'JL Bogor no 12', 'Malang', 'Jawa Timur', '082342637123', 'reny@gmail.com', 'Tetap', '12-Jan-15', 'P11'),
('19890302111', 'Abdul Aziz', 'L', 'Surabaya', '2-Mar-89', 'Jl Ijen no 14', 'Malang', 'Jawa Timur', '087443287328', 'aziz@gmail.com', 'DEFAULT', '18-Jan-15', 'P12'),
('19890615221', 'Dwi Rahayu', 'P', 'Malang', '15-Jun-89', 'JL Bandung no 21', 'Malang', 'Jawa Timur', '082537773722', 'dwi@gmail.com', 'Kontrak', '16-Jun-15', 'P12');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` varchar(50) NOT NULL,
  `nama_jurusan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
('P14', 'Kecerdasan Buatan'),
('P11', 'manajemen informatika'),
('P12', 'teknik komputer');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_kuliah`
--

CREATE TABLE `kelas_kuliah` (
  `id_kelas` int(20) NOT NULL,
  `id_smt` int(20) DEFAULT NULL,
  `kode_mk` varchar(50) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `id_ruang` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas_kuliah`
--

INSERT INTO `kelas_kuliah` (`id_kelas`, `id_smt`, `kode_mk`, `waktu`, `id_ruang`) VALUES
(1, 4, 'A13', 'Senin,07.00-08.00', 1),
(2, 4, 'A14', 'Senin,08.00-09.00', 2),
(3, 4, 'A23', 'Selasa,09.00-10.00', 5),
(4, 4, 'A24', 'Rabu,07.00-08.00', 6),
(5, 5, 'A11', 'Rabu,07.00-08.00', 9),
(6, 5, 'A12', 'Jumat,08.00-09.00', 8),
(7, 5, 'A21', 'Selasa,09.00-10.00', 1),
(8, 5, 'A22', 'Kamis,07.00-08.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` char(20) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `telp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_jurusan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `alamat`, `kota`, `provinsi`, `telp`, `email`, `id_jurusan`) VALUES
('12606030001', 'Rina Nikmawati', 'P', 'Blitar', '0000-00-00', 'JL Kawi no 24', 'Blitar', 'Jawa Timur', '082272637123', 'rina@gmail.com', 'P11'),
('12606030002', 'Lukman Hakim', 'L', 'Malang', '0000-00-00', 'Jl Semeru no 18', 'Malang', 'Jawa Timur', '086735472781', 'lukman@gmail.com', 'P11'),
('12606030003', 'Abdi Pangestu', 'L', 'Surabaya', '0000-00-00', 'Jl Bandung no 21', 'Surabaya', 'Jawa Timur', '087323287328', 'abdi@gmail.com', 'P11'),
('12606030004', 'Rendy Lucky', 'L', 'Solo', '0000-00-00', 'JL Bromo no 19', 'Solo', 'Jawa Tengah', '082537263722', 'rendy@gmail.com', 'P11'),
('12606030005', 'Amanda R.', 'P', 'Solo', '0000-00-00', 'JL Simpang Lima no 23', 'Solo', 'Jawa Tengah', '085738728288', 'amanda@gmail.com', 'P11'),
('12606030006', 'Muhammad Rizal', 'L', 'Yogyakarta', '0000-00-00', 'JL Merdeka no 23', 'Yogyakarta', 'Jawa Tengah', '082738823728', 'rizal@gmail.com', 'P11'),
('12606030007', 'Safitri ', 'P', 'Bandung', '0000-00-00', 'JL kenari no 12', 'Bandung', 'Jawa Barat', '085327322382', 'fitri@gmail.com', 'P12'),
('12606030008', 'Miftahul Maruf', 'L', 'Kediri', '0000-00-00', 'JL Mawar no 123', 'Kediri', 'Jawa Timur', '082723728822', 'miftah@gmail.com', 'P12'),
('12606030009', 'Riza Umami', 'P', 'Blitar', '0000-00-00', 'JL Brigjen Ketamsono 112', 'Blitar', 'Jawa Timur', '085723726773', 'riza@gmail.com', 'P12'),
('12606030010', 'Titik Puspa', 'P', 'Malang', '0000-00-00', 'JL Ijen no 34', 'Malang', 'Jawa Timur', '085537369320', 'puspa@gmail.com', 'P12'),
('12606030011', 'Ratna Puspitasari', 'P', 'Surabaya', '0000-00-00', 'JL Pahlawan no 27', 'Surabaya', 'Jawa Timur', '082738826628', 'ratna@gmail.com', 'P12'),
('12606030012', 'Novan Alex', 'L', 'Surabaya', '0000-00-00', 'JL Kerinci no 56', 'Surabaya', 'Jawa Timur', '085327327652', 'alex@gmail.com', 'P12');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_mk` varchar(50) NOT NULL,
  `id_jurusan` varchar(50) DEFAULT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `sks` int(20) DEFAULT NULL,
  `jenis_mk` varchar(50) DEFAULT 'wajib'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_mk`, `id_jurusan`, `nama_mk`, `sks`, `jenis_mk`) VALUES
('A11', 'P11', 'Algoritma Pemrograman', 3, 'Wajib'),
('A12', 'P11', 'Basis Data ', 3, 'DEFAULT'),
('A13', 'P11', 'Basis Data Lanjut', 3, 'Pilihan'),
('A14', 'P11', 'Pemrograman Lanjut', 3, 'Wajib'),
('A21', 'P12', 'Algoritma Pemrograman', 3, 'DEFAULT'),
('A22', 'P12', 'Basis Data', 3, 'Wajib'),
('A23', 'P12', 'Struktur data', 3, 'Wajib'),
('A24', 'P12', 'Pemrograman Android', 3, 'Pilihan');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(50) NOT NULL,
  `nim` varchar(50) DEFAULT NULL,
  `id_kelas` int(20) DEFAULT NULL,
  `nilai_uts` int(20) DEFAULT NULL,
  `nilai_uas` int(20) DEFAULT NULL,
  `nilai_ukk` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nim`, `id_kelas`, `nilai_uts`, `nilai_uas`, `nilai_ukk`) VALUES
(1, '12606030001', 1, 70, 90, 77),
(2, '12606030002', 1, 80, 89, 78),
(3, '12606030003', 1, 87, 86, 86),
(4, '12606030004', 1, 89, 88, 98),
(5, '12606030005', 1, 100, 98, 74),
(6, '12606030006', 1, 97, 76, 98),
(7, '12606030001', 2, 77, 87, 87),
(8, '12606030002', 2, 78, 89, 88),
(9, '12606030003', 2, 86, 73, 85),
(10, '12606030004', 2, 98, 74, 87),
(11, '12606030005', 2, 78, 98, 88),
(12, '12606030006', 2, 90, 87, 85),
(13, '12606030007', 3, 89, 88, 79),
(14, '12606030008', 3, 78, 85, 87),
(15, '12606030009', 3, 77, 79, 89),
(16, '12606030010', 3, 75, 87, 80),
(17, '12606030011', 3, 80, 89, 86),
(18, '12606030012', 3, 86, 73, 87),
(19, '12606030007', 4, 87, 74, 88),
(20, '12606030008', 4, 88, 98, 90),
(21, '12606030009', 4, 90, 89, 80),
(22, '12606030010', 4, 95, 78, 86),
(23, '12606030011', 4, 100, 77, 87),
(24, '12606030012', 4, 78, 75, 88),
(25, '12606030001', 5, 90, 78, 88),
(26, '12606030002', 5, 80, 77, 85),
(27, '12606030003', 5, 86, 75, 79),
(28, '12606030004', 5, 87, 80, 87),
(29, '12606030005', 5, 88, 86, 89),
(30, '12606030006', 5, 87, 87, 80),
(31, '12606030001', 6, 88, 77, 86),
(32, '12606030002', 6, 85, 75, 74),
(33, '12606030003', 6, 79, 80, 98),
(34, '12606030004', 6, 87, 86, 89),
(35, '12606030005', 6, 89, 87, 78),
(36, '12606030006', 6, 73, 76, 77),
(37, '12606030007', 7, 74, 98, 74),
(38, '12606030008', 7, 98, 87, 98),
(39, '12606030009', 7, 87, 88, 87),
(40, '12606030010', 7, 88, 85, 88),
(41, '12606030011', 7, 85, 87, 85),
(42, '12606030012', 7, 79, 88, 87),
(43, '12606030007', 8, 87, 85, 88),
(44, '12606030008', 8, 89, 79, 85),
(45, '12606030009', 8, 73, 87, 79),
(46, '12606030010', 8, 74, 89, 87),
(47, '12606030011', 8, 98, 80, 88),
(48, '12606030012', 8, 89, 86, 90);

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id_ruang` int(20) NOT NULL,
  `nama_ruang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id_ruang`, `nama_ruang`) VALUES
(1, '1.1'),
(2, '1.2'),
(3, '1.3'),
(4, '1.4'),
(5, '2.1'),
(6, '2.2'),
(7, '2.3'),
(8, '2.4'),
(9, '2.5'),
(10, '2.6');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id_smt` int(20) NOT NULL,
  `tahun_ajaran` varchar(50) DEFAULT NULL,
  `semester` int(20) DEFAULT NULL,
  `aktif` int(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id_smt`, `tahun_ajaran`, `semester`, `aktif`) VALUES
(1, '2015/2016', 1, 0),
(2, '2015/2016', 2, 0),
(3, '2016/2017', 1, 0),
(4, '2016/2017', 2, 0),
(5, '2017/2018', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ajar_dosen`
--
ALTER TABLE `ajar_dosen`
  ADD PRIMARY KEY (`id_ajar`),
  ADD KEY `nip` (`nip`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`),
  ADD UNIQUE KEY `nama_jurusan` (`nama_jurusan`);

--
-- Indexes for table `kelas_kuliah`
--
ALTER TABLE `kelas_kuliah`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `kode_mk` (`kode_mk`),
  ADD KEY `id_ruang` (`id_ruang`),
  ADD KEY `id_smt` (`id_smt`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_mk`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nim` (`nim`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id_ruang`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_smt`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ajar_dosen`
--
ALTER TABLE `ajar_dosen`
  ADD CONSTRAINT `ajar_dosen_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`),
  ADD CONSTRAINT `ajar_dosen_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas_kuliah` (`id_kelas`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `kelas_kuliah`
--
ALTER TABLE `kelas_kuliah`
  ADD CONSTRAINT `kelas_kuliah_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`),
  ADD CONSTRAINT `kelas_kuliah_ibfk_2` FOREIGN KEY (`id_ruang`) REFERENCES `ruang` (`id_ruang`),
  ADD CONSTRAINT `kelas_kuliah_ibfk_3` FOREIGN KEY (`id_smt`) REFERENCES `semester` (`id_smt`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas_kuliah` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

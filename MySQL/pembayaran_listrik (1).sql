-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2022 at 02:19 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pembayaran_listrik`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_trtaglis`
--

CREATE TABLE `detail_trtaglis` (
  `id_transaksi` int(20) NOT NULL,
  `kode_voucher` int(20) NOT NULL,
  `id_transaksi_taglis` int(20) NOT NULL,
  `id_konfirmasi` int(20) NOT NULL,
  `id_barang` int(20) NOT NULL,
  `waktu_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_trtaglis`
--

INSERT INTO `detail_trtaglis` (`id_transaksi`, `kode_voucher`, `id_transaksi_taglis`, `id_konfirmasi`, `id_barang`, `waktu_transaksi`) VALUES
(12673671, 24196723, 237959873, 203987489, 87878781, '2022-11-10'),
(91823798, 2104987238, 420987292, 2093845787, 87878782, '2022-11-19'),
(242334234, 2104987238, 98743257, 203987489, 87878782, '2022-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `detail_trtoken`
--

CREATE TABLE `detail_trtoken` (
  `id_transaksi` int(20) NOT NULL,
  `kode_voucher` int(20) NOT NULL,
  `id_transaksi_token` int(20) NOT NULL,
  `id_konfirmasi` int(20) NOT NULL,
  `id_barang` int(20) NOT NULL,
  `waktu_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_trtoken`
--

INSERT INTO `detail_trtoken` (`id_transaksi`, `kode_voucher`, `id_transaksi_token`, `id_konfirmasi`, `id_barang`, `waktu_transaksi`) VALUES
(2983078, 739074245, 13746786, 1284579987, 87878781, '2022-11-16'),
(9867856, 739074245, 83938938, 91824709, 87878782, '2022-08-12'),
(84844545, 24196723, 31309232, 237923123, 87878782, '2022-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

CREATE TABLE `harga` (
  `id_harga` int(20) DEFAULT NULL,
  `harga` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_konfirmasi` int(20) NOT NULL,
  `metode_pembayaran` varchar(30) NOT NULL,
  `id_pelanggan` int(20) NOT NULL,
  `kode_voucher` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_barang` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_konfirmasi`, `metode_pembayaran`, `id_pelanggan`, `kode_voucher`, `id_user`, `id_barang`) VALUES
(91824709, 'linkaja', 22531125, 739074245, 123212321, 87878782),
(103974908, 'linkaja', 65653356, 24196723, 123212321, 87878781),
(203987489, 'linkaja', 65653355, 2104987238, 123212321, 87878782),
(237923123, 'linkaja', 22531123, 24196723, 123212321, 87878782),
(1284579987, 'linkaja', 22531124, 739074245, 123212321, 87878781),
(2093845787, 'linkaja', 65653357, 2104987238, 123212321, 87878782);

-- --------------------------------------------------------

--
-- Table structure for table `listrik`
--

CREATE TABLE `listrik` (
  `id_pembelian` int(20) NOT NULL,
  `nama_pembelian` varchar(30) NOT NULL,
  `id_user` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `listrik`
--

INSERT INTO `listrik` (`id_pembelian`, `nama_pembelian`, `id_user`) VALUES
(12021001, 'token listrik', 123212321),
(12021002, 'tagihan listrik', 123212321);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(20) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `tegangan` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `tegangan`) VALUES
(22531123, 'Jono', '450 VA'),
(22531124, 'Maryono', '1300VA'),
(22531125, 'Hartono', '900VA'),
(65653355, 'Indigone', '1300VA'),
(65653356, 'islam', '450VA'),
(65653357, 'syukur', '900VA');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_listrik`
--

CREATE TABLE `pembelian_listrik` (
  `id_barang` int(20) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga` int(20) NOT NULL,
  `biaya_admin` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_listrik`
--

INSERT INTO `pembelian_listrik` (`id_barang`, `nama_barang`, `harga`, `biaya_admin`) VALUES
(87878781, 'harga 20000', 20000, 2500),
(87878782, 'harga 50000', 50000, 2500),
(87878783, 'harga 100000', 100000, 2500),
(87878784, 'harga 200000', 200000, 2500),
(87878785, 'harga 500000', 500000, 2500);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_taglis`
--

CREATE TABLE `transaksi_taglis` (
  `id_pelanggan` int(20) NOT NULL,
  `id_transaksi_taglis` int(20) NOT NULL,
  `waktu_transaksi` date DEFAULT NULL,
  `id_barang` int(20) NOT NULL,
  `id_pembelian` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_taglis`
--

INSERT INTO `transaksi_taglis` (`id_pelanggan`, `id_transaksi_taglis`, `waktu_transaksi`, `id_barang`, `id_pembelian`) VALUES
(65653355, 98743257, '2022-11-02', 87878782, 12021002),
(65653356, 237959873, '2022-11-10', 87878781, 12021002),
(65653357, 420987292, '2022-11-19', 87878782, 12021002);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_token`
--

CREATE TABLE `transaksi_token` (
  `id_pelanggan` int(20) NOT NULL,
  `id_transaksi_token` int(20) NOT NULL,
  `waktu_transaksi` date DEFAULT NULL,
  `id_barang` int(20) NOT NULL,
  `id_pembelian` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_token`
--

INSERT INTO `transaksi_token` (`id_pelanggan`, `id_transaksi_token`, `waktu_transaksi`, `id_barang`, `id_pembelian`) VALUES
(22531124, 13746786, '2022-11-16', 87878781, 12021001),
(22531123, 31309232, '2022-11-09', 87878782, 12021001),
(22531125, 83938938, '2022-08-12', 87878782, 12021001);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(20) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `saldo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `saldo`) VALUES
(123212321, 'Dimas Wicaksono', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `kode_voucher` int(20) NOT NULL,
  `nama_voucher` varchar(30) DEFAULT NULL,
  `jumlah_voucher` int(20) NOT NULL,
  `id_user` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`kode_voucher`, `nama_voucher`, `jumlah_voucher`, `id_user`) VALUES
(24196723, 'cashback 90%', 1, 123212321),
(739074245, 'dicount 30%', 5, 123212321),
(2104987238, 'discount 90% max 10000', 6, 123212321);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_trtaglis`
--
ALTER TABLE `detail_trtaglis`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_voucher` (`kode_voucher`,`id_transaksi_taglis`,`id_konfirmasi`),
  ADD KEY `id_konfirmasi` (`id_konfirmasi`),
  ADD KEY `id_transaksi_taglis` (`id_transaksi_taglis`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `detail_trtoken`
--
ALTER TABLE `detail_trtoken`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_voucher` (`kode_voucher`,`id_transaksi_token`),
  ADD KEY `id_transaksi_token` (`id_transaksi_token`),
  ADD KEY `id_konfirmasi` (`id_konfirmasi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `kode_voucher` (`kode_voucher`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `listrik`
--
ALTER TABLE `listrik`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembelian_listrik`
--
ALTER TABLE `pembelian_listrik`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `harga` (`harga`,`biaya_admin`),
  ADD KEY `id_harga` (`harga`);

--
-- Indexes for table `transaksi_taglis`
--
ALTER TABLE `transaksi_taglis`
  ADD PRIMARY KEY (`id_transaksi_taglis`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indexes for table `transaksi_token`
--
ALTER TABLE `transaksi_token`
  ADD PRIMARY KEY (`id_transaksi_token`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`kode_voucher`),
  ADD KEY `id_user` (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_trtaglis`
--
ALTER TABLE `detail_trtaglis`
  ADD CONSTRAINT `detail_trtaglis_ibfk_2` FOREIGN KEY (`id_konfirmasi`) REFERENCES `konfirmasi` (`id_konfirmasi`),
  ADD CONSTRAINT `detail_trtaglis_ibfk_3` FOREIGN KEY (`id_transaksi_taglis`) REFERENCES `transaksi_taglis` (`id_transaksi_taglis`),
  ADD CONSTRAINT `detail_trtaglis_ibfk_4` FOREIGN KEY (`kode_voucher`) REFERENCES `voucher` (`kode_voucher`),
  ADD CONSTRAINT `detail_trtaglis_ibfk_5` FOREIGN KEY (`id_barang`) REFERENCES `pembelian_listrik` (`id_barang`);

--
-- Constraints for table `detail_trtoken`
--
ALTER TABLE `detail_trtoken`
  ADD CONSTRAINT `detail_trtoken_ibfk_1` FOREIGN KEY (`kode_voucher`) REFERENCES `voucher` (`kode_voucher`),
  ADD CONSTRAINT `detail_trtoken_ibfk_5` FOREIGN KEY (`id_transaksi_token`) REFERENCES `transaksi_token` (`id_transaksi_token`),
  ADD CONSTRAINT `detail_trtoken_ibfk_7` FOREIGN KEY (`id_konfirmasi`) REFERENCES `konfirmasi` (`id_konfirmasi`),
  ADD CONSTRAINT `detail_trtoken_ibfk_8` FOREIGN KEY (`id_barang`) REFERENCES `pembelian_listrik` (`id_barang`);

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `konfirmasi_ibfk_2` FOREIGN KEY (`kode_voucher`) REFERENCES `voucher` (`kode_voucher`),
  ADD CONSTRAINT `konfirmasi_ibfk_3` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `konfirmasi_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `konfirmasi_ibfk_5` FOREIGN KEY (`id_barang`) REFERENCES `pembelian_listrik` (`id_barang`);

--
-- Constraints for table `listrik`
--
ALTER TABLE `listrik`
  ADD CONSTRAINT `listrik_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_taglis`
--
ALTER TABLE `transaksi_taglis`
  ADD CONSTRAINT `transaksi_taglis_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `pembelian_listrik` (`id_barang`),
  ADD CONSTRAINT `transaksi_taglis_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_taglis_ibfk_3` FOREIGN KEY (`id_pembelian`) REFERENCES `listrik` (`id_pembelian`);

--
-- Constraints for table `transaksi_token`
--
ALTER TABLE `transaksi_token`
  ADD CONSTRAINT `transaksi_token_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `pembelian_listrik` (`id_barang`),
  ADD CONSTRAINT `transaksi_token_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_token_ibfk_3` FOREIGN KEY (`id_pembelian`) REFERENCES `listrik` (`id_pembelian`);

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

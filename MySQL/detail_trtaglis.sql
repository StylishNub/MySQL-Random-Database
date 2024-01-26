-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 12:49 PM
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
  `biaya_admin` int(20) NOT NULL,
  `kode_voucher` int(20) NOT NULL,
  `id_transaksi_taglis` int(20) NOT NULL,
  `id_harga` int(20) NOT NULL,
  `id_konfirmasi` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_trtaglis`
--

INSERT INTO `detail_trtaglis` (`id_transaksi`, `biaya_admin`, `kode_voucher`, `id_transaksi_taglis`, `id_harga`, `id_konfirmasi`) VALUES
(12673671, 2500, 24196723, 237959873, 21323143, 203987489),
(91823798, 2500, 2104987238, 420987292, 21323144, 2093845787),
(242334234, 2500, 2104987238, 98743257, 21323144, 203987489);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_trtaglis`
--
ALTER TABLE `detail_trtaglis`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_voucher` (`kode_voucher`,`id_transaksi_taglis`,`id_harga`,`id_konfirmasi`),
  ADD KEY `id_harga` (`id_harga`),
  ADD KEY `id_konfirmasi` (`id_konfirmasi`),
  ADD KEY `id_transaksi_taglis` (`id_transaksi_taglis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_trtaglis`
--
ALTER TABLE `detail_trtaglis`
  ADD CONSTRAINT `detail_trtaglis_ibfk_1` FOREIGN KEY (`id_harga`) REFERENCES `harga` (`id_harga`),
  ADD CONSTRAINT `detail_trtaglis_ibfk_2` FOREIGN KEY (`id_konfirmasi`) REFERENCES `konfirmasi` (`id_konfirmasi`),
  ADD CONSTRAINT `detail_trtaglis_ibfk_3` FOREIGN KEY (`id_transaksi_taglis`) REFERENCES `transaksi_taglis` (`id_transaksi_taglis`),
  ADD CONSTRAINT `detail_trtaglis_ibfk_4` FOREIGN KEY (`kode_voucher`) REFERENCES `voucher` (`kode_voucher`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

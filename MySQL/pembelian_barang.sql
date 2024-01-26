-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 05:57 AM
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
-- Database: `pembelian_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` char(20) NOT NULL,
  `nama_barang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`) VALUES
('89686590036', 'Chiki Balls Cheese 12gr'),
('89686590135', 'Chiki Balls chicken 12gr'),
('89686591231', 'Chiki Balls coklat 12gr');

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` char(20) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `tanggal`) VALUES
('PJ-1801-00001', '2018-01-02'),
('PJ-1801-00002', '2018-01-04'),
('PJ-1801-00003', '2018-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` char(20) NOT NULL,
  `kode_barang` char(20) NOT NULL,
  `id_faktur` char(20) NOT NULL,
  `id_suplier` char(20) NOT NULL,
  `jumlah_satuan` varchar(30) NOT NULL,
  `harga` varchar(30) NOT NULL,
  `subtotal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `kode_barang`, `id_faktur`, `id_suplier`, `jumlah_satuan`, `harga`, `subtotal`) VALUES
('123212321', '89686590036', 'PJ-1801-00002', '1234567890', '1.500.00 Pcs', '937.00', '1.405.500.00'),
('123212322', '89686590135', 'PJ-1801-00002', '1234567890', '500.00 Pcs', '937.00', '468.500.00'),
('123212323', '89686591231', 'PJ-1801-00002', '1234567890', '500.00 Pcs', '937.00', '468.500.00'),
('123212324', '89686590036', 'PJ-1801-00001', '1234567891', '200.00 Pcs', '937.00', '187.400.00'),
('123212325', '89686590135', 'PJ-1801-00001', '1234567891', '200.00 Pcs', '937.00', '187.400.00'),
('123212326', '89686591231', 'PJ-1801-00001', '1234567891', '350.00 Pcs', '937.00', '327.950.00'),
('123212327', '89686590036', 'PJ-1801-00003', '1234567891', '750.00 Pcs', '937.00', '702.750.00'),
('123212328', '89686590135', 'PJ-1801-00003', '1234567891', '600.00 Pcs', '937.00', '562.200.00'),
('123212329', '89686591231', 'PJ-1801-00003', '1234567891', '450.00 Pcs', '937.00', '421.650.00');

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `id_suplier` char(20) NOT NULL,
  `nama_suplier` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`id_suplier`, `nama_suplier`) VALUES
('1234567890', 'CV. Agung Nusantara'),
('1234567891', 'PT. Mega food Lestari');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_suplier` (`id_suplier`),
  ADD KEY `id_faktur` (`id_faktur`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_suplier`) REFERENCES `suplier` (`id_suplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`id_faktur`) REFERENCES `faktur` (`id_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_4` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

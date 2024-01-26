-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2022 at 10:45 AM
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
-- Database: `flowchart_crewink`
--

-- --------------------------------------------------------

--
-- Table structure for table `beranda`
--

CREATE TABLE `beranda` (
  `id_beranda` varchar(30) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_rekomendasi` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_status` int(20) NOT NULL,
  `id_caption` int(20) NOT NULL,
  `id_comment` int(20) NOT NULL,
  `id_like` int(20) NOT NULL,
  `id_share` int(20) NOT NULL,
  `id_save` int(20) NOT NULL,
  `id_buy` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `id_buy` int(20) NOT NULL,
  `total` int(20) NOT NULL,
  `id_pembelian` int(20) NOT NULL,
  `id_pembayaran` int(20) NOT NULL,
  `id_lisensi` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `caption`
--

CREATE TABLE `caption` (
  `id_caption` int(20) NOT NULL,
  `caption` text NOT NULL,
  `id_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(20) NOT NULL,
  `comment` text NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_like` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `edit`
--

CREATE TABLE `edit` (
  `id_edit` int(20) NOT NULL,
  `edit` varchar(30) NOT NULL,
  `id_efek` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id_followers` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

CREATE TABLE `following` (
  `id_following` int(20) NOT NULL,
  `following` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id_income` int(20) NOT NULL,
  `id_tarik` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_transfer` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id_like` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `massages`
--

CREATE TABLE `massages` (
  `id_messages` int(20) NOT NULL,
  `messages` text NOT NULL,
  `id_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` varchar(30) NOT NULL,
  `id_setting` varchar(30) NOT NULL,
  `id_profile` varchar(30) NOT NULL,
  `id_bantuan` varchar(30) NOT NULL,
  `id_messages` text NOT NULL,
  `id_logout` varchar(30) NOT NULL,
  `nama_menu` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu utama`
--

CREATE TABLE `menu utama` (
  `nama_lengkap` varchar(30) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_beranda` varchar(30) NOT NULL,
  `id_trend` varchar(30) NOT NULL,
  `id_search` varchar(100) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_notif` varchar(30) NOT NULL,
  `id_profile` varchar(30) NOT NULL,
  `id_menu` varchar(30) NOT NULL,
  `id_menu_utama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `id_buy` int(20) NOT NULL,
  `id_sell` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE `notif` (
  `id_notif` varchar(30) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_tag` int(20) NOT NULL,
  `id_like` int(20) NOT NULL,
  `id_comment` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id_profile` varchar(30) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_like` int(20) NOT NULL,
  `id_caption` text NOT NULL,
  `id_comment` text NOT NULL,
  `id_save` int(20) NOT NULL,
  `id_following` int(20) NOT NULL,
  `id_followers` int(20) NOT NULL,
  `id_messages` text NOT NULL,
  `id_income` int(20) NOT NULL,
  `id_tarik` int(20) NOT NULL,
  `id_transfer` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi`
--

CREATE TABLE `rekomendasi` (
  `id_rekomendasi` int(20) NOT NULL,
  `id_beranda` varchar(30) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_like` int(20) NOT NULL,
  `id_comment` int(20) NOT NULL,
  `id_caption` int(20) NOT NULL,
  `id_profile` varchar(30) NOT NULL,
  `id_share` int(20) NOT NULL,
  `id_save` int(20) NOT NULL,
  `id_upload` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `save`
--

CREATE TABLE `save` (
  `id_save` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `save` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `id_search` varchar(100) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_profile` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `share`
--

CREATE TABLE `share` (
  `id_share` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sign up`
--

CREATE TABLE `sign up` (
  `nama_lengkap` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(30) NOT NULL,
  `domisili` varchar(30) NOT NULL,
  `negara` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `ulangi_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` varchar(30) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_comment` text NOT NULL,
  `id_like` int(20) NOT NULL,
  `id_messages` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(20) NOT NULL,
  `tag` varchar(30) NOT NULL,
  `id_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tarik`
--

CREATE TABLE `tarik` (
  `id_tarik` int(20) NOT NULL,
  `jumlah_tarik` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_income` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `id_transfer` int(20) NOT NULL,
  `jumlah_transfer` int(20) NOT NULL,
  `id_income` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trend`
--

CREATE TABLE `trend` (
  `id_trend` varchar(30) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_caption` int(20) NOT NULL,
  `id_comment` int(20) NOT NULL,
  `id_like` int(20) NOT NULL,
  `id_share` int(20) NOT NULL,
  `id_save` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id_upload` varchar(30) NOT NULL,
  `id_jenis_upload` varchar(30) NOT NULL,
  `id_ukuran` int(20) NOT NULL,
  `id_caption` int(20) NOT NULL,
  `id_tag` int(20) NOT NULL,
  `id_thumb` int(20) NOT NULL,
  `id_edit` int(20) NOT NULL,
  `id_sell` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(30) NOT NULL,
  `nama_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beranda`
--
ALTER TABLE `beranda`
  ADD PRIMARY KEY (`id_beranda`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id_buy`);

--
-- Indexes for table `caption`
--
ALTER TABLE `caption`
  ADD PRIMARY KEY (`id_caption`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id_followers`);

--
-- Indexes for table `following`
--
ALTER TABLE `following`
  ADD PRIMARY KEY (`id_following`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`password`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `menu utama`
--
ALTER TABLE `menu utama`
  ADD PRIMARY KEY (`id_menu_utama`),
  ADD KEY `id_user` (`id_user`,`id_beranda`,`id_trend`,`id_search`,`id_upload`,`id_notif`,`id_profile`,`id_menu`),
  ADD KEY `username` (`username`),
  ADD KEY `id_search` (`id_search`),
  ADD KEY `id_upload` (`id_upload`),
  ADD KEY `id_trend` (`id_trend`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `id_beranda` (`id_beranda`),
  ADD KEY `id_notif` (`id_notif`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`id_notif`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indexes for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD PRIMARY KEY (`id_rekomendasi`),
  ADD KEY `id_beranda` (`id_beranda`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id_search`);

--
-- Indexes for table `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`id_share`);

--
-- Indexes for table `sign up`
--
ALTER TABLE `sign up`
  ADD PRIMARY KEY (`username`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tarik`
--
ALTER TABLE `tarik`
  ADD PRIMARY KEY (`id_tarik`);

--
-- Indexes for table `trend`
--
ALTER TABLE `trend`
  ADD PRIMARY KEY (`id_trend`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id_upload`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu utama`
--
ALTER TABLE `menu utama`
  ADD CONSTRAINT `menu utama_ibfk_1` FOREIGN KEY (`username`) REFERENCES `sign up` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_2` FOREIGN KEY (`id_search`) REFERENCES `search` (`id_search`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_3` FOREIGN KEY (`id_upload`) REFERENCES `upload` (`id_upload`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_4` FOREIGN KEY (`id_trend`) REFERENCES `trend` (`id_trend`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_5` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_6` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_7` FOREIGN KEY (`id_beranda`) REFERENCES `beranda` (`id_beranda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_8` FOREIGN KEY (`id_notif`) REFERENCES `notif` (`id_notif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu utama_ibfk_9` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD CONSTRAINT `rekomendasi_ibfk_1` FOREIGN KEY (`id_beranda`) REFERENCES `beranda` (`id_beranda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sign up`
--
ALTER TABLE `sign up`
  ADD CONSTRAINT `sign up_ibfk_1` FOREIGN KEY (`password`) REFERENCES `login` (`password`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

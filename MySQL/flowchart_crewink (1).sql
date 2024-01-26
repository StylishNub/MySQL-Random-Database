-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 08:09 AM
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
  `id_messages` int(20) NOT NULL,
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
  `id_comment` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL
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
  `id_caption` int(20) NOT NULL,
  `id_comment` int(20) NOT NULL,
  `id_save` int(20) NOT NULL,
  `id_following` int(20) NOT NULL,
  `id_followers` int(20) NOT NULL,
  `id_messages` int(20) NOT NULL,
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
  `save` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL
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
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `id_sell` int(20) NOT NULL,
  `sell` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_income` int(20) NOT NULL,
  `id_tarik` int(20) NOT NULL,
  `id_transfer` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `share`
--

CREATE TABLE `share` (
  `id_share` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `id_user` varchar(30) NOT NULL
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
  `id_status` int(20) NOT NULL,
  `id_upload` varchar(30) NOT NULL,
  `id_user` varchar(30) NOT NULL,
  `id_comment` int(20) NOT NULL,
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
  ADD KEY `id_upload` (`id_upload`),
  ADD KEY `id_status` (`id_status`,`id_caption`,`id_comment`,`id_like`,`id_share`,`id_save`,`id_buy`),
  ADD KEY `id_buy` (`id_buy`),
  ADD KEY `id_caption` (`id_caption`),
  ADD KEY `id_comment` (`id_comment`),
  ADD KEY `id_like` (`id_like`),
  ADD KEY `id_share` (`id_share`),
  ADD KEY `id_save` (`id_save`);

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id_buy`),
  ADD KEY `total` (`total`,`id_pembelian`,`id_pembayaran`,`id_lisensi`);

--
-- Indexes for table `caption`
--
ALTER TABLE `caption`
  ADD PRIMARY KEY (`id_caption`),
  ADD KEY `caption` (`caption`(768)),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_like` (`id_like`);

--
-- Indexes for table `edit`
--
ALTER TABLE `edit`
  ADD PRIMARY KEY (`id_edit`),
  ADD KEY `id_efek` (`id_efek`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id_followers`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `following`
--
ALTER TABLE `following`
  ADD PRIMARY KEY (`id_following`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id_income`),
  ADD KEY `id_tarik` (`id_tarik`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_transfer` (`id_transfer`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`password`);

--
-- Indexes for table `massages`
--
ALTER TABLE `massages`
  ADD PRIMARY KEY (`id_messages`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `id_setting` (`id_setting`),
  ADD KEY `id_bantuan` (`id_bantuan`),
  ADD KEY `id_messages` (`id_messages`),
  ADD KEY `id_logout` (`id_logout`);

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
  ADD PRIMARY KEY (`id_notif`),
  ADD KEY `id_upload` (`id_upload`),
  ADD KEY `id_tag` (`id_tag`),
  ADD KEY `id_like` (`id_like`),
  ADD KEY `id_comment` (`id_comment`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_upload` (`id_upload`),
  ADD KEY `id_like` (`id_like`),
  ADD KEY `id_caption` (`id_caption`),
  ADD KEY `id_comment` (`id_comment`,`id_save`,`id_following`,`id_followers`,`id_messages`,`id_income`,`id_tarik`,`id_transfer`),
  ADD KEY `id_followers` (`id_followers`),
  ADD KEY `id_following` (`id_following`),
  ADD KEY `id_income` (`id_income`),
  ADD KEY `id_messages` (`id_messages`),
  ADD KEY `id_save` (`id_save`),
  ADD KEY `id_tarik` (`id_tarik`),
  ADD KEY `id_transfer` (`id_transfer`);

--
-- Indexes for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD PRIMARY KEY (`id_rekomendasi`),
  ADD KEY `id_beranda` (`id_beranda`),
  ADD KEY `id_user` (`id_user`,`id_like`,`id_comment`,`id_caption`,`id_profile`,`id_share`,`id_save`,`id_upload`),
  ADD KEY `id_caption` (`id_caption`),
  ADD KEY `id_comment` (`id_comment`),
  ADD KEY `id_like` (`id_like`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `id_save` (`id_save`),
  ADD KEY `id_share` (`id_share`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `save`
--
ALTER TABLE `save`
  ADD PRIMARY KEY (`id_save`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id_search`),
  ADD KEY `id_user` (`id_user`,`id_upload`,`id_profile`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`id_sell`),
  ADD KEY `id_user` (`id_user`,`id_income`,`id_tarik`,`id_transfer`),
  ADD KEY `id_income` (`id_income`),
  ADD KEY `id_tarik` (`id_tarik`),
  ADD KEY `id_transfer` (`id_transfer`);

--
-- Indexes for table `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`id_share`),
  ADD KEY `id_user` (`id_user`);

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
  ADD PRIMARY KEY (`id_status`),
  ADD KEY `id_upload` (`id_upload`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_comment` (`id_comment`),
  ADD KEY `id_like` (`id_like`),
  ADD KEY `id_messages` (`id_messages`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tarik`
--
ALTER TABLE `tarik`
  ADD PRIMARY KEY (`id_tarik`),
  ADD KEY `id_user` (`id_user`,`id_income`),
  ADD KEY `id_income` (`id_income`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id_transfer`),
  ADD KEY `id_income` (`id_income`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `trend`
--
ALTER TABLE `trend`
  ADD PRIMARY KEY (`id_trend`),
  ADD KEY `id_user` (`id_user`,`id_upload`,`id_caption`,`id_comment`,`id_like`,`id_share`,`id_save`),
  ADD KEY `id_caption` (`id_caption`),
  ADD KEY `id_comment` (`id_comment`),
  ADD KEY `id_like` (`id_like`),
  ADD KEY `id_save` (`id_save`),
  ADD KEY `id_share` (`id_share`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id_upload`),
  ADD KEY `id_caption` (`id_caption`,`id_tag`,`id_edit`,`id_sell`),
  ADD KEY `id_edit` (`id_edit`),
  ADD KEY `id_sell` (`id_sell`),
  ADD KEY `id_tag` (`id_tag`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beranda`
--
ALTER TABLE `beranda`
  ADD CONSTRAINT `beranda_ibfk_1` FOREIGN KEY (`id_buy`) REFERENCES `buy` (`id_buy`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beranda_ibfk_2` FOREIGN KEY (`id_caption`) REFERENCES `caption` (`id_caption`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beranda_ibfk_3` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beranda_ibfk_4` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beranda_ibfk_5` FOREIGN KEY (`id_share`) REFERENCES `share` (`id_share`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beranda_ibfk_6` FOREIGN KEY (`id_save`) REFERENCES `save` (`id_save`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beranda_ibfk_7` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `caption`
--
ALTER TABLE `caption`
  ADD CONSTRAINT `caption_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `following`
--
ALTER TABLE `following`
  ADD CONSTRAINT `following_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`id_tarik`) REFERENCES `tarik` (`id_tarik`),
  ADD CONSTRAINT `income_ibfk_2` FOREIGN KEY (`id_transfer`) REFERENCES `transfer` (`id_transfer`),
  ADD CONSTRAINT `income_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `like_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `massages`
--
ALTER TABLE `massages`
  ADD CONSTRAINT `massages_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_messages`) REFERENCES `massages` (`id_messages`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);

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
-- Constraints for table `notif`
--
ALTER TABLE `notif`
  ADD CONSTRAINT `notif_ibfk_1` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notif_ibfk_2` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notif_ibfk_3` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notif_ibfk_4` FOREIGN KEY (`id_upload`) REFERENCES `upload` (`id_upload`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notif_ibfk_5` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_caption`) REFERENCES `caption` (`id_caption`),
  ADD CONSTRAINT `profile_ibfk_10` FOREIGN KEY (`id_transfer`) REFERENCES `transfer` (`id_transfer`),
  ADD CONSTRAINT `profile_ibfk_11` FOREIGN KEY (`id_upload`) REFERENCES `upload` (`id_upload`),
  ADD CONSTRAINT `profile_ibfk_12` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`),
  ADD CONSTRAINT `profile_ibfk_3` FOREIGN KEY (`id_followers`) REFERENCES `followers` (`id_followers`),
  ADD CONSTRAINT `profile_ibfk_4` FOREIGN KEY (`id_following`) REFERENCES `following` (`id_following`),
  ADD CONSTRAINT `profile_ibfk_5` FOREIGN KEY (`id_income`) REFERENCES `income` (`id_income`),
  ADD CONSTRAINT `profile_ibfk_6` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`),
  ADD CONSTRAINT `profile_ibfk_7` FOREIGN KEY (`id_messages`) REFERENCES `massages` (`id_messages`),
  ADD CONSTRAINT `profile_ibfk_8` FOREIGN KEY (`id_save`) REFERENCES `save` (`id_save`),
  ADD CONSTRAINT `profile_ibfk_9` FOREIGN KEY (`id_tarik`) REFERENCES `tarik` (`id_tarik`);

--
-- Constraints for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD CONSTRAINT `rekomendasi_ibfk_1` FOREIGN KEY (`id_beranda`) REFERENCES `beranda` (`id_beranda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekomendasi_ibfk_2` FOREIGN KEY (`id_caption`) REFERENCES `caption` (`id_caption`),
  ADD CONSTRAINT `rekomendasi_ibfk_3` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`),
  ADD CONSTRAINT `rekomendasi_ibfk_4` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`),
  ADD CONSTRAINT `rekomendasi_ibfk_5` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`),
  ADD CONSTRAINT `rekomendasi_ibfk_6` FOREIGN KEY (`id_save`) REFERENCES `save` (`id_save`),
  ADD CONSTRAINT `rekomendasi_ibfk_7` FOREIGN KEY (`id_share`) REFERENCES `share` (`id_share`),
  ADD CONSTRAINT `rekomendasi_ibfk_8` FOREIGN KEY (`id_upload`) REFERENCES `upload` (`id_upload`),
  ADD CONSTRAINT `rekomendasi_ibfk_9` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `save`
--
ALTER TABLE `save`
  ADD CONSTRAINT `save_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `search`
--
ALTER TABLE `search`
  ADD CONSTRAINT `search_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`),
  ADD CONSTRAINT `search_ibfk_2` FOREIGN KEY (`id_upload`) REFERENCES `upload` (`id_upload`),
  ADD CONSTRAINT `search_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`id_income`) REFERENCES `income` (`id_income`),
  ADD CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`id_tarik`) REFERENCES `tarik` (`id_tarik`),
  ADD CONSTRAINT `sell_ibfk_3` FOREIGN KEY (`id_transfer`) REFERENCES `transfer` (`id_transfer`),
  ADD CONSTRAINT `sell_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `sign up`
--
ALTER TABLE `sign up`
  ADD CONSTRAINT `sign up_ibfk_1` FOREIGN KEY (`password`) REFERENCES `login` (`password`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`),
  ADD CONSTRAINT `status_ibfk_2` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`),
  ADD CONSTRAINT `status_ibfk_3` FOREIGN KEY (`id_messages`) REFERENCES `massages` (`id_messages`),
  ADD CONSTRAINT `status_ibfk_4` FOREIGN KEY (`id_upload`) REFERENCES `upload` (`id_upload`);

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `tarik`
--
ALTER TABLE `tarik`
  ADD CONSTRAINT `tarik_ibfk_1` FOREIGN KEY (`id_income`) REFERENCES `income` (`id_income`),
  ADD CONSTRAINT `tarik_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`id_income`) REFERENCES `income` (`id_income`),
  ADD CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `trend`
--
ALTER TABLE `trend`
  ADD CONSTRAINT `trend_ibfk_1` FOREIGN KEY (`id_caption`) REFERENCES `caption` (`id_caption`),
  ADD CONSTRAINT `trend_ibfk_2` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`),
  ADD CONSTRAINT `trend_ibfk_3` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`),
  ADD CONSTRAINT `trend_ibfk_4` FOREIGN KEY (`id_save`) REFERENCES `save` (`id_save`),
  ADD CONSTRAINT `trend_ibfk_5` FOREIGN KEY (`id_share`) REFERENCES `share` (`id_share`),
  ADD CONSTRAINT `trend_ibfk_6` FOREIGN KEY (`id_upload`) REFERENCES `upload` (`id_upload`),
  ADD CONSTRAINT `trend_ibfk_7` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `upload_ibfk_1` FOREIGN KEY (`id_caption`) REFERENCES `caption` (`id_caption`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `upload_ibfk_2` FOREIGN KEY (`id_edit`) REFERENCES `edit` (`id_edit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `upload_ibfk_3` FOREIGN KEY (`id_sell`) REFERENCES `sell` (`id_sell`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `upload_ibfk_4` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

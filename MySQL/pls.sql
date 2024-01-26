-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2023 pada 09.07
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pls`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_balance`
--

CREATE TABLE `admin_balance` (
  `id` int(11) NOT NULL,
  `balance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_balance`
--

INSERT INTO `admin_balance` (`id`, `balance`) VALUES
(1, '9705000.00');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `dlt`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `dlt` (
`nama` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pulsa_price`
--

CREATE TABLE `pulsa_price` (
  `id` int(11) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pulsa_price`
--

INSERT INTO `pulsa_price` (`id`, `provider`, `price`) VALUES
(1, 'Telkomsel', '10000.00'),
(2, 'XL', '12000.00'),
(3, 'Indosat', '8000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `saldo_user`
--

CREATE TABLE `saldo_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `saldo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `saldo_user`
--

INSERT INTO `saldo_user` (`id`, `user_id`, `saldo`) VALUES
(1, 1, '-20000.00'),
(2, 2, '242000.00'),
(3, 3, '0.00'),
(4, 4, '20000.00'),
(5, 5, '40000.00'),
(6, 6, '0.00'),
(7, 7, '0.00'),
(8, 8, '92000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `topup`
--

CREATE TABLE `topup` (
  `id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `topup`
--

INSERT INTO `topup` (`id`, `price`) VALUES
(1, '20000.00'),
(2, '50000.00'),
(3, '100000.00'),
(4, '500000.00'),
(5, '1000000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `no_hp` varchar(25) NOT NULL,
  `pulsa_id` int(11) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `user_id`, `no_hp`, `pulsa_id`, `tanggal_transaksi`, `jumlah`) VALUES
(9, 5, '0882009074648', 1, '2023-06-18', '10000.00'),
(10, 8, '08823742392', 3, '2023-06-18', '8000.00');

--
-- Trigger `transaksi`
--
DELIMITER $$
CREATE TRIGGER `reduce_saldo_user` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
    DECLARE pulsa_price DECIMAL(10, 2);
    DECLARE saldo_user DECIMAL(10, 2);

    -- Mendapatkan jumlah top-up dari tabel topup berdasarkan user_id di topup
    SELECT price INTO pulsa_price FROM pulsa_price WHERE id = NEW.pulsa_id;

    -- Mendapatkan saldo admin dari tabel admin_balance
    SELECT saldo INTO saldo_user FROM saldo_user WHERE id = NEW.user_id; -- Ganti '1' dengan ID admin yang sesuai

    -- Mengupdate saldo admin dengan mengurangi jumlah top-up dari saldo admin yang ada
     UPDATE saldo_user SET saldo = saldo - pulsa_price WHERE user_id = NEW.user_id; -- Ganti '1' dengan ID admin yang sesuai
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_admin_balance` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
    DECLARE pulsa_price DECIMAL(10, 2);
    DECLARE admin_balance DECIMAL(10, 2);

    -- Mendapatkan harga pulsa dari tabel pulsa_price berdasarkan pulsa_id di transaksi
    SELECT price INTO pulsa_price FROM pulsa_price WHERE id = NEW.pulsa_id;

    -- Mendapatkan saldo admin dari tabel admin_balance
    SELECT balance INTO admin_balance FROM admin_balance WHERE id = 1; -- Ganti '1' dengan ID admin yang sesuai

    -- Mengupdate saldo admin dengan menambahkan harga pulsa yang baru dibeli
    UPDATE admin_balance SET balance = admin_balance + pulsa_price WHERE id = 1; -- Ganti '1' dengan ID admin yang sesuai
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_topup`
--

CREATE TABLE `transaksi_topup` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `topup_id` int(11) DEFAULT NULL,
  `tanggal_topup` date DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_topup`
--

INSERT INTO `transaksi_topup` (`id`, `user_id`, `topup_id`, `tanggal_topup`, `jumlah`) VALUES
(9, 8, 3, '2023-06-18', '100000.00');

--
-- Trigger `transaksi_topup`
--
DELIMITER $$
CREATE TRIGGER `reduce_admin_balance` AFTER INSERT ON `transaksi_topup` FOR EACH ROW BEGIN
    DECLARE topup DECIMAL(10, 2);
    DECLARE admin_balance DECIMAL(10, 2);

    -- Mendapatkan jumlah top-up dari tabel topup berdasarkan user_id di topup
    SELECT price INTO topup FROM topup WHERE id = NEW.topup_id;

    -- Mendapatkan saldo admin dari tabel admin_balance
    SELECT balance INTO admin_balance FROM admin_balance WHERE id = 1; -- Ganti '1' dengan ID admin yang sesuai

    -- Mengupdate saldo admin dengan mengurangi jumlah top-up dari saldo admin yang ada
    UPDATE admin_balance SET balance = admin_balance - topup WHERE id = 1; -- Ganti '1' dengan ID admin yang sesuai
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_saldo_user` AFTER INSERT ON `transaksi_topup` FOR EACH ROW BEGIN
    DECLARE topup DECIMAL(10, 2);
    DECLARE saldo_user DECIMAL(10, 2);

    -- Mendapatkan harga pulsa dari tabel pulsa_price berdasarkan pulsa_id di transaksi
    SELECT price INTO topup FROM topup WHERE id = NEW.topup_id;

    -- Mendapatkan saldo admin dari tabel admin_balance
    SELECT saldo INTO saldo_user FROM saldo_user WHERE id = New.user_id; -- Ganti '1' dengan ID admin yang sesuai

    -- Mengupdate saldo admin dengan menambahkan harga pulsa yang baru dibeli
    UPDATE saldo_user SET saldo = saldo + topup WHERE user_id = new.user_id; -- Ganti '1' dengan ID admin yang sesuai
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `no_hp` varchar(25) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `no_hp`, `tanggal_lahir`, `alamat`) VALUES
(1, 'kerub', 'ubs@gmail', 'serafim', '088937423', '2023-06-02', 'Jalan - Jalan'),
(2, 'ker', 'aa', 'aa', '9283719', '2023-06-02', 'lalala'),
(3, 'admin', 'admin', 'admin', '1111', '2023-06-01', 'jalan'),
(4, 'bb', 'bb', 'bb', '08890475829', '2023-06-22', 'jalan kaki'),
(5, 'Kerubim Serafim M', 'kerubim@gmail.com', 'sera', '082009074648', '2003-11-17', 'Jalan jalan'),
(6, 'Serafim Mahanaim', 'serafim@gmail.com', 'serafim', '0882009074647', '2003-11-17', 'Jalan Kaki nomor 7'),
(7, 'Mahanaim Serafim', 'mahanaim@gmail.com', 'serafim', '0882009074643', '2003-11-17', 'Jalan La sucipto'),
(8, 'Kerubim Mahanaim', 'ubimker@gmail.com', 'serafim', '0882009074641', '2003-11-17', 'Jalan Veteran');

--
-- Trigger `users`
--
DELIMITER $$
CREATE TRIGGER `create_saldo_user` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO saldo_user (user_id, saldo)
    VALUES (NEW.id, 0);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_saldo_user` AFTER DELETE ON `users` FOR EACH ROW BEGIN
    DELETE FROM saldo_user
    WHERE user_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur untuk view `dlt`
--
DROP TABLE IF EXISTS `dlt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dlt`  AS SELECT `users`.`nama` AS `nama` FROM (`transaksi_topup` join `users` on(`users`.`id` = `transaksi_topup`.`user_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_balance`
--
ALTER TABLE `admin_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pulsa_price`
--
ALTER TABLE `pulsa_price`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `saldo_user`
--
ALTER TABLE `saldo_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `topup`
--
ALTER TABLE `topup`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pulsa_id` (`pulsa_id`);

--
-- Indeks untuk tabel `transaksi_topup`
--
ALTER TABLE `transaksi_topup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `topup_id` (`topup_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `saldo_user`
--
ALTER TABLE `saldo_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `topup`
--
ALTER TABLE `topup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi_topup`
--
ALTER TABLE `transaksi_topup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `saldo_user`
--
ALTER TABLE `saldo_user`
  ADD CONSTRAINT `saldo_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`pulsa_id`) REFERENCES `pulsa_price` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi_topup`
--
ALTER TABLE `transaksi_topup`
  ADD CONSTRAINT `transaksi_topup_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transaksi_topup_ibfk_2` FOREIGN KEY (`topup_id`) REFERENCES `topup` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

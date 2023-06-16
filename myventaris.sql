-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2023 pada 06.23
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myventaris`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_data_barang`
--

CREATE TABLE `d_data_barang` (
  `id_inventaris` varchar(250) NOT NULL,
  `price` int(250) NOT NULL,
  `jumlah_barang` varchar(250) NOT NULL,
  `kondisi` varchar(250) NOT NULL,
  `id_jenis` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `d_data_barang`
--

INSERT INTO `d_data_barang` (`id_inventaris`, `price`, `jumlah_barang`, `kondisi`, `id_jenis`) VALUES
('W0001', 1234, '1000', 'Layak', 'JB0002'),
('W0002', 270000, '50', 'Rusak', 'JB0002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_data_barang_edit`
--

CREATE TABLE `d_data_barang_edit` (
  `id_inventaris` varchar(25) NOT NULL,
  `id_jenis` varchar(50) NOT NULL,
  `price` varchar(100) NOT NULL,
  `jumlah_barang` varchar(150) NOT NULL,
  `kondisi` varchar(25) NOT NULL,
  `reason` text DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `user_act` varchar(25) NOT NULL,
  `log_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_jenis_barang`
--

CREATE TABLE `d_jenis_barang` (
  `id_jenis` varchar(250) NOT NULL,
  `jenis_barang` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `d_jenis_barang`
--

INSERT INTO `d_jenis_barang` (`id_jenis`, `jenis_barang`) VALUES
('JB0002', 'Meja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_jenis_barang_edit`
--

CREATE TABLE `d_jenis_barang_edit` (
  `id_jenis` varchar(25) NOT NULL,
  `jenis_barang` varchar(250) NOT NULL,
  `reason` text DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `user_act` varchar(25) NOT NULL,
  `log_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `d_jenis_barang_edit`
--

INSERT INTO `d_jenis_barang_edit` (`id_jenis`, `jenis_barang`, `reason`, `type`, `user_act`, `log_time`) VALUES
('JB0001', 'Kursi', 'ya', 'delete', '', '2023-06-15 23:35:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_level`
--

CREATE TABLE `m_level` (
  `level_id` varchar(25) NOT NULL,
  `level_name` varchar(30) NOT NULL,
  `status_delete` int(1) NOT NULL,
  `entry_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL,
  `passcode` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_level`
--

INSERT INTO `m_level` (`level_id`, `level_name`, `status_delete`, `entry_date`, `update_date`, `passcode`) VALUES
('L001', 'Admin', 0, '2023-04-03 10:14:22', '0000-00-00 00:00:00', NULL),
('L002', 'User', 0, '2023-05-04 10:14:22', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_menu_child`
--

CREATE TABLE `m_menu_child` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `menu_name_eng` varchar(25) NOT NULL,
  `menu_header_id` int(11) NOT NULL,
  `file_php` varchar(100) NOT NULL,
  `token_csrf` varchar(250) NOT NULL,
  `sort` int(11) NOT NULL,
  `passcode` varchar(25) NOT NULL DEFAULT '',
  `data` int(1) NOT NULL DEFAULT 1,
  `add` int(1) NOT NULL DEFAULT 1,
  `view` int(1) NOT NULL DEFAULT 1,
  `edit` int(1) NOT NULL DEFAULT 1,
  `delete` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_menu_child`
--

INSERT INTO `m_menu_child` (`menu_id`, `menu_name`, `menu_name_eng`, `menu_header_id`, `file_php`, `token_csrf`, `sort`, `passcode`, `data`, `add`, `view`, `edit`, `delete`) VALUES
(1, 'Data Barang Kelas', '', 1, 'd_data_barang_kelas.php', '', 2, '', 1, 1, 1, 1, 1),
(2, 'Jenis Barang', '', 1, 'd_jenis_barang.php', '', 8, '', 1, 1, 1, 1, 1),
(3, 'User', '', 2, 'm_user.php', '', 8, '', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_menu_header`
--

CREATE TABLE `m_menu_header` (
  `menu_header_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `class_icon` varchar(40) NOT NULL,
  `menu_header_name` varchar(50) NOT NULL,
  `menu_header_name_eng` varchar(25) NOT NULL,
  `sort` int(3) NOT NULL,
  `passcode` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_menu_header`
--

INSERT INTO `m_menu_header` (`menu_header_id`, `id`, `class_icon`, `menu_header_name`, `menu_header_name_eng`, `sort`, `passcode`) VALUES
(1, 1, 'fa fa-eye', 'Data Barang', '', 1, NULL),
(2, 2, 'fa fa-database', 'Master', '', 2, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_menu_level`
--

CREATE TABLE `m_menu_level` (
  `id_arr` int(11) NOT NULL,
  `level_id` varchar(25) NOT NULL,
  `menu_header_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `view` int(3) NOT NULL,
  `edit` int(3) NOT NULL,
  `del` int(3) NOT NULL,
  `adddata` int(11) NOT NULL,
  `passcode` varchar(25) DEFAULT NULL,
  `base_price` int(1) NOT NULL,
  `net_price` int(1) NOT NULL,
  `sell_price` int(1) NOT NULL,
  `branch_price` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_menu_level`
--

INSERT INTO `m_menu_level` (`id_arr`, `level_id`, `menu_header_id`, `menu_id`, `view`, `edit`, `del`, `adddata`, `passcode`, `base_price`, `net_price`, `sell_price`, `branch_price`) VALUES
(1, 'L001', 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0),
(2, 'L001', 1, 2, 0, 0, 0, 0, NULL, 0, 0, 0, 0),
(3, 'L001', 2, 3, 0, 0, 0, 0, NULL, 0, 0, 0, 0),
(4, 'L002', 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0),
(5, 'L002', 1, 2, 0, 0, 0, 0, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_menu_level_dashboard`
--

CREATE TABLE `m_menu_level_dashboard` (
  `id_arr` int(11) NOT NULL,
  `sort` varchar(25) DEFAULT NULL,
  `level_id` varchar(25) NOT NULL,
  `dashboard_id` int(11) NOT NULL,
  `view` int(3) NOT NULL,
  `passcode` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `id_user` varchar(25) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `level_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`id_user`, `username`, `password`, `full_name`, `level_id`) VALUES
('U0002', 'admin', 'eDFzeEhFellSVFJObmJtV3lUN3dtZz09', 'admin', 'L001'),
('U0004', 'witch', 'emsydE15S1dpMy9HNEp1Tnk5WTJ0UT09', 'hey', 'L002'),
('U0005', 'axd', 'OVVIYW5NaXMraEJJSWIxUjF3ZHBZUT09', 'Muhammad Alexander ', 'L002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user_edit`
--

CREATE TABLE `m_user_edit` (
  `id_user` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `level` varchar(250) NOT NULL,
  `reason` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  `user_act` varchar(250) NOT NULL,
  `log_time` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_user_edit`
--

INSERT INTO `m_user_edit` (`id_user`, `username`, `full_name`, `password`, `level`, `reason`, `type`, `user_act`, `log_time`) VALUES
('U0004', 'mau', 'maulana', 'ejljR1ZvQnJVaGozbWgrbzg2dGVFUT09', 'L002', 'ya', 'delete', 'U0002', '2023-05-09 09:09:49');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `d_data_barang`
--
ALTER TABLE `d_data_barang`
  ADD PRIMARY KEY (`id_inventaris`);

--
-- Indeks untuk tabel `d_data_barang_edit`
--
ALTER TABLE `d_data_barang_edit`
  ADD PRIMARY KEY (`id_inventaris`);

--
-- Indeks untuk tabel `d_jenis_barang`
--
ALTER TABLE `d_jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `d_jenis_barang_edit`
--
ALTER TABLE `d_jenis_barang_edit`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `m_level`
--
ALTER TABLE `m_level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indeks untuk tabel `m_menu_child`
--
ALTER TABLE `m_menu_child`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indeks untuk tabel `m_menu_header`
--
ALTER TABLE `m_menu_header`
  ADD PRIMARY KEY (`menu_header_id`);

--
-- Indeks untuk tabel `m_menu_level`
--
ALTER TABLE `m_menu_level`
  ADD PRIMARY KEY (`id_arr`);

--
-- Indeks untuk tabel `m_menu_level_dashboard`
--
ALTER TABLE `m_menu_level_dashboard`
  ADD PRIMARY KEY (`id_arr`);

--
-- Indeks untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `m_user_edit`
--
ALTER TABLE `m_user_edit`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_menu_child`
--
ALTER TABLE `m_menu_child`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT untuk tabel `m_menu_header`
--
ALTER TABLE `m_menu_header`
  MODIFY `menu_header_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `m_menu_level`
--
ALTER TABLE `m_menu_level`
  MODIFY `id_arr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32520;

--
-- AUTO_INCREMENT untuk tabel `m_menu_level_dashboard`
--
ALTER TABLE `m_menu_level_dashboard`
  MODIFY `id_arr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5206;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

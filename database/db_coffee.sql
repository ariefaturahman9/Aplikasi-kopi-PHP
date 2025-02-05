-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 12:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_coffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `nama_level`) VALUES
(1, 'Administrator'),
(2, 'Waiter'),
(3, 'Kasir'),
(4, 'Owner'),
(5, 'Pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(150) NOT NULL,
  `harga` varchar(150) NOT NULL,
  `stok` int(11) NOT NULL,
  `status_masakan` varchar(150) NOT NULL,
  `gambar_masakan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`id_masakan`, `nama_masakan`, `harga`, `stok`, `status_masakan`, `gambar_masakan`) VALUES
(25, 'Vanila Latte', '16000', 12, 'tersedia', 'Vanila Latte.jpeg'),
(36, 'French Fries', '10000', -2, 'tersedia', 'French Fries.jpeg'),
(38, 'Lemon Pie', '13000', 10, 'tersedia', 'Lemon Pie.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `waktu_pesan` datetime NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_harga` varchar(150) NOT NULL,
  `uang_bayar` varchar(150) DEFAULT NULL,
  `uang_kembali` varchar(150) DEFAULT NULL,
  `status_order` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `id_admin`, `id_pengunjung`, `waktu_pesan`, `no_meja`, `total_harga`, `uang_bayar`, `uang_kembali`, `status_order`) VALUES
(30, 113, 113, '2023-12-19 20:43:05', 5, '195000', '200000', '5000', 'sudah bayar'),
(31, 105, 103, '2023-12-19 20:45:22', 5, '48000', '60000', '12000', 'sudah bayar'),
(32, 105, 109, '2023-12-19 20:45:56', 5, '65000', '70000', '5000', 'sudah bayar'),
(33, 105, 107, '2023-12-19 20:46:39', 4, '54000', '60000', '6000', 'sudah bayar'),
(40, 105, 105, '2023-12-22 15:16:52', 6, '105000', '120000', '15000', 'sudah bayar'),
(41, 113, 104, '2025-02-04 23:39:01', 7, '125000', '150000', '25000', 'sudah bayar');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_masakan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status_pesan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `id_user`, `id_order`, `id_masakan`, `jumlah`, `status_pesan`) VALUES
(63, 113, 30, 32, 15, 'sudah'),
(64, 103, 31, 25, 3, 'sudah'),
(65, 109, 32, 23, 5, 'sudah'),
(66, 107, 33, 20, 4, 'sudah'),
(67, 107, 33, 22, 1, 'sudah'),
(84, 105, 40, 38, 5, 'sudah'),
(85, 105, 40, 36, 4, 'sudah'),
(86, 105, 0, 38, 0, ''),
(87, 105, 0, 36, 0, ''),
(88, 104, 41, 38, 5, 'sudah'),
(89, 104, 41, 36, 6, 'sudah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `status_cetak` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `id_pesan`, `jumlah_terjual`, `status_cetak`) VALUES
(1, 46, 1, 'belum cetak'),
(2, 47, 2, 'belum cetak'),
(3, 48, 2, 'belum cetak'),
(4, 49, 1, 'belum cetak'),
(5, 50, 2, 'belum cetak'),
(6, 51, 0, 'belum cetak'),
(7, 52, 8, 'belum cetak'),
(8, 53, 0, 'belum cetak'),
(9, 54, 0, 'belum cetak'),
(10, 55, 3, 'belum cetak'),
(11, 56, 0, 'belum cetak'),
(12, 57, 2, 'belum cetak'),
(13, 58, 2, 'belum cetak'),
(14, 59, 4, 'belum cetak'),
(15, 60, 5, 'belum cetak'),
(16, 61, 5, 'belum cetak'),
(17, 62, 2, 'belum cetak'),
(18, 63, 15, 'belum cetak'),
(19, 64, 3, 'belum cetak'),
(20, 65, 5, 'belum cetak'),
(21, 66, 4, 'belum cetak'),
(22, 67, 1, 'belum cetak'),
(23, 68, 4, 'belum cetak'),
(24, 69, 0, 'belum cetak'),
(25, 70, 0, 'belum cetak'),
(26, 71, 0, 'belum cetak'),
(27, 72, 5, 'belum cetak'),
(28, 73, 1, 'belum cetak'),
(29, 74, 0, 'belum cetak'),
(30, 75, 1, 'belum cetak'),
(31, 76, 2, 'belum cetak'),
(32, 77, 3, 'belum cetak'),
(33, 78, 0, 'belum cetak'),
(34, 79, 1, 'belum cetak'),
(35, 80, 1, 'belum cetak'),
(36, 81, 2, 'belum cetak'),
(37, 82, 3, 'belum cetak'),
(38, 83, 1, 'belum cetak'),
(39, 84, 5, 'belum cetak'),
(40, 85, 4, 'belum cetak'),
(41, 86, 0, 'belum cetak'),
(42, 87, 0, 'belum cetak'),
(43, 88, 5, 'belum cetak'),
(44, 89, 6, 'belum cetak');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_level` int(11) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_user`, `id_level`, `status`) VALUES
(103, 'faqih', '123', 'Faqihhuddin Sholeh', 2, 'aktif'),
(104, 'pelanggan', '123', 'Pelanggan', 5, 'aktif'),
(105, 'fadd', '123', 'Fadhilah Ruhiyah', 1, 'aktif'),
(107, 'danu', '123', 'Danu Sulaeman', 2, 'aktif'),
(108, 'haris', '123', 'Haris Iskandar', 2, 'aktif'),
(109, 'amal', '123', 'Amaliyah Riskiyani', 2, 'aktif'),
(112, 'fadhil', '123', 'Fadhilah Ruhiyah', 4, 'aktif'),
(113, 'ikbal', '123', 'Ikbal Priyaguna ', 3, 'aktif'),
(120, 'arie', '123', 'arie', 4, 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_pengunjung` (`id_pengunjung`);

--
-- Indexes for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id_masakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

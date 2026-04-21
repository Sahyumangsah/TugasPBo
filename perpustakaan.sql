-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 21, 2026 at 03:27 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabelbuku`
--

CREATE TABLE `tabelbuku` (
  `KodeBuku` varchar(10) NOT NULL,
  `JudulBuku` varchar(100) NOT NULL,
  `Penerbit` varchar(50) DEFAULT NULL,
  `Pengarang` varchar(50) DEFAULT NULL,
  `TahunTerbit` int DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `Stok` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelbuku`
--

INSERT INTO `tabelbuku` (`KodeBuku`, `JudulBuku`, `Penerbit`, `Pengarang`, `TahunTerbit`, `kategori`, `Stok`) VALUES
('BK001', 'Belajar Laravel 10', 'Informatika', 'Eko Kurniawan', 2023, 'Pemrograman', 10),
('BK002', 'Dasar Java Swing', 'Erlangga', 'Bambang Sudarsono', 2021, 'Desktop', 5),
('BK003', 'Manajemen Basis Data', 'Andi Offset', 'Indra Permana', 2022, 'Database', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tabelkembali`
--

CREATE TABLE `tabelkembali` (
  `no_kembali` varchar(20) NOT NULL,
  `no_pinjam` varchar(20) DEFAULT NULL,
  `tgl_dikembalikan` date NOT NULL,
  `denda` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelkembali`
--

INSERT INTO `tabelkembali` (`no_kembali`, `no_pinjam`, `tgl_dikembalikan`, `denda`) VALUES
('KB-59107', 'PJ-35449', '2026-04-21', 0),
('KB-67996', 'PJ-50976', '2026-04-21', 0),
('KB-93525', 'PJ-85209', '2026-04-21', 20000),
('KM001', 'PJ001', '2026-04-16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tabelpinjam`
--

CREATE TABLE `tabelpinjam` (
  `no_pinjam` varchar(20) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `id_siswa` varchar(20) DEFAULT NULL,
  `kode_buku` varchar(10) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelpinjam`
--

INSERT INTO `tabelpinjam` (`no_pinjam`, `tgl_pinjam`, `tgl_kembali`, `id_siswa`, `kode_buku`, `jumlah`, `status`) VALUES
('PJ-35449', '2026-04-21', '2026-04-28', '1234', 'BK001', 1, 'Kembali'),
('PJ-50976', '2026-04-21', '2026-04-28', '1234', 'BK003', 1, 'Kembali'),
('PJ-517', '2026-04-10', '2026-04-11', '1234', 'BK003', 1, 'Dipinjam'),
('PJ-85209', '2026-04-10', '2026-04-11', '1234', 'BK001', 1, 'Kembali'),
('PJ001', '2026-04-10', '2026-04-17', '2024001', 'BK001', 1, 'Dipinjam'),
('PJ002', '2026-04-12', '2026-04-19', '2024002', 'BK002', 1, 'Dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `tabelsiswa`
--

CREATE TABLE `tabelsiswa` (
  `id` bigint UNSIGNED NOT NULL,
  `nis` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tempat_lahir` varchar(15) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `jurusan` varchar(15) DEFAULT NULL,
  `kelas` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelsiswa`
--

INSERT INTO `tabelsiswa` (`id`, `nis`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `jurusan`, `kelas`, `created_at`, `updated_at`) VALUES
(1, '2024001', 'Andi Saputra', 'Jakarta', '2008-05-15', 'Laki-laki', 'RPL', 'XII RPL 1', NULL, NULL),
(2, '2024002', 'Bunga Citra', 'Bandung', '2008-08-20', 'Perempuan', 'TKJ', 'XI TKJ 2', NULL, NULL),
(3, '2024003', 'Chandra Wijaya', 'Surabaya', '2009-01-10', 'Laki-laki', 'RPL', 'X RPL 3', NULL, NULL),
(4, '1234', 'sahyu', 'Jakarta', '2008-05-15', 'Laki-laki', 'RPL', 'XII RPL 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `kode_buku` varchar(10) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('Dipinjam','Dikembalikan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `username`, `kode_buku`, `tanggal_pinjam`, `tanggal_kembali`, `status`) VALUES
(1, 'siswa01', 'BK001', '2026-04-10', '2026-04-16', 'Dikembalikan'),
(2, 'admin1', 'BK002', '2026-04-12', '2026-04-19', 'Dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `level` enum('Admin','Petugas','Siswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama`, `level`) VALUES
(1, 'admin1', 'password123', 'Budi Admin', 'Admin'),
(2, 'petugas2', 'petugas456', 'Siti Petugas', 'Petugas'),
(3, 'siswa01', 'siswa789', 'Andi Siswa', 'Siswa'),
(4, 'sahyu', 'sahu', 'sahyu', 'Siswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabelbuku`
--
ALTER TABLE `tabelbuku`
  ADD PRIMARY KEY (`KodeBuku`);

--
-- Indexes for table `tabelkembali`
--
ALTER TABLE `tabelkembali`
  ADD PRIMARY KEY (`no_kembali`),
  ADD KEY `fk_pinjam_kembali` (`no_pinjam`);

--
-- Indexes for table `tabelpinjam`
--
ALTER TABLE `tabelpinjam`
  ADD PRIMARY KEY (`no_pinjam`),
  ADD KEY `fk_buku_pinjam` (`kode_buku`);

--
-- Indexes for table `tabelsiswa`
--
ALTER TABLE `tabelsiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_buku_transaksi` (`kode_buku`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabelsiswa`
--
ALTER TABLE `tabelsiswa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabelkembali`
--
ALTER TABLE `tabelkembali`
  ADD CONSTRAINT `fk_pinjam_kembali` FOREIGN KEY (`no_pinjam`) REFERENCES `tabelpinjam` (`no_pinjam`);

--
-- Constraints for table `tabelpinjam`
--
ALTER TABLE `tabelpinjam`
  ADD CONSTRAINT `fk_buku_pinjam` FOREIGN KEY (`kode_buku`) REFERENCES `tabelbuku` (`KodeBuku`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_buku_transaksi` FOREIGN KEY (`kode_buku`) REFERENCES `tabelbuku` (`KodeBuku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

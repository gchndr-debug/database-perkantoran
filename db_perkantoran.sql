-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2026 at 03:08 AM
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
-- Database: `db_perkantoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `Id_dept` varchar(10) NOT NULL,
  `Nama_dept` varchar(50) NOT NULL,
  `Lokasi_lantai` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`Id_dept`, `Nama_dept`, `Lokasi_lantai`) VALUES
('D01', 'IT & Jaringan', 'Lantai 3'),
('D02', 'Keuangan', 'Lantai 2'),
('D03', 'Pemasaran', 'Lantai 1');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `Id_jabatan` varchar(10) NOT NULL,
  `Nama_jabatan` varchar(50) NOT NULL,
  `Gaji_pokok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`Id_jabatan`, `Nama_jabatan`, `Gaji_pokok`) VALUES
('J01', 'Manager', 8500000),
('J02', 'Staff', 5000000),
('J03', 'Teknisi', 5500000);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `NIP` varchar(20) NOT NULL,
  `Nama_karyawan` varchar(100) NOT NULL,
  `Jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `Tanggal_masuk` date NOT NULL,
  `Id_dept` varchar(10) DEFAULT NULL,
  `Id_jabatan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`NIP`, `Nama_karyawan`, `Jenis_kelamin`, `Tanggal_masuk`, `Id_dept`, `Id_jabatan`) VALUES
('2026001', 'Givsi Junior Messi', 'Laki-laki', '2025-01-30', 'D01', 'J03'),
('2026002', 'Stevie Senior ', 'Perempuan', '2023-06-10', 'D02', 'J01'),
('2026003', 'Chelsea Aminah Samsul ', 'Laki-laki', '2026-02-28', 'D01', 'J03');

-- --------------------------------------------------------

--
-- Table structure for table `penugasan`
--

CREATE TABLE `penugasan` (
  `Id_tugas` varchar(10) NOT NULL,
  `NIP` varchar(20) DEFAULT NULL,
  `Id_proyek` varchar(10) DEFAULT NULL,
  `Peran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penugasan`
--

INSERT INTO `penugasan` (`Id_tugas`, `NIP`, `Id_proyek`, `Peran`) VALUES
('T01', '2026001', 'P01', 'Koordinator Jaringan'),
('T02', '2026002', 'P02', 'Ketua Tim Audit');

-- --------------------------------------------------------

--
-- Table structure for table `proyek`
--

CREATE TABLE `proyek` (
  `Id_proyek` varchar(10) NOT NULL,
  `Nama_proyek` varchar(100) NOT NULL,
  `Status` enum('Perencanaan','Berjalan','Selesai','Ditunda') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proyek`
--

INSERT INTO `proyek` (`Id_proyek`, `Nama_proyek`, `Status`) VALUES
('P01', 'Instalasi Server Kantor', 'Berjalan'),
('P02', 'Audit Keuangan Tahunan', 'Perencanaan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`Id_dept`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`Id_jabatan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `Id_dept` (`Id_dept`),
  ADD KEY `Id_jabatan` (`Id_jabatan`);

--
-- Indexes for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD PRIMARY KEY (`Id_tugas`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `Id_proyek` (`Id_proyek`);

--
-- Indexes for table `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`Id_proyek`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`Id_dept`) REFERENCES `departemen` (`Id_dept`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`Id_jabatan`) REFERENCES `jabatan` (`Id_jabatan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD CONSTRAINT `penugasan_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `karyawan` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penugasan_ibfk_2` FOREIGN KEY (`Id_proyek`) REFERENCES `proyek` (`Id_proyek`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

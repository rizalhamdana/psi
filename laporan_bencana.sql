-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2018 at 03:17 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laporan_bencana`
--

-- --------------------------------------------------------

--
-- Table structure for table `bencana`
--

CREATE TABLE `bencana` (
  `id_bencana` int(11) NOT NULL,
  `nama_bencana` int(11) NOT NULL,
  `tanggal_bencana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kerusakan`
--

CREATE TABLE `kerusakan` (
  `id_kerusakan` int(11) NOT NULL,
  `jenis_kerusakan` int(11) NOT NULL,
  `objek_kerusakan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kerusakanspesifikasi`
--

CREATE TABLE `kerusakanspesifikasi` (
  `id_spesifikasi` int(11) NOT NULL,
  `id_kerusakan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_pengguna` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `id_bencana` int(11) NOT NULL,
  `id_kerusakan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `nama_pengguna` int(11) NOT NULL,
  `status_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `spesifikasi`
--

CREATE TABLE `spesifikasi` (
  `id_spesifikasi` int(11) NOT NULL,
  `nama_spesifikasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `id_wilayah` int(11) NOT NULL,
  `nama_wilayah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bencana`
--
ALTER TABLE `bencana`
  ADD PRIMARY KEY (`id_bencana`);

--
-- Indexes for table `kerusakan`
--
ALTER TABLE `kerusakan`
  ADD PRIMARY KEY (`id_kerusakan`);

--
-- Indexes for table `kerusakanspesifikasi`
--
ALTER TABLE `kerusakanspesifikasi`
  ADD KEY `id_spesifikasi` (`id_spesifikasi`),
  ADD KEY `id_kerusakan` (`id_kerusakan`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_wilayah` (`id_wilayah`),
  ADD KEY `id_bencana` (`id_bencana`),
  ADD KEY `id_kerusakan` (`id_kerusakan`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `spesifikasi`
--
ALTER TABLE `spesifikasi`
  ADD PRIMARY KEY (`id_spesifikasi`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id_wilayah`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kerusakanspesifikasi`
--
ALTER TABLE `kerusakanspesifikasi`
  ADD CONSTRAINT `kerusakanspesifikasi_ibfk_1` FOREIGN KEY (`id_spesifikasi`) REFERENCES `spesifikasi` (`id_spesifikasi`),
  ADD CONSTRAINT `kerusakanspesifikasi_ibfk_2` FOREIGN KEY (`id_kerusakan`) REFERENCES `kerusakan` (`id_kerusakan`);

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id_wilayah`),
  ADD CONSTRAINT `laporan_ibfk_3` FOREIGN KEY (`id_bencana`) REFERENCES `bencana` (`id_bencana`),
  ADD CONSTRAINT `laporan_ibfk_4` FOREIGN KEY (`id_kerusakan`) REFERENCES `kerusakan` (`id_kerusakan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

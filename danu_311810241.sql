-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2021 at 03:08 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `danu_311810241`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga_satuan`, `stok`) VALUES
(143018, 'AMDK CLUB 330 ML', 29000, 100),
(143019, 'AMDK CLUB 600 ML', 31500, 100),
(143020, 'AMDK CLUB1500 ML', 32000, 100),
(158826, 'AMDK CLUB 220 ML', 17800, 100);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `kode_salesman` int(11) NOT NULL,
  `kode_cust` int(11) NOT NULL,
  `nama_cust` varchar(50) NOT NULL,
  `alamat_cust` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`kode_salesman`, `kode_cust`, `nama_cust`, `alamat_cust`) VALUES
(745, 11855, 'TOKO SIMAUNG', 'PASIR JENGKOL RT 18/18 MAJALAYA KARAWANG'),
(746, 11856, 'TOKO BERKAH', 'JL TUPAREV KARAWANGPAWITAN KARAWANG'),
(744, 11857, 'TOKO 256', 'JL PARAHIYANGAN ADIARSA KARAWANG');

-- --------------------------------------------------------

--
-- Table structure for table `distribusi`
--

CREATE TABLE `distribusi` (
  `no_faktur` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `kode_cust` int(11) NOT NULL,
  `kode_salesman` int(11) NOT NULL,
  `tgl_distribusi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jmlh_barang` smallint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribusi`
--

INSERT INTO `distribusi` (`no_faktur`, `kode_barang`, `kode_cust`, `kode_salesman`, `tgl_distribusi`, `jmlh_barang`) VALUES
(152311, 158826, 11857, 745, '2021-06-22 15:27:34', 10);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `kode_salesman` int(11) NOT NULL,
  `no_faktur` int(11) NOT NULL,
  `nama_salesman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`kode_salesman`, `no_faktur`, `nama_salesman`) VALUES
(744, 152310, 'SUHENDAR'),
(745, 152311, 'DANU'),
(746, 152312, 'INDRA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kode_cust`),
  ADD KEY `kode_cust` (`kode_cust`),
  ADD KEY `kode_salesman` (`kode_salesman`);

--
-- Indexes for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`no_faktur`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `kode_cust` (`kode_cust`),
  ADD KEY `kode_salesman` (`kode_salesman`),
  ADD KEY `no_faktur` (`no_faktur`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`kode_salesman`),
  ADD KEY `id_salesman` (`kode_salesman`),
  ADD KEY `no_faktur` (`no_faktur`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`kode_salesman`) REFERENCES `salesman` (`kode_salesman`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD CONSTRAINT `distribusi_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_ibfk_2` FOREIGN KEY (`kode_cust`) REFERENCES `customer` (`kode_cust`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_ibfk_3` FOREIGN KEY (`kode_salesman`) REFERENCES `salesman` (`kode_salesman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_ibfk_4` FOREIGN KEY (`no_faktur`) REFERENCES `salesman` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

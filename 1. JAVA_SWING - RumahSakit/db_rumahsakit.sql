-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2023 at 09:24 AM
-- Server version: 8.0.33
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `CatatanMedisElektronik`
--

CREATE TABLE `CatatanMedisElektronik` (
  `id_catatan` int NOT NULL,
  `id_reservasi` int NOT NULL,
  `hasil_pemeriksaan` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `pengobatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `CatatanMedisElektronik`
--

INSERT INTO `CatatanMedisElektronik` (`id_catatan`, `id_reservasi`, `hasil_pemeriksaan`, `diagnosis`, `pengobatan`) VALUES
(1, 1, 'hasilnya blablabla', 'diagnosisnya blablabla', 'pengobatannya blablbla');

-- --------------------------------------------------------

--
-- Table structure for table `Dokter`
--

CREATE TABLE `Dokter` (
  `id_dokter` int NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `spesialis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Dokter`
--

INSERT INTO `Dokter` (`id_dokter`, `nama_dokter`, `spesialis`) VALUES
(1, 'Dr.John', 'Umum'),
(2, 'Dr.Doe', 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `JadwalKunjungan`
--

CREATE TABLE `JadwalKunjungan` (
  `id_jadwal` int NOT NULL,
  `id_pasien` int NOT NULL,
  `id_dokter` int NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `JadwalKunjungan`
--

INSERT INTO `JadwalKunjungan` (`id_jadwal`, `id_pasien`, `id_dokter`, `tanggal`, `waktu`) VALUES
(1, 2, 1, '2021-01-01', '11:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `ObatDanAlatMedis`
--

CREATE TABLE `ObatDanAlatMedis` (
  `id_obat` int NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `jumlah` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ObatDanAlatMedis`
--

INSERT INTO `ObatDanAlatMedis` (`id_obat`, `nama_obat`, `jenis`, `jumlah`) VALUES
(2, 'test', 'test', 77);

-- --------------------------------------------------------

--
-- Table structure for table `Pasien`
--

CREATE TABLE `Pasien` (
  `id_pasien` int NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `riwayat_penyakit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Pasien`
--

INSERT INTO `Pasien` (`id_pasien`, `nama_pasien`, `email`, `password`, `alamat`, `nomor_telepon`, `tanggal_lahir`, `riwayat_penyakit`) VALUES
(2, 'test', 'test@mail.com', 'testtest', 'jl.disana', '08912891821', '2021-01-01', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `Pegawai`
--

CREATE TABLE `Pegawai` (
  `id_pegawai` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Pegawai`
--

INSERT INTO `Pegawai` (`id_pegawai`, `username`, `email`, `password`, `role`) VALUES
(1, 'test', 'test@mail.com', 'testtest', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `Pembayaran`
--

CREATE TABLE `Pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_reservasi` int NOT NULL,
  `jumlah` int NOT NULL,
  `metode_pembayaran` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Pembayaran`
--

INSERT INTO `Pembayaran` (`id_pembayaran`, `id_reservasi`, `jumlah`, `metode_pembayaran`, `tanggal`) VALUES
(1, 1, 5500000, 'Cash', '2023-12-09 12:51:46');

-- --------------------------------------------------------

--
-- Table structure for table `Reservasi`
--

CREATE TABLE `Reservasi` (
  `id_reservasi` int NOT NULL,
  `id_pasien` int NOT NULL,
  `id_dokter` int NOT NULL,
  `asuransi` int NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `status` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Reservasi`
--

INSERT INTO `Reservasi` (`id_reservasi`, `id_pasien`, `id_dokter`, `asuransi`, `tanggal`, `waktu`, `status`) VALUES
(1, 2, 2, 0, '2021-01-01', '11:30:00', 1),
(2, 2, 1, 1, '2021-01-02', '14:55:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `RiwayatResep`
--

CREATE TABLE `RiwayatResep` (
  `id_resep` int NOT NULL,
  `id_reservasi` int NOT NULL,
  `obat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `RiwayatResep`
--

INSERT INTO `RiwayatResep` (`id_resep`, `id_reservasi`, `obat`) VALUES
(1, 1, 'test'),
(2, 1, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `RuangPerawatan`
--

CREATE TABLE `RuangPerawatan` (
  `id_ruang` int NOT NULL,
  `nomor_kamar` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `ketersediaan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `RuangPerawatan`
--

INSERT INTO `RuangPerawatan` (`id_ruang`, `nomor_kamar`, `jenis`, `ketersediaan`) VALUES
(2, 'test', 'vip', 'y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CatatanMedisElektronik`
--
ALTER TABLE `CatatanMedisElektronik`
  ADD PRIMARY KEY (`id_catatan`),
  ADD KEY `vbbbbb` (`id_reservasi`);

--
-- Indexes for table `Dokter`
--
ALTER TABLE `Dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `JadwalKunjungan`
--
ALTER TABLE `JadwalKunjungan`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `jadwalkunjungan_ibfk_2` (`id_dokter`);

--
-- Indexes for table `ObatDanAlatMedis`
--
ALTER TABLE `ObatDanAlatMedis`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `Pasien`
--
ALTER TABLE `Pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `Pegawai`
--
ALTER TABLE `Pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `aaaaa` (`id_reservasi`);

--
-- Indexes for table `Reservasi`
--
ALTER TABLE `Reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `reservasi_ibfk_2` (`id_dokter`);

--
-- Indexes for table `RiwayatResep`
--
ALTER TABLE `RiwayatResep`
  ADD PRIMARY KEY (`id_resep`);

--
-- Indexes for table `RuangPerawatan`
--
ALTER TABLE `RuangPerawatan`
  ADD PRIMARY KEY (`id_ruang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CatatanMedisElektronik`
--
ALTER TABLE `CatatanMedisElektronik`
  MODIFY `id_catatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Dokter`
--
ALTER TABLE `Dokter`
  MODIFY `id_dokter` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `JadwalKunjungan`
--
ALTER TABLE `JadwalKunjungan`
  MODIFY `id_jadwal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ObatDanAlatMedis`
--
ALTER TABLE `ObatDanAlatMedis`
  MODIFY `id_obat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Pasien`
--
ALTER TABLE `Pasien`
  MODIFY `id_pasien` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Pegawai`
--
ALTER TABLE `Pegawai`
  MODIFY `id_pegawai` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Reservasi`
--
ALTER TABLE `Reservasi`
  MODIFY `id_reservasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `RiwayatResep`
--
ALTER TABLE `RiwayatResep`
  MODIFY `id_resep` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `RuangPerawatan`
--
ALTER TABLE `RuangPerawatan`
  MODIFY `id_ruang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CatatanMedisElektronik`
--
ALTER TABLE `CatatanMedisElektronik`
  ADD CONSTRAINT `vbbbbb` FOREIGN KEY (`id_reservasi`) REFERENCES `Reservasi` (`id_reservasi`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `JadwalKunjungan`
--
ALTER TABLE `JadwalKunjungan`
  ADD CONSTRAINT `jadwalkunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `Pasien` (`id_pasien`),
  ADD CONSTRAINT `jadwalkunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `Dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  ADD CONSTRAINT `aaaaa` FOREIGN KEY (`id_reservasi`) REFERENCES `Reservasi` (`id_reservasi`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Reservasi`
--
ALTER TABLE `Reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `Pasien` (`id_pasien`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `Dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

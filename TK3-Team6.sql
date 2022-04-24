CREATE DATABASE aplikasi_tamu;

##########Jawaban Nomor 1##########

CREATE TABLE `bagian` (
  `id_bagian` int(11) NOT NULL,
  `nama_bagian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `bagian` ADD PRIMARY KEY (`id_bagian`);
ALTER TABLE `bagian` MODIFY `id_bagian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

CREATE TABLE `instansi` (
  `id_instansi` int(11) NOT NULL,
  `nama_instansi` varchar(255) NOT NULL,
  `jenis_instansi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `instansi` ADD PRIMARY KEY (`id_instansi`);
ALTER TABLE `instansi` MODIFY `id_instansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `level` ADD PRIMARY KEY (`id_level`);
ALTER TABLE `level` MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_bagian` int(11) NOT NULL,
  `alamat_email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `handphone` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `id_bagian` (`id_bagian`);
ALTER TABLE `pegawai` MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_bagian`) REFERENCES `bagian` (`id_bagian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `ruang` (
  `id_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `ruang` ADD PRIMARY KEY (`id_ruang`);
ALTER TABLE `ruang` MODIFY `id_ruang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

CREATE TABLE `tamu` (
  `id_tamu` int(11) NOT NULL,
  `nama_tamu` varchar(255) NOT NULL,
  `id_instansi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id_tamu`),
  ADD KEY `id_instansi` (`id_instansi`);
ALTER TABLE `tamu` MODIFY `id_tamu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
ALTER TABLE `tamu` ADD CONSTRAINT `tamu_ibfk_1` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `sigma_fortuna` (
  `id_sigma` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_ruang` int(11) NOT NULL,
  `id_tamu` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `notulen` text NOT NULL,
  `respon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `sigma_fortuna`
  ADD PRIMARY KEY (`id_sigma`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_ruang` (`id_ruang`),
  ADD KEY `id_tamu` (`id_tamu`);
ALTER TABLE `sigma_fortuna` MODIFY `id_sigma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
ALTER TABLE `sigma_fortuna`
 	ADD CONSTRAINT `sigma_fortuna_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
 	ADD CONSTRAINT `sigma_fortuna_ibfk_2` FOREIGN KEY (`id_ruang`) REFERENCES `ruang` (`id_ruang`) ON DELETE CASCADE ON UPDATE CASCADE,
  	ADD CONSTRAINT `sigma_fortuna_ibfk_3` FOREIGN KEY (`id_tamu`) REFERENCES `tamu` (`id_tamu`) ON DELETE CASCADE ON UPDATE CASCADE;

##########Jawaban Nomor 2##########
INSERT INTO `level` (`level`) VALUES
('Senior IT'),
('Junior IT'),
('CEO (Chief Executive Officer)'),
('CFO (Chief Financial Officer)'),
('COO (Chief Operational Officer)'),
('CTO (Chief Technology Officer)'),
('Direktur'),
('Product Owner'),
('Product Manager'),
('Manager'),
('Supervisor');

##########Jawaban Nomor 3##########

INSERT INTO `bagian` (`id_bagian`, `nama_bagian`) VALUES
    (3, 'QA'),
    (4, 'IT'),
    (5, 'HRD'),
    (6, 'Accounting'),
    (7, 'Warehouse'),
    (8, 'Sales and Marketing');

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `id_level`, `id_bagian`, `alamat_email`, `password`, `handphone`, `alamat`, `status`) VALUES
    (3, 'Zain', 12, 4, 'random-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Surabaya', 'Aktif'),
    (4, 'Ismail', 14, 3, 'random2-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Jakarta', 'Aktif'),
    (5, 'Candra', 15, 4, 'random3-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Surabaya', 'Aktif'),
    (6, 'Lorem', 16, 5, 'random4-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Medan', 'Aktif'),
    (7, 'Ipsum', 22, 6, 'random5-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Surabaya', 'Aktif'),
    (8, 'Sit', 21, 7, 'random6-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Bekasi', 'Aktif'),
    (9, 'Doler', 17, 8, 'random7-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Bandung', 'Aktif'),
    (10, 'Amet', 18, 3, 'random8-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Bekasi', 'Aktif'),
    (11, 'Jonmy', 17, 4, 'random9-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Surabaya', 'Aktif'),
    (12, 'Sir Alex', 16, 5, 'random10-email@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '08123456789', 'Jakarta', 'Aktif');

##########Jawaban Nomor 4##########

INSERT INTO `instansi` (`id_instansi`, `nama_instansi`, `jenis_instansi`) VALUES
    (1, 'PT. TELKOM', 'BUMN'),
    (2, 'PT. ANTAM', 'BUMN'),
    (3, 'PT. SEVIMA', 'Swasta'),
    (4, 'Pertamina', 'BUMN'),
    (5, 'Kementrian Pertahanan', 'Pemerintah');

INSERT INTO `ruang` (`id_ruang`, `nama_ruang`) VALUES
    (1, 'Meeting 1'),
    (2, 'Meeting 2'),
    (3, 'Ruang Buggenfil'),
    (4, 'Ruang Mawar'),
    (5, 'Ruang Melati');

INSERT INTO `tamu` (`nama_tamu`, `id_instansi`) VALUES
    ('Zain Malik', 1),
    ('Prabowo', 1),
    ('James', 2),
    ('Malik', 2),
    ('Abdul', 3),
    ('Saepudin', 3),
    ('Alex', 5);

##########Jawaban Nomor 5##########

INSERT INTO `sigma_fortuna` (`id_sigma`, `id_pegawai`, `id_ruang`, `id_tamu`, `tanggal`, `keperluan`, `notulen`, `respon`) VALUES
    (2, 10, 3, 8, '2022-04-01', 'Bercocok tanam.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (3, 5, 1, 9, '2022-04-01', 'Rapat IPO', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (4, 5, 1, 10, '2022-04-02', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tidak Tersedia'),
    (5, 10, 5, 11, '2022-04-30', 'Rapat Direksi', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (6, 7, 5, 12, '2022-04-21', 'Rapat Keamanan Nasional', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (7, 6, 1, 13, '2022-04-04', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (8, 4, 3, 14, '2022-04-18', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Menunggu Keputusan Direksi'),
    (9, 8, 5, 8, '2022-04-22', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tidak Tersedia'),
    (10, 10, 3, 9, '2022-04-18', 'Bercocok tanam.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (11, 5, 1, 10, '2022-04-16', 'Rapat IPO', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (12, 5, 1, 11, '2022-04-30', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tidak Tersedia'),
    (13, 10, 5, 12, '2022-04-26', 'Rapat Direksi', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (14, 7, 5, 13, '2022-04-06', 'Rapat Keamanan Nasional', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (15, 6, 1, 14, '2022-04-16', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (16, 4, 3, 8, '2022-04-21', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Menunggu Keputusan Direksi'),
    (17, 8, 5, 10, '2022-04-26', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tidak Tersedia'),
    (18, 3, 1, 11, '2022-04-06', 'Rapat Keamanan Nasional', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (19, 8, 5, 9, '2022-04-16', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia'),
    (20, 12, 3, 12, '2022-04-21', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Menunggu Keputusan Direksi'),
    (21, 7, 1, 14, '2022-03-30', 'Meeting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Jadwal Tersedia');

##########Jawaban Nomor 6##########

UPDATE `pegawai` SET `id_level` = '21' WHERE `pegawai`.`id_pegawai` = 22;

##########Jawaban Nomor 7##########

select b.nama_bagian, count(s.id_sigma) as jmlh_kunjungan
from sigma_fortuna s
join pegawai p on s.id_pegawai = p.id_pegawai
join bagian b on p.id_bagian = b.id_bagian
where respon = 'Jadwal Tersedia'
	and month(s.tanggal) = month(now())
group by b.id_bagian;

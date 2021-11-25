-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Nov 2021 pada 08.26
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_shop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_product`, `qty`, `subtotal`) VALUES
(2, 6, 3, 1, 285000),
(4, 6, 5, 1, 650000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(200) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `slug`, `title`, `status`, `keterangan`) VALUES
(1, 'lightstick', 'Lightstick', 'Ready', 'Simbol K-POP'),
(2, 'album', 'Album', 'Pre order', 'PO 26/11/2021'),
(3, 'merchandise', 'Merchandise', 'Pre order', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 6, 30000000),
(2, 1, 3, 2, 6000000),
(3, 2, 2, 1, 500000),
(4, 3, 3, 1, 3000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(2, 2, 'bts-map-of-the-seoul-persona-version-01', 'BTS Map of The Seoul : Persona Version 01', '<p><strong>Rincian Album</strong></p>\r\n\r\n<ol>\r\n <li>Photobook</li>\r\n <li>Mini Book</li>\r\n <li>Photocard</li>\r\n <li>Clear Photo Picket</li>\r\n <li>Postcard</li>\r\n <li>Photo Film</li>\r\n <li>Poster</li>\r\n <li>Disc</li>\r\n</ol>\r\n', 285000, '1', 'bts-map-of-the-seoul-persona-version-01-20211118094955.jpeg'),
(3, 2, 'blackpink-kill-this-love-pink-version', 'Blackpink | Kill This Love | Pink Version', '<p><strong>Rincian Album</strong></p>\r\n\r\n<ol>\r\n <li>Photobook</li>\r\n <li>Accordion Lyrics Book Disc</li>\r\n <li>Photocard</li>\r\n <li>Polaroid Photocard</li>\r\n <li>Postcard 2</li>\r\n <li>Photozine</li>\r\n <li>Sticker Set</li>\r\n</ol>\r\n', 285000, '1', 'blackpink-kill-this-love-pink-version-20211118095314.jpeg'),
(4, 3, 'boneka-bt21', 'Boneka BT21', '<p><strong>Tersedia:</strong></p>\r\n\r\n<ol>\r\n <li>Mang</li>\r\n <li>Koya</li>\r\n <li>Chimmy</li>\r\n</ol>\r\n', 500000, '1', 'boneka-bt21-20211118095529.jpeg'),
(5, 1, 'carat-bong', 'Carat Bong', '<p><strong>Seventeen Lightstick</strong></p>\r\n', 650000, '1', 'carat-bong-20211118095736.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Tanzil Rahmatul Karim', 'tanzil.r35@gmail.com', '$2y$10$VxVMgbtzGoHEBkSNXj67p.N5JwjoV8XTi5QpQxjrKkv/YBhco1HLW', 'admin', 1, 'tanzil-rahmatul-karim-20211118091931.jpg'),
(5, 'Member', 'member@member.com', '$2y$10$rQPLhudPttaRYtq9pi3GZeHFV7hshnITO8/eWR2Mp4BEoLDjxNT6K', 'member', 1, 'member-20200315232137.png'),
(6, 'Zulfi Masyita', 'zulfi@gmail.com', '$2y$10$RVUCg8nCUol7feX8BaHI/ubVk/O6Iauoa//xQIuJjdqme6oWqB46.', 'admin', 1, 'zulfi-masyita-20211118203404.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 27. 14:12
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pizza_etterem`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizza`
--

CREATE TABLE `pizza` (
  `termekID` int(11) NOT NULL,
  `termekNev` varchar(255) NOT NULL,
  `termekLeiras` text DEFAULT NULL,
  `termekAr` int(11) NOT NULL,
  `meret` int(11) DEFAULT NULL,
  `hej` varchar(100) DEFAULT NULL,
  `szosz` varchar(100) DEFAULT NULL,
  `sajt` varchar(100) DEFAULT NULL,
  `feltetek` varchar(100) DEFAULT NULL,
  `kep` varchar(100) NOT NULL,
  `learazas` int(11) DEFAULT NULL,
  `keszlet` int(11) NOT NULL,
  `letrehozas` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizza`
--

INSERT INTO `pizza` (`termekID`, `termekNev`, `termekLeiras`, `termekAr`, `meret`, `hej`, `szosz`, `sajt`, `feltetek`, `kep`, `learazas`, `keszlet`, `letrehozas`) VALUES
(1, 'Sonkás pizza', 'paradicsomos alap, sonka, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'sonka', 'sonkas.png', NULL, 50, '2025-02-06 07:11:43'),
(2, 'Margaréta', 'paradicsomos alap, paradicsomkarika, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'paradicsomkarika', 'margareta.png', NULL, 50, '2025-02-06 07:11:43'),
(3, 'Szalámis pizza', 'paradicsomos alap, szalámi, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsomos', 'mozzarella, trappista', 'szalámi', 'szalamis.png', NULL, 50, '2025-02-06 07:11:43'),
(4, 'Tarjás pizza', 'paradicsomos alap, tarja, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'tarja', 'tarjas.jpg', NULL, 50, '2025-02-06 07:11:43'),
(5, 'Kolbászos pizza', 'paradicsomos alap, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'kolbász', 'kolbaszos.png', NULL, 50, '2025-02-06 07:11:43'),
(6, 'Spartacus pizza', 'paradicsomos alap, csípős pepperoni, paprikás szalámi, gyöngyhagyma, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'hagyma', 'spartacus.png', NULL, 50, '2025-02-27 13:00:04'),
(7, 'Gombás pizza', 'paradicsomos alap, gomba, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba', 'gombas.png', NULL, 50, '2025-02-27 13:03:25'),
(8, 'Vegetáriánus pizza', 'paradicsomos alap, gomba, borsó, kukorica, ananász, bab, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bab, borsó, gomba', 'vegetarianus.png', NULL, 50, '2025-02-27 13:05:33'),
(12, 'Bolognai pizza', 'paradicsomos alap, bolognai ragu, hagyma, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bolognai ragu, hagyma', 'bolognai.png', NULL, 50, '2025-02-06 07:11:43'),
(14, 'TNT pizza', 'Füstölt tarja, bacon, kolbász, bab, hagyma, chili, mozzarella, trappista', 1990, 24, 'vastag', 'chili', 'füstölt', 'bab', 'TNT.png', NULL, 50, '2025-02-27 12:58:00'),
(15, 'Csirkemelles pizza', 'tejfölös-fokhagymás alap, csirkemell, mozzarella, trappista', 1990, 24, 'vastag', 'hagymás tejföl', 'mozzarella, trappista', 'csirkemell', 'csirkemelles.png', NULL, 50, '2025-02-06 07:11:43'),
(16, 'Húsimádó pizza', 'paradicsomos alap, szalonna, pick szalámi, sonka, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'pick szalámi, sonka, kolbász', 'husimado.png', NULL, 50, '2025-02-06 07:11:43'),
(17, 'Sistergős pizza', 'paradicsomos alap, chili, kolbász, csemege szalámi, lilahagyma, hegyes erős paprika, mozarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'paprika', 'sistergos.png', NULL, 50, '2025-02-26 08:19:52'),
(18, 'Négy íz pizza', 'paradicsomos alap, pick szalámi, ananász, sonka, mozzarella, trappista, gomba,', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba, ananász, sonka', 'negy-iz.png', NULL, 50, '2025-02-06 07:11:43'),
(19, 'QQRIQ pizza', 'paradicsomos alap, paradicsom, paprika, csirkehús, bazsalikom,', 1990, 24, 'vastag', 'paradicsom', 'nincs', 'paradicsom, paprika, csirkehús, bazsalikom', 'qqriq.png', NULL, 50, '2025-02-06 07:11:43'),
(20, 'Nagyravágyó pizza', 'tejfölös mustáros alap, kolbász, bacon, pipi hús, virsli, lilahagyma, mozarella, trappista', 1990, 24, 'vastag', 'tejfölös', 'mozzarella, trappista', 'lilahagyma', 'nagyravagyo.png', NULL, 50, '2025-02-26 08:24:45');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`termekID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `termekID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 26. 09:40
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
-- Adatbázis: `pizza_torony`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizza`
--

CREATE TABLE `pizza` (
  `termekID` int(11) NOT NULL,
  `termeknev` varchar(100) NOT NULL,
  `termekdesc` text NOT NULL,
  `termekAr` int(10) NOT NULL,
  `meret` int(10) NOT NULL,
  `hej` varchar(50) NOT NULL,
  `szosz` varchar(100) NOT NULL,
  `sajt` varchar(100) NOT NULL,
  `feltetek` varchar(100) NOT NULL,
  `kep` varchar(100) NOT NULL,
  `kategoria` varchar(100) NOT NULL,
  `learazas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `pizza`
--

INSERT INTO `pizza` (`termekID`, `termeknev`, `termekdesc`, `termekAr`, `meret`, `hej`, `szosz`, `sajt`, `feltetek`, `kep`, `kategoria`, `learazas`) VALUES
(1, 'Sonkás pizza', 'paradicsomos alap, sonka, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'sonka', 'sonkas.jpg', 'Classic (vastag) 24-es pizza', NULL),
(2, 'Margaréta', 'paradicsomos alap, paradicsomkarika, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'paradicsomkarika', 'margareta.jpg', 'Classic (vastag) 24-es pizza', NULL),
(3, 'Szalámis pizza', 'paradicsomos alap, szalámi, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsomos', 'mozzarella, trappista', 'szalámi', 'szalamis.jpg', 'Classic (vastag) 24-es pizza', NULL),
(4, 'Tarjás pizza', 'paradicsomos alap, tarja, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'tarja', 'tarjas.jpg', 'Classic (vastag) 24-es pizza', NULL),
(5, 'Kolbászos pizza', 'paradicsomos alap, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'kolbász', 'kolbasz.jpg', 'Classic (vastag) 24-es pizza', NULL),
(6, 'Margaréta', 'paradicsomos alap, paradicsomkarika, mozzarella, trappista', 3140, 32, 'vékony', 'paradicsom', 'mozzarella, trappista', 'paradicsomkarika', 'margareta.jpg', 'Olasz (vékony) 32-es pizzák', NULL),
(7, 'Sonkás pizza', 'paradicsomos alap, sonka, mozzarella, trappista', 3140, 32, 'vekony', 'paradicsom', 'mozzarella, trappista', 'sonka', 'sonkas.jpg', 'Olasz (vékony) 32-es pizzák', NULL),
(8, 'Szalámis pizza', 'paradicsomos alap, szalámi, mozzarella, trappista', 3140, 32, 'vékony', 'paradicsom', 'mozzarella, trappista', 'szalámi', 'szalamis.jpg', 'Olasz (vékony) 32-es pizzák', NULL),
(9, 'Kolbászos pizza', 'paradicsomos alap, kolbász, mozzarella, trappista', 3140, 32, 'vekony', 'paradicsom', 'mozzarella, trappista', 'kolbász', 'kolbaszos.jpg', 'Olasz (vékony) 32-es pizzák', NULL),
(10, 'Tarjás pizza', 'paradicsomos alap, tarja, mozzarella, trappista', 3140, 32, 'vékony', 'paradicsom', 'mozzarella, trappista', 'tarja', 'tarjas.jpg', 'Olasz (vékony) 32-es pizzák\r\n', NULL),
(12, 'Bolognai pizza', 'paradicsomos alap, bolognai ragu, hagyma, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bolognai ragu, hagyma', 'bolognai.png', 'Classic (vastag) 24-es pizzák', NULL),
(13, 'Csirkemelles pizza', 'tejfölös-fokhagymás alap, csirkemell, mozzarella, trappista', 3140, 32, 'vastag', 'fokhagymás tejföl', 'mozzarella, trappista', 'csirkemell', 'csirkemelles.png', 'classic (vastag) 32-es pizzák', NULL),
(14, 'Bolognai pizza', 'paradicsomos alap, bolognai ragu, hagyma, mozzarella, trappista', 3140, 32, 'vastag', 'paradicsom', 'trappista, mozzarella', 'bolognai ragu, hagyma', 'bolognai.png', 'classic (vastag) 32-es pizzák', NULL),
(15, 'Csirkemelles pizza', 'tejfölös-fokhagymás alap, csirkemell, mozzarella, trappista', 1990, 24, 'vastag', 'hagymás tejföl', 'mozzarella, trappista', 'csirkemell', 'csirkemelles.png', 'Classic (vastag) 24-es pizzák', NULL),
(16, 'Húsimádó pizza', 'paradicsomos alap, szalonna, pick szalámi, sonka, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'pick szalámi, sonka, kolbász', 'husimado.png', 'Classic (vastag) 24-es pizzák', NULL),
(17, 'Húsimádó pizza', 'paradicsomos alap, szalonna, pick szalámi, sonka, kolbász, mozzarella, trappista', 3140, 32, 'vastag', 'paradicsom', 'mozzarella, trappista', 'pick szalámi, sonka, kolbász', 'husimado', 'Classic (vastag) 32-es pizzák', NULL),
(18, 'Négy íz pizza', 'paradicsomos alap, pick szalámi, ananász, sonka, mozzarella, trappista, gomba,', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba, ananász, sonka', 'negy-iz.png', 'Classic (vastag) 24-es', NULL),
(19, 'QQRIQ pizza', 'paradicsomos alap, paradicsom, paprika, csirkehús, bazsalikom,', 1990, 24, 'vastag', 'paradicsom', 'nincs', 'paradicsom, paprika, csirkehús, bazsalikom', 'qqriq.png', 'Classic (vastag) 24-es pizza', NULL);

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
  MODIFY `termekID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

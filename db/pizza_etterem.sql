-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Jan 23. 12:27
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
-- Tábla szerkezet ehhez a táblához `asztalfoglalasok`
--

CREATE TABLE `asztalfoglalasok` (
  `foglalasID` int(10) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telszam` varchar(100) NOT NULL,
  `datum` date NOT NULL,
  `ido` time NOT NULL,
  `orak` tinyint(4) NOT NULL,
  `vendegek` tinyint(4) NOT NULL,
  `asztal` varchar(100) NOT NULL,
  `megjegyzes` text NOT NULL,
  `igeny` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `asztalfoglalasok`
--

INSERT INTO `asztalfoglalasok` (`foglalasID`, `nev`, `email`, `telszam`, `datum`, `ido`, `orak`, `vendegek`, `asztal`, `megjegyzes`, `igeny`) VALUES
(1, 'Nagy Raul', 'nagyraul@gmail.com', '+36566575675', '2024-11-21', '09:00:00', 2, 2, '', 'megjegyzés', 'nincs');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhasznaloID` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `orszagkod` varchar(2) DEFAULT NULL,
  `telszam` varchar(20) DEFAULT NULL,
  `lakcim` text DEFAULT NULL,
  `jelszo` varchar(255) NOT NULL,
  `letrehozas` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhasznaloID`, `nev`, `email`, `orszagkod`, `telszam`, `lakcim`, `jelszo`, `letrehozas`) VALUES
(1, 'Nagy Raul', 'nagyraul@gmail.com', '36', '5665756756', '', 'Jelszo1', '2025-01-23 10:05:13'),
(2, 'Balázs Lehel', 'balazslehel@gmail.com', '36', '3213124144', '', 'Jelszo2', '2025-01-23 10:05:13');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kapcsolat`
--

CREATE TABLE `kapcsolat` (
  `kapcsolatID` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telszam` varchar(100) NOT NULL,
  `targy` varchar(100) NOT NULL,
  `uzenet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kapcsolat`
--

INSERT INTO `kapcsolat` (`kapcsolatID`, `nev`, `email`, `telszam`, `targy`, `uzenet`) VALUES
(1, 'Balázs Lehel', 'balazslehel@gmail.com', '+36321312414', 'A pizzát nem kaptam meg.', 'A pizzát nem sikerült megkapnom');

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
(1, 'Sonkás pizza', 'paradicsomos alap, sonka, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'sonka', 'sonkas.png', NULL, 50, '2025-01-23 10:15:56'),
(2, 'Margaréta', 'paradicsomos alap, paradicsomkarika, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'paradicsomkarika', 'margareta.png', NULL, 50, '2025-01-23 10:15:56'),
(3, 'Szalámis pizza', 'paradicsomos alap, szalámi, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsomos', 'mozzarella, trappista', 'szalámi', 'szalamis.png', NULL, 50, '2025-01-23 10:15:56'),
(4, 'Tarjás pizza', 'paradicsomos alap, tarja, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'tarja', 'tarjas.jpg', NULL, 50, '2025-01-23 10:15:56'),
(5, 'Kolbászos pizza', 'paradicsomos alap, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'kolbász', 'kolbaszos.png', NULL, 50, '2025-01-23 10:15:56'),
(12, 'Bolognai pizza', 'paradicsomos alap, bolognai ragu, hagyma, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bolognai ragu, hagyma', 'bolognai.png', NULL, 50, '2025-01-23 10:15:56'),
(15, 'Csirkemelles pizza', 'tejfölös-fokhagymás alap, csirkemell, mozzarella, trappista', 1990, 24, 'vastag', 'hagymás tejföl', 'mozzarella, trappista', 'csirkemell', 'csirkemelles.png', NULL, 50, '2025-01-23 10:15:56'),
(16, 'Húsimádó pizza', 'paradicsomos alap, szalonna, pick szalámi, sonka, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'pick szalámi, sonka, kolbász', 'husimado.png', NULL, 50, '2025-01-23 10:15:56'),
(18, 'Négy íz pizza', 'paradicsomos alap, pick szalámi, ananász, sonka, mozzarella, trappista, gomba,', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba, ananász, sonka', 'negy-iz.png', NULL, 50, '2025-01-23 10:15:56'),
(19, 'QQRIQ pizza', 'paradicsomos alap, paradicsom, paprika, csirkehús, bazsalikom,', 1990, 24, 'vastag', 'paradicsom', NULL, 'paradicsom, paprika, csirkehús, bazsalikom', 'qqriq.png', NULL, 50, '2025-01-23 10:15:56');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `rendelesID` int(11) NOT NULL,
  `felhasznaloID` int(11) NOT NULL,
  `fizform` varchar(100) NOT NULL,
  `kartyaNev` varchar(100) NOT NULL,
  `kartyaSzam` int(16) NOT NULL,
  `lejarat` varchar(100) NOT NULL,
  `cvv` int(11) NOT NULL,
  `reszossz` int(11) NOT NULL,
  `szalldij` int(11) NOT NULL,
  `vegossz` int(11) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `statusz` enum('függőben','szállításban','elszállítva','törölt') DEFAULT 'függőben'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`rendelesID`, `felhasznaloID`, `fizform`, `kartyaNev`, `kartyaSzam`, `lejarat`, `cvv`, `reszossz`, `szalldij`, `vegossz`, `datum`, `statusz`) VALUES
(1, 1, 'készpénz', '', 0, '', 0, 2380, 100, 2480, '2025-01-23 10:23:12', 'függőben');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_elemei`
--

CREATE TABLE `rendeles_elemei` (
  `rendelesElemeID` int(11) NOT NULL,
  `rendelesID` int(11) NOT NULL,
  `termekID` int(11) NOT NULL,
  `darab` int(11) NOT NULL,
  `termekAr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rendeles_elemei`
--

INSERT INTO `rendeles_elemei` (`rendelesElemeID`, `rendelesID`, `termekID`, `darab`, `termekAr`) VALUES
(1, 1, 1, 1, 1990);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `asztalfoglalasok`
--
ALTER TABLE `asztalfoglalasok`
  ADD PRIMARY KEY (`foglalasID`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felhasznaloID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `kapcsolat`
--
ALTER TABLE `kapcsolat`
  ADD PRIMARY KEY (`kapcsolatID`);

--
-- A tábla indexei `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`termekID`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`rendelesID`),
  ADD KEY `felhasznaloID` (`felhasznaloID`);

--
-- A tábla indexei `rendeles_elemei`
--
ALTER TABLE `rendeles_elemei`
  ADD PRIMARY KEY (`rendelesElemeID`),
  ADD KEY `termekID` (`termekID`),
  ADD KEY `rendelesID` (`rendelesID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `asztalfoglalasok`
--
ALTER TABLE `asztalfoglalasok`
  MODIFY `foglalasID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `kapcsolat`
--
ALTER TABLE `kapcsolat`
  MODIFY `kapcsolatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `termekID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `rendelesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `rendeles_elemei`
--
ALTER TABLE `rendeles_elemei`
  MODIFY `rendelesElemeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

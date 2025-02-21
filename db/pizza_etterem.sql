-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 21. 11:52
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
  `foglalasID` int(11) NOT NULL,
  `felhasznaloID` int(11) DEFAULT NULL,
  `nev` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `orszagkod` varchar(2) DEFAULT NULL,
  `telszam` varchar(100) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `ido` time DEFAULT NULL,
  `orak` tinyint(4) DEFAULT NULL,
  `vendegek` tinyint(4) DEFAULT NULL,
  `megjegyzes` text DEFAULT NULL,
  `igeny` text DEFAULT NULL,
  `letrehozas` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `asztalfoglalasok`
--

INSERT INTO `asztalfoglalasok` (`foglalasID`, `felhasznaloID`, `nev`, `email`, `orszagkod`, `telszam`, `datum`, `ido`, `orak`, `vendegek`, `megjegyzes`, `igeny`, `letrehozas`) VALUES
(1, 1, 'Nagy Raul', 'nagyraul@gmail.com', '36', '566575675', '2024-11-21', '09:00:00', 2, 2, 'megjegyzés', 'nincs', '2025-02-14 10:32:14'),
(2, NULL, 'Rútka Pál', 'rutkapal@gmail.com', '36', '209399676', '2025-02-19', '10:30:00', 1, 0, 'megyjegzés', 'nincs', '2025-02-14 10:32:14'),
(3, NULL, 'Luc Feri', 'balraamasodikajto@gmail.com', '36', '209399676', '2025-02-26', '11:20:00', 2, 3, 'megjegyzés', 'nincs', '2025-02-14 10:32:14'),
(4, NULL, 'Kolom Pál', 'kolompal@gmail.com', '36', '209399676', '2025-03-12', '14:06:00', 4, 6, 'megjegyzés', 'igény', '2025-02-14 10:32:14'),
(36, NULL, 'Miklós Róbert', 'mikrobi@gmail.com', '36', '209399676', '2025-02-11', '16:00:00', 4, 9, 'fléksdkfsdléf', 'fkdlfklséfl', '2025-02-14 10:32:14'),
(38, NULL, 'A', 'a@gmail.com', '36', '5454536', '2025-02-21', '13:28:00', 3, 2, 'A', 'AAAAAAAAAAAAA', '2025-02-14 11:24:12'),
(39, NULL, 'A', 'a@gmail.com', '36', '4554353', '2025-02-21', '12:16:00', 1, 4, 'A', 'AAAAAAAAAAAAAAAAAAAAAA', '2025-02-21 10:12:40');

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
(1, 'Nagy Raul', 'nagyraul@gmail.com', '36', '566575675', '6900 Makó, Hagyma u. 32', 'Jelszo1', '2025-02-06 07:11:43'),
(2, 'Balázs Lehel', 'balazslehel@gmail.com', '36', '321312414', '6900 Makó, Liget u. 8', 'Jelszo2', '2025-02-06 07:11:43'),
(3, 'Novák Antal', 'novantal@gmail.com', '36', '209399676', '6900 Makó, Kálvin u. 18', 'Kfoprkfprek', '2025-02-06 07:11:43'),
(4, 'Csaba Selmeczi', 'csabaselmeczi@gmail.com', '36', '209399676', '1108 Budapest, Kozma u. 13  ', 'Jelszo3', '2025-02-06 07:11:43'),
(5, 'Raul', 'raul@gmail.com', '36', '8659864', '6900Makó', 'Jelszo0', '2025-02-10 12:05:17'),
(6, 'Raul', 'paul@gmail.com', '36', '8659864', '6900Makó', 'Jelszo0', '2025-02-10 12:05:47');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kapcsolat`
--

CREATE TABLE `kapcsolat` (
  `kapcsolatID` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `orszagkod` varchar(2) NOT NULL,
  `telszam` varchar(100) NOT NULL,
  `targy` varchar(100) NOT NULL,
  `uzenet` text NOT NULL,
  `letrehozas` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kapcsolat`
--

INSERT INTO `kapcsolat` (`kapcsolatID`, `nev`, `email`, `orszagkod`, `telszam`, `targy`, `uzenet`, `letrehozas`) VALUES
(1, 'Balázs Lehel', 'balazslehel@gmail.com', '36', '321312414', 'A pizzát nem kaptam meg.', 'A pizzát nem sikerült megkapnom', '2025-02-14 10:33:21'),
(2, 'Németh Szilárd', 'NSzilard@gmail.com', '36', '209399676', 'Patkány van a pizzás dobozban', 'Én csak egy pizzát rendeltem, patkányt nem.', '2025-02-14 10:33:21'),
(3, 'Méreg Attila', 'mattila@gmail.com', '36', '209399676', 'Hol van a pizza?', 'Már vagy egy órája várok arra az átkozott pizzára, de még mindig nincs itt!!! Mi tart ilyen sokáig!??!?! ', '2025-02-14 10:33:21');

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
(12, 'Bolognai pizza', 'paradicsomos alap, bolognai ragu, hagyma, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bolognai ragu, hagyma', 'bolognai.png', NULL, 50, '2025-02-06 07:11:43'),
(15, 'Csirkemelles pizza', 'tejfölös-fokhagymás alap, csirkemell, mozzarella, trappista', 1990, 24, 'vastag', 'hagymás tejföl', 'mozzarella, trappista', 'csirkemell', 'csirkemelles.png', NULL, 50, '2025-02-06 07:11:43'),
(16, 'Húsimádó pizza', 'paradicsomos alap, szalonna, pick szalámi, sonka, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'pick szalámi, sonka, kolbász', 'husimado.png', NULL, 50, '2025-02-06 07:11:43'),
(18, 'Négy íz pizza', 'paradicsomos alap, pick szalámi, ananász, sonka, mozzarella, trappista, gomba,', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba, ananász, sonka', 'negy-iz.png', NULL, 50, '2025-02-06 07:11:43'),
(19, 'QQRIQ pizza', 'paradicsomos alap, paradicsom, paprika, csirkehús, bazsalikom,', 1990, 24, 'vastag', 'paradicsom', 'nincs', 'paradicsom, paprika, csirkehús, bazsalikom', 'qqriq.png', NULL, 50, '2025-02-06 07:11:43');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `rendelesID` int(11) NOT NULL,
  `felhasznaloID` int(11) NOT NULL,
  `szalcim` varchar(100) NOT NULL,
  `fizform` varchar(100) NOT NULL,
  `kartyaNev` varchar(100) DEFAULT NULL,
  `kartyaSzam` varchar(24) DEFAULT NULL,
  `lejarat` date DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `reszossz` int(11) NOT NULL,
  `szalldij` int(11) NOT NULL,
  `vegossz` int(11) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `statusz` enum('függőben','szállításban','elszállítva','törölt') DEFAULT 'függőben'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`rendelesID`, `felhasznaloID`, `szalcim`, `fizform`, `kartyaNev`, `kartyaSzam`, `lejarat`, `cvv`, `reszossz`, `szalldij`, `vegossz`, `datum`, `statusz`) VALUES
(1, 1, 'Makó, Hagyma utca 32.', 'készpénz', NULL, NULL, NULL, NULL, 2580, 100, 2480, '2025-02-06 07:11:43', 'függőben'),
(2, 4, '6900 Makó, Liget u. 34', 'kártya', 'CSABA SELMECZI', '2347 6534 5234 3454', '2026-02-11', 123, 2490, 150, 2670, '2025-02-06 07:11:43', 'függőben'),
(3, 3, '6900 Makó, Kálvin u. 18', 'készpénz', NULL, NULL, NULL, NULL, 2980, 200, 2880, '2025-02-06 07:11:43', 'függőben');

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
(1, 1, 1, 1, 1990),
(2, 1, 2, 1, 1990),
(3, 3, 3, 5, 9950),
(4, 4, 4, 8, 15920),
(5, 5, 6, 9, 17910),
(6, 6, 5, 4, 7960);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `asztalfoglalasok`
--
ALTER TABLE `asztalfoglalasok`
  ADD PRIMARY KEY (`foglalasID`),
  ADD KEY `felhasznaloID` (`felhasznaloID`);

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
  MODIFY `foglalasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `kapcsolat`
--
ALTER TABLE `kapcsolat`
  MODIFY `kapcsolatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `termekID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `rendelesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `rendeles_elemei`
--
ALTER TABLE `rendeles_elemei`
  MODIFY `rendelesElemeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `fk_rendelesek_felhasznaloID` FOREIGN KEY (`felhasznaloID`) REFERENCES `felhasznalok` (`felhasznaloID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

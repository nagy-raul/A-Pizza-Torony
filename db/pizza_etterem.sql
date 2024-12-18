-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 18. 13:00
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
  `orak` int(2) NOT NULL,
  `vendegek` int(2) NOT NULL,
  `asztal` varchar(10) NOT NULL,
  `megjegyzes` text NOT NULL,
  `igeny` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `felhasznaloID` int(10) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `jelszo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telszam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhasznaloID`, `nev`, `jelszo`, `email`, `telszam`) VALUES
(1, 'Nagy Raul', 'jelszo', 'nagyraul@gmail.com', '+36566575675'),
(2, 'Balázs Lehel', 'jelszo2', 'balazslehel@gmail.com', '+36321312414');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kapcsolat`
--

CREATE TABLE `kapcsolat` (
  `kapcsolatID` int(10) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telszam` varchar(100) NOT NULL,
  `targy` varchar(100) NOT NULL,
  `uzenet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `termekID` int(10) NOT NULL,
  `termeknev` varchar(100) NOT NULL,
  `termekdesc` text NOT NULL,
  `termekAr` int(10) NOT NULL,
  `meret` int(10) NOT NULL,
  `hej` varchar(50) NOT NULL,
  `szosz` varchar(100) NOT NULL,
  `sajt` varchar(100) NOT NULL,
  `feltetek` varchar(100) NOT NULL,
  `kep` varchar(100) NOT NULL,
  `learazas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `pizza`
--

INSERT INTO `pizza` (`termekID`, `termeknev`, `termekdesc`, `termekAr`, `meret`, `hej`, `szosz`, `sajt`, `feltetek`, `kep`, `learazas`) VALUES
(1, 'Sonkás pizza', 'paradicsomos alap, sonka, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'sonka', 'sonkas.png', NULL),
(2, 'Margaréta', 'paradicsomos alap, paradicsomkarika, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'paradicsomkarika', 'margareta.png', NULL),
(3, 'Szalámis pizza', 'paradicsomos alap, szalámi, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsomos', 'mozzarella, trappista', 'szalámi', 'szalamis.png', NULL),
(4, 'Tarjás pizza', 'paradicsomos alap, tarja, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'tarja', 'tarjas.jpg', NULL),
(5, 'Kolbászos pizza', 'paradicsomos alap, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'kolbász', 'kolbaszos.png', NULL),
(12, 'Bolognai pizza', 'paradicsomos alap, bolognai ragu, hagyma, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bolognai ragu, hagyma', 'bolognai.png', NULL),
(15, 'Csirkemelles pizza', 'tejfölös-fokhagymás alap, csirkemell, mozzarella, trappista', 1990, 24, 'vastag', 'hagymás tejföl', 'mozzarella, trappista', 'csirkemell', 'csirkemelles.png', NULL),
(16, 'Húsimádó pizza', 'paradicsomos alap, szalonna, pick szalámi, sonka, kolbász, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'pick szalámi, sonka, kolbász', 'husimado.png', NULL),
(18, 'Négy íz pizza', 'paradicsomos alap, pick szalámi, ananász, sonka, mozzarella, trappista, gomba,', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba, ananász, sonka', 'negy-iz.png', NULL),
(19, 'QQRIQ pizza', 'paradicsomos alap, paradicsom, paprika, csirkehús, bazsalikom,', 1990, 24, 'vastag', 'paradicsom', 'nincs', 'paradicsom, paprika, csirkehús, bazsalikom', 'qqriq.png', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `rendelesID` int(11) NOT NULL,
  `felhasznaloID` int(5) NOT NULL,
  `szalcim` varchar(100) NOT NULL,
  `fizform` varchar(100) NOT NULL,
  `reszossz` int(10) NOT NULL,
  `fizossz` int(10) NOT NULL,
  `szalldij` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`rendelesID`, `felhasznaloID`, `szalcim`, `fizform`, `reszossz`, `fizossz`, `szalldij`) VALUES
(1, 1, 'Makó, Hagyma utca 32.', 'készpénz', 2580, 2480, 100);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_elemei`
--

CREATE TABLE `rendeles_elemei` (
  `termekID` int(11) NOT NULL,
  `rendeles_id` int(11) NOT NULL,
  `darab` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `rendeles_elemei`
--

INSERT INTO `rendeles_elemei` (`termekID`, `rendeles_id`, `darab`) VALUES
(1, 1, 1);

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
  ADD PRIMARY KEY (`felhasznaloID`);

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
  ADD PRIMARY KEY (`rendeles_id`),
  ADD KEY `termekID` (`termekID`);

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
  MODIFY `felhasznaloID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `kapcsolat`
--
ALTER TABLE `kapcsolat`
  MODIFY `kapcsolatID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `rendelesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `rendeles_elemei`
--
ALTER TABLE `rendeles_elemei`
  MODIFY `rendeles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

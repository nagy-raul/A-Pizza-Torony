-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 20. 09:12
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
  `felhasznaloID` int(5) NOT NULL,
  `foglalasID` int(10) NOT NULL,
  `datum` date NOT NULL,
  `ido` time NOT NULL,
  `orak` int(2) NOT NULL,
  `vendegek` int(2) NOT NULL,
  `megjegyzes` varchar(1000) NOT NULL,
  `igeny` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `asztalfoglalasok`
--

INSERT INTO `asztalfoglalasok` (`felhasznaloID`, `foglalasID`, `datum`, `ido`, `orak`, `vendegek`, `megjegyzes`, `igeny`) VALUES
(1, 1, '2024-11-21', '09:00:00', 2, 2, 'megjegyzés', 'nincs');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhasznaloID` int(5) NOT NULL,
  `jelszo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telszam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhasznaloID`, `jelszo`, `email`, `telszam`) VALUES
(1, 'jelszo', 'nagyraul@gmail.com', '+36566575675'),
(2, 'jelszo2', 'balazslehel@gmail.com', '+36321312414');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kapcsolat`
--

CREATE TABLE `kapcsolat` (
  `kapcsolatID` int(10) NOT NULL,
  `felhasznaloID` int(5) NOT NULL,
  `targy` varchar(100) NOT NULL,
  `uzenet` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `kapcsolat`
--

INSERT INTO `kapcsolat` (`kapcsolatID`, `felhasznaloID`, `targy`, `uzenet`) VALUES
(1, 1, 'A pizzát nem kaptam meg.', 'A pizzát nem sikerült megkapnom');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizza`
--

CREATE TABLE `pizza` (
  `termekID` int(11) NOT NULL,
  `termeknev` varchar(100) NOT NULL,
  `termekdesc` varchar(1000) NOT NULL,
  `termekAr` int(10) NOT NULL,
  `meret` int(10) NOT NULL,
  `hej` varchar(50) NOT NULL,
  `szosz` varchar(100) NOT NULL,
  `sajt` varchar(100) NOT NULL,
  `feltetek` varchar(100) NOT NULL,
  `extrak` varchar(1000) NOT NULL,
  `kep` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `pizza`
--

INSERT INTO `pizza` (`termekID`, `termeknev`, `termekdesc`, `termekAr`, `meret`, `hej`, `szosz`, `sajt`, `feltetek`, `extrak`, `kep`) VALUES
(1, 'Sonkás pizza', 'paradicsomos alap, sonka, mozzarella, trappista', 1990, 24, 'vastag', 'paradicsom', 'mozzarella, trappista', 'sonka', 'üditő', 'sonkas.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `felhasznaloID` int(5) NOT NULL,
  `rendelesID` int(11) NOT NULL,
  `szalcim` varchar(100) NOT NULL,
  `fizform` varchar(100) NOT NULL,
  `reszossz` int(100) NOT NULL,
  `fizossz` int(100) NOT NULL,
  `szalldij` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`felhasznaloID`, `rendelesID`, `szalcim`, `fizform`, `reszossz`, `fizossz`, `szalldij`) VALUES
(1, 1, 'Makó, Hagyma utca 32.', 'készpénz', 2580, 2480, 100);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_elemei`
--

CREATE TABLE `rendeles_elemei` (
  `termekID` int(11) NOT NULL,
  `rendeles_id` int(11) NOT NULL,
  `darab` int(100) NOT NULL
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
  MODIFY `felhasznaloID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `kapcsolat`
--
ALTER TABLE `kapcsolat`
  MODIFY `kapcsolatID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `termekID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `rendeles_elemei`
--
ALTER TABLE `rendeles_elemei`
  MODIFY `rendeles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

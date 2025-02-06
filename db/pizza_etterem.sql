-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 06. 08:39
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
-- AUTO_INCREMENT a táblához `rendeles_elemei`
--
ALTER TABLE `rendeles_elemei`
  MODIFY `rendelesElemeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

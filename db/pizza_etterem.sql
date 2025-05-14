-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Máj 14. 17:58
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

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
  `orszagkod` varchar(2) NOT NULL,
  `telszam` varchar(100) NOT NULL,
  `datum` date NOT NULL,
  `ido` time NOT NULL,
  `orak` tinyint(4) NOT NULL,
  `vendegek` tinyint(4) NOT NULL,
  `igeny` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `asztalfoglalasok`
--

INSERT INTO `asztalfoglalasok` (`foglalasID`, `nev`, `email`, `orszagkod`, `telszam`, `datum`, `ido`, `orak`, `vendegek`, `igeny`) VALUES
(1, 'Nagy Raul', 'nagyraul@gmail.com', '36', '566575675', '2024-11-21', '09:00:00', 2, 2, 'nincs'),
(2, 'Rútka Pál', 'rutkapal@gmail.com', '36', '209399676', '2025-02-19', '10:30:00', 1, 0, 'nincs'),
(3, 'Luc Feri', 'balraamasodikajto@gmail.com', '36', '209399676', '2025-02-26', '11:20:00', 2, 3, 'nincs'),
(4, 'Kolom Pál', 'kolompal@gmail.com', '36', '209399676', '2025-03-12', '14:06:00', 4, 6, 'igény'),
(5, 'Miklós Róbert', 'mikrobi@gmail.com', '36', '209399676', '2025-02-11', '16:00:00', 4, 9, 'fkdlfklséfl'),
(6, 'Kovács Péter', 'kovacs.peter@gmail.com', '36', '301234567', '2025-02-20', '17:00:00', 9, 4, 'a'),
(7, 'Balázs Lehel', 'balazslehel@gmail.com', '36', '8659864', '2025-07-30', '19:35:00', 10, 9, 'asd'),
(8, 'Nagy Raul', 'nagyraul@gmail.com', '36', '6546565', '2025-04-17', '10:32:00', 3, 2, 'AAAAAAAAAAA'),
(9, 'Nagy Raul', 'nagyraul@gmail.com', '36', '6546565', '2025-04-17', '11:36:00', 4, 3, 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');

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
(1, 'Nagy Raul', 'nagyraul@gmail.com', '36', '2034567', '6900 Makó, Hagyma u. 32', 'Jelszo1', '2025-02-06 07:11:43'),
(2, 'Balázs Lehel', 'balazslehel@gmail.com', '36', '30987654', '6900 Makó, Liget u. 8', 'Jelszo2', '2025-02-06 07:11:43'),
(3, 'Novák Antal', 'novantal@gmail.com', '36', '702345678', '6900 Makó, Kálvin u. 18', 'Jelszo4', '2025-02-06 07:11:43'),
(4, 'Csaba Selmeczi', 'csabaselmeczi@gmail.com', '36', '2087654321', '1108 Budapest, Kozma u. 13  ', 'Jelszo3', '2025-02-06 07:11:43'),
(5, 'Raul', 'raul@gmail.com', '36', '301234567', '6900 Makó, Árpád u. 5', 'Jelszo0', '2025-02-10 12:05:17'),
(7, 'Teszt Elek', 'tesztelek@gmail.com', '36', '7034567890', '6900, Makó, Gyöngy u. 8', 'Jelszo6', '2025-02-27 13:28:47'),
(8, 'Tokai Gergő', 'tokaig@gmail.com', '36', '209399676', '6900 Barkó u. 12', 'Jelszo5', '2025-03-11 09:02:16'),
(9, 'B', 'a@gmail.com', '36', '555555555', '6900 Makó, Hagyma u. 11', 'Jelszo0', '2025-05-14 15:24:37');

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
  `uzenet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kapcsolat`
--

INSERT INTO `kapcsolat` (`kapcsolatID`, `nev`, `email`, `orszagkod`, `telszam`, `targy`, `uzenet`) VALUES
(1, 'Balázs Lehel', 'balazslehel@gmail.com', '36', '321312414', 'A pizzát nem kaptam meg.', 'A pizzát nem sikerült megkapnom'),
(2, 'Németh Szilárd', 'NSzilard@gmail.com', '36', '209399676', 'Patkány van a pizzás dobozban', 'Én csak egy pizzát rendeltem, patkányt nem.'),
(3, 'Méreg Attila', 'mattila@gmail.com', '36', '209399676', 'Hol van a pizza?', 'Már vagy egy órája várok arra az átkozott pizzára, de még mindig nincs itt!!! Mi tart ilyen sokáig!??!?! '),
(4, 'Nagy Raul', 'nagyraul@gmail.com', '36', '4444444', 'jlkfjdklgjfdklgjfdkljgfdlkgj', 'jkglédfjglfdgjkfdgkldfjlkgjdfglkfjdklg');

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
(1, 'Sonkás pizza', 'paradicsomos alap, sonka, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'sonka', 'sonkas.png', NULL, 50, '2025-02-06 07:11:43'),
(2, 'Margaréta', 'paradicsomos alap, paradicsomkarika, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'paradicsomkarika', 'margareta.png', NULL, 50, '2025-02-06 07:11:43'),
(3, 'Szalámis pizza', 'paradicsomos alap, szalámi, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsomos', 'mozzarella, trappista', 'szalámi', 'szalamis.png', NULL, 50, '2025-02-06 07:11:43'),
(4, 'Tarjás pizza', 'paradicsomos alap, tarja, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'tarja', 'tarjas.jpg', NULL, 50, '2025-02-06 07:11:43'),
(5, 'Kolbászos pizza', 'paradicsomos alap, kolbász, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'kolbász', 'kolbaszos.png', NULL, 50, '2025-02-06 07:11:43'),
(6, 'Spartacus pizza', 'paradicsomos alap, csípős pepperoni, paprikás szalámi, gyöngyhagyma, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'hagyma', 'spartacus.png', NULL, 50, '2025-02-27 13:00:04'),
(7, 'Gombás pizza', 'paradicsomos alap, gomba, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba', 'gombas.png', NULL, 50, '2025-02-27 13:03:25'),
(8, 'Vegetáriánus pizza', 'paradicsomos alap, gomba, borsó, kukorica, ananász, bab, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bab, borsó, gomba', 'vegetarianus.png', NULL, 50, '2025-02-27 13:05:33'),
(12, 'Bolognai pizza', 'paradicsomos alap, bolognai ragu, hagyma, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'bolognai ragu, hagyma', 'bolognai.png', NULL, 50, '2025-02-06 07:11:43'),
(14, 'TNT pizza', 'Füstölt tarja, bacon, kolbász, bab, hagyma, chili, mozzarella, trappista', 1990, NULL, 'vastag', 'chili', 'füstölt', 'bab', 'TNT.png', NULL, 50, '2025-02-27 12:58:00'),
(15, 'Csirkemelles pizza', 'tejfölös-fokhagymás alap, csirkemell, mozzarella, trappista', 1990, NULL, 'vastag', 'hagymás tejföl', 'mozzarella, trappista', 'csirkemell', 'csirkemelles.png', NULL, 50, '2025-02-06 07:11:43'),
(16, 'Húsimádó pizza', 'paradicsomos alap, szalonna, pick szalámi, sonka, kolbász, mozzarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'pick szalámi, sonka, kolbász', 'husimado.png', NULL, 50, '2025-02-06 07:11:43'),
(17, 'Sistergős pizza', 'paradicsomos alap, chili, kolbász, csemege szalámi, lilahagyma, hegyes erős paprika, mozarella, trappista', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'paprika', 'sistergos.png', NULL, 50, '2025-02-26 08:19:52'),
(18, 'Négy íz pizza', 'paradicsomos alap, pick szalámi, ananász, sonka, mozzarella, trappista, gomba,', 1990, NULL, 'vastag', 'paradicsom', 'mozzarella, trappista', 'gomba, ananász, sonka', 'negy-iz.png', NULL, 50, '2025-02-06 07:11:43'),
(19, 'QQRIQ pizza', 'paradicsomos alap, paradicsom, paprika, csirkehús, bazsalikom,', 1990, NULL, 'vastag', 'paradicsom', 'nincs', 'paradicsom, paprika, csirkehús, bazsalikom', 'qqriq.png', NULL, 50, '2025-02-06 07:11:43'),
(20, 'Nagyravágyó pizza', 'tejfölös mustáros alap, kolbász, bacon, pipi hús, virsli, lilahagyma, mozarella, trappista', 1990, NULL, 'vastag', 'tejfölös', 'mozzarella, trappista', 'lilahagyma', 'nagyravagyo.png', NULL, 50, '2025-02-26 08:24:45');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `rendelesID` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `szalcim` varchar(100) NOT NULL,
  `fizform` enum('készpénz','bankkártya') NOT NULL,
  `kartyaNev` varchar(100) DEFAULT NULL,
  `kartyaSzam` varchar(24) DEFAULT NULL,
  `lejarat` date DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `vegossz` int(11) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `statusz` enum('függőben','szállításban','elszállítva','törölt') DEFAULT 'függőben'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`rendelesID`, `nev`, `email`, `szalcim`, `fizform`, `kartyaNev`, `kartyaSzam`, `lejarat`, `cvv`, `vegossz`, `datum`, `statusz`) VALUES
(1, 'Nagy Raul', 'nagyraul@gmail.com', '6900 Makó, Hagyma utca 32.', 'készpénz', NULL, NULL, NULL, NULL, 2480, '2025-02-06 07:11:43', 'függőben'),
(2, 'Csaba Selmeczi', 'csabaselmeczi@gmail.com', '6900 Makó, Liget u. 34', 'bankkártya', 'CSABA SELMECZI', '2347 6534 5234 3454', '2026-02-11', 123, 2670, '2025-02-06 07:11:43', 'függőben'),
(3, 'Balázs Lehel', 'balazslehel@gmail.com', '6900 Makó, Kálvin u. 18', 'készpénz', NULL, NULL, NULL, NULL, 2880, '2025-02-06 07:11:43', 'függőben'),
(4, 'Nagy Raul', 'nagyraul@gmail.com', '6900 Makó, Hagyma utca 32.', 'készpénz', '', '', '0000-00-00', 0, 31840, '2025-05-13 14:21:30', 'függőben'),
(5, 'Nagy Raul', 'nagyraul@gmail.com', '6900 Makó, Hagyma utca 32.', 'készpénz', '', '', '0000-00-00', 0, 17910, '2025-05-13 14:25:57', 'függőben'),
(6, 'Balázs Lehel', 'balazslehel@gmail.com', '6900 Makó, Kálvin u. 18', 'bankkártya', 'BALÁZS LEHEL', '1234123412341234', '2026-06-18', 123, 5970, '2025-05-13 14:31:06', 'függőben');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_elemei`
--

CREATE TABLE `rendeles_elemei` (
  `rendelesElemeID` int(11) NOT NULL,
  `rendelesID` int(11) NOT NULL,
  `termekID` int(11) NOT NULL,
  `darab` int(11) NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rendeles_elemei`
--

INSERT INTO `rendeles_elemei` (`rendelesElemeID`, `rendelesID`, `termekID`, `darab`, `ar`) VALUES
(1, 1, 1, 1, 1990),
(2, 1, 2, 1, 1990),
(3, 3, 3, 5, 9950),
(4, 4, 4, 8, 15920),
(5, 5, 6, 9, 17910),
(6, 6, 5, 4, 7960),
(7, 4, 1, 4, 7960),
(8, 4, 2, 3, 5970),
(9, 4, 3, 9, 17910),
(10, 5, 1, 3, 5970),
(11, 5, 2, 3, 5970),
(12, 5, 3, 3, 5970),
(13, 6, 1, 3, 5970);

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
  ADD KEY `email` (`email`);

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
  MODIFY `foglalasID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `kapcsolat`
--
ALTER TABLE `kapcsolat`
  MODIFY `kapcsolatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `termekID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `rendelesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `rendeles_elemei`
--
ALTER TABLE `rendeles_elemei`
  MODIFY `rendelesElemeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

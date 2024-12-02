-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 27. 21:24
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `test`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL DEFAULT 'U',
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `born` date DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `img` blob DEFAULT NULL,
  `img_type` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `year` varchar(9) DEFAULT NULL,
  `profession` varchar(20) DEFAULT NULL,
  `class` char(1) DEFAULT NULL,
  `valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `type`, `first_name`, `last_name`, `middle_name`, `born`, `gender`, `img`, `img_type`, `country`, `country_code`, `phone`, `city`, `postcode`, `address`, `email`, `password`, `year`, `profession`, `class`, `valid`) VALUES
(1, 'U', 'Dániel', 'Aranyosi', NULL, '2005-07-31', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aranyosi.daniel-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(2, 'U', 'Balázs', 'Bakai', NULL, '2005-10-26', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bakai.balazs-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(3, 'U', 'Lehel', 'Balázs', NULL, '2005-09-19', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'balazs.lehel-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(4, 'U', 'István', 'Ballai', 'Attila', '2005-11-20', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ballai.istvanattila-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(5, 'U', 'Szabolcs', 'Benkő', NULL, '2006-02-16', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'benko.szabolcs-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(6, 'U', 'Bonifác', 'Burunkai', NULL, '2005-06-02', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'burunkai.bonifac-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(7, 'U', 'Márió', 'Csontos', 'Dávid', '2005-10-07', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'csontos.mariodavid-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(8, 'U', 'István', 'Erdei', NULL, '2005-12-12', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'erdei.istvan-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(9, 'U', 'Kristóf', 'Fehér', 'László', '2004-11-13', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'feher.kristoflaszlo-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(10, 'U', 'Bálint', 'Gulyás', 'János', '2005-11-30', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gulyas.balintjanos-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(11, 'U', 'Rómeó', 'Hadobás', 'Gábor', '2005-11-29', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hadobas.romeogabor-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(12, 'U', 'Máté', 'Hegedűs', NULL, '2005-07-28', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hegedus.mate-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(13, 'U', 'Ákos', 'Jernei', NULL, '2005-05-11', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jernei.akos-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(14, 'U', 'Balázs', 'Lakatos', NULL, '2005-06-20', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lakatos.balazs-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(15, 'U', 'Richárd', 'Lewis', 'Noel', '2005-03-27', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lewis.richardnoel-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(16, 'U', 'Csaba', 'Löffler', NULL, '2005-07-12', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'loffler.csaba-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 0),
(17, 'U', 'Brendon', 'Nagy', NULL, '2005-10-26', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nagy.brendon-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(18, 'U', 'Raul', 'Nagy', NULL, '2005-04-06', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nagy.raul-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(19, 'U', 'Dániel', 'Nyári', NULL, '2005-07-20', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nyari.daniel-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 0),
(20, 'U', 'Bence', 'Prágai', NULL, '2005-07-06', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pragai.bence-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(21, 'U', 'Ákos', 'Rácz', 'Csaba', '2005-06-17', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'racz.akoscsaba-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(22, 'U', 'Csaba', 'Selmeczi', NULL, '2005-02-11', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'selmeczi.csaba-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(23, 'U', 'Gellért', 'Simon', 'Máté', '2005-11-27', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'simon.gellertmate-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(24, 'U', 'Krisztián', 'Szabó', NULL, '2005-06-29', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szabo.krisztian-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(25, 'U', 'Krisztián', 'Szabó', 'János', '2005-11-02', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szabo.krisztianjanos-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(26, 'U', 'Tamás', 'Szabó', NULL, '2005-10-16', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szabo.tamas-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(27, 'U', 'Tamás', 'Szalma', NULL, '2005-06-01', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szalma.tamas-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(28, 'U', 'Zsanett', 'Szeder', NULL, '2006-05-27', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szeder.zsanett-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 0),
(29, 'U', 'Ádám', 'Széll', NULL, '2006-04-27', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szell.adam-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(30, 'U', 'Máté', 'Tóth', NULL, '2005-09-01', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'toth.mate-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(31, 'U', 'Izabella', 'Tóth-Kása', NULL, '2005-05-10', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'toth-kasa.izabella-2020@keri.mako.hu', '1234Aa', '2020-2025', 'mech-tech', 'C', 1),
(32, 'U', 'Marcell', 'Vékony', NULL, '2003-12-27', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vekony.marcell-2020@keri.mako.hu', '1234Aa', '2020-2025', 'soft-dev-tester', 'C', 1),
(33, 'U', 'Roland', 'Alföldi', NULL, '1991-01-23', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alfoldi.roland-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(34, 'U', 'Katalin', 'Bézi', NULL, '1990-03-14', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bezi.katalin-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(35, 'U', 'Dániel', 'Cseh', NULL, '2002-05-06', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cseh.daniel-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(36, 'U', 'Pál', 'Kondacs', NULL, '1989-03-08', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kondacs.pal-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(37, 'U', 'Zsolt', 'Nagy', NULL, '1970-04-19', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nagy.zsolt-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(38, 'U', 'János', 'Sárkány', NULL, '1991-12-05', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sarkany.janos-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(39, 'U', 'Eszter', 'Szabó-Juhász', NULL, '1990-01-20', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szabo-juhasz.eszter-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(40, 'U', 'Bence', 'Szlama', NULL, '1994-02-14', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szlama.bence-2023@keri.mako.hu', '1234Aa', '2023-2025', 'soft-dev-tester', 'E', 1),
(41, 'U', 'Dániel', 'Badó-Gulácsi', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bado-gulac.daniel-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(42, 'U', 'Barnabás', 'Berta', NULL, '2006-04-05', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'berta.barnabas-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(43, 'U', 'Richárd', 'Bokor', NULL, '2006-07-08', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bokor.richard-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(44, 'U', 'Benedek', 'Dani', NULL, '2006-09-11', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dani.benedek-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(45, 'U', 'Zoltán', 'Döme', NULL, '2006-10-29', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dome.zoltan-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(46, 'U', 'Balázs', 'Esser', 'Dávid', NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'esser.balazs-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(47, 'U', 'Adrián', 'Fodor', 'László', '2006-04-05', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fodor.adrian-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(48, 'U', 'Bence', 'Guvat', 'József', '2006-08-25', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guvat.bence-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(49, 'U', 'Máté', 'Herczeg', 'János', '2006-03-17', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'herczeg.mate-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(50, 'U', 'Zoltán', 'Kardos', NULL, '2006-08-13', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kardos.zoltan-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(51, 'U', 'David', 'Kis', 'Csaba', '2006-12-21', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kis.david-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(52, 'U', 'Marcell', 'Kis', 'Zsombor', '2007-03-24', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kis.marcell-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(53, 'U', 'Alexandra', 'Kneip', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kneip.alexandr-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(54, 'U', 'Henrik', 'Knoch', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'knoch.henrik-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(55, 'U', 'Balázs', 'Kriván', NULL, '2006-11-03', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'krivan.balazs-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(56, 'U', 'Tamás', 'Kulcsár', 'Áron', NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kulcsar.tamas-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(57, 'U', 'Martin', 'Miklós', NULL, '2006-05-25', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'miklos.martin-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(58, 'U', 'Zsigmond', 'Oláh', 'Sámuel', NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'olah.zsigmond-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(59, 'U', 'Csanád', 'Paku', NULL, '2006-05-30', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'paku.csanad-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(60, 'U', 'Norbert', 'Répa', NULL, '2006-08-25', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'repa.norbert-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(61, 'U', 'Ármin', 'Sötét', NULL, '2006-09-30', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sotet.armin-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(62, 'U', 'Benjámin', 'Suba', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'suba.benjamin-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(63, 'U', 'Ádám', 'Suhajda', 'Dominik', NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'suhajda.adam-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(64, 'U', 'Dominik', 'Szabados', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szabados.dominik-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(65, 'U', 'Bence', 'Szabó', NULL, '2007-05-16', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szabo.bence-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(66, 'U', 'László', 'Szalontai', NULL, '2007-01-02', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szalontai.laszlo-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(67, 'U', 'Péter', 'Szántó', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szanto.peter-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(68, 'U', 'Máté', 'Szélpál', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szelpal.mate-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(69, 'U', 'Martin', 'Szőke', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'szoke.martin-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'mech-tech', 'C', 1),
(70, 'U', 'Ádám', 'Tokai', NULL, '2006-03-06', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tokai.adam-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(71, 'U', 'Dzsenifer', 'Tóth', NULL, '2006-10-09', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'toth.dzsenife-2021@keri.mako.hu\r', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(72, 'U', 'László', 'Tóth', 'Gábor', '2006-06-26', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'toth.laszlo-2021@keri.mako.hu', '1234Aa', '2021-2026', 'soft-dev-tester', 'C', 1),
(73, 'A', 'Attila', 'Ódry', NULL, '1964-03-08', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'odry.attila@keri.mako.hu', '1234Aa', NULL, NULL, NULL, 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

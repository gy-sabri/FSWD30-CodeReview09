-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Feb 2018 um 16:46
-- Server-Version: 10.1.9-MariaDB
-- PHP-Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `moaz_sabri_fswd30_codereview_09`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `add_charge`
--

CREATE TABLE `add_charge` (
  `add_charge_id` smallint(5) NOT NULL,
  `fk_customer_id` smallint(5) DEFAULT NULL,
  `fk_checking_id` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `add_charge`
--

INSERT INTO `add_charge` (`add_charge_id`, `fk_customer_id`, `fk_checking_id`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 5, 1),
(4, 6, 2),
(5, 3, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `cars_id` smallint(5) NOT NULL,
  `fk_parking_id` smallint(5) DEFAULT NULL,
  `model_cars` enum('BMW','VW','Audi','Mercedes','Jeep','KIA','BENTLEY') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`cars_id`, `fk_parking_id`, `model_cars`) VALUES
(1, 1, 'BMW'),
(2, 2, 'Mercedes'),
(3, 4, 'BMW'),
(4, 3, 'Jeep'),
(5, 2, 'BENTLEY'),
(6, 5, 'VW'),
(7, 3, 'KIA'),
(8, 6, 'BMW'),
(9, 4, 'Audi'),
(10, 7, 'Mercedes');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `checking`
--

CREATE TABLE `checking` (
  `checking_id` smallint(5) NOT NULL,
  `fk_returns_id` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `checking`
--

INSERT INTO `checking` (`checking_id`, `fk_returns_id`) VALUES
(5, 1),
(1, 2),
(3, 3),
(4, 4),
(2, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `company_id` smallint(5) NOT NULL,
  `fk_resevation_id` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `company`
--

INSERT INTO `company` (`company_id`, `fk_resevation_id`) VALUES
(3, 1),
(5, 2),
(2, 3),
(1, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` smallint(5) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `bank_card` int(11) NOT NULL,
  `driving_license` enum('A','B','C') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `birth_date`, `email`, `bank_card`, `driving_license`) VALUES
(1, 'Sarah', 'Michail', '1990-02-10', 'example@example.com', 433746434, 'A'),
(2, 'Jon', 'Mart', '1078-12-10', 'example2@example.net', 482875421, 'B'),
(3, 'Tom', 'bat', '1992-05-15', 'exp@hot.com', 646354874, 'A'),
(4, 'Bob', 'Mart', '1989-12-08', 'email@yahoo.com', 543316843, 'B'),
(5, 'Jon', 'Diab', '1988-04-08', 'mmm@mmm.com', 15631351, 'C'),
(6, 'Sabri', 'SO', '1994-01-01', 'gy@sabri.sy', 4863134, 'C');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` smallint(5) NOT NULL,
  `fk_company_id` smallint(5) DEFAULT NULL,
  `fk_customer_id` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_company_id`, `fk_customer_id`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 5, 1),
(4, 2, 3),
(5, 4, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locarion`
--

CREATE TABLE `locarion` (
  `locarion_id` smallint(5) NOT NULL,
  `fk_customer_id` smallint(5) DEFAULT NULL,
  `fk_start_id` smallint(5) DEFAULT NULL,
  `fk_return_id` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `locarion`
--

INSERT INTO `locarion` (`locarion_id`, `fk_customer_id`, `fk_start_id`, `fk_return_id`) VALUES
(1, 1, 4, 5),
(2, 3, 1, 6),
(3, 5, 4, 5),
(4, 1, 6, 2),
(5, 1, 9, 3),
(6, 1, 3, 5),
(7, 3, 2, 5),
(8, 2, 4, 5),
(9, 1, 2, 3),
(10, 4, 5, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parking`
--

CREATE TABLE `parking` (
  `parking_id` smallint(5) NOT NULL,
  `fk_checking_id` smallint(5) DEFAULT NULL,
  `fk_company_id` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `parking`
--

INSERT INTO `parking` (`parking_id`, `fk_checking_id`, `fk_company_id`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 5, NULL),
(4, 1, 2),
(5, 3, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `resevation`
--

CREATE TABLE `resevation` (
  `resevation_id` smallint(5) NOT NULL,
  `fk_cars_id` smallint(6) DEFAULT NULL,
  `fk_web_office_id` smallint(5) DEFAULT NULL,
  `fk_locarion_id` smallint(5) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `resevation`
--

INSERT INTO `resevation` (`resevation_id`, `fk_cars_id`, `fk_web_office_id`, `fk_locarion_id`, `from_date`, `to_date`) VALUES
(1, 1, 4, 5, '2018-02-01', '2018-02-08'),
(2, 4, 2, 6, '2018-02-09', '2018-02-12'),
(3, 10, 5, 3, '2018-02-15', '2018-02-23'),
(4, 5, 7, 2, '2018-02-12', '2018-02-15'),
(5, 4, 3, 9, '2018-02-08', '2018-02-24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `returns`
--

CREATE TABLE `returns` (
  `returns_id` smallint(5) NOT NULL,
  `fk_company_id` smallint(5) DEFAULT NULL,
  `locarion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `returns`
--

INSERT INTO `returns` (`returns_id`, `fk_company_id`, `locarion`) VALUES
(1, 2, 'Wien'),
(2, 5, 'Salzburg'),
(3, 2, 'hbf'),
(4, 3, 'Linz'),
(5, 1, 'Airport'),
(6, 4, 'Wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start`
--

CREATE TABLE `start` (
  `start_id` smallint(5) NOT NULL,
  `fk_company_id` smallint(5) DEFAULT NULL,
  `fk_cars_id` smallint(5) DEFAULT NULL,
  `locarion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `start`
--

INSERT INTO `start` (`start_id`, `fk_company_id`, `fk_cars_id`, `locarion`) VALUES
(1, 2, 1, 'hbf'),
(2, 4, 2, 'Airport'),
(3, 3, 2, 'City'),
(4, 4, 3, 'Dorf'),
(5, 1, 5, 'hbf'),
(6, 5, 6, 'Wine'),
(7, 1, 7, 'Salzburg'),
(8, 4, 8, 'Linz'),
(9, 2, 9, 'Wien'),
(10, 3, 10, 'Airport');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `website_office`
--

CREATE TABLE `website_office` (
  `website_office_id` smallint(5) NOT NULL,
  `fk_customer_id` smallint(5) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `website_office`
--

INSERT INTO `website_office` (`website_office_id`, `fk_customer_id`, `url`) VALUES
(1, 1, 'www.example.com'),
(2, 1, 'www.example.com'),
(3, 2, 'www.cars.at'),
(4, 3, 'www.facebook.com'),
(5, 3, 'www.exmp.sy'),
(6, 5, 'www.example.uk'),
(7, 4, 'www.example.sy'),
(8, 6, 'www.example.com'),
(9, 5, 'www.example.us');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `add_charge`
--
ALTER TABLE `add_charge`
  ADD PRIMARY KEY (`add_charge_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_checking_id` (`fk_checking_id`);

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`cars_id`);

--
-- Indizes für die Tabelle `checking`
--
ALTER TABLE `checking`
  ADD PRIMARY KEY (`checking_id`),
  ADD KEY `fk_returns_id` (`fk_returns_id`);

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_resevation_id` (`fk_resevation_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `locarion`
--
ALTER TABLE `locarion`
  ADD PRIMARY KEY (`locarion_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_start_id` (`fk_start_id`),
  ADD KEY `fk_return_id` (`fk_return_id`);

--
-- Indizes für die Tabelle `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`parking_id`),
  ADD KEY `fk_checking_id` (`fk_checking_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indizes für die Tabelle `resevation`
--
ALTER TABLE `resevation`
  ADD PRIMARY KEY (`resevation_id`),
  ADD KEY `fk_cars_id` (`fk_cars_id`),
  ADD KEY `fk_web_office_id` (`fk_web_office_id`),
  ADD KEY `fk_locarion_id` (`fk_locarion_id`);

--
-- Indizes für die Tabelle `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`returns_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indizes für die Tabelle `start`
--
ALTER TABLE `start`
  ADD PRIMARY KEY (`start_id`),
  ADD KEY `fk_cars_id` (`fk_cars_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indizes für die Tabelle `website_office`
--
ALTER TABLE `website_office`
  ADD PRIMARY KEY (`website_office_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `add_charge`
--
ALTER TABLE `add_charge`
  MODIFY `add_charge_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `cars`
--
ALTER TABLE `cars`
  MODIFY `cars_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `checking`
--
ALTER TABLE `checking`
  MODIFY `checking_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `company`
--
ALTER TABLE `company`
  MODIFY `company_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `locarion`
--
ALTER TABLE `locarion`
  MODIFY `locarion_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `parking`
--
ALTER TABLE `parking`
  MODIFY `parking_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `resevation`
--
ALTER TABLE `resevation`
  MODIFY `resevation_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `returns`
--
ALTER TABLE `returns`
  MODIFY `returns_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `start`
--
ALTER TABLE `start`
  MODIFY `start_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `website_office`
--
ALTER TABLE `website_office`
  MODIFY `website_office_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `add_charge`
--
ALTER TABLE `add_charge`
  ADD CONSTRAINT `add_charge_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `add_charge_ibfk_2` FOREIGN KEY (`fk_checking_id`) REFERENCES `checking` (`checking_id`);

--
-- Constraints der Tabelle `checking`
--
ALTER TABLE `checking`
  ADD CONSTRAINT `checking_ibfk_1` FOREIGN KEY (`fk_returns_id`) REFERENCES `returns` (`returns_id`);

--
-- Constraints der Tabelle `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_resevation_id`) REFERENCES `resevation` (`resevation_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `locarion`
--
ALTER TABLE `locarion`
  ADD CONSTRAINT `locarion_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `locarion_ibfk_2` FOREIGN KEY (`fk_start_id`) REFERENCES `start` (`start_id`),
  ADD CONSTRAINT `locarion_ibfk_3` FOREIGN KEY (`fk_return_id`) REFERENCES `returns` (`returns_id`);

--
-- Constraints der Tabelle `parking`
--
ALTER TABLE `parking`
  ADD CONSTRAINT `parking_ibfk_1` FOREIGN KEY (`fk_checking_id`) REFERENCES `checking` (`checking_id`),
  ADD CONSTRAINT `parking_ibfk_2` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints der Tabelle `resevation`
--
ALTER TABLE `resevation`
  ADD CONSTRAINT `resevation_ibfk_1` FOREIGN KEY (`fk_cars_id`) REFERENCES `cars` (`cars_id`),
  ADD CONSTRAINT `resevation_ibfk_2` FOREIGN KEY (`fk_web_office_id`) REFERENCES `website_office` (`website_office_id`),
  ADD CONSTRAINT `resevation_ibfk_3` FOREIGN KEY (`fk_locarion_id`) REFERENCES `locarion` (`locarion_id`);

--
-- Constraints der Tabelle `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints der Tabelle `start`
--
ALTER TABLE `start`
  ADD CONSTRAINT `start_ibfk_1` FOREIGN KEY (`fk_cars_id`) REFERENCES `cars` (`cars_id`),
  ADD CONSTRAINT `start_ibfk_2` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints der Tabelle `website_office`
--
ALTER TABLE `website_office`
  ADD CONSTRAINT `website_office_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Sep 2017 um 21:13
-- Server-Version: 10.1.26-MariaDB
-- PHP-Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cecilia_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `id_address` int(11) NOT NULL,
  `id_street` int(11) NOT NULL,
  `house_no` varchar(20) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`id_address`, `id_street`, `house_no`, `b_inactive`) VALUES
(1, 1, '24/10', 0),
(2, 4, '3/2/15', 0),
(3, 3, '12b', 0),
(4, 5, '112/2/18', 0),
(5, 2, 'nr. 10 bl. B ap. 22', 0),
(6, 6, '17/3', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `billing_data`
--

CREATE TABLE `billing_data` (
  `id_billing_data` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `billing_data`
--

INSERT INTO `billing_data` (`id_billing_data`, `id_booking`, `id_address`, `b_inactive`) VALUES
(1, 1, 1, 0),
(2, 3, 5, 0),
(3, 2, 2, 0),
(4, 4, 4, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `cancellation_date` datetime DEFAULT NULL,
  `id_car` int(11) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`id_booking`, `id_user`, `booking_date`, `cancellation_date`, `id_car`, `b_inactive`) VALUES
(1, 1, '2017-06-23 00:00:00', NULL, 4, 0),
(2, 3, '2017-06-22 00:00:00', NULL, 2, 0),
(3, 2, '2017-06-20 00:00:00', NULL, 5, 0),
(4, 2, '2017-07-10 00:00:00', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `id_car` int(11) NOT NULL,
  `id_car_brand` int(11) NOT NULL,
  `id_car_type` int(11) NOT NULL,
  `id_fuel_type` int(11) NOT NULL,
  `colour` varchar(60) NOT NULL,
  `plate_no` varchar(60) NOT NULL,
  `inreg_date` datetime DEFAULT NULL,
  `id_price_category` int(11) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`id_car`, `id_car_brand`, `id_car_type`, `id_fuel_type`, `colour`, `plate_no`, `inreg_date`, `id_price_category`, `b_inactive`) VALUES
(1, 5, 3, 1, 'rot', 'W-24563', '2016-02-05 00:00:00', 1, 0),
(2, 1, 4, 2, 'schwarz', 'W-39874', '2015-09-12 00:00:00', 3, 0),
(3, 6, 1, 1, 'silber', 'W-19854', '2017-02-23 00:00:00', 4, 0),
(4, 7, 2, 4, 'braun', 'W-29857', '2016-05-04 00:00:00', 2, 0),
(5, 7, 3, 3, 'green', 'W-39732', '2017-03-05 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_brand`
--

CREATE TABLE `car_brand` (
  `id_car_brand` int(11) NOT NULL,
  `car_brand_name` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car_brand`
--

INSERT INTO `car_brand` (`id_car_brand`, `car_brand_name`, `b_inactive`) VALUES
(1, 'Mercedes', 0),
(2, 'Peugeot', 0),
(3, 'Volkswagen', 0),
(4, 'Fiat', 0),
(5, 'Dacia', 0),
(6, 'Audi', 0),
(7, 'Opel', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_type`
--

CREATE TABLE `car_type` (
  `id_car_type` int(11) NOT NULL,
  `car_type_name` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car_type`
--

INSERT INTO `car_type` (`id_car_type`, `car_type_name`, `b_inactive`) VALUES
(1, 'Sportwagen', 0),
(2, 'Geländewagen', 0),
(3, 'Stadtcruiser', 0),
(4, 'Business-Limousine', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `charge`
--

CREATE TABLE `charge` (
  `id_charge` int(11) NOT NULL,
  `id_price_category` int(11) NOT NULL,
  `charge_name` varchar(60) NOT NULL,
  `unitary_price` decimal(7,2) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_until` datetime DEFAULT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `charge`
--

INSERT INTO `charge` (`id_charge`, `id_price_category`, `charge_name`, `unitary_price`, `valid_from`, `valid_until`, `b_inactive`) VALUES
(1, 1, 'Tagsatz', '40.00', '2017-01-01 00:00:00', NULL, 0),
(2, 2, 'Tagsatz', '50.00', '2017-01-01 00:00:00', NULL, 0),
(3, 3, 'Tagsatz', '65.00', '2017-01-01 00:00:00', NULL, 0),
(4, 4, 'Tagsatz', '85.00', '2017-01-01 00:00:00', NULL, 0),
(5, 1, 'Extra-Fullkasko', '15.00', '2017-01-01 00:00:00', NULL, 0),
(6, 2, 'Extra-Fullkasko', '20.00', '2017-01-01 00:00:00', NULL, 0),
(7, 3, 'Extra-Fullkasko', '30.00', '2017-01-01 00:00:00', NULL, 0),
(8, 4, 'Extra-Fullkasko', '40.00', '2017-01-01 00:00:00', NULL, 0),
(9, 3, 'Pickup-Service', '50.00', '2017-01-01 00:00:00', NULL, 0),
(10, 4, 'Pickup-Service', '65.00', '2017-01-01 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_type`
--

CREATE TABLE `contact_type` (
  `id_contact_type` int(11) NOT NULL,
  `type_name` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `contact_type`
--

INSERT INTO `contact_type` (`id_contact_type`, `type_name`, `b_inactive`) VALUES
(1, 'Telefon', 0),
(2, 'Mobil', 0),
(3, 'E-Mail', 0),
(4, 'Fax', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `country`
--

CREATE TABLE `country` (
  `id_country` int(11) NOT NULL,
  `country_name` varchar(60) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `country`
--

INSERT INTO `country` (`id_country`, `country_name`, `country_code`, `b_inactive`) VALUES
(1, 'Österreich', 'A', 0),
(2, 'Deutschland', 'D', 0),
(3, 'Rumänien', 'RO', 0),
(4, 'Ungarn', 'HU', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `id_driver` int(11) NOT NULL,
  `id_person` int(11) NOT NULL,
  `no_driver_license` varchar(60) NOT NULL,
  `issue_date_driver_license` datetime NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`id_driver`, `id_person`, `no_driver_license`, `issue_date_driver_license`, `b_inactive`) VALUES
(1, 1, '1666784', '2013-02-15 00:00:00', 0),
(2, 2, '2541478', '2005-12-02 00:00:00', 0),
(3, 3, '2514785', '2012-12-12 00:00:00', 0),
(4, 4, '1444752', '1978-04-12 00:00:00', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fuel_type`
--

CREATE TABLE `fuel_type` (
  `id_fuel_type` int(11) NOT NULL,
  `fuel_type_name` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fuel_type`
--

INSERT INTO `fuel_type` (`id_fuel_type`, `fuel_type_name`, `b_inactive`) VALUES
(1, 'Benzin', 0),
(2, 'Diesel', 0),
(3, 'Elektro', 0),
(4, 'Erdgas', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `invoice_no` varchar(20) NOT NULL,
  `issue_date` datetime NOT NULL,
  `cash_discount_rate` decimal(4,2) DEFAULT NULL,
  `cash_discount_term` tinyint(4) DEFAULT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `id_booking`, `invoice_no`, `issue_date`, `cash_discount_rate`, `cash_discount_term`, `b_inactive`) VALUES
(1, 1, 'A-001/2017', '2017-07-23 00:00:00', NULL, NULL, 0),
(2, 2, 'A-002/2017', '2017-07-23 00:00:00', '4.50', 14, 0),
(3, 3, 'A-003/2017', '2017-07-23 00:00:00', NULL, NULL, 0),
(4, 4, 'A-004/2017', '2017-07-23 00:00:00', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  `location_name` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`id_location`, `id_address`, `location_name`, `b_inactive`) VALUES
(1, 6, 'Standard-Pickup-Location', 0),
(2, 3, '', 0),
(3, 1, 'Standard-Pickup-Location 2', 0),
(4, 2, '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `payment_status` tinyint(4) DEFAULT '0',
  `payment_date_deadline` datetime NOT NULL,
  `payment_date_affected` datetime DEFAULT NULL,
  `payment_amount` decimal(7,2) DEFAULT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`id_payment`, `id_invoice`, `payment_status`, `payment_date_deadline`, `payment_date_affected`, `payment_amount`, `b_inactive`) VALUES
(1, 1, 1, '2017-08-06 00:00:00', '2017-08-02 00:00:00', '50.00', 0),
(2, 2, 1, '2017-08-06 00:00:00', '2017-07-29 00:00:00', '410.65', 0),
(3, 3, 0, '2017-08-06 00:00:00', NULL, NULL, 0),
(4, 4, 1, '2017-08-06 00:00:00', '2017-08-07 00:00:00', '80.00', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `id_person` int(11) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `birthday` datetime NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`id_person`, `last_name`, `first_name`, `birthday`, `gender`, `b_inactive`) VALUES
(1, 'Tester', 'Toni', '1984-10-05 00:00:00', 1, 0),
(2, 'Dummy', 'Sabine', '1976-09-12 00:00:00', 0, 0),
(3, 'Muster', 'Anton', '1999-02-25 00:00:00', 1, 0),
(4, 'Bogus', 'Olga', '1953-12-01 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `price_category`
--

CREATE TABLE `price_category` (
  `id_price_category` int(11) NOT NULL,
  `price_category_name` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `price_category`
--

INSERT INTO `price_category` (`id_price_category`, `price_category_name`, `b_inactive`) VALUES
(1, 'Low-Budget', 0),
(2, 'Family-Class', 0),
(3, 'Business-Class', 0),
(4, 'Luxury-Class', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ref_booking_charge`
--

CREATE TABLE `ref_booking_charge` (
  `id_ref_booking_charge` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `id_charge` int(11) NOT NULL,
  `discount_rate` decimal(4,2) DEFAULT NULL,
  `quantity` tinyint(4) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ref_booking_charge`
--

INSERT INTO `ref_booking_charge` (`id_ref_booking_charge`, `id_booking`, `id_charge`, `discount_rate`, `quantity`, `b_inactive`) VALUES
(1, 1, 2, NULL, 0, 0),
(2, 2, 3, NULL, 0, 0),
(3, 2, 7, NULL, 0, 0),
(4, 2, 9, NULL, 0, 0),
(5, 3, 1, NULL, 0, 0),
(6, 3, 6, NULL, 0, 0),
(7, 4, 1, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ref_booking_transfer`
--

CREATE TABLE `ref_booking_transfer` (
  `id_ref_booking_transfer` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `id_transfer` int(11) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ref_booking_transfer`
--

INSERT INTO `ref_booking_transfer` (`id_ref_booking_transfer`, `id_booking`, `id_transfer`, `b_inactive`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 2, 3, 0),
(4, 2, 4, 0),
(5, 3, 5, 0),
(6, 3, 6, 0),
(7, 4, 7, 0),
(8, 4, 8, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ref_person_address`
--

CREATE TABLE `ref_person_address` (
  `id_ref_person_address` int(11) NOT NULL,
  `id_person` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_until` datetime DEFAULT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ref_person_address`
--

INSERT INTO `ref_person_address` (`id_ref_person_address`, `id_person`, `id_address`, `valid_from`, `valid_until`, `b_inactive`) VALUES
(1, 1, 1, '2017-03-12 00:00:00', NULL, 0),
(2, 2, 5, '2017-04-02 00:00:00', NULL, 0),
(3, 3, 2, '2017-03-29 00:00:00', '2017-04-17 23:59:59', 0),
(4, 3, 3, '2017-04-18 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ref_person_contact_type`
--

CREATE TABLE `ref_person_contact_type` (
  `id_ref_person_contact_type` int(11) NOT NULL,
  `id_person` int(11) NOT NULL,
  `id_contact_type` int(11) NOT NULL,
  `value` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ref_person_contact_type`
--

INSERT INTO `ref_person_contact_type` (`id_ref_person_contact_type`, `id_person`, `id_contact_type`, `value`, `b_inactive`) VALUES
(1, 1, 3, 'tester1919@hotmail.com', 0),
(2, 1, 2, '0699/1234567', 0),
(3, 2, 2, '0664/123456', 0),
(4, 2, 3, 'dummy_auch@gmx.at', 0),
(5, 3, 3, 'anton@muster.tv', 0),
(6, 3, 1, '01/12 34 567', 0),
(7, 4, 3, 'olga69@love.ro', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `street`
--

CREATE TABLE `street` (
  `id_street` int(11) NOT NULL,
  `id_town` int(11) NOT NULL,
  `street_name` varchar(60) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `street`
--

INSERT INTO `street` (`id_street`, `id_town`, `street_name`, `b_inactive`) VALUES
(1, 18, 'Ferrogasse', 0),
(2, 26, 'Str. Silistra', 0),
(3, 25, 'Invalidenstraße', 0),
(4, 27, 'Fortuna Köz', 0),
(5, 19, 'Krottenbachstraße', 0),
(6, 3, 'Ungargasse', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `town`
--

CREATE TABLE `town` (
  `id_town` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `town_name` varchar(60) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `town`
--

INSERT INTO `town` (`id_town`, `id_country`, `town_name`, `postal_code`, `b_inactive`) VALUES
(1, 1, 'Wien', 1010, 0),
(2, 1, 'Wien', 1020, 0),
(3, 1, 'Wien', 1030, 0),
(4, 1, 'Wien', 1040, 0),
(5, 1, 'Wien', 1050, 0),
(6, 1, 'Wien', 1060, 0),
(7, 1, 'Wien', 1070, 0),
(8, 1, 'Wien', 1080, 0),
(9, 1, 'Wien', 1090, 0),
(10, 1, 'Wien', 1100, 0),
(11, 1, 'Wien', 1110, 0),
(12, 1, 'Wien', 1120, 0),
(13, 1, 'Wien', 1113, 0),
(14, 1, 'Wien', 1140, 0),
(15, 1, 'Wien', 1150, 0),
(16, 1, 'Wien', 1160, 0),
(17, 1, 'Wien', 1170, 0),
(18, 1, 'Wien', 1180, 0),
(19, 1, 'Wien', 1190, 0),
(20, 1, 'Wien', 1200, 0),
(21, 1, 'Wien', 1210, 0),
(22, 1, 'Wien', 1220, 0),
(23, 1, 'Wien', 1230, 0),
(24, 1, 'Baden', 2500, 0),
(25, 2, 'Berlin', 10115, 0),
(26, 3, 'Timisoara', 300254, 0),
(27, 4, 'Budapest', 1014, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transfer`
--

CREATE TABLE `transfer` (
  `id_transfer` int(11) NOT NULL,
  `id_driver` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  `id_transfer_type` int(11) NOT NULL,
  `transfer_date_agreed` datetime NOT NULL,
  `transfer_date_affected` datetime DEFAULT NULL,
  `milage_km` int(11) DEFAULT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `transfer`
--

INSERT INTO `transfer` (`id_transfer`, `id_driver`, `id_location`, `id_transfer_type`, `transfer_date_agreed`, `transfer_date_affected`, `milage_km`, `b_inactive`) VALUES
(1, 1, 1, 1, '2017-07-02 14:00:00', '2017-07-02 14:00:00', 12451, 0),
(2, 1, 3, 2, '2017-07-03 14:00:00', '2017-07-03 13:33:00', 12512, 0),
(3, 2, 3, 1, '2017-07-04 09:00:00', '2017-07-04 09:14:00', 57841, 0),
(4, 2, 3, 2, '2017-07-08 09:00:00', '2017-07-08 09:03:00', 58021, 0),
(5, 3, 1, 1, '2017-07-03 08:30:00', '2017-07-03 08:30:00', 25001, 0),
(6, 3, 2, 2, '2017-07-04 10:00:00', '2017-07-04 09:47:00', 250047, 0),
(7, 4, 3, 1, '2017-07-05 10:00:00', '2017-07-05 10:02:00', 34205, 0),
(8, 4, 4, 2, '2017-07-07 09:00:00', '2017-07-07 10:23:00', 34314, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transfer_type`
--

CREATE TABLE `transfer_type` (
  `id_transfer_type` int(11) NOT NULL,
  `transfer_type_name` varchar(20) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `transfer_type`
--

INSERT INTO `transfer_type` (`id_transfer_type`, `transfer_type_name`, `b_inactive`) VALUES
(1, 'pickup', 0),
(2, 'return', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_account`
--

CREATE TABLE `user_account` (
  `id_user` int(11) NOT NULL,
  `id_person` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `password` char(128) NOT NULL,
  `b_inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user_account`
--

INSERT INTO `user_account` (`id_user`, `id_person`, `user_name`, `password`, `b_inactive`) VALUES
(1, 1, 'tester1234', '5374f9853f96eaa5b3c1124f9eb1dbbb63fb5c5ce40abb41ec88c745ec3455328685f3046cac8c356a4d81dbd315fd09173c54dc94a4208e5bc091776b02eb77', 0),
(2, 2, 'dummy007', '5374f9853f96eaa5b3c1124f9eb1dbbb63fb5c5ce40abb41ec88c745ec3455328685f3046cac8c356a4d81dbd315fd09173c54dc94a4208e5bc091776b02eb77', 0),
(3, 3, 'ineedafreakingcar', '5374f9853f96eaa5b3c1124f9eb1dbbb63fb5c5ce40abb41ec88c745ec3455328685f3046cac8c356a4d81dbd315fd09173c54dc94a4208e5bc091776b02eb77', 0);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_car_list`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_car_list` (
`id_car` int(11)
,`car_brand_name` varchar(60)
,`car_type_name` varchar(60)
,`fuel_type_name` varchar(60)
,`price_category_name` varchar(60)
,`colour` varchar(60)
,`plate_no` varchar(60)
,`inreg_date` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_invoice_list`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_invoice_list` (
`client` varchar(122)
,`form_of_address` varchar(4)
,`billing_address` varchar(159)
,`booking_date` datetime
,`id_booking` int(11)
,`invoice_no` varchar(20)
,`issue_date` datetime
,`pickup` datetime
,`return` datetime
,`days_of_usage` int(7)
,`invoice_amount` decimal(46,8)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_invoice_list_subquery`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_invoice_list_subquery` (
`client` varchar(122)
,`form_of_address` varchar(4)
,`billing_address` varchar(159)
,`booking_date` datetime
,`id_booking` int(11)
,`invoice_no` varchar(20)
,`issue_date` datetime
,`pickup` datetime
,`return` datetime
);

-- --------------------------------------------------------

--
-- Struktur des Views `v_car_list`
--
DROP TABLE IF EXISTS `v_car_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_car_list`  AS  (select `c`.`id_car` AS `id_car`,`cb`.`car_brand_name` AS `car_brand_name`,`ct`.`car_type_name` AS `car_type_name`,`ft`.`fuel_type_name` AS `fuel_type_name`,`pc`.`price_category_name` AS `price_category_name`,`c`.`colour` AS `colour`,`c`.`plate_no` AS `plate_no`,`c`.`inreg_date` AS `inreg_date` from ((((`car` `c` left join `car_brand` `cb` on((`c`.`id_car_brand` = `cb`.`id_car_brand`))) left join `car_type` `ct` on((`c`.`id_car_type` = `ct`.`id_car_type`))) left join `fuel_type` `ft` on((`c`.`id_fuel_type` = `ft`.`id_fuel_type`))) left join `price_category` `pc` on((`c`.`id_price_category` = `pc`.`id_price_category`))) where ((`c`.`b_inactive` = 0) and (`cb`.`b_inactive` = 0) and (`ct`.`b_inactive` = 0) and (`ft`.`b_inactive` = 0) and (`pc`.`b_inactive` = 0))) ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_invoice_list`
--
DROP TABLE IF EXISTS `v_invoice_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_list`  AS  (select `x`.`client` AS `client`,`x`.`form_of_address` AS `form_of_address`,`x`.`billing_address` AS `billing_address`,`x`.`booking_date` AS `booking_date`,`x`.`id_booking` AS `id_booking`,`x`.`invoice_no` AS `invoice_no`,`x`.`issue_date` AS `issue_date`,`x`.`pickup` AS `pickup`,`x`.`return` AS `return`,(to_days(`x`.`return`) - to_days(`x`.`pickup`)) AS `days_of_usage`,(((select sum((`ch`.`unitary_price` * ((100 - ifnull(`rbc`.`discount_rate`,0)) / 100))) from (`charge` `ch` left join `ref_booking_charge` `rbc` on((`rbc`.`id_charge` = `ch`.`id_charge`))) where ((`rbc`.`id_booking` = `x`.`id_booking`) and (not((`ch`.`charge_name` like 'Pickup%'))))) * (to_days(`x`.`return`) - to_days(`x`.`pickup`))) + ifnull((select sum((`ch`.`unitary_price` * ((100 - ifnull(`rbc`.`discount_rate`,0)) / 100))) from (`charge` `ch` left join `ref_booking_charge` `rbc` on((`rbc`.`id_charge` = `ch`.`id_charge`))) where ((`rbc`.`id_booking` = `x`.`id_booking`) and (`ch`.`charge_name` like 'Pickup%'))),0)) AS `invoice_amount` from `v_invoice_list_subquery` `x`) ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_invoice_list_subquery`
--
DROP TABLE IF EXISTS `v_invoice_list_subquery`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_invoice_list_subquery`  AS  (select concat(ucase(`p`.`last_name`),', ',`p`.`first_name`) AS `client`,(case `p`.`gender` when 0 then 'Frau' else 'Herr' end) AS `form_of_address`,concat(`c`.`country_code`,'-',`t`.`postal_code`,' ',`t`.`town_name`,', ',`s`.`street_name`,' ',`a`.`house_no`) AS `billing_address`,`b`.`booking_date` AS `booking_date`,`b`.`id_booking` AS `id_booking`,`i`.`invoice_no` AS `invoice_no`,`i`.`issue_date` AS `issue_date`,(select `tr`.`transfer_date_affected` from (`transfer` `tr` left join `ref_booking_transfer` `rbt` on((`rbt`.`id_transfer` = `tr`.`id_transfer`))) where ((`tr`.`id_transfer_type` = 1) and (`rbt`.`id_booking` = `b`.`id_booking`))) AS `pickup`,(select `tr`.`transfer_date_affected` from (`transfer` `tr` left join `ref_booking_transfer` `rbt` on((`rbt`.`id_transfer` = `tr`.`id_transfer`))) where ((`tr`.`id_transfer_type` = 2) and (`rbt`.`id_booking` = `b`.`id_booking`))) AS `return` from ((((((((`invoice` `i` left join `booking` `b` on((`b`.`id_booking` = `i`.`id_booking`))) left join `user_account` `ua` on((`ua`.`id_user` = `b`.`id_user`))) left join `person` `p` on((`p`.`id_person` = `ua`.`id_person`))) left join `billing_data` `bd` on((`bd`.`id_booking` = `b`.`id_booking`))) left join `address` `a` on((`a`.`id_address` = `bd`.`id_address`))) left join `street` `s` on((`s`.`id_street` = `a`.`id_street`))) left join `town` `t` on((`t`.`id_town` = `s`.`id_town`))) left join `country` `c` on((`c`.`id_country` = `t`.`id_country`))) where ((`i`.`b_inactive` = 0) and (`i`.`b_inactive` = 0) and (`b`.`b_inactive` = 0) and (`ua`.`b_inactive` = 0) and (`p`.`b_inactive` = 0) and (`a`.`b_inactive` = 0) and (`s`.`b_inactive` = 0) and (`t`.`b_inactive` = 0) and (`c`.`b_inactive` = 0))) ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `id_street` (`id_street`);

--
-- Indizes für die Tabelle `billing_data`
--
ALTER TABLE `billing_data`
  ADD PRIMARY KEY (`id_billing_data`),
  ADD KEY `id_booking` (`id_booking`),
  ADD KEY `id_address` (`id_address`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_car` (`id_car`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id_car`),
  ADD KEY `id_car_brand` (`id_car_brand`),
  ADD KEY `id_car_type` (`id_car_type`),
  ADD KEY `id_fuel_type` (`id_fuel_type`),
  ADD KEY `id_price_category` (`id_price_category`);

--
-- Indizes für die Tabelle `car_brand`
--
ALTER TABLE `car_brand`
  ADD PRIMARY KEY (`id_car_brand`);

--
-- Indizes für die Tabelle `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`id_car_type`);

--
-- Indizes für die Tabelle `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`id_charge`),
  ADD KEY `id_price_category` (`id_price_category`);

--
-- Indizes für die Tabelle `contact_type`
--
ALTER TABLE `contact_type`
  ADD PRIMARY KEY (`id_contact_type`);

--
-- Indizes für die Tabelle `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id_country`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id_driver`),
  ADD KEY `id_person` (`id_person`);

--
-- Indizes für die Tabelle `fuel_type`
--
ALTER TABLE `fuel_type`
  ADD PRIMARY KEY (`id_fuel_type`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `id_booking` (`id_booking`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `id_address` (`id_address`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_invoice` (`id_invoice`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id_person`);

--
-- Indizes für die Tabelle `price_category`
--
ALTER TABLE `price_category`
  ADD PRIMARY KEY (`id_price_category`);

--
-- Indizes für die Tabelle `ref_booking_charge`
--
ALTER TABLE `ref_booking_charge`
  ADD PRIMARY KEY (`id_ref_booking_charge`),
  ADD KEY `id_booking` (`id_booking`),
  ADD KEY `id_charge` (`id_charge`);

--
-- Indizes für die Tabelle `ref_booking_transfer`
--
ALTER TABLE `ref_booking_transfer`
  ADD PRIMARY KEY (`id_ref_booking_transfer`),
  ADD KEY `id_booking` (`id_booking`),
  ADD KEY `id_transfer` (`id_transfer`);

--
-- Indizes für die Tabelle `ref_person_address`
--
ALTER TABLE `ref_person_address`
  ADD PRIMARY KEY (`id_ref_person_address`),
  ADD KEY `id_person` (`id_person`),
  ADD KEY `id_address` (`id_address`);

--
-- Indizes für die Tabelle `ref_person_contact_type`
--
ALTER TABLE `ref_person_contact_type`
  ADD PRIMARY KEY (`id_ref_person_contact_type`),
  ADD KEY `id_person` (`id_person`),
  ADD KEY `id_contact_type` (`id_contact_type`);

--
-- Indizes für die Tabelle `street`
--
ALTER TABLE `street`
  ADD PRIMARY KEY (`id_street`),
  ADD KEY `id_town` (`id_town`);

--
-- Indizes für die Tabelle `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`id_town`),
  ADD KEY `id_country` (`id_country`);

--
-- Indizes für die Tabelle `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id_transfer`),
  ADD KEY `id_driver` (`id_driver`),
  ADD KEY `id_location` (`id_location`),
  ADD KEY `id_transfer_type` (`id_transfer_type`);

--
-- Indizes für die Tabelle `transfer_type`
--
ALTER TABLE `transfer_type`
  ADD PRIMARY KEY (`id_transfer_type`);

--
-- Indizes für die Tabelle `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `id_person` (`id_person`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `billing_data`
--
ALTER TABLE `billing_data`
  MODIFY `id_billing_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `car_brand`
--
ALTER TABLE `car_brand`
  MODIFY `id_car_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `car_type`
--
ALTER TABLE `car_type`
  MODIFY `id_car_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `charge`
--
ALTER TABLE `charge`
  MODIFY `id_charge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `contact_type`
--
ALTER TABLE `contact_type`
  MODIFY `id_contact_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `country`
--
ALTER TABLE `country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `driver`
--
ALTER TABLE `driver`
  MODIFY `id_driver` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `fuel_type`
--
ALTER TABLE `fuel_type`
  MODIFY `id_fuel_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `id_person` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `price_category`
--
ALTER TABLE `price_category`
  MODIFY `id_price_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `ref_booking_charge`
--
ALTER TABLE `ref_booking_charge`
  MODIFY `id_ref_booking_charge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `ref_booking_transfer`
--
ALTER TABLE `ref_booking_transfer`
  MODIFY `id_ref_booking_transfer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `ref_person_address`
--
ALTER TABLE `ref_person_address`
  MODIFY `id_ref_person_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `ref_person_contact_type`
--
ALTER TABLE `ref_person_contact_type`
  MODIFY `id_ref_person_contact_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `street`
--
ALTER TABLE `street`
  MODIFY `id_street` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `town`
--
ALTER TABLE `town`
  MODIFY `id_town` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT für Tabelle `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id_transfer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `transfer_type`
--
ALTER TABLE `transfer_type`
  MODIFY `id_transfer_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `user_account`
--
ALTER TABLE `user_account`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id_street`) REFERENCES `street` (`id_street`);

--
-- Constraints der Tabelle `billing_data`
--
ALTER TABLE `billing_data`
  ADD CONSTRAINT `billing_data_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`),
  ADD CONSTRAINT `billing_data_ibfk_2` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_account` (`id_user`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_car`) REFERENCES `car` (`id_car`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`id_car_brand`) REFERENCES `car_brand` (`id_car_brand`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`),
  ADD CONSTRAINT `car_ibfk_3` FOREIGN KEY (`id_fuel_type`) REFERENCES `fuel_type` (`id_fuel_type`),
  ADD CONSTRAINT `car_ibfk_4` FOREIGN KEY (`id_price_category`) REFERENCES `price_category` (`id_price_category`);

--
-- Constraints der Tabelle `charge`
--
ALTER TABLE `charge`
  ADD CONSTRAINT `charge_ibfk_1` FOREIGN KEY (`id_price_category`) REFERENCES `price_category` (`id_price_category`);

--
-- Constraints der Tabelle `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`);

--
-- Constraints der Tabelle `ref_booking_charge`
--
ALTER TABLE `ref_booking_charge`
  ADD CONSTRAINT `ref_booking_charge_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`),
  ADD CONSTRAINT `ref_booking_charge_ibfk_2` FOREIGN KEY (`id_charge`) REFERENCES `charge` (`id_charge`);

--
-- Constraints der Tabelle `ref_booking_transfer`
--
ALTER TABLE `ref_booking_transfer`
  ADD CONSTRAINT `ref_booking_transfer_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`),
  ADD CONSTRAINT `ref_booking_transfer_ibfk_2` FOREIGN KEY (`id_transfer`) REFERENCES `transfer` (`id_transfer`);

--
-- Constraints der Tabelle `ref_person_address`
--
ALTER TABLE `ref_person_address`
  ADD CONSTRAINT `ref_person_address_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`),
  ADD CONSTRAINT `ref_person_address_ibfk_2` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

--
-- Constraints der Tabelle `ref_person_contact_type`
--
ALTER TABLE `ref_person_contact_type`
  ADD CONSTRAINT `ref_person_contact_type_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`),
  ADD CONSTRAINT `ref_person_contact_type_ibfk_2` FOREIGN KEY (`id_contact_type`) REFERENCES `contact_type` (`id_contact_type`);

--
-- Constraints der Tabelle `street`
--
ALTER TABLE `street`
  ADD CONSTRAINT `street_ibfk_1` FOREIGN KEY (`id_town`) REFERENCES `town` (`id_town`);

--
-- Constraints der Tabelle `town`
--
ALTER TABLE `town`
  ADD CONSTRAINT `town_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`);

--
-- Constraints der Tabelle `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`id_driver`) REFERENCES `driver` (`id_driver`),
  ADD CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`),
  ADD CONSTRAINT `transfer_ibfk_3` FOREIGN KEY (`id_transfer_type`) REFERENCES `transfer_type` (`id_transfer_type`);

--
-- Constraints der Tabelle `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

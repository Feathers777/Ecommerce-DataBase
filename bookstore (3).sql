-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2022 at 03:23 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_ID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Street` varchar(40) NOT NULL,
  `City` varchar(40) NOT NULL,
  `Postcode` varchar(20) DEFAULT NULL,
  `Phone` varchar(11) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Postcode` (`Postcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `FirstName`, `LastName`, `Street`, `City`, `Postcode`, `Phone`) VALUES
(1, 'Alex', 'Doherty', '25 Richmond Crescent', 'Derry', 'BT78 T', '07730498876'),
(2, 'Cormac', 'Duffy', '15 Everglade Rode', 'Derry', 'BT78 V', '07734459851'),
(3, 'Owen', 'Kelly', '1 Medow Bank', 'Derry', 'BT78 R', '07713436334'),
(4, 'Ross', 'Connolly', '19 Crescent Road', 'Derry', 'BT78 C', '07707362116'),
(5, 'Ryan', 'Featherstone', '67 Creggan Road', 'Derry', 'BT78 D', '07730498874');

-- --------------------------------------------------------

--
-- Table structure for table `ordering_system`
--

DROP TABLE IF EXISTS `ordering_system`;
CREATE TABLE IF NOT EXISTS `ordering_system` (
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` varchar(11) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Postcode` varchar(11) NOT NULL,
  `Ship_date` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordering_system`
--

INSERT INTO `ordering_system` (`Customer_ID`, `Product_ID`, `City`, `Postcode`, `Ship_date`, `Quantity`) VALUES
(1, '3001', 'Derry', 'BT78 T', '14/04/2022', '100'),
(2, '3002', 'Derry', 'BT78 V', '18/04/2022', '7'),
(3, '3003', 'Derry', 'BT78 R', '18/04/2022', '2'),
(4, '3004', 'Derry', 'BT78 C', '16/04/2022', '1'),
(5, '3005', 'Derry', 'BT78 D', '15/04/2022', '5');

-- --------------------------------------------------------

--
-- Table structure for table `order_c`
--

DROP TABLE IF EXISTS `order_c`;
CREATE TABLE IF NOT EXISTS `order_c` (
  `Order_Number` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Customer_Name` varchar(11) NOT NULL,
  `To_street` varchar(40) NOT NULL,
  `To_city` varchar(20) NOT NULL,
  `To_Postcode` varchar(11) NOT NULL,
  `To_Phone` varchar(11) NOT NULL,
  `Ship_date` varchar(11) NOT NULL,
  `Category` varchar(20) NOT NULL,
  PRIMARY KEY (`Order_Number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_c`
--

INSERT INTO `order_c` (`Order_Number`, `Customer_ID`, `Customer_Name`, `To_street`, `To_city`, `To_Postcode`, `To_Phone`, `Ship_date`, `Category`) VALUES
(1, 1, 'Alex', '25 Richmond Crescent', 'Derry', 'BT78 T', '07730498874', '14/04/2022', 'horror'),
(2, 2, 'Cormac', '15 Everglade Rode', 'Derry', 'BT78 V', '07734459851', '18/04/2022', 'comedy'),
(3, 3, 'wen', '1 Medow Bank', 'Derry', 'BT78 R', '07713436334', '18/04/2022', 'sify'),
(4, 4, 'Ross', '19 Crescent Road', 'Derry', 'BT78 C', '07707362116', '16/04/2022', 'horror'),
(5, 5, 'Ryan', '67 Creggan Road', 'Derry', 'BT78 D', '07730498874', '15/04/2022', 'action');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` varchar(11) NOT NULL,
  `Payment_Type` varchar(11) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Customer_ID`, `Product_ID`, `Payment_Type`) VALUES
(1, '3001', 'Book'),
(2, '3002', 'Book'),
(3, '3003', 'Book'),
(4, '3004', 'Book'),
(5, '3005', 'Book');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Product_ID` int(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Author_ID` varchar(11) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Quantity`, `Author_ID`) VALUES
(3001, '100', '3363'),
(3002, '7', '3363'),
(3003, '2', '3363'),
(3004, '1', '3363'),
(3005, '5', '3363');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `Product_ID` int(11) NOT NULL,
  `Category` varchar(10) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`Product_ID`, `Category`) VALUES
(3001, 'horror'),
(3002, 'comedy');

-- --------------------------------------------------------

--
-- Table structure for table `reviews_of_books`
--

DROP TABLE IF EXISTS `reviews_of_books`;
CREATE TABLE IF NOT EXISTS `reviews_of_books` (
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` varchar(11) NOT NULL,
  `Rating` varchar(11) NOT NULL,
  `Field` varchar(11) NOT NULL,
  `Review` varchar(200) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `Customer_ID` (`Customer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews_of_books`
--

INSERT INTO `reviews_of_books` (`Customer_ID`, `Product_ID`, `Rating`, `Field`, `Review`) VALUES
(1, '3001', '1.000000000', 'horror', 'something about how good the book is'),
(2, '3002', '1.000000000', 'comedy', 'something about how funny the book is'),
(3, '3003', '0.400000000', 'sify', 'something about how medeoicer the book is'),
(4, '3004', '1.000000000', 'horror', 'something about how good the book is'),
(5, '3005', '0.200000000', 'action', 'something about how bad the book is');

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
CREATE TABLE IF NOT EXISTS `shipment` (
  `Shipment_ID` int(11) NOT NULL,
  `Product_ID` varchar(11) NOT NULL,
  `Shipment_date` varchar(11) NOT NULL,
  `Shipment_tracking_number` varchar(20) NOT NULL,
  PRIMARY KEY (`Shipment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`Shipment_ID`, `Product_ID`, `Shipment_date`, `Shipment_tracking_number`) VALUES
(6013, '3001', '14/04/2022', '222'),
(6014, '3002', '18/04/2022', '223'),
(6015, '3003', '18/04/2022', '224'),
(6016, '3004', '16/04/2022', '225'),
(6017, '3005', '15/04/2022', '226');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
CREATE TABLE IF NOT EXISTS `shipment_items` (
  `Shipment_ID` int(11) NOT NULL,
  `Product_ID` varchar(11) NOT NULL,
  PRIMARY KEY (`Shipment_ID`),
  KEY `Product_ID` (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipment_items`
--

INSERT INTO `shipment_items` (`Shipment_ID`, `Product_ID`) VALUES
(6013, '3001'),
(6014, '3002'),
(6015, '3003'),
(6016, '3004'),
(6017, '3005');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Quantity` varchar(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`Quantity`, `Product_ID`) VALUES
('100', 3001),
('7', 3002),
('2', 3003),
('1', 3004),
('5', 3005);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

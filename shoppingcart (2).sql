-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2017 at 06:16 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `Category` varchar(30) NOT NULL,
  `Definition` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `Category`, `Definition`) VALUES
(1, 'Cleaning Products', 'Household cleaning materials'),
(2, 'Food', 'Comestible items'),
(3, 'Appliances', 'Electrically or Mechanically actuated objects used for any purpose'),
(4, 'Clothing', 'Wearable items'),
(5, 'Miscellaneous', 'A category for any item not otherwise categorized'),
(6, 'Jewelry', 'Adornments, usually fashioned of precious or semi-precious metals and stones'),
(7, 'Produce', 'Fresh grown vegetables or fruit');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`) VALUES
(1, 1, 19, 1),
(2, 3, 10, 2),
(3, 3, 11, 3),
(4, 2, 1, 1),
(5, 2, 2, 1),
(6, 3, 13, 1),
(7, 3, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`) VALUES
(1, 5),
(3, 5),
(4, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `productcategories`
--

CREATE TABLE `productcategories` (
  `ProductCategoryID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productcategories`
--

INSERT INTO `productcategories` (`ProductCategoryID`, `CategoryID`, `ProductID`) VALUES
(1, 5, 19),
(2, 4, 19),
(3, 1, 1),
(4, 1, 2),
(5, 1, 3),
(6, 1, 4),
(7, 1, 5),
(8, 1, 6),
(9, 1, 7),
(10, 1, 8),
(11, 1, 9),
(12, 2, 10),
(13, 2, 11),
(14, 2, 12),
(15, 3, 13),
(16, 3, 14),
(17, 3, 15),
(18, 4, 16),
(19, 4, 17),
(20, 4, 18),
(21, 5, 19),
(22, 6, 19);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` varchar(20) NOT NULL,
  `Stock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Description`, `Price`, `Stock`) VALUES
(1, 'Bar Soap', 'Plain bar of hand soap', '$1.00', 2000),
(2, 'Liquid Soap', 'Liquid hand soap', '$2.00', 3000),
(3, 'Laundry Detergent', 'Cleaning product for clothes', '$3.50', 1500),
(4, 'Cleaning Sponge', 'Reuseable Sponge for debridement', '$0.50', 2500),
(5, 'Mop', 'Long handled cleaning  mop', '$5.00', 800),
(6, 'Shaving Soap', 'High-quality soap for luxury shaving', '$6.99', 240),
(7, 'Mouthwash', 'Alcohol-based oral hygiene product', '$2.59', 850),
(8, 'Toilet Paper', 'Personal hygiene paper', '$0.10', 50000),
(9, 'Deodorizing Spray', 'Atomizer bottle with deodorizing liquid', '$2.50', 670),
(10, 'Apples', 'Apples by the bushel', '$8.00', 400),
(11, 'Cake', 'Delicious confectionary', '$15.00', 120),
(12, 'Rice', 'Rice in 1 pound bags', '$3.00', 2000),
(13, 'Smart Phones', 'they are phones, that are smart', '$200.00', 700),
(14, 'Flat Screen TVs', 'The better kind of TVs', '$599.99', 200),
(15, 'Dishwasher', 'A labour saving dishwashing machine', '$169.99', 70),
(16, 'Tshirts', 'A common piece of upper body apparel', '$19.99', 1450),
(17, 'Khaki Pants', 'Classy khakis', '$29.99', 660),
(18, 'Swimming Suits', 'Raiment of summer fun', '15.99', 230),
(19, 'The One Ring', 'My precious', 'Free... or is it?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `useraddresses`
--

CREATE TABLE `useraddresses` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Address1` varchar(255) NOT NULL,
  `Address2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraddresses`
--

INSERT INTO `useraddresses` (`AddressID`, `UserID`, `Address1`, `Address2`) VALUES
(1, 5, 'Bag End on Bagshot Row, Hobbiton', 'The Shire'),
(2, 6, '3 Bagshot Row, Hobbiton', 'The Shire'),
(9, 30, 'Bag End on Bagshot Row, Hobbiton', 'The Shire');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Name`) VALUES
(5, 'Frodo Baggins'),
(6, 'Samwise Gamgee'),
(30, 'Bilbo Baggins');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `OrderItem` (`ProductID`),
  ADD KEY `fk_Order_ID` (`OrderID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `productcategories`
--
ALTER TABLE `productcategories`
  ADD PRIMARY KEY (`ProductCategoryID`),
  ADD KEY `fk_Product_ID` (`ProductID`),
  ADD KEY `fk_Category_ID` (`CategoryID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `useraddresses`
--
ALTER TABLE `useraddresses`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `fk_user_ID` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `productcategories`
--
ALTER TABLE `productcategories`
  MODIFY `ProductCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `useraddresses`
--
ALTER TABLE `useraddresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `fk_Order_ID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `fk_Product_ID` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `productcategories`
--
ALTER TABLE `productcategories`
  ADD CONSTRAINT `fk_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
  ADD CONSTRAINT `fk_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `useraddresses`
--
ALTER TABLE `useraddresses`
  ADD CONSTRAINT `fk_user_ID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

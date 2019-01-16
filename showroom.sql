-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema show_room
--

CREATE DATABASE IF NOT EXISTS show_room;
USE show_room;

--
-- Definition of table `billingaddress`
--

DROP TABLE IF EXISTS `billingaddress`;
CREATE TABLE `billingaddress` (
  `addressid` int(10) unsigned NOT NULL auto_increment,
  `addresslineone` varchar(255) default NULL,
  `addresslinetwo` varchar(255) default NULL,
  `country` varchar(45) default NULL,
  `city` varchar(45) default NULL,
  `statename` varchar(45) default NULL,
  `emailid` varchar(45) default NULL,
  `phone` varchar(45) default NULL,
  PRIMARY KEY  (`addressid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billingaddress`
--

/*!40000 ALTER TABLE `billingaddress` DISABLE KEYS */;
INSERT INTO `billingaddress` (`addressid`,`addresslineone`,`addresslinetwo`,`country`,`city`,`statename`,`emailid`,`phone`) VALUES 
 (2,'asfg','asfdf','dfgfj','juhg','hhrtg','rezoana@gmail.com','01731981292'),
 (3,'Mirpur','Dhaka','Bangladesh','Dhaka','Dhaka','rabib@gmail.com','01717876265');
/*!40000 ALTER TABLE `billingaddress` ENABLE KEYS */;


--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `catid` varchar(255) NOT NULL,
  `catname` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`catid`,`catname`,`description`) VALUES 
 ('001','Saree','Formal Dress'),
 ('0010','Maxi','Maxi Dress'),
 ('0011','Frocks','Long frocks designs bridal party dress'),
 ('002','Salwar kameez','Western Dress'),
 ('003','Lawn Kameez','Formal Dress'),
 ('004','Gowns','Party Wear Gowns'),
 ('005','Kurti','Designer Kurtis'),
 ('006','Lehenga','Wedding Lehenga'),
 ('007','Churidar','Cotton Churidar Designer Suit'),
 ('008','Skirt','Elegant Fancy Flower Print Skirt '),
 ('009','Punjabi','Cotton Punjabi Suits');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `empattend`
--

DROP TABLE IF EXISTS `empattend`;
CREATE TABLE `empattend` (
  `empattendid` int(10) unsigned NOT NULL auto_increment,
  `arivaltime` varchar(45) default NULL,
  `attenddate` date default NULL,
  `departuretime` varchar(45) default NULL,
  `empid` int(10) unsigned default NULL,
  `overtime` varchar(45) default NULL,
  `offday` varchar(45) default NULL,
  `enddate` date default NULL,
  PRIMARY KEY  (`empattendid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empattend`
--

/*!40000 ALTER TABLE `empattend` DISABLE KEYS */;
INSERT INTO `empattend` (`empattendid`,`arivaltime`,`attenddate`,`departuretime`,`empid`,`overtime`,`offday`,`enddate`) VALUES 
 (1,'9:10','2018-11-29','5:00',101,'2','3','0027-06-10'),
 (2,'9:00','2018-12-08','5.00',102,'3 hour','2','2018-12-08'),
 (3,'9:05','2018-12-08','5:10',103,'2 hour','2','2018-12-08'),
 (4,'9:10','2019-01-04','5:10',111,'2 hour','4','2019-01-10');
/*!40000 ALTER TABLE `empattend` ENABLE KEYS */;


--
-- Definition of table `employeeinfo`
--

DROP TABLE IF EXISTS `employeeinfo`;
CREATE TABLE `employeeinfo` (
  `empid` int(10) unsigned NOT NULL auto_increment,
  `empaddress` varchar(255) default NULL,
  `empgender` varchar(255) default NULL,
  `empmail` varchar(255) default NULL,
  `empname` varchar(255) default NULL,
  `empnid` varchar(255) default NULL,
  `empphone` varchar(255) default NULL,
  PRIMARY KEY  (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeeinfo`
--

/*!40000 ALTER TABLE `employeeinfo` DISABLE KEYS */;
INSERT INTO `employeeinfo` (`empid`,`empaddress`,`empgender`,`empmail`,`empname`,`empnid`,`empphone`) VALUES 
 (101,'Dhaka','Male','rabib@gmail.com','Md. Rabib','7854156325698741','01717894512'),
 (102,'Bogura','Female','tabia@gmail.com',' Tanha Tabia','012547896325413','01717236843'),
 (103,'Gobindogonj, Gaibandha','Male','jaeem@gmail.com','Md. Jaeem Rahman','78965412365','01712029554'),
 (104,'Gobindogonj, Gaibandha','Female','jarin@gmail.com','Jarin Tasniya','852147632569','01712784512'),
 (105,'Mirpur, Dhaka','Male','abrar@gmail.com','Md. Al-Abrar','012547896325413','01717876265'),
 (106,'Shajjatpur, Shirajgonj','Female','prithul@gmail.com','Prithul ','7854156325698741','01718963214'),
 (107,'Thonthoniya, Bogura','Male','rafi@gmail.com','Md.Rafiu Rahman','859632156974','01717954101'),
 (108,'Kajipara, Dhaka','Female','nirjhira@gmail.com','Miss Nirjhira','7854156325698741','01717954114'),
 (109,'Shenpara, Dhaka','Male','jonaed@gmail.com','Md. Jonaed Ahmed','365214789662','01717896532'),
 (110,'Shobujbag, Bogura','Female','jubaida@gmail.com','Jubaida Alam','78965412365','01712908117'),
 (111,'Jahurul Nagar, Bogura','Female','rezoana@gmai.com','Rezoana Sarker','012254782204180','01731981292');
/*!40000 ALTER TABLE `employeeinfo` ENABLE KEYS */;


--
-- Definition of table `empsalary`
--

DROP TABLE IF EXISTS `empsalary`;
CREATE TABLE `empsalary` (
  `salaryid` int(10) unsigned NOT NULL auto_increment,
  `basicsalary` double default NULL,
  `empattendid` int(10) unsigned default NULL,
  `empid` int(10) unsigned default NULL,
  `incentives` double default NULL,
  `overtimepayment` double default NULL,
  `salarydate` date default NULL,
  `total` double default NULL,
  PRIMARY KEY  (`salaryid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empsalary`
--

/*!40000 ALTER TABLE `empsalary` DISABLE KEYS */;
INSERT INTO `empsalary` (`salaryid`,`basicsalary`,`empattendid`,`empid`,`incentives`,`overtimepayment`,`salarydate`,`total`) VALUES 
 (1,10000,1,101,2496,2000,'2018-12-06',14496),
 (2,8000,1,102,2000,1500,'2018-12-11',11500),
 (3,12000,3,104,2500,3000,'2018-12-28',17500),
 (4,10000,3,105,2500,3000,'2019-01-25',15500),
 (7,12000,2,106,2000,3000,'2019-01-25',17000);
/*!40000 ALTER TABLE `empsalary` ENABLE KEYS */;


--
-- Definition of table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `ordetailid` int(10) unsigned NOT NULL auto_increment,
  `orderid` int(10) unsigned default NULL,
  `productid` int(10) unsigned default NULL,
  `quantity` int(10) unsigned default NULL,
  `price` double default NULL,
  `size` varchar(45) default NULL,
  `color` varchar(45) default NULL,
  PRIMARY KEY  (`ordetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetails`
--

/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` (`ordetailid`,`orderid`,`productid`,`quantity`,`price`,`size`,`color`) VALUES 
 (1,1,2,1,2100,NULL,NULL),
 (2,1,3,1,1700,NULL,NULL),
 (3,2,3,1,1700,NULL,NULL),
 (4,2,2,1,2100,NULL,NULL),
 (5,3,2,1,2100,NULL,NULL),
 (6,5,3,1,1700,NULL,NULL),
 (7,6,3,1,1700,NULL,NULL),
 (8,7,5,1,7000,NULL,NULL),
 (9,8,4,1,2800,NULL,NULL),
 (10,12,2,1,2100,NULL,NULL),
 (11,12,3,1,1700,NULL,NULL),
 (12,13,12,2,1400,NULL,NULL);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `paymentid` int(10) unsigned NOT NULL auto_increment,
  `amount` double default NULL,
  `paydate` date default NULL,
  `purchaseid` int(10) unsigned default NULL,
  `remarks` varchar(45) default NULL,
  `user` varchar(45) default NULL,
  `supplierid` int(10) unsigned default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`paymentid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`paymentid`,`amount`,`paydate`,`purchaseid`,`remarks`,`user`,`supplierid`,`status`) VALUES 
 (1,20000,'2018-12-07',2,'Cash',NULL,101,'payment success'),
 (2,10000,'2019-01-03',3,'Cash','rabib@gmail.com',102,'payment success'),
 (3,12750,'2019-01-11',4,'Cheek','rabib@gmail.com',101,'payment success'),
 (4,2550,'2019-01-18',5,'Cash','rabib@gmail.com',102,'payment success'),
 (5,29500,'2019-01-23',18,'Cheek','ramy@gmail.com',105,'payment success');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(10) unsigned NOT NULL auto_increment,
  `catid` varchar(255) default NULL,
  `supplierid` varchar(255) default NULL,
  `productname` varchar(255) default NULL,
  `productprice` double default NULL,
  `productquantity` int(10) unsigned default NULL,
  `productdescription` varchar(255) default NULL,
  `purchasedate` date default NULL,
  `saleprice` double default NULL,
  PRIMARY KEY  (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`productid`,`catid`,`supplierid`,`productname`,`productprice`,`productquantity`,`productdescription`,`purchasedate`,`saleprice`) VALUES 
 (2,'001','106','Saree',5000,25,'Pakisthani','2018-11-29',6500),
 (3,'002','105','Salwar-Kameez',1500,18,'Western','2018-12-12',1700),
 (4,'002','103','Salwar Kameez',2500,6,'Anarkali Suits','2018-12-13',2800),
 (8,'004','101','Gawon',5000,25,'Party Wear Gawon','2018-11-26',7000),
 (9,'005','102','Kurti',1800,25,'Designer Kurtis','2018-11-26',2200),
 (10,'001','106','Saree',4000,30,'Silk Banarasi saree with un-stiched blouse ','2019-01-07',5000),
 (11,'006','103','Lehenga',10000,30,'Silk-Embroidered-Party-Wedding-Wear-Lehenga','2018-11-27',12000),
 (12,'007','106','Churidar',3200,46,'Cotton Churidar Designer Suit','2019-01-03',4000),
 (13,'008','105','Skirt',2500,37,'Fancy Flower Print Skirt','2019-01-05',3000),
 (14,'009','105','Punjabi',2500,48,'Ladies Punjabi Suit','2019-01-10',3000),
 (15,'0010','104','Maxi',850,25,'Cotton Printed Maxi','2019-01-13',1200),
 (16,'0011','105','Frocks',7000,23,'Long frocks  bridal party dress','2019-01-15',8500);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `product_sale`
--

DROP TABLE IF EXISTS `product_sale`;
CREATE TABLE `product_sale` (
  `sale_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL,
  `show_id` int(10) unsigned NOT NULL,
  `sale_date` date NOT NULL,
  PRIMARY KEY  (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_sale`
--

/*!40000 ALTER TABLE `product_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sale` ENABLE KEYS */;


--
-- Definition of table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
CREATE TABLE `productorder` (
  `orderid` int(10) unsigned NOT NULL auto_increment,
  `orderdate` date default NULL,
  `useremail` varchar(45) default NULL,
  `orderstatus` varchar(45) default NULL,
  `addressid` int(10) unsigned default NULL,
  PRIMARY KEY  (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productorder`
--

/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` (`orderid`,`orderdate`,`useremail`,`orderstatus`,`addressid`) VALUES 
 (1,'2018-12-09','rezoana@gmail.com','ordered',2),
 (2,'2018-12-10','rezoana@gmail.com','ordered',2),
 (3,'2018-12-22','rabib@gmail.com','ordered',3),
 (4,'2018-12-22','rabib@gmail.com','ordered',3),
 (5,'2018-12-23','rabib@gmail.com','ordered',3),
 (6,'2018-12-23','rabib@gmail.com','ordered',3),
 (7,'2018-12-25','rezoana@gmail.com','ordered',2),
 (8,'2018-12-30','rezoana@gmail.com','ordered',2),
 (9,'2018-12-30','rezoana@gmail.com','ordered',2),
 (10,'2018-12-30','rezoana@gmail.com','ordered',2),
 (11,'2018-12-30','rezoana@gmail.com','ordered',2),
 (12,'2018-12-30','rezoana@gmail.com','ordered',2),
 (13,'2019-01-02','rezoana@gmail.com','ordered',2),
 (14,'2019-01-02','rezoana@gmail.com','ordered',2);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;


--
-- Definition of table `productsale`
--

DROP TABLE IF EXISTS `productsale`;
CREATE TABLE `productsale` (
  `psaleid` int(10) unsigned NOT NULL auto_increment,
  `orderid` int(10) unsigned default NULL,
  `deleverydate` date default NULL,
  `salestatus` varchar(45) default NULL,
  PRIMARY KEY  (`psaleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productsale`
--

/*!40000 ALTER TABLE `productsale` DISABLE KEYS */;
INSERT INTO `productsale` (`psaleid`,`orderid`,`deleverydate`,`salestatus`) VALUES 
 (1,1,'2018-12-31','Delivered'),
 (2,2,'2019-01-01','Delivered'),
 (3,1,'2019-01-04','Delivered'),
 (4,7,'2019-01-04','Delivered'),
 (5,8,'2019-01-04','Delivered');
/*!40000 ALTER TABLE `productsale` ENABLE KEYS */;


--
-- Definition of table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `purchaseid` int(10) unsigned NOT NULL auto_increment,
  `admin` varchar(45) default NULL,
  `billtotal` double default NULL,
  `date` date default NULL,
  `status` varchar(45) default NULL,
  `supplierid` int(10) unsigned default NULL,
  PRIMARY KEY  (`purchaseid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`purchaseid`,`admin`,`billtotal`,`date`,`status`,`supplierid`) VALUES 
 (1,'rabib@gmail.com',2100,'2018-12-25','purchase',102),
 (2,'rabib@gmail.com',20000,'2018-12-25','purchase',101),
 (3,'rabib@gmail.com',10000,'2018-12-20','purchase',102),
 (4,'rabib@gmail.com',12750,'2018-12-31','purchase',101),
 (5,'rabib@gmail.com',2550,'2018-12-26','purchase',102),
 (6,'rabib@gmail.com',3500,'2018-12-31','purchase',103),
 (7,'rabib@gmail.com',1250,'2018-12-27','purchase',102),
 (8,NULL,1250,'2018-12-27','purchase',102),
 (9,'rabib@gmail.com',3500,'2018-12-13','purchase',101),
 (10,'rabib@gmail.com',800,'2018-12-02','purchase',101),
 (11,'rabib@gmail.com',3000,'2018-12-04','purchase',102),
 (12,'rezoana@gmail.com',37500,'2018-12-24','purchase',102),
 (13,'rezoana@gmail.com',25000,'2018-12-24','purchase',102),
 (14,'asd@gmail.com',49500,'2019-01-24','purchase',106),
 (15,'asd@gmail.com',27000,'2019-01-24','purchase',105),
 (16,'asd@gmail.com',10000,'2019-01-24','purchase',102),
 (17,'ramy@gmail.com',41800,'2019-01-17','purchase',106),
 (18,'ramy@gmail.com',29500,'2019-01-18','purchase',105),
 (19,'ramy@gmail.com',13250,'2019-01-14','purchase',101);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;


--
-- Definition of table `purchasedetail`
--

DROP TABLE IF EXISTS `purchasedetail`;
CREATE TABLE `purchasedetail` (
  `purchasedetailid` int(10) unsigned NOT NULL auto_increment,
  `price` double default NULL,
  `productid` int(10) unsigned default NULL,
  `purchaseid` int(10) unsigned default NULL,
  `quantity` int(10) unsigned default NULL,
  PRIMARY KEY  (`purchasedetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchasedetail`
--

/*!40000 ALTER TABLE `purchasedetail` DISABLE KEYS */;
INSERT INTO `purchasedetail` (`purchasedetailid`,`price`,`productid`,`purchaseid`,`quantity`) VALUES 
 (1,5000,2,1,5),
 (2,10,5,2,2000),
 (3,1000,2,3,10),
 (4,850,4,4,15),
 (5,850,4,5,3),
 (6,700,2,6,5),
 (7,250,4,7,5),
 (8,700,2,9,5),
 (9,400,2,10,2),
 (10,600,4,11,5),
 (11,2500,5,12,15),
 (12,2500,5,13,10),
 (13,3500,11,14,5),
 (14,4000,8,14,8),
 (15,1500,2,15,10),
 (16,1200,4,15,10),
 (17,2000,8,16,5),
 (18,7000,16,17,5),
 (19,850,15,17,8),
 (20,2500,13,18,5),
 (21,2000,14,18,5),
 (22,1000,15,18,7),
 (23,1800,9,19,5),
 (24,850,15,19,5);
/*!40000 ALTER TABLE `purchasedetail` ENABLE KEYS */;


--
-- Definition of table `receivepayment`
--

DROP TABLE IF EXISTS `receivepayment`;
CREATE TABLE `receivepayment` (
  `receiveid` int(10) unsigned NOT NULL auto_increment,
  `amount` double default NULL,
  `showroomid` int(10) unsigned default NULL,
  `date` date default NULL,
  `remarks` varchar(45) default NULL,
  `saleid` int(10) unsigned default NULL,
  `user` varchar(45) default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`receiveid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receivepayment`
--

/*!40000 ALTER TABLE `receivepayment` DISABLE KEYS */;
INSERT INTO `receivepayment` (`receiveid`,`amount`,`showroomid`,`date`,`remarks`,`saleid`,`user`,`status`) VALUES 
 (2,3594,102,'2018-11-29','Cash',3,NULL,'Receive Success'),
 (3,1500,103,'2019-01-17','Cheek',5,'rabib@gmail.com','Receive Success'),
 (4,3250,103,'2019-01-09','Cash',2,NULL,'Receive Success'),
 (5,1600,103,'2019-01-09','Cheek',4,'rabib@gmail.com','Receive Success'),
 (6,16000,501,'2019-01-09','Cash',13,'asd@gmail.com','Receive Success'),
 (7,11000,506,'2019-01-30','Cheek',15,'ramy@gmail.com','Receive Success');
/*!40000 ALTER TABLE `receivepayment` ENABLE KEYS */;


--
-- Definition of table `sale`
--

DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `saleid` int(10) unsigned NOT NULL auto_increment,
  `admin` varchar(45) default NULL,
  `billtotal` double default NULL,
  `showroomid` int(10) unsigned default NULL,
  `saledate` date default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`saleid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` (`saleid`,`admin`,`billtotal`,`showroomid`,`saledate`,`status`) VALUES 
 (1,'rabib@gmail.com',3000,101,'2018-12-27','Sale'),
 (2,'rabib@gmail.com',3250,103,'2018-12-25','Sale'),
 (3,'rabib@gmail.com',3594,102,'2018-12-26','Sale'),
 (4,'rabib@gmail.com',1600,103,'2018-12-03','Sale'),
 (5,'rabib@gmail.com',1500,103,'2018-12-25','Sale'),
 (6,'rabib@gmail.com',12000,102,'2018-12-16','Sale'),
 (7,'rabib@gmail.com',6000,103,'2018-12-25','Sale'),
 (8,'rezoana@gmail.com',15000,103,'2018-12-25','Sale'),
 (9,'rezoana@gmail.com',3600,104,'2019-01-24','Sale'),
 (10,'rezoana@gmail.com',2800,102,'2019-01-24','Sale'),
 (11,'rezoana@gmail.com',2800,102,'2019-01-31','Sale'),
 (12,'asd@gmail.com',11000,105,'2019-01-25','Sale'),
 (13,'asd@gmail.com',16000,501,'2019-01-24','Sale'),
 (14,'asd@gmail.com',15000,506,'2019-01-31','Sale'),
 (15,'ramy@gmail.com',11000,506,'2019-01-19','Sale'),
 (16,'ramy@gmail.com',36400,502,'2019-01-24','Sale');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;


--
-- Definition of table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
CREATE TABLE `sale_details` (
  `sale_details_id` int(10) unsigned NOT NULL auto_increment,
  `sale_id` int(10) unsigned NOT NULL,
  `sale_qty` int(10) unsigned NOT NULL,
  `sale_price` double NOT NULL,
  PRIMARY KEY  (`sale_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_details`
--

/*!40000 ALTER TABLE `sale_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_details` ENABLE KEYS */;


--
-- Definition of table `saledetail`
--

DROP TABLE IF EXISTS `saledetail`;
CREATE TABLE `saledetail` (
  `saledetailid` int(10) unsigned NOT NULL auto_increment,
  `price` double default NULL,
  `productid` int(10) unsigned default NULL,
  `quantity` int(10) unsigned default NULL,
  `saleid` int(10) unsigned default NULL,
  PRIMARY KEY  (`saledetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saledetail`
--

/*!40000 ALTER TABLE `saledetail` DISABLE KEYS */;
INSERT INTO `saledetail` (`saledetailid`,`price`,`productid`,`quantity`,`saleid`) VALUES 
 (1,1000,2,3,1),
 (2,650,3,5,2),
 (3,1198,3,3,3),
 (4,800,2,2,4),
 (5,300,2,5,5),
 (6,1200,2,10,6),
 (7,1200,2,5,7),
 (8,3000,5,5,8),
 (9,1200,9,3,9),
 (10,1400,9,2,10),
 (11,1400,9,2,11),
 (12,4000,11,2,12),
 (13,1500,3,2,12),
 (14,5000,11,2,13),
 (15,3000,8,2,13),
 (16,5000,11,3,14),
 (17,1200,15,5,15),
 (18,2500,14,2,15),
 (19,3200,12,4,16),
 (20,2200,13,3,16),
 (21,8500,16,2,16);
/*!40000 ALTER TABLE `saledetail` ENABLE KEYS */;


--
-- Definition of table `showroom`
--

DROP TABLE IF EXISTS `showroom`;
CREATE TABLE `showroom` (
  `showroomid` varchar(255) NOT NULL,
  `showroomname` varchar(255) default NULL,
  `showroomaddress` varchar(255) default NULL,
  `showroomphone` varchar(45) default NULL,
  `showroomemail` varchar(45) default NULL,
  PRIMARY KEY  (`showroomid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `showroom`
--

/*!40000 ALTER TABLE `showroom` DISABLE KEYS */;
INSERT INTO `showroom` (`showroomid`,`showroomname`,`showroomaddress`,`showroomphone`,`showroomemail`) VALUES 
 ('501','Arong','Mirpur 1, Dhaka','01712587496','arong@gmail.com'),
 ('502','Matrichaya','Joleshoritola, Bogura','01912789654','matri@gmail.com'),
 ('503','American Blues','Gulshan , Dhaka','01715968745','america@gmail.com'),
 ('504','Angelic Threads','Bonani, Dhaka','01912365241','angelic@gmail.com'),
 ('505','Blackbird Boutique','Dhanmondi, Dhaka','01913771049','black@gmail.com'),
 ('506','Classy Missy','New Market, Bogura','01915774532','classy@gmail.com');
/*!40000 ALTER TABLE `showroom` ENABLE KEYS */;


--
-- Definition of table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `stockid` int(10) unsigned NOT NULL auto_increment,
  `productid` int(10) unsigned default NULL,
  `totalstock` int(10) unsigned default NULL,
  PRIMARY KEY  (`stockid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`stockid`,`productid`,`totalstock`) VALUES 
 (1,2,25),
 (2,2,2),
 (3,11,5),
 (4,8,8),
 (5,2,10),
 (6,4,10),
 (7,8,5),
 (8,16,5),
 (9,15,8),
 (10,13,5),
 (11,14,5),
 (12,15,7),
 (13,9,5),
 (14,15,5);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;


--
-- Definition of table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplierid` varchar(255) NOT NULL,
  `suppliername` varchar(45) default NULL,
  `supplieraddress` varchar(255) default NULL,
  `supplierphone` varchar(255) default NULL,
  `supplieremail` varchar(255) default NULL,
  PRIMARY KEY  (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`supplierid`,`suppliername`,`supplieraddress`,`supplierphone`,`supplieremail`) VALUES 
 ('101','SRS Fashion','Bogura','01717516692','srs@gmail.com'),
 ('102','ASD','Dhaka','01745363477','asd@gmail.com'),
 ('103','Fashion Mia','Mirpur,Dhaka','01731748596','fashion@gmail.com'),
 ('104','Anex Fashion','KajiPara, Dhaka','01712784512','anex@gmail.com'),
 ('105','Foring','Joleshoritola, Bogura','0178541239','foring@gmail.com'),
 ('106','Kashbon','Newmarket , Bogura','01721589632','kashbon@gmail.com');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `emailid` varchar(255) NOT NULL,
  `phone` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`emailid`,`phone`,`username`) VALUES 
 ('asd@gmail.com','+8801913771049','asd'),
 ('dipu@gmail.com','+88562435','dipu'),
 ('rabib@gmail.com','+8878521','Rabib'),
 ('ramy@gmail.com','01913771049','Ramy'),
 ('rezoana@gmail.com','0125698741','rezoana');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `emailid` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` (`emailid`,`password`,`role`,`status`) VALUES 
 ('asd@gmail.com','456','ROLE_ADMIN','True'),
 ('dipu@gmail.com','123','ROLE_USER','True'),
 ('rabib@gmail.com','789','ROLE_ADMIN','True'),
 ('ramy@gmail.com','147','ROLE_ADMIN','True'),
 ('rezoana@gmail.com','123','ROLE_USER','True');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

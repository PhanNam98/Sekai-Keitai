/*
SQLyog Enterprise - MySQL GUI v6.15
MySQL - 5.0.82-community-nt : Database - sekaikeitai
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `sekaikeitai`;

USE `sekaikeitai`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Accounttype` varchar(30) NOT NULL,
  PRIMARY KEY  (`Username`),
  KEY `FK_account` (`Accounttype`),
  CONSTRAINT `FK_account` FOREIGN KEY (`Accounttype`) REFERENCES `accounttype` (`Accounttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`Username`,`Password`,`Accounttype`) values ('admin','admin','Admin'),('db','db','EmpDb'),('joker','1234','EmpDb'),('namjoker1','1234','EmpDb'),('sale','sale','EmpSale');

/*Table structure for table `accounttype` */

DROP TABLE IF EXISTS `accounttype`;

CREATE TABLE `accounttype` (
  `Accounttype` varchar(30) NOT NULL,
  `Accountname` varchar(1111) NOT NULL,
  PRIMARY KEY  (`Accounttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `accounttype` */

insert  into `accounttype`(`Accounttype`,`Accountname`) values ('Admin','Adminstrator'),('EmpDb','Employee Database'),('EmpSale','Employee Sale');

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `Colorid` varchar(30) NOT NULL,
  `Colorname` varchar(1111) NOT NULL,
  PRIMARY KEY  (`Colorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `color` */

insert  into `color`(`Colorid`,`Colorname`) values ('black','Black'),('silver','Silver'),('white','White');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `Cusid` int(11) NOT NULL auto_increment,
  `Cusname` varchar(1111) NOT NULL,
  `Cusphone` varchar(10) NOT NULL,
  `Cusaddress` varchar(1111) NOT NULL,
  PRIMARY KEY  (`Cusid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`Cusid`,`Cusname`,`Cusphone`,`Cusaddress`) values (1,'Baolp','12348678','Thu Dau Mot');

/*Table structure for table `developer` */

DROP TABLE IF EXISTS `developer`;

CREATE TABLE `developer` (
  `Devid` varchar(30) NOT NULL,
  `Devname` varchar(1111) NOT NULL,
  PRIMARY KEY  (`Devid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `developer` */

insert  into `developer`(`Devid`,`Devname`) values ('',''),('apple','Apple Inc'),('LG','LG'),('ss','Samsung');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `Empid` int(11) NOT NULL auto_increment,
  `Empname` varchar(1111) default NULL,
  `sex` varchar(6) default NULL,
  `address` varchar(1111) default NULL,
  `socidentity` varchar(10) default NULL,
  `phonenum` varchar(10) default NULL,
  `Salary` float default NULL,
  `Emptype` varchar(30) default NULL,
  PRIMARY KEY  (`Empid`),
  KEY `FK_employee` (`Emptype`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`Emptype`) REFERENCES `employeetype` (`Emptype`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`Empid`,`Empname`,`sex`,`address`,`socidentity`,`phonenum`,`Salary`,`Emptype`) values (1,'Nam','Male','LA','123456789','123',5000,'Empdb'),(2,'Quoc','male','DN','123456789','123',5000,'Empsale'),(3,'NguyenML','Female','AG','123456789','123',2500,'Emp'),(22,'baoboa','Male','234','23214','234',324,'Emp'),(52,'nguyen','Male','safd','124312','23123',2.31412e+006,'Emp'),(53,'RM','Male','gfhg','3342','12313423',4.32423e+006,'Emp'),(54,'nam1','Male','3434','132','2434',234342,'EmpSale'),(55,'Joker','FeMale','sdfsdfsdf','123123','34234',3.42342e+007,'Emp'),(56,'qw','Male','fdg','12312','3424',123123,'Emp'),(57,'Salary','Male','viet nam','1234567890','1234567891',12,'Emp');

/*Table structure for table `employeetype` */

DROP TABLE IF EXISTS `employeetype`;

CREATE TABLE `employeetype` (
  `Emptype` varchar(30) NOT NULL,
  `Emptypename` varchar(1111) NOT NULL,
  PRIMARY KEY  (`Emptype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeetype` */

insert  into `employeetype`(`Emptype`,`Emptypename`) values ('Emp','Employee'),('EmpDb','Employee Database'),('EmpSale','Employee Sale');

/*Table structure for table `generation` */

DROP TABLE IF EXISTS `generation`;

CREATE TABLE `generation` (
  `Genid` varchar(30) NOT NULL,
  `Genname` varchar(1111) NOT NULL,
  `Devid` varchar(30) NOT NULL,
  PRIMARY KEY  (`Genid`),
  KEY `FK_generation` (`Devid`),
  CONSTRAINT `FK_generation` FOREIGN KEY (`Devid`) REFERENCES `developer` (`Devid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `generation` */

insert  into `generation`(`Genid`,`Genname`,`Devid`) values ('','','apple'),('a','a','apple'),('ipx','iPhone X','apple'),('note','Samsung Note','ss'),('S','Samsung Galaxy S','ss');

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `Invoiceid` int(11) NOT NULL auto_increment,
  `Empid` int(11) NOT NULL,
  `Cusid` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL COMMENT '1=sold, 0=not sold',
  `Date` datetime NOT NULL,
  PRIMARY KEY  (`Invoiceid`),
  KEY `FK_invoice` (`Cusid`),
  KEY `FK_invoice_1` (`Empid`),
  CONSTRAINT `FK_invoice` FOREIGN KEY (`Cusid`) REFERENCES `customer` (`Cusid`),
  CONSTRAINT `FK_invoice_1` FOREIGN KEY (`Empid`) REFERENCES `employee` (`Empid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `invoice` */

insert  into `invoice`(`Invoiceid`,`Empid`,`Cusid`,`Status`,`Date`) values (1,1,1,1,'2018-11-22 00:00:00');

/*Table structure for table `invoicedetail` */

DROP TABLE IF EXISTS `invoicedetail`;

CREATE TABLE `invoicedetail` (
  `Invoiceid` int(11) NOT NULL,
  `Modelid` varchar(30) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY  (`Invoiceid`),
  KEY `FK_invoicedetail_1` (`Modelid`),
  CONSTRAINT `FK_invoicedetail` FOREIGN KEY (`Invoiceid`) REFERENCES `invoice` (`Invoiceid`),
  CONSTRAINT `FK_invoicedetail_1` FOREIGN KEY (`Modelid`) REFERENCES `productdetail` (`Modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `invoicedetail` */

insert  into `invoicedetail`(`Invoiceid`,`Modelid`,`Quantity`,`Price`) values (1,'test',1,5000);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `Productid` varchar(30) NOT NULL,
  `Productname` varchar(1111) NOT NULL,
  `Cpu` varchar(1111) NOT NULL,
  `Ram` varchar(10) default NULL,
  `Storage` varchar(10) default NULL,
  `Screen` varchar(10) default NULL,
  `Battery` varchar(10) default NULL,
  `Genid` varchar(30) NOT NULL,
  PRIMARY KEY  (`Productid`),
  KEY `FK_product` (`Genid`),
  CONSTRAINT `FK_product` FOREIGN KEY (`Genid`) REFERENCES `generation` (`Genid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`Productid`,`Productname`,`Cpu`,`Ram`,`Storage`,`Screen`,`Battery`,`Genid`) values ('ip1','iPhone','A','8gb','512gb','retina','5000mAh','ipx'),('Note9','Samsung note 9','1','2','2','2','2','note'),('S9','Samsung Galaxy S9','445','345','453','54','45345','S');

/*Table structure for table `productdetail` */

DROP TABLE IF EXISTS `productdetail`;

CREATE TABLE `productdetail` (
  `Modelid` varchar(30) NOT NULL,
  `Productid` varchar(30) NOT NULL,
  `Colorid` varchar(30) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY  (`Modelid`),
  KEY `FK_productdetail` (`Colorid`),
  KEY `FK_productdetail_1` (`Productid`),
  CONSTRAINT `FK_productdetail` FOREIGN KEY (`Colorid`) REFERENCES `color` (`Colorid`),
  CONSTRAINT `FK_productdetail_1` FOREIGN KEY (`Productid`) REFERENCES `product` (`Productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productdetail` */

insert  into `productdetail`(`Modelid`,`Productid`,`Colorid`,`Price`,`Quantity`) values ('test','ip1','black',5000,50),('test2','ip1','black',32435,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*
SQLyog Ultimate - MySQL GUI v8.22 
MySQL - 5.0.24-community-nt : Database - hmt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hmt` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hmt`;

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `attendance_id` double NOT NULL auto_increment,
  `emp_id` varchar(300) default NULL,
  `emp_name` varchar(90) default NULL,
  `attendance_date` varchar(60) default NULL,
  `check_in` varchar(30) default NULL,
  `check_out` varchar(30) default NULL,
  PRIMARY KEY  (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attendance` */

insert  into `attendance`(`attendance_id`,`emp_id`,`emp_name`,`attendance_date`,`check_in`,`check_out`) values (1,'111','GARVIL','02/16/2013','20:29','null'),(2,'222','MIGHAN','02/16/2013','20:29','null'),(3,'333','ISHAN','02/16/2013','20:29','null'),(4,'444','KHUSHI','02/16/2013','20:29','null'),(5,'555','SHANU','02/16/2013','20:29','null'),(6,'111','GARVIL','02/17/2013','20:31','null'),(7,'222','MIGHAN','02/17/2013','20:31','null'),(8,'333','ISHAN','02/17/2013','20:31','null'),(9,'444','KHUSHI','02/17/2013','20:31','null'),(10,'555','SHANU','02/17/2013','20:31','null'),(11,'111','GARVIL','02/18/2013','20:32','null'),(12,'222','MIGHAN','02/18/2013','20:32','null'),(13,'333','ISHAN','02/18/2013','20:32','null'),(14,'444','KHUSHI','02/18/2013','20:32','null'),(15,'555','SHANU','02/18/2013','20:32','null'),(16,'111','GARVIL','02/19/2013','8:34','null'),(17,'222','MIGHAN','02/19/2013','8:34','null'),(18,'333','ISHAN','02/19/2013','8:34','null'),(19,'111','GARVIL','02/19/2013','11:52','null'),(20,'111','GARVIL','02/19/2013','11:52','null'),(21,'111','GARVIL','02/19/2013','13:3','null'),(22,'222','MIGHAN','02/19/2013','13:3','null'),(23,'333','ISHAN','02/19/2013','13:3','null'),(24,'444','KHUSHI','02/19/2013','13:3','null'),(25,'555','SHANU','02/19/2013','13:3','null'),(26,'111','GARVIL','02/20/2013','13:7','8:34'),(27,'111','GARVIL','02/21/2013','13:8','null'),(28,'222','MIGHAN','02/20/2013','8:31','null');

/*Table structure for table `bloodbank_manager` */

DROP TABLE IF EXISTS `bloodbank_manager`;

CREATE TABLE `bloodbank_manager` (
  `bloodtypeid` int(11) NOT NULL auto_increment,
  `bloodtypename` varchar(20) default NULL,
  `bloodquantity` int(11) default NULL,
  PRIMARY KEY  (`bloodtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bloodbank_manager` */

insert  into `bloodbank_manager`(`bloodtypeid`,`bloodtypename`,`bloodquantity`) values (1,'O_positive',9400),(2,'A_positive',0),(3,'B_positive',100),(4,'AB_positive',2000),(5,'O_negative',1000),(6,'A_negative',0),(7,'B_negative',0),(8,'AB_negative',0);

/*Table structure for table `bloodbankacceptor` */

DROP TABLE IF EXISTS `bloodbankacceptor`;

CREATE TABLE `bloodbankacceptor` (
  `acceptorid` int(11) NOT NULL auto_increment,
  `acceptor_name` varchar(50) default NULL,
  `acceptor_dob` varchar(15) default NULL,
  `accept_gender` varchar(6) default NULL,
  `acceptor_age` varchar(3) default NULL,
  `acceptor_bloodgroup` varchar(20) default NULL,
  `acceptor_mob` varchar(12) default NULL,
  `acceptor_address` varchar(100) default NULL,
  `acceptor_city` varchar(50) default NULL,
  `acceptor_state` varchar(15) default NULL,
  `acceptor_country` varchar(15) default NULL,
  `acceptor_email` varchar(20) default NULL,
  `acceptor_date` date default NULL,
  `acceptor_quantity` int(11) default NULL,
  PRIMARY KEY  (`acceptorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bloodbankacceptor` */

insert  into `bloodbankacceptor`(`acceptorid`,`acceptor_name`,`acceptor_dob`,`accept_gender`,`acceptor_age`,`acceptor_bloodgroup`,`acceptor_mob`,`acceptor_address`,`acceptor_city`,`acceptor_state`,`acceptor_country`,`acceptor_email`,`acceptor_date`,`acceptor_quantity`) values (19,'aaaaaa','aaasa','on','22','O_positive','null','null','rere','rree','null','ererer','2013-02-28',200),(20,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(21,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(22,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(23,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(24,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200);

/*Table structure for table `bloodbankdonor` */

DROP TABLE IF EXISTS `bloodbankdonor`;

CREATE TABLE `bloodbankdonor` (
  `donorid` int(11) NOT NULL auto_increment,
  `donor_name` varchar(50) default NULL,
  `donor_dob` varchar(10) default NULL,
  `donor_gender` varchar(6) default NULL,
  `donor_age` varchar(3) default NULL,
  `donor_bloodgroup` varchar(20) default NULL,
  `donor_weight` int(11) default NULL,
  `donor_mob` varchar(10) default NULL,
  `donor_address` varchar(100) default NULL,
  `donor_city` varchar(50) default NULL,
  `donor_state` varchar(20) default NULL,
  `donor_country` varchar(20) default NULL,
  `donor_email` varchar(15) default NULL,
  `donor_remark` varchar(50) default NULL,
  `donor_date` date default NULL,
  `donor_lastddate` date default NULL,
  `donor_quantity` int(11) default NULL,
  `donor_username` varchar(20) default NULL,
  `donor_password` varchar(20) default NULL,
  `donor_ConfirmPwd` varchar(20) default NULL,
  PRIMARY KEY  (`donorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bloodbankdonor` */

insert  into `bloodbankdonor`(`donorid`,`donor_name`,`donor_dob`,`donor_gender`,`donor_age`,`donor_bloodgroup`,`donor_weight`,`donor_mob`,`donor_address`,`donor_city`,`donor_state`,`donor_country`,`donor_email`,`donor_remark`,`donor_date`,`donor_lastddate`,`donor_quantity`,`donor_username`,`donor_password`,`donor_ConfirmPwd`) values (10,'govind','02/12/2013','male','21','O_positive',50,'fdfdfd','null','fdfd','fdfd','null','null','amit','2013-11-02','2013-11-02',10400,'amit','amit','amit');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `departmentid` int(11) NOT NULL auto_increment,
  `department_name` varchar(100) default NULL,
  PRIMARY KEY  (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`departmentid`,`department_name`) values (1,'Anaesthesiology'),(2,'Burn SurgeryCardiac Services'),(3,'Cardiology'),(4,'Dental'),(5,'Dermatology'),(6,'Dietetics'),(7,'Endocriniology'),(8,'ENT'),(9,'Gastroenterology'),(10,'Medicine'),(11,'Nephrology'),(12,'Neurology'),(13,'Obstetrics Gynaecology'),(14,'Oncology'),(15,'Oncomedicine'),(16,'Oncosurgery'),(17,'Radiotherapy'),(18,'Ophthalmology'),(19,'Orthopaedics'),(20,'Paediatric Services'),(21,'Spine  and Pain'),(22,'Plastic Surgery'),(23,'Psychiatry'),(24,'Respiratory Lab Allergy Clinic'),(25,'Urology'),(26,'General Surgery'),(27,'Gastroenterology');

/*Table structure for table `diseaseinformation` */

DROP TABLE IF EXISTS `diseaseinformation`;

CREATE TABLE `diseaseinformation` (
  `diseaseid` int(11) NOT NULL auto_increment,
  `disease_name` varchar(100) default NULL,
  `disease_department` varchar(100) default NULL,
  PRIMARY KEY  (`diseaseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `diseaseinformation` */

insert  into `diseaseinformation`(`diseaseid`,`disease_name`,`disease_department`) values (1,'brain pain','brain'),(2,'spine pain','bon '),(3,'maleriya','disease'),(4,'pilia','Gastroenterology'),(5,'pet dard','Gastroenterology'),(6,'hath','disease'),(7,'stomuch','disease'),(8,'jalan','Gastroenterology'),(9,'aaa','Gastroenterology'),(10,'bbb','Gastroenterology'),(11,'ccc','Gastroenterology'),(12,'eyes','Cardiology'),(13,'ear','Cardiology'),(14,'nose','Cardiology'),(15,'lips','Cardiology');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL auto_increment,
  `emp_name` varchar(30) default NULL,
  `emp_dob` date default NULL,
  `emp_jod` date default NULL,
  `emp_telephone` varchar(12) default NULL,
  `emp_mobile` varchar(12) default NULL,
  `emp_marrialstatus` varchar(10) default NULL,
  `emp_gender` varchar(10) default NULL,
  `emp_address` varchar(100) default NULL,
  `emp_city` varchar(20) default NULL,
  `emp_state` varchar(30) default NULL,
  `emp_country` varchar(30) default NULL,
  `emp_bloodgroup` varchar(5) default NULL,
  `emp_type` varchar(30) default NULL,
  `emp_email` varchar(100) default NULL,
  `emp_image` varchar(30) default NULL,
  `emp_salary` int(11) default NULL,
  `emp_department` varchar(200) default NULL,
  PRIMARY KEY  (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`emp_id`,`emp_name`,`emp_dob`,`emp_jod`,`emp_telephone`,`emp_mobile`,`emp_marrialstatus`,`emp_gender`,`emp_address`,`emp_city`,`emp_state`,`emp_country`,`emp_bloodgroup`,`emp_type`,`emp_email`,`emp_image`,`emp_salary`,`emp_department`) values (14,'prabhat',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gastroenterology'),(15,'Amit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gastroenterology'),(16,'Vikash',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cardiology'),(17,'anil',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cardiology'),(18,'vijay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cardiology');

/*Table structure for table `employee_account` */

DROP TABLE IF EXISTS `employee_account`;

CREATE TABLE `employee_account` (
  `accound_emp_id` int(11) NOT NULL auto_increment,
  `emp_id` int(11) default NULL,
  `bank_name` varchar(50) default NULL,
  `bank_account_no` varchar(50) default NULL,
  `pf_no` varchar(50) default NULL,
  `pan_no` varchar(50) default NULL,
  `esi` varchar(50) default NULL,
  PRIMARY KEY  (`accound_emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_account` */

insert  into `employee_account`(`accound_emp_id`,`emp_id`,`bank_name`,`bank_account_no`,`pf_no`,`pan_no`,`esi`) values (1,111,'sbi','63045454879','123456','bca1546','55555'),(2,17,'icici','654567454','45375374','235','5545');

/*Table structure for table `employee_experience` */

DROP TABLE IF EXISTS `employee_experience`;

CREATE TABLE `employee_experience` (
  `experience_id` int(11) NOT NULL auto_increment,
  `emp_id` int(30) NOT NULL COMMENT 'foreign key',
  `last_employer` varchar(100) default NULL,
  `post` varchar(50) default NULL,
  `salary` varchar(30) default NULL,
  `experience` varchar(15) default NULL,
  PRIMARY KEY  (`experience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_experience` */

insert  into `employee_experience`(`experience_id`,`emp_id`,`last_employer`,`post`,`salary`,`experience`) values (1,14,'ss','MD','2011111','4 year'),(2,15,'ss','MD','2011111','4 year'),(3,16,'ss','MD','2011111','4 year');

/*Table structure for table `employee_profetional_information` */

DROP TABLE IF EXISTS `employee_profetional_information`;

CREATE TABLE `employee_profetional_information` (
  `professional_id` int(11) NOT NULL auto_increment,
  `emp_id` int(30) default NULL COMMENT 'foreign key',
  `qualification_type` varchar(30) default NULL,
  `course_name` varchar(30) default NULL,
  `stream` varchar(100) default NULL,
  `university_name` varchar(100) default NULL,
  `college_name` varchar(100) default NULL,
  `course_duration` varchar(50) default NULL,
  `percentage` varchar(20) default NULL,
  PRIMARY KEY  (`professional_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_profetional_information` */

insert  into `employee_profetional_information`(`professional_id`,`emp_id`,`qualification_type`,`course_name`,`stream`,`university_name`,`college_name`,`course_duration`,`percentage`) values (1,14,'10','all','MP BOARD','Excellence','all','2005','80'),(2,14,'12','all','MP BOARD','Excellence','math','2007','85'),(3,14,'up','MBBS','SVPS','Excellence','MBBS','2011','76'),(4,14,'pg','MS','SVPS','SVPS','MS','2015','75'),(5,15,'10','all','MP BOARD','Excellence','all','2005','80'),(6,15,'12','all','MP BOARD','Excellence','math','2007','85'),(7,15,'up','MBBS','SVPS','Excellence','MBBS','2011','76'),(8,15,'pg','MS','SVPS','SVPS','MS','2015','75'),(9,16,'10','all','MP BOARD','Excellence','all','2005','80'),(10,16,'12','all','MP BOARD','Excellence','math','2007','85'),(11,16,'up','MBBS','SVPS','Excellence','MBBS','2011','76'),(12,16,'pg','MS','SVPS','SVPS','MS','2015','75');

/*Table structure for table `employee_schedule` */

DROP TABLE IF EXISTS `employee_schedule`;

CREATE TABLE `employee_schedule` (
  `schedule_id` int(11) NOT NULL auto_increment,
  `emp_id` int(10) default NULL COMMENT 'foriegn key',
  `visiting_day` varchar(20) default NULL,
  `start_hr` int(10) default NULL,
  `start_minute` int(11) default NULL,
  `end_hr` int(11) default NULL,
  `end_minute` int(10) default NULL,
  `consult_cost` int(10) default '0',
  PRIMARY KEY  (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_schedule` */

insert  into `employee_schedule`(`schedule_id`,`emp_id`,`visiting_day`,`start_hr`,`start_minute`,`end_hr`,`end_minute`,`consult_cost`) values (1,14,'Monday',1,0,1,0,0),(2,14,'TuesDay',1,0,1,0,0),(3,14,'Wednesday',1,0,1,0,0),(4,14,'Thursday',1,0,1,0,0),(5,14,'Friday',1,0,1,0,0),(6,14,'SaturDay',1,0,1,0,0),(7,14,'Sunday',1,0,1,0,0),(8,15,'Monday',2,0,7,0,0),(9,15,'TuesDay',3,0,1,0,0),(10,15,'Wednesday',3,0,6,0,0),(11,15,'Thursday',3,0,9,0,0),(12,15,'Friday',3,0,9,0,0),(13,15,'SaturDay',3,0,8,0,0),(14,15,'Sunday',3,0,8,0,0),(15,16,'Monday',1,0,1,0,0),(16,16,'TuesDay',1,0,1,0,0),(17,16,'Wednesday',1,0,1,0,0),(18,16,'Thursday',1,0,1,0,0),(19,16,'Friday',1,0,1,0,0),(20,16,'SaturDay',1,0,1,0,0),(21,16,'Sunday',1,0,1,0,0),(22,17,'Monday',1,0,1,0,0),(23,17,'TuesDay',1,0,1,0,0),(24,17,'Wednesday',1,0,1,0,0),(25,17,'Thursday',1,0,1,0,0),(26,17,'Friday',1,0,1,0,0),(27,17,'SaturDay',1,0,1,0,0),(28,17,'Sunday',1,0,1,0,0);

/*Table structure for table `employee_specialization` */

DROP TABLE IF EXISTS `employee_specialization`;

CREATE TABLE `employee_specialization` (
  `specialization_id` int(11) NOT NULL auto_increment,
  `emp_id` int(30) default NULL COMMENT 'foreign_key',
  `specialization` varchar(200) default NULL,
  `license_number` varchar(30) default NULL,
  PRIMARY KEY  (`specialization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_specialization` */

insert  into `employee_specialization`(`specialization_id`,`emp_id`,`specialization`,`license_number`) values (1,14,'gastroenterology','1231236'),(2,15,'gastroenterology','1231236'),(3,16,'pharmacology','1231236');

/*Table structure for table `floor` */

DROP TABLE IF EXISTS `floor`;

CREATE TABLE `floor` (
  `floor_number` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `floor` */

insert  into `floor`(`floor_number`) values (1),(2),(3),(4),(5);

/*Table structure for table `issuediteminfo` */

DROP TABLE IF EXISTS `issuediteminfo`;

CREATE TABLE `issuediteminfo` (
  `voucher_no` int(11) NOT NULL auto_increment,
  `issue_to` varchar(15) default NULL,
  `person_name` varchar(20) default NULL,
  `item_id` int(11) default NULL,
  `issue_item_type` varchar(15) default NULL,
  `issued_item_name` varchar(15) default NULL,
  `issue_date` date default NULL,
  `requesting_quantity` int(15) default '0',
  `issue_quantity` int(15) default '0',
  `pending_quantity` int(15) default '0',
  `total_amount` int(11) default NULL,
  `paid_amount` int(11) default NULL,
  `pending_amount` int(11) default NULL,
  PRIMARY KEY  (`voucher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issuediteminfo` */

insert  into `issuediteminfo`(`voucher_no`,`issue_to`,`person_name`,`item_id`,`issue_item_type`,`issued_item_name`,`issue_date`,`requesting_quantity`,`issue_quantity`,`pending_quantity`,`total_amount`,`paid_amount`,`pending_amount`) values (1,'tgfreg','tgfreg',1,'ijkgvdv','grtg','2012-02-08',9,8,500,300,200,1),(2,'fd','fd',12,'fuhff','dfgvfv','2012-09-08',15,9,6,500,300,200),(3,'medicare','medicare',5,'asd','medicare','2012-02-08',75,75,0,2000,2000,0);

/*Table structure for table `itemsupplied` */

DROP TABLE IF EXISTS `itemsupplied`;

CREATE TABLE `itemsupplied` (
  `supplyer_id` int(11) NOT NULL auto_increment,
  `supplyer_name` varchar(20) default NULL,
  `item_id` int(11) default NULL,
  `supplied_item_type` varchar(15) default NULL,
  `supplied_item_name` varchar(16) default NULL,
  `supplied_date` date default NULL,
  `requsting_quantity` int(11) default '0',
  `supplied_quantity` int(11) default '0',
  `pending_quantity` int(11) default '0',
  `item_expiry_date` date default NULL,
  `total_amount` int(15) default NULL,
  `paid_amount` int(20) default NULL,
  `pending_amount` int(20) default NULL,
  PRIMARY KEY  (`supplyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `itemsupplied` */

insert  into `itemsupplied`(`supplyer_id`,`supplyer_name`,`item_id`,`supplied_item_type`,`supplied_item_name`,`supplied_date`,`requsting_quantity`,`supplied_quantity`,`pending_quantity`,`item_expiry_date`,`total_amount`,`paid_amount`,`pending_amount`) values (1,'gtfhyf',1,'gfjy','jfyj','2012-02-08',78,45,33,'2012-02-08',45,37,8),(2,'gtfhyf',1,'treyu','jjhuui','2012-02-11',54,43,11,'2012-12-03',24,200,-176),(3,'trtyuzxzcy',14,'treyu','jjhuui','2012-02-04',54,43,11,'2012-02-22',24,200,-176),(4,'medicare',5,'treyu','jjhuui','2012-02-08',54,43,11,'2012-02-22',24,200,-176);

/*Table structure for table `operation_manager` */

DROP TABLE IF EXISTS `operation_manager`;

CREATE TABLE `operation_manager` (
  `id` int(11) default NULL,
  `operation_type` varchar(10) default NULL,
  `operation_name` varchar(100) default NULL,
  `operation_cost` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `operation_manager` */

/*Table structure for table `operation_patient` */

DROP TABLE IF EXISTS `operation_patient`;

CREATE TABLE `operation_patient` (
  `operation_id` int(11) NOT NULL auto_increment,
  `operation_date` date default NULL,
  `operation_time` varchar(10) default NULL,
  `operation_type` varchar(10) default NULL,
  `operation_name` varchar(100) default NULL,
  `patient_id` int(11) default NULL,
  `operation_cost` int(11) default NULL,
  `patient_relative` varchar(100) default NULL,
  `doctor_id` int(11) default NULL,
  PRIMARY KEY  (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `operation_patient` */

/*Table structure for table `operation_type` */

DROP TABLE IF EXISTS `operation_type`;

CREATE TABLE `operation_type` (
  `operation_id` int(11) NOT NULL auto_increment,
  `operation_name` varchar(30) default NULL,
  `operation_type` varchar(10) default NULL,
  `operation_cost` int(10) default NULL,
  PRIMARY KEY  (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `operation_type` */

insert  into `operation_type`(`operation_id`,`operation_name`,`operation_type`,`operation_cost`) values (1,'brain','major',200000);

/*Table structure for table `pathelogy_manager_detail` */

DROP TABLE IF EXISTS `pathelogy_manager_detail`;

CREATE TABLE `pathelogy_manager_detail` (
  `detail_id` int(11) NOT NULL auto_increment,
  `test_id` int(10) default NULL COMMENT 'foriegn key',
  `test_content` varchar(30) default NULL,
  `start_range` varchar(20) default NULL,
  `end_range` varchar(20) default NULL,
  `comment` varchar(200) default NULL,
  PRIMARY KEY  (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathelogy_manager_detail` */

/*Table structure for table `pathelogy_test_detail` */

DROP TABLE IF EXISTS `pathelogy_test_detail`;

CREATE TABLE `pathelogy_test_detail` (
  `test_id` int(10) NOT NULL auto_increment,
  `test_name` varchar(50) default NULL,
  `test_content` varchar(30) default NULL,
  `start_range` varchar(20) default NULL,
  `end_range` varchar(20) default NULL,
  PRIMARY KEY  (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathelogy_test_detail` */

insert  into `pathelogy_test_detail`(`test_id`,`test_name`,`test_content`,`start_range`,`end_range`) values (1,'blood_wbc','wbc','4000','9000'),(2,'blood_rbc','rbc','2','5'),(3,'blood_hea','heamoglobin','9','12'),(4,'stomach','stomach','30','40'),(5,'cheast','cheast','10','20'),(7,'xray','xray','10','20'),(8,'xray','xray','20','30'),(9,'ecg','heart','12','5');

/*Table structure for table `pathology_manager` */

DROP TABLE IF EXISTS `pathology_manager`;

CREATE TABLE `pathology_manager` (
  `test_id` int(11) NOT NULL auto_increment,
  `test_name` varchar(30) default NULL,
  `test_cost` int(10) default NULL,
  `test_precaution` varchar(500) default NULL,
  PRIMARY KEY  (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_manager` */

/*Table structure for table `pathology_test_cost` */

DROP TABLE IF EXISTS `pathology_test_cost`;

CREATE TABLE `pathology_test_cost` (
  `test_id` int(11) NOT NULL,
  `test_cost` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_test_cost` */

insert  into `pathology_test_cost`(`test_id`,`test_cost`) values (1,600),(2,700),(3,700),(4,200),(5,300),(11,635);

/*Table structure for table `pathology_test_report` */

DROP TABLE IF EXISTS `pathology_test_report`;

CREATE TABLE `pathology_test_report` (
  `report_id` int(11) NOT NULL auto_increment,
  `patient_id` int(11) default NULL,
  `test_id` int(11) default NULL,
  `test_date` date default NULL,
  `result` varchar(100) default NULL,
  `refered_by` varchar(50) default NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_test_report` */

insert  into `pathology_test_report`(`report_id`,`patient_id`,`test_id`,`test_date`,`result`,`refered_by`) values (1,5,5,'2013-12-13','ssada','dr.pankaj'),(2,1,3,'2013-11-11','zxz','dr.jhingulla'),(3,1,2,'2013-01-10','dsa','dadad'),(4,1,1,'2013-01-01','gfhg','jjhujhi');

/*Table structure for table `pathology_tests` */

DROP TABLE IF EXISTS `pathology_tests`;

CREATE TABLE `pathology_tests` (
  `pathology_test_id` int(11) NOT NULL auto_increment,
  `patient_id` int(11) default NULL,
  `test_id` int(11) default NULL,
  `test_cost` int(11) default NULL,
  `test_date` date default NULL,
  PRIMARY KEY  (`pathology_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_tests` */

/*Table structure for table `pathology_tests_detail` */

DROP TABLE IF EXISTS `pathology_tests_detail`;

CREATE TABLE `pathology_tests_detail` (
  `id` int(11) NOT NULL auto_increment,
  `pathology_test_id` int(11) default NULL,
  `pathology_content` varchar(100) default NULL,
  `pathology_start` int(11) default NULL,
  `pathology_end` int(11) default NULL,
  `pathology_remark` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_tests_detail` */

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `patient_registrationno` int(11) NOT NULL auto_increment,
  `patient_name` varchar(100) default NULL,
  `patient_gender` varchar(6) default NULL,
  `patient_age` varchar(4) default NULL,
  `patient_marital_status` varchar(3) default NULL,
  `patient_father_husband` varchar(100) default NULL,
  `patient_address` varchar(500) default NULL,
  `patient_city` varchar(50) default NULL,
  `patient_religion` varchar(20) default NULL,
  `patient_mobile` varchar(12) default NULL,
  `patient_telephone` varchar(12) default NULL,
  `patient_bloodgroup` varchar(5) default NULL,
  `patient_disease` varchar(500) default NULL,
  `patient_dateofregistraton` date default NULL,
  PRIMARY KEY  (`patient_registrationno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `patient` */

insert  into `patient`(`patient_registrationno`,`patient_name`,`patient_gender`,`patient_age`,`patient_marital_status`,`patient_father_husband`,`patient_address`,`patient_city`,`patient_religion`,`patient_mobile`,`patient_telephone`,`patient_bloodgroup`,`patient_disease`,`patient_dateofregistraton`) values (54,'anil ','male','21','yes','ashdka',' hjasdh h','ooih','iohoih','hoih','h','O+',NULL,'2013-02-28'),(55,'hkjhasd','male','41','yes','asdasd','asdasd','asdasd','asdf','asdasdasd','asdasd','O+',NULL,'2013-02-28'),(56,'sgdserydfg','male','sdg','yes','','y','try','sdfg','ery','rey','O+',NULL,'2013-02-28'),(57,'fdsg','male','12','yes','dfsg','dsfg','dfg','fdsg','fdgdfsg','dfsg','O+',NULL,'2013-02-28'),(58,'ko','male','21','yes','','asdf','asdf','fdsf','dfa','afd','O+',NULL,'2013-02-28'),(59,'kos','female','34','no','sadff','asdff','gfh','sg','gdh','afd','O+',NULL,'2013-02-28'),(60,'Rohit nayak','male','21','yes','poskdak',' skdfpjasdj fj','kpofk ','podsf opj',' jopdsfjojf',' jpojfspoj','O+',NULL,'2013-02-28'),(61,'Anil kimat','male','21','no','asd',' sa','asd','asd','asd','asd','O+',NULL,'2013-02-28'),(62,'hsfda hh','female','44','yes','jjf j','joj','pjj','jpj','jjp','jj','O+',NULL,'2013-02-28'),(63,'vijay dinanath','male','23','yes','asdf','adsf','sdf','adfs','asdf','hihoih','O+',NULL,'2013-02-28');

/*Table structure for table `patient_inside` */

DROP TABLE IF EXISTS `patient_inside`;

CREATE TABLE `patient_inside` (
  `admision_id` int(10) NOT NULL auto_increment,
  `patient_id` int(30) default NULL,
  `doctor_id` int(30) default NULL,
  `bed_id` int(10) default NULL,
  `disease_name` varchar(50) default NULL,
  `admision_date` date default NULL,
  PRIMARY KEY  (`admision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `patient_inside` */

insert  into `patient_inside`(`admision_id`,`patient_id`,`doctor_id`,`bed_id`,`disease_name`,`admision_date`) values (13,54,15,6,'fgdfg','2013-02-28'),(14,55,15,6,'asd','2013-02-28'),(15,56,16,7,'asdfasf','2013-02-28'),(16,57,15,8,'refg','2013-02-28'),(17,58,18,10,'asdiu','2013-02-28'),(18,59,16,9,'hs','2013-02-28'),(19,60,18,12,'asdfsdaf','2013-02-28'),(20,61,15,13,'sad','2013-02-28'),(21,62,15,13,'rtert','2013-02-28'),(22,63,15,15,'asdfasdf','2013-02-28');

/*Table structure for table `patient_outside` */

DROP TABLE IF EXISTS `patient_outside`;

CREATE TABLE `patient_outside` (
  `outside_id` int(11) NOT NULL auto_increment,
  `patient_registrationno` int(30) default NULL COMMENT 'foriegn key',
  `doctor_id` int(30) default NULL COMMENT 'foriegn key',
  `disease_name` varchar(200) default NULL,
  `check_up_date` date default NULL,
  `refer_by_dr` varchar(50) default NULL,
  `checkup_number` int(11) default NULL,
  PRIMARY KEY  (`outside_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `patient_outside` */

/*Table structure for table `perday` */

DROP TABLE IF EXISTS `perday`;

CREATE TABLE `perday` (
  `perday_id` double NOT NULL auto_increment,
  `emp_id` varchar(90) default NULL,
  `cost` varchar(90) default NULL,
  PRIMARY KEY  (`perday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `perday` */

insert  into `perday`(`perday_id`,`emp_id`,`cost`) values (1,'111','500'),(2,'222','500'),(3,'333','250'),(4,'444','1000'),(5,'555','300');

/*Table structure for table `profetional_information` */

DROP TABLE IF EXISTS `profetional_information`;

CREATE TABLE `profetional_information` (
  `professional_id` int(11) NOT NULL auto_increment,
  `emp_id` int(30) default NULL COMMENT 'foreign key',
  `qualification_type` varchar(30) default NULL,
  `course_name` varchar(30) default NULL,
  `university_name` varchar(100) default NULL,
  `college_name` varchar(100) default NULL,
  `course_duration` varchar(50) default NULL,
  `stream` varchar(100) default NULL,
  `percentage` varbinary(20) default NULL,
  PRIMARY KEY  (`professional_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profetional_information` */

/*Table structure for table `room_bed_info` */

DROP TABLE IF EXISTS `room_bed_info`;

CREATE TABLE `room_bed_info` (
  `bed_id` int(11) NOT NULL auto_increment,
  `room_id` int(10) default NULL COMMENT 'foriegn key',
  `bed_number` varchar(10) default NULL,
  `occupy_status` varchar(2) default NULL,
  `bed_status` varchar(10) default NULL,
  PRIMARY KEY  (`bed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_bed_info` */

insert  into `room_bed_info`(`bed_id`,`room_id`,`bed_number`,`occupy_status`,`bed_status`) values (1,1,'A','1','activate'),(2,1,'B','0','activate'),(3,1,'C','0','activate'),(4,1,'D','0','activate'),(5,1,'E','1','activate'),(6,2,'A','1','activate'),(7,2,'B','0','activate'),(8,2,'C','0','activate'),(9,2,'D','0','activate'),(10,2,'E','0','activate'),(11,3,'A','0','activate'),(12,4,'A','0','activate'),(13,4,'B','0','activate'),(14,4,'C','0','activate'),(15,4,'D','1','activate'),(16,4,'E','0','activate'),(17,4,'F','0','activate'),(18,4,'G','0','activate'),(19,4,'H','0','activate'),(20,4,'I','0','activate'),(21,4,'J','1','activate');

/*Table structure for table `room_info` */

DROP TABLE IF EXISTS `room_info`;

CREATE TABLE `room_info` (
  `room_id` int(11) NOT NULL auto_increment,
  `room_type_id` int(50) default NULL COMMENT 'foriegn key',
  `room_floor` varchar(10) default NULL,
  `room_number` varchar(10) default NULL,
  `bed_capacity` int(10) default NULL,
  `room_status` varchar(10) default NULL COMMENT 'activate deactivate',
  PRIMARY KEY  (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_info` */

insert  into `room_info`(`room_id`,`room_type_id`,`room_floor`,`room_number`,`bed_capacity`,`room_status`) values (1,1,'1','101',5,'activate'),(2,1,'1','102',5,'activate'),(3,2,'1','111',1,'activate'),(4,1,'2','103',10,'activate');

/*Table structure for table `room_type` */

DROP TABLE IF EXISTS `room_type`;

CREATE TABLE `room_type` (
  `room_type_id` int(11) NOT NULL auto_increment,
  `room_type_name` varchar(50) default NULL,
  `room_type_cost` int(20) default NULL,
  PRIMARY KEY  (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_type` */

insert  into `room_type`(`room_type_id`,`room_type_name`,`room_type_cost`) values (1,'general',1000),(2,'ipd',2000),(3,'opd',2000);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `salary_id` double NOT NULL auto_increment,
  `emp_id` varchar(30) default NULL,
  `total_days` varchar(90) default NULL,
  `salary` varchar(90) default NULL,
  `pf` varchar(90) default NULL,
  `netsalary` varchar(90) default NULL,
  `pay_date` varchar(90) default NULL,
  PRIMARY KEY  (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salary` */

insert  into `salary`(`salary_id`,`emp_id`,`total_days`,`salary`,`pf`,`netsalary`,`pay_date`) values (1,'111','2','1000.0','120.0','880.0','02/18/2013'),(2,'111','2','1000.0','120.0','880.0','02/19/2013'),(3,'111','2','1000.0','120.0','880.0','02/20/2013'),(4,'111','2','1000.0','120.0','880.0','02/20/2013');

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `item_id` int(11) NOT NULL auto_increment,
  `item_type` varchar(15) default NULL,
  `item_name` varchar(20) default NULL,
  `total_quantity` varchar(20) default NULL,
  `unit_per_pack` varchar(20) default NULL,
  `cost_pack` varchar(20) default NULL,
  `category` varchar(15) default NULL,
  `expiry_date` date default NULL,
  PRIMARY KEY  (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

insert  into `stock`(`item_id`,`item_type`,`item_name`,`total_quantity`,`unit_per_pack`,`cost_pack`,`category`,`expiry_date`) values (5,'medicare','medicare','78','mbhj','bhj','hbjh','2012-03-03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

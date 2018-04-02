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

/*Table structure for table `ambulance_info` */

DROP TABLE IF EXISTS `ambulance_info`;

CREATE TABLE `ambulance_info` (
  `ambulance_id` int(11) NOT NULL auto_increment,
  `ambulance_type` varchar(50) default NULL,
  `patient_id` int(11) default '0',
  `patient_name` varchar(50) default NULL,
  `date` date default NULL,
  `time` time default NULL,
  `address` varchar(50) default NULL,
  `contact_no` varchar(11) default NULL,
  PRIMARY KEY  (`ambulance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ambulance_info` */

insert  into `ambulance_info`(`ambulance_id`,`ambulance_type`,`patient_id`,`patient_name`,`date`,`time`,`address`,`contact_no`) values (1,' critical care oxg',0,'fsefr','2013-09-08','01:00:00','erferf','345363'),(4,' critical care oxg',0,'gff','2013-09-08','12:00:00','hgfhbgt','5245252'),(5,'critical care ambulance',0,'ref','2013-09-07','02:00:00','fdvgdf','3442');

/*Table structure for table `ambulance_manager` */

DROP TABLE IF EXISTS `ambulance_manager`;

CREATE TABLE `ambulance_manager` (
  `ambulance_id` int(11) NOT NULL auto_increment,
  `ambulance_type` varchar(50) default NULL,
  `costper_kilo` varchar(11) default NULL,
  `ambulance_quantity` varchar(11) default NULL,
  PRIMARY KEY  (`ambulance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ambulance_manager` */

insert  into `ambulance_manager`(`ambulance_id`,`ambulance_type`,`costper_kilo`,`ambulance_quantity`) values (1,'general ambulance','300','7'),(2,'critical care ambulance','300','9'),(3,'critical care oxg','400','10'),(4,'Emergancy','508','2');

/*Table structure for table `ambulance_updation` */

DROP TABLE IF EXISTS `ambulance_updation`;

CREATE TABLE `ambulance_updation` (
  `ambulance_id` int(11) NOT NULL auto_increment,
  `ambulance_type` varchar(30) default NULL,
  `driver_name` varchar(30) default NULL,
  `contact_no` varchar(11) default NULL,
  PRIMARY KEY  (`ambulance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ambulance_updation` */

insert  into `ambulance_updation`(`ambulance_id`,`ambulance_type`,`driver_name`,`contact_no`) values (1,'critical care ambulance','gdfgdedwwwde','343435333'),(2,'Emergancy','sssss','656767'),(3,'critical care ambulance','fgre','6565657'),(4,'critical care ambulance','fggdfgdf','4543554');

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `attendance_id` double NOT NULL auto_increment,
  `emp_id` int(10) default NULL,
  `year` varchar(60) default NULL,
  `month` varchar(30) default NULL,
  `date` varchar(30) default NULL,
  `a_status` varchar(30) default NULL,
  PRIMARY KEY  (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attendance` */

insert  into `attendance`(`attendance_id`,`emp_id`,`year`,`month`,`date`,`a_status`) values (23,3,'2013','3','2013/03/11','P'),(24,5,'2013','3','2013/03/11','P'),(25,4,'2013','3','2013/03/11','P'),(26,6,'2013','3','2013/03/11','P'),(27,3,'2013','3','2013/03/12','L'),(28,3,'2013','3','2013/03/14','P'),(29,4,'2013','3','2013/03/14','P'),(30,5,'2013','3','2013/03/14','P'),(31,6,'2013','3','2013/03/14','A'),(32,3,'2013','3','2013/03/15','P'),(33,4,'2013','3','2013/03/15','P'),(34,5,'2013','3','2013/03/15','L'),(35,6,'2013','3','2013/03/15','A');

/*Table structure for table `bloodbank_manager` */

DROP TABLE IF EXISTS `bloodbank_manager`;

CREATE TABLE `bloodbank_manager` (
  `bloodtypeid` int(11) NOT NULL auto_increment,
  `bloodtypename` varchar(20) default NULL,
  `bloodquantity` int(11) default NULL,
  PRIMARY KEY  (`bloodtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bloodbank_manager` */

insert  into `bloodbank_manager`(`bloodtypeid`,`bloodtypename`,`bloodquantity`) values (1,'O_positive',19623),(2,'A_positive',11000),(3,'B_positive',9100),(4,'AB_positive',11880),(5,'O_negative',1000),(6,'A_negative',100040),(7,'B_negative',30),(8,'AB_negative',1000);

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

insert  into `bloodbankacceptor`(`acceptorid`,`acceptor_name`,`acceptor_dob`,`accept_gender`,`acceptor_age`,`acceptor_bloodgroup`,`acceptor_mob`,`acceptor_address`,`acceptor_city`,`acceptor_state`,`acceptor_country`,`acceptor_email`,`acceptor_date`,`acceptor_quantity`) values (19,'aaaaaa','aaasa','on','22','O_positive','null','null','rere','rree','null','ererer','2013-02-28',200),(20,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(21,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(22,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(23,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(24,'dharmendra','02/16/2013','on','21','O_positive','null','null','rw','rewrwe','null','rw','2013-02-28',200),(25,'dharmesh','2013/03/02','on','21','AB_positive','null','null','bhopal','mp','null','dharmesh@gmail.com','2013-03-01',120);

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

insert  into `bloodbankdonor`(`donorid`,`donor_name`,`donor_dob`,`donor_gender`,`donor_age`,`donor_bloodgroup`,`donor_weight`,`donor_mob`,`donor_address`,`donor_city`,`donor_state`,`donor_country`,`donor_email`,`donor_remark`,`donor_date`,`donor_lastddate`,`donor_quantity`,`donor_username`,`donor_password`,`donor_ConfirmPwd`) values (10,'govind','02/12/2013','male','21','O_positive',50,'fdfdfd','null','fdfd','fdfd','null','null','amit','2013-11-02','2013-11-02',10400,'amit','amit','amit'),(11,'vikash kumar','1989/02/03','male','21','O_positive',89,'123','null','bhopal','mp','null','null','donar','0168-10-27','0176-09-03',9523,'amit','123','123');

/*Table structure for table `dailycheckup` */

DROP TABLE IF EXISTS `dailycheckup`;

CREATE TABLE `dailycheckup` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `doctorname` varchar(50) default NULL,
  `nursename` varchar(50) default NULL,
  `remark` varchar(500) default NULL,
  `cost` int(11) default NULL,
  `checkupdate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dailycheckup` */

insert  into `dailycheckup`(`id`,`pid`,`doctorname`,`nursename`,`remark`,`cost`,`checkupdate`) values (1,66,'DR ASHTHA','NEHA','VSADFASDFASDF',1231,'2013-03-03'),(2,66,'jsfaj','opjajpaj','sagfasg',12,'2013-03-03'),(3,66,'asdas','234','asdasd',345,'2013-03-03'),(4,64,'AMIT','NEHA','daily checkup',1500,'2013-03-04'),(5,64,'sunil','heena','djkfjsdajfp sajfsdjapof jpoj',1500,'2013-03-04');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `departmentid` int(11) NOT NULL auto_increment,
  `department_name` varchar(100) default NULL,
  PRIMARY KEY  (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`departmentid`,`department_name`) values (1,'Anaesthesiology'),(2,'Burn SurgeryCardiac Services'),(3,'Cardiology'),(4,'Dental'),(5,'Dermatology'),(6,'Dietetics'),(7,'Endocriniology'),(8,'ENT'),(9,'Gastroenterology'),(10,'Medicine'),(11,'Nephrology'),(12,'Neurology'),(13,'Obstetrics Gynaecology'),(14,'Oncology'),(15,'Oncomedicine'),(16,'Oncosurgery'),(17,'Radiotherapy'),(18,'Ophthalmology'),(19,'Orthopaedics'),(20,'Paediatric Services'),(21,'Spine  and Pain'),(22,'Plastic Surgery'),(23,'Psychiatry'),(24,'Respiratory Lab Allergy Clinic'),(25,'Urology'),(26,'General Surgery'),(27,'Gastroenterology'),(31,'a'),(32,'a'),(33,'sad');

/*Table structure for table `discharge` */

DROP TABLE IF EXISTS `discharge`;

CREATE TABLE `discharge` (
  `dischargeid` int(11) NOT NULL auto_increment,
  `admitid` int(11) default NULL,
  `patientid` int(11) default NULL,
  `admitdate` date default NULL,
  `dischargedate` date default NULL,
  `totalamount` int(11) default NULL,
  `customerpaid` int(11) default NULL,
  PRIMARY KEY  (`dischargeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `discharge` */

insert  into `discharge`(`dischargeid`,`admitid`,`patientid`,`admitdate`,`dischargedate`,`totalamount`,`customerpaid`) values (2,24,66,'2013-03-01','2013-03-03',23588,10000),(3,25,67,'2013-03-03','2013-03-04',1000,0);

/*Table structure for table `diseaseinformation` */

DROP TABLE IF EXISTS `diseaseinformation`;

CREATE TABLE `diseaseinformation` (
  `diseaseid` int(11) NOT NULL auto_increment,
  `disease_name` varchar(100) default NULL,
  `disease_department` varchar(100) default NULL,
  PRIMARY KEY  (`diseaseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `diseaseinformation` */

insert  into `diseaseinformation`(`diseaseid`,`disease_name`,`disease_department`) values (1,'brain pain','brain'),(2,'spine pain','bon '),(3,'maleriya','disease'),(4,'pilia','Gastroenterology'),(5,'pet dard','Gastroenterology'),(6,'hath','disease'),(7,'stomuch','disease'),(8,'jalan','Gastroenterology'),(9,'aaa','Gastroenterology'),(10,'bbb','Gastroenterology'),(11,'ccc','Gastroenterology'),(12,'eyes','Cardiology'),(13,'ear','Cardiology'),(14,'nose','Cardiology'),(15,'lips','Cardiology'),(17,'xxx','Neurology');

/*Table structure for table `emp_attendance` */

DROP TABLE IF EXISTS `emp_attendance`;

CREATE TABLE `emp_attendance` (
  `a_id` int(10) NOT NULL auto_increment,
  `a_date` varchar(20) default NULL,
  `a_status` varchar(10) default NULL,
  `a_month` varchar(20) default NULL,
  `a_year` int(10) default NULL,
  PRIMARY KEY  (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_attendance` */

/*Table structure for table `emp_salary` */

DROP TABLE IF EXISTS `emp_salary`;

CREATE TABLE `emp_salary` (
  `emp_id` int(20) default NULL,
  `emp_name` varchar(50) default NULL,
  `s_issue_date` varchar(30) default NULL,
  `date1` varchar(30) default NULL,
  `date2` varchar(30) default NULL,
  `amount` int(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_salary` */

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
  `status` int(5) default NULL,
  `c_date` varchar(30) default NULL,
  `s_date` varchar(30) default NULL,
  PRIMARY KEY  (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`emp_id`,`emp_name`,`emp_dob`,`emp_jod`,`emp_telephone`,`emp_mobile`,`emp_marrialstatus`,`emp_gender`,`emp_address`,`emp_city`,`emp_state`,`emp_country`,`emp_bloodgroup`,`emp_type`,`emp_email`,`emp_image`,`emp_salary`,`emp_department`,`status`,`c_date`,`s_date`) values (3,'Manish','2013-03-12','2012-08-08','9874562023','987456123','unmarried','male','sdfgfgfds','indore','MP','gdfgfd','O+','doctor','gfgfdgd@gmail.com','abc',20000,'Anaesthesiology',1,'2013/03/15','2013/03/14'),(4,'Amit','2013-03-04','2012-08-08','9874562023','987456123','unmarried','female','fghdfhf','indore','MP','gdfgfd','O+','doctor','amit@gmail.com','abc',20000,'Anaesthesiology',1,'2013/03/15','2013/03/04'),(5,'Rohit','2013-03-04','2012-08-08','9874562023','987456123','unmarried','female','fghdfhf','indore','MP','gdfgfd','O+','doctor','amit@gmail.com','abc',20000,'Anaesthesiology',1,'2013/03/15','2013/03/04'),(6,'prabhat','2013-03-04','2012-08-08','9874562023','987456123','unmarried','female','fghdfhf','indore','MP','gdfgfd','O+','doctor','amit@gmail.com','abc',20000,'Anaesthesiology',1,'2013/03/15','2013/03/04'),(7,'AMIT','2013-03-05','2013-03-15','897658756855','9857476464','unmarried','male','DWARKAPURI INDORE','INDORE','MP','INDIA','O+','doctor','abc@gmail.com','abc',20000,'Neurology',0,'2013/03/15','2013/03/15');

/*Table structure for table `employee_account` */

DROP TABLE IF EXISTS `employee_account`;

CREATE TABLE `employee_account` (
  `accound_emp_id` int(11) NOT NULL auto_increment,
  `emp_id` int(11) default NULL,
  `bank_name` varchar(50) default NULL,
  `bank_account_no` varchar(50) default NULL,
  `pf_no` varchar(50) default NULL,
  `pan_no` varchar(50) default NULL,
  PRIMARY KEY  (`accound_emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_account` */

insert  into `employee_account`(`accound_emp_id`,`emp_id`,`bank_name`,`bank_account_no`,`pf_no`,`pan_no`) values (1,111,'sbi','63045454879','123456','bca1546'),(2,555,'ICICI','7897897897','123456','vd565'),(3,23,'sbi','7878789','6767','6767676666'),(4,24,'sbi','7878789','7878','6767676'),(5,25,'SBI','98745623122544','987456321','AFD78955'),(6,26,'SBI','98745623122544','987456321','AFD78955'),(7,27,'SBI','98745623122544','987456321','AFD78955'),(10,1,'SBI','98745623122544','987456321','AFD78955'),(15,2,'SBI','98745623122544','987456321','AFD78955'),(16,3,'SBI','98745623122544','987456321','AFD78955'),(17,4,'SBI','98745623122544','987456321','AFD78955'),(18,5,'SBI','98745623122544','987456321','AFD78955'),(19,6,'SBI','98745623122544','987456321','AFD78955'),(20,7,'SBI ','22222222222222','234343434','4434GDFG656');

/*Table structure for table `employee_experience` */

DROP TABLE IF EXISTS `employee_experience`;

CREATE TABLE `employee_experience` (
  `experience_id` int(11) NOT NULL auto_increment,
  `emp_id` int(30) NOT NULL COMMENT 'foreign key',
  `last_employer` varchar(100) default NULL,
  `post` varchar(50) default NULL,
  `salary` varchar(30) default NULL,
  `experience` varchar(200) default NULL,
  PRIMARY KEY  (`experience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_experience` */

insert  into `employee_experience`(`experience_id`,`emp_id`,`last_employer`,`post`,`salary`,`experience`) values (3,16,'ss','MD','2011111','4 year'),(4,19,'ci','ic','8000','2 year'),(5,21,'central infotech','567456','200','1 year'),(6,22,'ss','MD','2011111','Less than 1 year'),(7,23,'dxasdx','dxa','3232','Less than 1 year'),(8,24,'dxasdx','dxa','3232','1 year'),(9,25,'ci','ic','8000','Less than 1 year'),(10,26,'fresher','fresher','N/A','fresher'),(11,27,'fresher','fresher','N/A','fresher'),(14,1,'fresher','fresher','N/A','fresher'),(15,0,'fresher','fresher','N/A','fresher'),(16,0,'fresher','fresher','N/A','fresher'),(17,0,'fresher','fresher','N/A','fresher'),(18,0,'fresher','fresher','N/A','fresher'),(19,2,'fresher','fresher','N/A','fresher'),(20,3,'fresher','fresher','N/A','fresher'),(21,4,'dssa','dsad','8000','1 year'),(22,5,'dssa','dsad','8000','1 year'),(23,6,'dssa','dsad','8000','1 year'),(24,7,'CENTERAL','MANGER','20000','Less than 1 year');

/*Table structure for table `employee_leave` */

DROP TABLE IF EXISTS `employee_leave`;

CREATE TABLE `employee_leave` (
  `leave_id` int(11) NOT NULL auto_increment,
  `emp_id` varchar(30) default NULL,
  `leave_stating_date` varchar(30) default NULL,
  `leave_end_date` varchar(30) default NULL,
  `total_day` int(11) default NULL,
  PRIMARY KEY  (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_leave` */

insert  into `employee_leave`(`leave_id`,`emp_id`,`leave_stating_date`,`leave_end_date`,`total_day`) values (1,'23','03/01/2013','03/01/2013',1),(2,'23','2013/03/12','2013/03/13',367);

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

insert  into `employee_profetional_information`(`professional_id`,`emp_id`,`qualification_type`,`course_name`,`stream`,`university_name`,`college_name`,`course_duration`,`percentage`) values (9,16,'10','all','MP BOARD','Excellence','all','2005','80'),(10,16,'12','all','MP BOARD','Excellence','math','2007','85'),(11,16,'up','MBBS','SVPS','Excellence','MBBS','2011','76'),(12,16,'pg','MS','SVPS','SVPS','MS','2015','75'),(13,19,'jkjkj','cdf','indore','indore','indore','2012','75'),(18,21,'10','math','mp board','extra','all','2004','70'),(19,21,'12','math','mp board','extra','all','2006','80'),(20,21,'ug','math','mp board','extra','all','2006','80'),(21,21,'pg','math','mp board','jl','all','2011','70'),(22,22,'10','all','MP BOARD','Excellence','all','2005','80'),(23,22,'12','all','MP BOARD','Excellence','all','2007','80'),(24,22,'up','BCA','central infotech','central infotech','BCA','2011','80'),(25,23,'PG','ssssss','de','vfd','dcsce','2014','89'),(26,24,'PG','MS','RGPV','RGPV','xyz','2012','75'),(27,25,'jkjkj','cdf','indore','indore','fsfs','2012','75'),(28,26,'jkjkj','cdf','indore','indore','indore','2012','75'),(29,27,'dff','gfgfg','gfgf','gfgfd','gfgf','2012','45'),(32,1,'dff','gfgfg','gfgf','gfgfd','gfgf','2012','75'),(37,2,'dff','gfgfg','gfgf','gfgfd','gfgf','2012','75'),(38,3,'gfdgf','gfdgf','gfdgdfgfd','gfdgdfg','fgfdgdf','2012','52'),(39,4,'dff','gfgfg','gfgf','gfgfd','gfgf','2012','75'),(40,5,'dff','gfgfg','gfgf','gfgfd','gfgf','2012','75'),(41,6,'dff','gfgfg','gfgf','gfgfd','gfgf','2012','75'),(42,7,'10TH','ALL SUBJEC','MP BOARD','DHAR','ALL ','2005','75'),(43,7,'12','ALL SUBJEC','MP BOARD','DHAR','MATH','2007','88');

/*Table structure for table `employee_schedule` */

DROP TABLE IF EXISTS `employee_schedule`;

CREATE TABLE `employee_schedule` (
  `schedule_id` int(11) NOT NULL auto_increment,
  `emp_id` int(10) default NULL COMMENT 'foriegn key',
  `visiting_day` varchar(20) default NULL,
  `start_hr` int(10) default NULL,
  `start_minute` int(11) default NULL,
  `start_shift` varchar(3) default NULL,
  `end_hr` int(11) default NULL,
  `end_minute` int(10) default NULL,
  `end_shift` varchar(3) default NULL,
  `startconsult_time` varchar(20) default NULL,
  `endconsult_time` varchar(20) default NULL,
  `consult_cost` varchar(10) default '0',
  PRIMARY KEY  (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_schedule` */

insert  into `employee_schedule`(`schedule_id`,`emp_id`,`visiting_day`,`start_hr`,`start_minute`,`start_shift`,`end_hr`,`end_minute`,`end_shift`,`startconsult_time`,`endconsult_time`,`consult_cost`) values (1,3,'Monday',4,30,'PM',9,15,'PM','11 : 00 : AM','11 : 00 : AM','100'),(2,3,'TuesDay',1,0,'AM',1,0,'AM','11 : 00 : AM','11 : 00 : AM','100'),(3,7,'Monday',4,0,'PM',6,0,'PM','1 : 00 : AM','1 : 00 : AM','0');

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

insert  into `employee_specialization`(`specialization_id`,`emp_id`,`specialization`,`license_number`) values (3,16,'pharmacology','1231236'),(4,19,'alternative medicine','4510012'),(6,21,'cardiology','25252525'),(7,23,'alternative medicine','87798'),(8,24,'anatomy','67766'),(9,26,'acupuncture','4510012'),(10,27,'alternative medicine','4510012'),(11,0,'acupuncture','4510012'),(12,0,'acupuncture','4510012'),(13,1,'acupuncture','4510012'),(14,0,'acupuncture','4510012'),(15,0,'acupuncture','4510012'),(16,0,'acupuncture','4510012'),(17,0,'acupuncture','4510012'),(18,2,'acupuncture','4510012'),(19,3,'acupuncture','4510012'),(20,4,'addl. professor','4510012'),(21,5,'addl. professor','4510012'),(22,6,'addl. professor','4510012'),(23,7,'allergy','4FJFDKDKW33');

/*Table structure for table `expenditure` */

DROP TABLE IF EXISTS `expenditure`;

CREATE TABLE `expenditure` (
  `e_id` int(10) NOT NULL auto_increment,
  `e_item` varchar(50) default NULL,
  `e_date` date default NULL,
  `e_cost` varchar(10) default NULL,
  `e_remark` varchar(100) default NULL,
  PRIMARY KEY  (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expenditure` */

insert  into `expenditure`(`e_id`,`e_item`,`e_date`,`e_cost`,`e_remark`) values (1,'hh','2013-02-25','500','hghh');

/*Table structure for table `expireitem` */

DROP TABLE IF EXISTS `expireitem`;

CREATE TABLE `expireitem` (
  `supplyer_id` int(11) NOT NULL auto_increment,
  `supplyer_name` varchar(20) default NULL,
  `supplied_item_type` varchar(15) default NULL,
  `supplied_item_name` varchar(16) default NULL,
  `mfg_company` varchar(16) default NULL,
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

/*Data for the table `expireitem` */

/*Table structure for table `fileupload` */

DROP TABLE IF EXISTS `fileupload`;

CREATE TABLE `fileupload` (
  `name` varchar(30) default NULL,
  `contact` varchar(50) default NULL,
  `image` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fileupload` */

/*Table structure for table `floor` */

DROP TABLE IF EXISTS `floor`;

CREATE TABLE `floor` (
  `floor_number` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `floor` */

insert  into `floor`(`floor_number`) values (1),(2),(3),(4),(5),(6),(7);

/*Table structure for table `issuediteminfo` */

DROP TABLE IF EXISTS `issuediteminfo`;

CREATE TABLE `issuediteminfo` (
  `billno` int(11) NOT NULL auto_increment,
  `person_name` varchar(20) default NULL,
  `issue_date` date default NULL,
  `total_amount` int(11) default NULL,
  PRIMARY KEY  (`billno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issuediteminfo` */

insert  into `issuediteminfo`(`billno`,`person_name`,`issue_date`,`total_amount`) values (1,'amit kumar H','2013-03-08',200),(2,'Vijay Kumar','2013-03-08',200),(3,'alok sharma','2013-03-01',100),(4,'smart','2013-03-07',200),(5,'mohit nayaksd','2013-03-07',100),(6,'ASHAHSDAHSD','2013-03-07',100),(7,'Vijay Kumar','2013-03-08',200);

/*Table structure for table `itemsupplied` */

DROP TABLE IF EXISTS `itemsupplied`;

CREATE TABLE `itemsupplied` (
  `supplyer_id` int(11) NOT NULL auto_increment,
  `supplyer_name` varchar(20) default NULL,
  `supplied_item_type` varchar(15) default NULL,
  `supplied_item_name` varchar(16) default NULL,
  `mfg_company` varchar(16) default NULL,
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

insert  into `itemsupplied`(`supplyer_id`,`supplyer_name`,`supplied_item_type`,`supplied_item_name`,`mfg_company`,`supplied_date`,`requsting_quantity`,`supplied_quantity`,`pending_quantity`,`item_expiry_date`,`total_amount`,`paid_amount`,`pending_amount`) values (1,'amit chouhan','drug','introcunal','Ciphla','2012-10-04',1000,1000,0,'2014-01-17',1000,1000,0),(3,'Vijay Kumar Yadav','drug','medicare','indore','2011-11-28',1000,1000,0,'2012-01-05',1000,100,900),(4,'Anonymous','drug','ms','indore','2013-01-06',1000,100,900,'2013-06-28',100,100,0),(5,'Anonymous','drug','KZ 100','indore','2013-03-01',1000,1000,0,'2013-07-13',41000,41000,0),(6,'ANIL KUMAR','drug','XYZ','Ciphla','2012-03-01',1000,1000,0,'2014-08-21',10000,10000,0);

/*Table structure for table `login_control` */

DROP TABLE IF EXISTS `login_control`;

CREATE TABLE `login_control` (
  `emp_id` int(15) default NULL,
  `Emp_name` varchar(30) NOT NULL,
  `control_type` varchar(50) NOT NULL,
  `password` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_control` */

insert  into `login_control`(`emp_id`,`Emp_name`,`control_type`,`password`) values (16,'Vikash','Admin','admin'),(17,'anil','Reception','rec');

/*Table structure for table `operation_manager` */

DROP TABLE IF EXISTS `operation_manager`;

CREATE TABLE `operation_manager` (
  `id` int(11) NOT NULL auto_increment,
  `operation_type` varchar(50) default NULL,
  `operation_name` varchar(100) default NULL,
  `operation_cost` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `operation_manager` */

insert  into `operation_manager`(`id`,`operation_type`,`operation_name`,`operation_cost`) values (2,'Major','Removal of brain tumors',20000),(3,'Major','Correction of bone malformations of the skull and face',20000),(4,'Major','Repair of congenital heart disease',20000),(5,'Minor','Placement of ear tubes',20000),(6,'Minor','Hernia repairs',20000),(7,'Minor','Correction of bone fractures',20000),(8,'Minor','Removal of skin lesions',20000),(9,'Minor','Biopsy of growths',20000),(10,'Major','xyz',15000);

/*Table structure for table `operation_patient` */

DROP TABLE IF EXISTS `operation_patient`;

CREATE TABLE `operation_patient` (
  `operation_id` int(11) NOT NULL auto_increment,
  `operation_date` varchar(30) default NULL,
  `operation_time` varchar(10) default NULL,
  `operation_type` varchar(10) default NULL,
  `operation_name` varchar(100) default NULL,
  `patient_id` int(11) default NULL,
  `operation_cost` int(11) default NULL,
  `paid_operation_cost` int(11) default NULL,
  `surgeon_name` varchar(50) default NULL,
  `assistant_surgeon_name` varchar(50) default NULL,
  `nurse_Name` varchar(50) default NULL,
  `ot_boy_name` varchar(100) default NULL,
  `operation_theater` varchar(30) default NULL,
  PRIMARY KEY  (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `operation_patient` */

insert  into `operation_patient`(`operation_id`,`operation_date`,`operation_time`,`operation_type`,`operation_name`,`patient_id`,`operation_cost`,`paid_operation_cost`,`surgeon_name`,`assistant_surgeon_name`,`nurse_Name`,`ot_boy_name`,`operation_theater`) values (6,'2013/03/04','14:00','Minor','Hernia repairs',64,20000,10000,'Amit','aaaaaa','aaaa','aaaaa','A302'),(7,'2013/03/03','14:00','Minor','Placement of ear tubes',64,20000,10000,'Amit','Garvil','asssd','Rohit','A302');

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
  `test_cost` int(10) default NULL,
  PRIMARY KEY  (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathelogy_test_detail` */

insert  into `pathelogy_test_detail`(`test_id`,`test_name`,`test_content`,`start_range`,`end_range`,`test_cost`) values (1,'blood','wbc','15','20',200),(2,'blood','rbc','2','5',500),(3,'blood','heamoglobin','9','12',300),(4,'blood','xyz','123','321',123),(7,'stomach','stomach','30','40',700),(8,'cheast','cheast','10','20',400),(9,'xray','xray','10','20',600),(10,'ecg','heart','12','5',200),(12,'blood','hemo','100','200',20),(13,'blood','CXC','100','1000',50);

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

/*Table structure for table `pathology_patient` */

DROP TABLE IF EXISTS `pathology_patient`;

CREATE TABLE `pathology_patient` (
  `pathology_patient_id` int(11) NOT NULL auto_increment,
  `patient_name` varchar(100) default NULL,
  `patient_address` varchar(500) default NULL,
  `total` int(11) default NULL,
  `paid` int(11) default NULL,
  `p_status` varchar(20) default NULL,
  `test_date` date default NULL,
  PRIMARY KEY  (`pathology_patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_patient` */

insert  into `pathology_patient`(`pathology_patient_id`,`patient_name`,`patient_address`,`total`,`paid`,`p_status`,`test_date`) values (2,'Ravi','Lalaram',900,900,'uncheck','2013-03-07'),(3,'Syam','Vihar',1500,1500,'uncheck','2013-03-07'),(4,'Anil','Gujrat',1623,1623,'uncheck','2013-03-07'),(5,'Anonymous','asdf',1446,1446,'uncheck','2013-03-07'),(6,'ravi kmaur','123 lala bag',2100,2100,'uncheck','2013-03-08'),(7,'rohit','abcuii',820,820,'uncheck','2013-03-07');

/*Table structure for table `pathology_patient_test` */

DROP TABLE IF EXISTS `pathology_patient_test`;

CREATE TABLE `pathology_patient_test` (
  `pathology_patient_test` int(11) NOT NULL auto_increment,
  `pathology_patient` int(11) default NULL,
  `test_name` varchar(50) default NULL,
  `test_amount` int(11) default NULL,
  `test_status` varchar(20) default NULL,
  `test_remark` varchar(5000) default NULL,
  PRIMARY KEY  (`pathology_patient_test`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_patient_test` */

insert  into `pathology_patient_test`(`pathology_patient_test`,`pathology_patient`,`test_name`,`test_amount`,`test_status`,`test_remark`) values (1,2,'endoscopy',200,'clear','hello'),(2,2,'stomach',700,'pending','s'),(3,3,'endoscopy',200,'pending','remak'),(4,3,'ecg',200,'pending','remak'),(5,3,'cheast',400,'pending','remak'),(6,3,'stomach',700,'pending','remak'),(7,4,'blood',923,'pending','remak'),(8,4,'stomach',700,'pending','remak'),(9,5,'cheast',400,'clear','fg'),(10,5,'blood',1046,'clear','NOT FOUND'),(11,6,'xray',600,'clear','no need'),(12,6,'blood',800,'pending','remak'),(13,6,'stomach',700,'pending','remak'),(14,7,'ecg',200,'clear','No Status'),(15,7,'cheast',400,'clear','No sean'),(16,7,'blood',220,'clear','No SEAN');

/*Table structure for table `pathology_patient_test_detail` */

DROP TABLE IF EXISTS `pathology_patient_test_detail`;

CREATE TABLE `pathology_patient_test_detail` (
  `pathology_test_detail` int(11) NOT NULL auto_increment,
  `pathology_patient_id` int(11) default NULL,
  `test_id` int(11) default NULL,
  `test_name` varchar(100) default NULL,
  `test_content` varchar(100) default NULL,
  `test_startrange` varchar(100) default NULL,
  `test_endrange` varchar(100) default NULL,
  `test_result` varchar(100) default NULL,
  PRIMARY KEY  (`pathology_test_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_patient_test_detail` */

insert  into `pathology_patient_test_detail`(`pathology_test_detail`,`pathology_patient_id`,`test_id`,`test_name`,`test_content`,`test_startrange`,`test_endrange`,`test_result`) values (1,1,1,'blood','wbc','4000','9000',''),(2,1,3,'blood','heamoglobin','9','12',''),(3,1,8,'cheast','cheast','10','20',''),(4,2,11,'endoscopy','born','11','15',''),(5,2,7,'stomach','stomach','30','40',''),(6,3,8,'cheast','cheast','10','20',''),(7,3,10,'ecg','heart','12','5',''),(8,3,11,'endoscopy','born','11','15',''),(9,3,7,'stomach','stomach','30','40',''),(10,4,6,'blood','xyz','123','321',''),(11,4,3,'blood','heamoglobin','9','12',''),(12,4,2,'blood','rbc','2','5',''),(13,4,7,'stomach','stomach','30','40',''),(14,5,1,'blood','wbc','4000','9000','1000'),(15,5,6,'blood','xyz','123','321','100'),(16,5,4,'blood','xyz','123','321','10'),(17,5,8,'cheast','cheast','10','20','123'),(18,6,2,'blood','rbc','2','5',''),(19,6,3,'blood','heamoglobin','9','12',''),(20,6,7,'stomach','stomach','30','40',''),(21,6,9,'xray','xray','10','20','123'),(22,7,1,'blood','wbc','15','20','15-21'),(23,7,12,'blood','hemo','100','200','12-32'),(24,7,8,'cheast','cheast','10','20','10-12'),(25,7,10,'ecg','heart','12','5','12-9');

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
  `test_id` varchar(10) default NULL,
  `test_date` date default NULL,
  `result` varchar(100) default NULL,
  `refered_by` varchar(50) default NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathology_test_report` */

insert  into `pathology_test_report`(`report_id`,`patient_id`,`test_id`,`test_date`,`result`,`refered_by`) values (1,5,'1.1','2013-12-13','ssada','dr.pankaj'),(2,1,'1.2','2013-11-11','zxz','dr.jhingulla'),(3,1,'2.1','2013-01-10','dsa','dadad'),(4,1,'1.3',NULL,'gg',NULL),(5,1,'3.1','2013-01-02','s','tgyedr7u'),(6,5,'1.1','2013-01-02','','dfgds'),(7,5,'1.2','2013-01-02','','dfgds'),(8,5,'1.3','2013-01-02','','dfgds'),(9,72,'2.1','2013-03-07','','123131gg'),(10,72,'2.1','2013-03-06','','123131gg'),(11,73,'2.1','2013-03-06','13','123131gg'),(12,73,'4.1','2013-03-07','123','Dr sharm'),(13,73,'5.1','2013-03-08','','123131gg'),(14,64,'3.1','2013-03-08','11','123131gg'),(15,73,'1.2','2013-03-05','negative','dr.amit'),(16,73,'2.1','2013-03-05','23','dr.amit'),(17,4,'1.1','2013-03-06','','dr golu'),(18,4,'1.2','2013-03-06','','dr golu'),(19,4,'1.3','2013-03-06','','dr golu'),(20,4,'6.2','2013-03-06','','dr golu'),(21,1,'1.1','2013-03-06','','fdg'),(22,1,'1.2','2013-03-06','','fdg'),(23,1,'1.3','2013-03-06','','fdg'),(24,1,'6.2','2013-03-06','','fdg'),(25,1,'1.1','2013-03-06','','de'),(26,1,'1.2','2013-03-06','','de'),(27,1,'1.3','2013-03-06','','de'),(28,1,'6.2','2013-03-06','','de');

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
  `patient_marital_status` varchar(10) default NULL,
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

insert  into `patient`(`patient_registrationno`,`patient_name`,`patient_gender`,`patient_age`,`patient_marital_status`,`patient_father_husband`,`patient_address`,`patient_city`,`patient_religion`,`patient_mobile`,`patient_telephone`,`patient_bloodgroup`,`patient_disease`,`patient_dateofregistraton`) values (54,'anil ','male','21','yes','ashdka',' hjasdh h','ooih','iohoih','hoih','h','O+',NULL,'2013-02-28'),(55,'hkjhasd','male','41','yes','asdasd','asdasd','asdasd','asdf','asdasdasd','asdasd','O+',NULL,'2013-02-28'),(56,'sgdserydfg','male','sdg','yes','','y','try','sdfg','ery','rey','O+',NULL,'2013-02-28'),(57,'fdsg','male','12','yes','dfsg','dsfg','dfg','fdsg','fdgdfsg','dfsg','O+',NULL,'2013-02-28'),(58,'ko','male','21','yes','','asdf','asdf','fdsf','dfa','afd','O+',NULL,'2013-02-28'),(59,'kos','female','34','no','sadff','asdff','gfh','sg','gdh','afd','O+',NULL,'2013-02-28'),(60,'Rohit nayak','male','21','yes','poskdak',' skdfpjasdj fj','kpofk ','podsf opj',' jopdsfjojf',' jpojfspoj','O+',NULL,'2013-02-28'),(61,'Anil kimat','male','21','no','asd',' sa','asd','asd','asd','asd','O+',NULL,'2013-02-28'),(62,'hsfda hh','female','44','yes','jjf j','joj','pjj','jpj','jjp','jj','O+',NULL,'2013-02-28'),(63,'vijay dinanath','male','23','yes','asdf','adsf','sdf','adfs','asdf','hihoih','O+',NULL,'2013-02-28'),(64,'ravi','male','22','no','gf','fgfgfg','indore','gf','gfgf','gf','O+',NULL,'2013-02-27'),(65,'amit kumar','male','21','unmarried','smart','9-lalal','indore','indian','123647897','13645897','O+',NULL,'2013-03-01'),(66,'anil kumar','female','22','unmarried','','1256465','indore','indian','7897897989','65645365','O+',NULL,'2013-03-01'),(67,'kunal','male','21','unmarried','sunil','9 palasia','indore','hindu','1236547123','9876543211','O+',NULL,'2013-03-03'),(68,'amit kumar','male','21','unmarried','dsafsdaf','dsfahuisdha','uou','ouu','ouoi','uou','O-',NULL,'2013-03-04'),(69,'mohit','male','21','unmarried','asdasd','gd dsg','indore','indian','7897897989','65645365','O+',NULL,'2013-03-04'),(70,'amit','male','22','unmarried','asdf','efd gdsg','fdfd','indian','7897897989','65645365','O-',NULL,'2013-03-04'),(71,'amit','male','22','unmarried','asdf','efd gdsg','fdfd','indian','7897897989','65645365','O-',NULL,'2013-03-04'),(72,'hani','male','p','unmarried','pojpoj','poj','jpo','pojpo','pp','ojj','O+',NULL,'2013-03-05'),(73,'asd','male','p','unmarried','pojpoj','poj','jpo','pojpo','pp','ojj','O+',NULL,'2013-03-05'),(74,'Rohit','male','21',NULL,'HJKH','ssssss','indore','indian','1231231231','1231231231','O+','null','2013-03-08'),(75,'dffd','male','22','unmarried','gfgd','fgd','gfd','gf','gfgg','gf','O+',NULL,'2013-03-11'),(76,'gfgdfgf','male','32','unmarried','hdfh','gjhdgd','hfdf','hfhfdhdf','46543','56432','O+',NULL,'2013-03-11'),(77,'ffffsddfdsfd','male','12','unmarried','ikghkghk','dfhuyhcghg','dfhdfhdh','ggjffj','789542','8+64564','O+',NULL,'2013-03-11'),(78,'rtetrytyut','male','32','unmarried','hdsfdh','rgshfdghrfh','fikm','sertdeg','8453245','48663','O+',NULL,'2013-03-11'),(79,'ashis','male','22','unmarried','hfhdfh','dhfd','indore','indian','89566232','653256126','O+',NULL,'2013-03-11'),(80,'gdddddd','male','22','unmarried','fshhsh','gsd','indore','indian','89566232','653256126','O+',NULL,'2013-03-11'),(81,'vxxccxzc','male','22','unmarried','fafsa','fsfsf','fsfsfs','fssfs','89566232','653256126','O+',NULL,'2013-03-11'),(82,'eererre','male','11','unmarried','hff','fdhhhf','hfdf','indian','89566232','653256126','O+',NULL,'2013-03-11');

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

insert  into `patient_inside`(`admision_id`,`patient_id`,`doctor_id`,`bed_id`,`disease_name`,`admision_date`) values (13,54,15,6,'fgdfg','2013-02-28'),(14,55,15,6,'asd','2013-02-28'),(15,56,16,7,'asdfasf','2013-02-28'),(16,57,15,8,'refg','2013-02-28'),(17,58,18,10,'asdiu','2013-02-28'),(18,59,16,9,'hs','2013-02-28'),(19,60,18,12,'asdfsdaf','2013-02-28'),(20,61,15,13,'sad','2013-02-28'),(21,62,15,13,'rtert','2013-02-28'),(22,63,15,15,'asdfasdf','2013-02-28'),(23,64,17,2,'fdfgdgdg','2013-02-27'),(24,66,21,8,'AdK','2013-03-01'),(25,67,16,12,'Maleria','2013-03-03'),(26,72,16,13,'Maleria','2013-03-05'),(27,73,16,4,'eye','2013-03-05'),(28,79,24,3,'hfdhfdfff','2013-03-11'),(29,80,24,7,'eererre','2013-03-11'),(30,81,24,8,'bbbbb','2013-03-11'),(31,82,24,9,'sfss','2013-03-11');

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

insert  into `patient_outside`(`outside_id`,`patient_registrationno`,`doctor_id`,`disease_name`,`check_up_date`,`refer_by_dr`,`checkup_number`) values (1,65,16,'ear','2013-03-01','Dr asthana',1),(2,68,17,'ear','2013-03-04','uu',2),(3,68,17,'nose','2013-03-04','uu',2),(4,69,16,'ear','2013-03-04','asdf',1),(5,70,16,'ear','2013-03-04','asdf',2),(6,71,16,'ear','2013-03-04','asdf',3),(7,74,24,'eyes','2013-03-08','Dr sharma',1),(8,75,24,'eyes','2013-03-11','gf',1),(9,76,24,'eyes','2013-03-11','fhjgjg',2),(10,77,24,'ear','2013-03-11','ghgh',3),(11,78,24,'nose','2013-03-11','fh',4);

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

insert  into `room_bed_info`(`bed_id`,`room_id`,`bed_number`,`occupy_status`,`bed_status`) values (1,1,'A','1','activate'),(2,1,'B','1','activate'),(3,1,'C','1','activate'),(4,1,'D','1','activate'),(5,1,'E','1','activate'),(6,2,'A','1','activate'),(7,2,'B','1','activate'),(8,2,'C','1','activate'),(9,2,'D','1','activate'),(10,2,'E','0','activate'),(11,3,'A','0','deactivate'),(12,4,'A','0','activate'),(13,4,'B','1','activate'),(14,4,'C','0','activate'),(15,4,'D','1','activate'),(16,4,'E','0','activate'),(17,4,'F','0','activate'),(18,4,'G','0','activate'),(19,4,'H','0','activate'),(20,4,'I','0','activate'),(21,4,'J','1','deactivate'),(22,5,'A','0','activate'),(23,5,'B','0','activate'),(24,5,'C','0','activate'),(25,5,'D','0','activate'),(26,5,'E','0','activate'),(27,6,'A','0','activate'),(28,6,'B','0','activate');

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

insert  into `room_info`(`room_id`,`room_type_id`,`room_floor`,`room_number`,`bed_capacity`,`room_status`) values (1,1,'1','101',5,'activate'),(2,1,'1','102',5,'activate'),(3,2,'1','111',1,'activate'),(4,1,'2','103',10,'activate'),(5,2,'5','501',5,'activate'),(6,1,'1','130',2,'activate');

/*Table structure for table `room_type` */

DROP TABLE IF EXISTS `room_type`;

CREATE TABLE `room_type` (
  `room_type_id` int(11) NOT NULL auto_increment,
  `room_type_name` varchar(50) default NULL,
  `room_type_cost` int(20) default NULL,
  PRIMARY KEY  (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_type` */

insert  into `room_type`(`room_type_id`,`room_type_name`,`room_type_cost`) values (1,'general',1000),(2,'ipd',2000),(3,'opd',2000),(4,'icu',1000),(5,'ABC',300);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `salary_id` double NOT NULL auto_increment,
  `emp_id` varchar(30) default NULL,
  `total_days` varchar(90) default NULL,
  `salary` varchar(90) default NULL,
  `hra` varchar(30) default NULL,
  `ca` varchar(30) default NULL,
  `ma` varchar(30) default NULL,
  `sa` varchar(30) default NULL,
  `ea` varchar(30) default NULL,
  `pf` varchar(90) default NULL,
  `netsalary` varchar(90) default NULL,
  `pay_date` varchar(90) default NULL,
  `month` varchar(30) default NULL,
  PRIMARY KEY  (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salary` */

insert  into `salary`(`salary_id`,`emp_id`,`total_days`,`salary`,`hra`,`ca`,`ma`,`sa`,`ea`,`pf`,`netsalary`,`pay_date`,`month`) values (55,'3','1','666.0','133.2','53.28','83.25','73.26','13.32','79.92','721.0699999999999','2013/03/14','March');

/*Table structure for table `states` */

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL auto_increment,
  `state` varchar(100) default NULL,
  PRIMARY KEY  (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `states` */

insert  into `states`(`state_id`,`state`) values (1,'Andra Pradesh'),(2,'Arunachal Pradesh'),(3,'Assam'),(4,'Bihar'),(5,'Chhattisgarh'),(6,'Goa'),(7,'Gujarat'),(8,'Haryana'),(9,'Himachal Pradesh'),(10,'Jammu and Kashmir'),(11,'Jharkhand'),(12,'Karnataka'),(13,'Kerala'),(14,'Madya Pradesh'),(15,'Maharashtra'),(16,'Manipur'),(17,'Meghalaya'),(18,'Mizoram'),(19,'Orissa'),(20,'Punjab'),(21,'Rajasthan'),(22,'Sikkim'),(23,'Tamil Nadu'),(24,'Tripura'),(25,'Uttaranchal'),(26,'Uttar Pradesh'),(27,'West Bengal\r\n');

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `item_id` int(11) NOT NULL auto_increment,
  `item_type` varchar(15) default NULL,
  `item_name` varchar(20) default NULL,
  `mfg_company` varchar(20) default NULL,
  `total_quantity` varchar(20) default NULL,
  PRIMARY KEY  (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

insert  into `stock`(`item_id`,`item_type`,`item_name`,`mfg_company`,`total_quantity`) values (1,'drug','introcunal','Ciphla','800'),(2,'drug','CTZ','Ciphla','300'),(3,'drug','medicare','indore','900'),(5,'drug','KZ 100','indore','0'),(6,'drug','XYZ','Ciphla','1000');

/*Table structure for table `supplierinfo` */

DROP TABLE IF EXISTS `supplierinfo`;

CREATE TABLE `supplierinfo` (
  `supplyer_id` int(11) NOT NULL auto_increment,
  `supplyer_name` varchar(15) default NULL,
  `supplyer_address` varchar(20) default NULL,
  `supplyer_city` varchar(15) default NULL,
  `supplyer_state` varchar(15) default NULL,
  `supplyer_country` varchar(15) default NULL,
  `supplyer_contactno` varchar(10) default NULL,
  `supplyer_email` varchar(15) default NULL,
  PRIMARY KEY  (`supplyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `supplierinfo` */

insert  into `supplierinfo`(`supplyer_id`,`supplyer_name`,`supplyer_address`,`supplyer_city`,`supplyer_state`,`supplyer_country`,`supplyer_contactno`,`supplyer_email`) values (1,'s','kguk','ytiuu','gtiug','kiran prakas','ytiutgi','uyguki'),(2,NULL,NULL,NULL,NULL,'suria',NULL,NULL),(3,NULL,NULL,NULL,NULL,'asian pait',NULL,NULL),(4,'govind','dsfasdf','indore','mp','india','124567489','rohti@gmail.com'),(5,'amit chouhan','syamanagar','indore','mp','india','1236547891','amit@gmail.com'),(6,'Anonymous','9- sadas','Indore','MP','India','123654132','an@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

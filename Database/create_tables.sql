->CREATE TABLE `etaireia` (
  `AFM` char(9) NOT NULL,
  `DOY` varchar(30) DEFAULT NULL,
  `name` varchar(35) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `street` varchar(15) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`AFM`)
);

->CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `lastname` varchar(35) DEFAULT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`username`)
);

->CREATE TABLE `evaluator` (
  `username` varchar(30) NOT NULL,
  `exp_years` tinyint DEFAULT '0',
  `firm` char(9) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_firm` (`firm`),
  CONSTRAINT `fk_firm` FOREIGN KEY (`firm`) REFERENCES `etaireia` (`AFM`) ON DELETE CASCADE,
  CONSTRAINT `fk_usrnm` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
);

->CREATE TABLE `employee` (
  `username` varchar(30) NOT NULL,
  `bio` text,
  `sistatikes` varchar(35) DEFAULT NULL,
  `certificates` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_employee_usrnm` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE
);

->CREATE TABLE `languages` (
  `candid` varchar(30) NOT NULL,
  `lang` set('ENG','FR','SP','GE','CH','GR') NOT NULL,
  PRIMARY KEY (`candid`,`lang`),
  CONSTRAINT `fk_languages_candid` FOREIGN KEY (`candid`) REFERENCES `employee` (`username`) ON DELETE CASCADE
);

->CREATE TABLE `project` (
  `candid` varchar(30) NOT NULL,
  `num` tinyint NOT NULL,
  `descr` text,
  `url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`candid`,`num`),
  CONSTRAINT `fk_project_candid` FOREIGN KEY (`candid`) REFERENCES `employee` (`username`) ON DELETE CASCADE
);

->CREATE TABLE `job` (
  `id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `position` varchar(60) DEFAULT NULL,
  `edra` varchar(60) DEFAULT NULL,
  `evaluator` varchar(30) DEFAULT NULL,
  `announce_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `submission_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_evaluator` (`evaluator`),
  CONSTRAINT `fk_job_evaluator` FOREIGN KEY (`evaluator`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE
);

->CREATE TABLE `subject` (
  `title` varchar(36) NOT NULL,
  `description` tinytext,
  `belongsto` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `fk_subject_belongsto` (`belongsto`),
  CONSTRAINT `fk_subject_belongsto` FOREIGN KEY (`belongsto`) REFERENCES `subject` (`title`) ON DELETE CASCADE
);

->CREATE TABLE `requires` (
  `job_id` int NOT NULL,
  `subject_title` varchar(36) NOT NULL,
  PRIMARY KEY (`job_id`,`subject_title`),
  KEY `fk_requires_subjectttl` (`subject_title`),
  CONSTRAINT `fk_requires_jobid` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_requires_subjectttl` FOREIGN KEY (`subject_title`) REFERENCES `subject` (`title`) ON DELETE CASCADE
);

->CREATE TABLE `applies` (
  `cand_usrname` varchar(30) NOT NULL,
  `job_id` int NOT NULL,
  PRIMARY KEY (`cand_usrname`,`job_id`),
  KEY `fk_applies_jobid` (`job_id`),
  CONSTRAINT `fk_applies_candusrname` FOREIGN KEY (`cand_usrname`) REFERENCES `employee` (`username`),
  CONSTRAINT `fk_applies_jobid` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE
);

->CREATE TABLE `degree` (
  `titlos` varchar(150) NOT NULL,
  `idryma` varchar(150) NOT NULL,
  `bathmida` enum('BSc','MSc','PhD') DEFAULT NULL,
  PRIMARY KEY (`titlos`,`idryma`)
);

->CREATE TABLE `has_degree` (
  `degr_title` varchar(150) NOT NULL,
  `degr_idryma` varchar(140) NOT NULL,
  `cand_usrname` varchar(30) NOT NULL,
  `etos` year DEFAULT NULL,
  `grade` float DEFAULT NULL,
  PRIMARY KEY (`degr_title`,`degr_idryma`,`cand_usrname`),
  KEY `fk_hasdegree_candusrname` (`cand_usrname`),
  CONSTRAINT `fk_hasdegree_candusrname` FOREIGN KEY (`cand_usrname`) REFERENCES `employee` (`username`) ON DELETE CASCADE,
  CONSTRAINT `fk_hasdegree_titleidryma` FOREIGN KEY (`degr_title`, `degr_idryma`) REFERENCES `degree` (`titlos`, `idryma`)
);

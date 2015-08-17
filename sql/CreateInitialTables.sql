

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



CREATE TABLE `designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  `cctc` varchar(45) DEFAULT NULL,
  `ectc` varchar(45) DEFAULT NULL,
  `prevorg` varchar(45) DEFAULT NULL,
  `resumelink` varchar(100) DEFAULT NULL,
  `otherfile` varchar(100) DEFAULT NULL,
  `createdon` varchar(45) DEFAULT NULL,
  `lastmodified` varchar(45) DEFAULT NULL,
  `stageid` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

CREATE TABLE `stage` (
  `stageid` int(11) NOT NULL AUTO_INCREMENT,
  `stage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stageid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

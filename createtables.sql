

CREATE TABLE `feedsources` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`fmtype` VARCHAR(128) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`fmsource` VARCHAR(128) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fmname` VARCHAR(128) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fmurl` VARCHAR(128) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fmschedule` VARCHAR(128) NOT NULL COLLATE 'utf8mb4_general_ci',
	`date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`date_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `fmurl` (`fmurl`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;


CREATE TABLE `saved` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`social` TINYINT(1) NOT NULL DEFAULT '0',
	`websites` TINYINT(1) NOT NULL DEFAULT '0',
	`rss` TINYINT(1) NOT NULL DEFAULT '0',
	`forums` TINYINT(1) NOT NULL DEFAULT '0',
	`subcats` VARCHAR(1024) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;
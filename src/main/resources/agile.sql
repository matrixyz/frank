# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: agile
# ------------------------------------------------------
# Server version 5.6.22

#
# Source for table t_core_column
#

DROP TABLE IF EXISTS `t_core_column`;
CREATE TABLE `t_core_column` (
  `col_id` int(11) NOT NULL AUTO_INCREMENT,
  `col_name` varchar(100) NOT NULL DEFAULT '' COMMENT '列名称',
  `col_type` varchar(20) NOT NULL DEFAULT '' COMMENT '列数据类型',
  `col_index` int(11) DEFAULT NULL COMMENT '字段在表中的排列顺序',
  `col_default` varchar(255) DEFAULT '' COMMENT '字段默认值',
  `col_null` bit(1) DEFAULT b'0' COMMENT '是否允许字段为空值，默认为0允许',
  `tab_id` int(11) DEFAULT NULL COMMENT '表id',
  `comment` varchar(255) DEFAULT NULL COMMENT '列注释',
  `cre_tim` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`col_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='字段数据记录';

#
# Dumping data for table t_core_column
#

LOCK TABLES `t_core_column` WRITE;
/*!40000 ALTER TABLE `t_core_column` DISABLE KEYS */;
INSERT INTO `t_core_column` VALUES (1,'pwd','double',NULL,'阿斯蒂芬',b'1',2,'这是注释','2017-04-06 21:49:18');
INSERT INTO `t_core_column` VALUES (2,'name','int',NULL,'user',b'1',2,'这是注释','2017-04-06 21:49:18');
INSERT INTO `t_core_column` VALUES (3,'test','int',NULL,'user',b'1',2,'这是注释','2017-04-06 21:49:18');
INSERT INTO `t_core_column` VALUES (4,'pwd','double',NULL,'阿斯蒂芬',b'1',3,'这是注释','2017-04-06 21:49:53');
INSERT INTO `t_core_column` VALUES (5,'name','int',NULL,'user',b'1',3,'这是注释','2017-04-06 21:49:53');
INSERT INTO `t_core_column` VALUES (6,'test','int',NULL,'user',b'1',3,'这是注释','2017-04-06 21:49:53');
INSERT INTO `t_core_column` VALUES (7,'11','int',NULL,'user',b'1',4,'这是注释','2017-04-14 22:46:47');
INSERT INTO `t_core_column` VALUES (8,'11','int',NULL,'user',b'1',4,'这是注释','2017-04-14 22:46:47');
INSERT INTO `t_core_column` VALUES (9,'11','int',NULL,'user',b'1',4,'这是注释','2017-04-14 22:46:47');
INSERT INTO `t_core_column` VALUES (10,'11','int',NULL,'user',b'1',5,'这是注释','2017-06-04 09:46:24');
INSERT INTO `t_core_column` VALUES (11,'11','int',NULL,'user',b'1',5,'这是注释','2017-06-04 09:46:24');
INSERT INTO `t_core_column` VALUES (12,'11','int',NULL,'user',b'1',5,'这是注释','2017-06-04 09:46:24');
INSERT INTO `t_core_column` VALUES (13,'sdfsadf','int',NULL,'user',b'1',6,'这是注释','2017-06-04 09:51:25');
INSERT INTO `t_core_column` VALUES (14,'aaa','int',NULL,'user',b'1',6,'这是注释','2017-06-04 09:51:25');
INSERT INTO `t_core_column` VALUES (15,'是打发斯蒂芬','int',NULL,'user',b'1',6,'这是注释','2017-06-04 09:51:25');
INSERT INTO `t_core_column` VALUES (16,'sdfsadf','int',NULL,'user',b'1',7,'这是注释','2017-06-04 09:52:19');
INSERT INTO `t_core_column` VALUES (17,'aaa','int',NULL,'user',b'1',7,'这是注释','2017-06-04 09:52:19');
INSERT INTO `t_core_column` VALUES (18,'是打发斯蒂芬','int',NULL,'user',b'1',7,'这是注释','2017-06-04 09:52:19');
INSERT INTO `t_core_column` VALUES (19,'user_name','nvarchar',NULL,'user',b'1',8,'这是注释','2017-06-04 21:54:23');
INSERT INTO `t_core_column` VALUES (20,'user_age','int',NULL,'user',b'1',8,'这是注释','2017-06-04 21:54:23');
INSERT INTO `t_core_column` VALUES (21,'just','int',NULL,'user',b'1',8,'这是注释','2017-06-04 21:54:23');
INSERT INTO `t_core_column` VALUES (22,'ddd','int',NULL,'user',b'1',9,'这是注释','2017-06-04 22:07:52');
INSERT INTO `t_core_column` VALUES (23,'11','int',NULL,'user',b'1',9,'这是注释','2017-06-04 22:07:52');
INSERT INTO `t_core_column` VALUES (24,'11','int',NULL,'user',b'1',9,'这是注释','2017-06-04 22:07:52');
/*!40000 ALTER TABLE `t_core_column` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_core_db
#

DROP TABLE IF EXISTS `t_core_db`;
CREATE TABLE `t_core_db` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '数据库名称',
  `index_sort` int(11) DEFAULT '0' COMMENT '排序',
  `comment` varchar(200) DEFAULT NULL COMMENT '数据库描述',
  `pro_id` smallint(3) DEFAULT '0' COMMENT '项目外键',
  PRIMARY KEY (`Id`),
  KEY `fk_pro_id` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='数据库信息表';

#
# Dumping data for table t_core_db
#

LOCK TABLES `t_core_db` WRITE;
/*!40000 ALTER TABLE `t_core_db` DISABLE KEYS */;
INSERT INTO `t_core_db` VALUES (1,'jindian_db',1,'金典网会员管理系统',1);
INSERT INTO `t_core_db` VALUES (2,'p2p_db',0,'中金金服信贷管理系统',2);
/*!40000 ALTER TABLE `t_core_db` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_core_industry
#

DROP TABLE IF EXISTS `t_core_industry`;
CREATE TABLE `t_core_industry` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '-1' COMMENT '父代信息，pid=-1代表本身是顶级分类',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '行业名称',
  `query_count` int(11) NOT NULL DEFAULT '0' COMMENT '被查询次数',
  `use_count` int(11) NOT NULL DEFAULT '0' COMMENT '被使用次数',
  `comment` varchar(255) DEFAULT NULL COMMENT '说明备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='行业分类';

#
# Dumping data for table t_core_industry
#

LOCK TABLES `t_core_industry` WRITE;
/*!40000 ALTER TABLE `t_core_industry` DISABLE KEYS */;
INSERT INTO `t_core_industry` VALUES (1,-1,'金融业',0,0,'金融行业，包括银行，保险，证券，贵金属，期货等各种衍生品');
/*!40000 ALTER TABLE `t_core_industry` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_core_project
#

DROP TABLE IF EXISTS `t_core_project`;
CREATE TABLE `t_core_project` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '项目名称',
  `index_sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `comment` varchar(300) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_core_project
#

LOCK TABLES `t_core_project` WRITE;
/*!40000 ALTER TABLE `t_core_project` DISABLE KEYS */;
INSERT INTO `t_core_project` VALUES (1,'信息管理系统',0,'金典网后台会员管理系统');
INSERT INTO `t_core_project` VALUES (2,'中金金服信贷管理系统',1,'中金金服信贷管理系统');
/*!40000 ALTER TABLE `t_core_project` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_core_table
#

DROP TABLE IF EXISTS `t_core_table`;
CREATE TABLE `t_core_table` (
  `tab_id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_name` varchar(100) NOT NULL DEFAULT '' COMMENT '表名称',
  `db_id` int(11) NOT NULL DEFAULT '0' COMMENT '数据库id',
  `comment` varchar(255) DEFAULT NULL COMMENT '表注释',
  `charset` varchar(10) NOT NULL DEFAULT 'utf-8' COMMENT '表字符集格式',
  `cre_tim` datetime DEFAULT NULL COMMENT '创建时间',
  `tab_type` varchar(10) DEFAULT 'InnoDB' COMMENT '表引擎类型',
  PRIMARY KEY (`tab_id`),
  KEY `fk_db_id` (`db_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='表数据记录';

#
# Dumping data for table t_core_table
#

LOCK TABLES `t_core_table` WRITE;
/*!40000 ALTER TABLE `t_core_table` DISABLE KEYS */;
INSERT INTO `t_core_table` VALUES (1,'users',1,'注释','utf-8','2017-04-06 21:41:46','InnoDB');
INSERT INTO `t_core_table` VALUES (2,'users',1,'注释','utf-8','2017-04-06 21:49:18','InnoDB');
INSERT INTO `t_core_table` VALUES (3,'users',1,'注释','utf-8','2017-04-06 21:49:53','InnoDB');
INSERT INTO `t_core_table` VALUES (4,'Bill Smith',1,NULL,'utf-8','2017-04-14 22:46:47','InnoDB');
INSERT INTO `t_core_table` VALUES (5,'Bill Smith',2,NULL,'utf-8','2017-06-04 09:46:24','InnoDB');
INSERT INTO `t_core_table` VALUES (6,'Bill Smith',2,NULL,'utf-8','2017-06-04 09:51:25','InnoDB');
INSERT INTO `t_core_table` VALUES (7,'Bill Smith',2,NULL,'utf-8','2017-06-04 09:52:19','InnoDB');
INSERT INTO `t_core_table` VALUES (8,'bbs_config',1,NULL,'utf-8','2017-06-04 21:54:23','InnoDB');
INSERT INTO `t_core_table` VALUES (9,'jkdothat',1,'','utf-8','2017-06-04 22:07:52','InnoDB');
/*!40000 ALTER TABLE `t_core_table` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_core_tablekey
#

DROP TABLE IF EXISTS `t_core_tablekey`;
CREATE TABLE `t_core_tablekey` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL DEFAULT '' COMMENT '表名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统中所有表对应的整型编号ID';

#
# Dumping data for table t_core_tablekey
#

LOCK TABLES `t_core_tablekey` WRITE;
/*!40000 ALTER TABLE `t_core_tablekey` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_core_tablekey` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_efficient_query_history
#

DROP TABLE IF EXISTS `t_efficient_query_history`;
CREATE TABLE `t_efficient_query_history` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `query_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '关键字被查询发生的日期',
  `query_type` varchar(255) DEFAULT NULL COMMENT '查询描述，可能是行业查询、时间查询、表库字段查询、业务查询',
  `query_sql` varchar(300) NOT NULL DEFAULT '' COMMENT '被查询的SQL语句',
  `query_times` int(11) NOT NULL DEFAULT '1' COMMENT '关键字被查询的次数',
  `res_count` int(11) NOT NULL DEFAULT '0' COMMENT '关键字被查询出的结果数量',
  `res_preview` varchar(255) DEFAULT NULL COMMENT '该查询结果的前N条记录预览',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='高效字段查询之历史查询集合';

#
# Dumping data for table t_efficient_query_history
#

LOCK TABLES `t_efficient_query_history` WRITE;
/*!40000 ALTER TABLE `t_efficient_query_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_efficient_query_history` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for view v_pro_db_tab_nam
#

DROP VIEW IF EXISTS `v_pro_db_tab_nam`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_pro_db_tab_nam` AS select `tab`.`tab_id` AS `tab_id`,`pro`.`name` AS `pro_name`,`db`.`name` AS `db_name`,`tab`.`tab_name` AS `tab_name` from ((`t_core_db` `db` join `t_core_project` `pro`) join `t_core_table` `tab`) where ((`tab`.`db_id` = `db`.`Id`) and (`db`.`Id` = `pro`.`id`));

#
# Source for view v_pro_db_tab_tree
#

DROP VIEW IF EXISTS `v_pro_db_tab_tree`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_pro_db_tab_tree` AS select concat('db_',`t_core_db`.`Id`) AS `id`,`t_core_db`.`name` AS `name`,'db' AS `obj_type`,concat('pro_',`t_core_db`.`pro_id`) AS `pid`,`t_core_db`.`comment` AS `comment` from `t_core_db` where `t_core_db`.`pro_id` in (select `t_core_project`.`id` from `t_core_project`) union select concat('pro_',`t_core_project`.`id`) AS `id`,`t_core_project`.`name` AS `name`,'pro' AS `obj_type`,0 AS `pid`,`t_core_project`.`comment` AS `comment` from `t_core_project` union select concat('tab_',`t_core_table`.`tab_id`) AS `id`,`t_core_table`.`tab_name` AS `name`,'tab' AS `obj_type`,concat('db_',`t_core_table`.`db_id`) AS `pid`,`t_core_table`.`comment` AS `comment` from `t_core_table` where `t_core_table`.`db_id` in (select `t_core_db`.`Id` from `t_core_db`);

#
# Source for trigger insert_t_core_column_trigger
#

DROP TRIGGER IF EXISTS `agile`.`insert_t_core_column_trigger`;
CREATE DEFINER='root'@'localhost' TRIGGER `agile`.`insert_t_core_column_trigger` BEFORE INSERT ON `agile`.`t_core_column`
  FOR EACH ROW SET NEW.`cre_tim` = NOW();


#
# Source for trigger insert_t_core_table_trigger
#

DROP TRIGGER IF EXISTS `agile`.`insert_t_core_table_trigger`;
CREATE DEFINER='root'@'localhost' TRIGGER `agile`.`insert_t_core_table_trigger` BEFORE INSERT ON `agile`.`t_core_table`
  FOR EACH ROW SET NEW.`cre_tim` = NOW();


#
#  Foreign keys for table t_core_db
#

ALTER TABLE `t_core_db`
ADD CONSTRAINT `fk_pro_id` FOREIGN KEY (`pro_id`) REFERENCES `t_core_project` (`id`);

#
#  Foreign keys for table t_core_table
#

ALTER TABLE `t_core_table`
ADD CONSTRAINT `fk_db_id` FOREIGN KEY (`db_id`) REFERENCES `t_core_db` (`Id`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

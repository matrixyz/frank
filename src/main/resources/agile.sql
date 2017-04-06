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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='字段数据记录';

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
/*!40000 ALTER TABLE `t_core_column` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_core_db
#

DROP TABLE IF EXISTS `t_core_db`;
CREATE TABLE `t_core_db` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '数据库名称',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据库信息表';

#
# Dumping data for table t_core_db
#

LOCK TABLES `t_core_db` WRITE;
/*!40000 ALTER TABLE `t_core_db` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='行业分类';

#
# Dumping data for table t_core_industry
#

LOCK TABLES `t_core_industry` WRITE;
/*!40000 ALTER TABLE `t_core_industry` DISABLE KEYS */;
INSERT INTO `t_core_industry` VALUES (1,-1,'金融业',0,0,'金融行业，包括银行，保险，证券，贵金属，期货等各种衍生品');
/*!40000 ALTER TABLE `t_core_industry` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_core_table
#

DROP TABLE IF EXISTS `t_core_table`;
CREATE TABLE `t_core_table` (
  `tab_id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_name` varchar(100) NOT NULL DEFAULT '' COMMENT '表名称',
  `db_id` varchar(30) DEFAULT NULL COMMENT '数据库id',
  `comment` varchar(255) DEFAULT NULL COMMENT '表注释',
  `cre_tim` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`tab_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='表数据记录';

#
# Dumping data for table t_core_table
#

LOCK TABLES `t_core_table` WRITE;
/*!40000 ALTER TABLE `t_core_table` DISABLE KEYS */;
INSERT INTO `t_core_table` VALUES (1,'users','1','注释','2017-04-06 21:41:46');
INSERT INTO `t_core_table` VALUES (2,'users','1','注释','2017-04-06 21:49:18');
INSERT INTO `t_core_table` VALUES (3,'users','1','注释','2017-04-06 21:49:53');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统中所有表对应的整型编号ID';

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


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

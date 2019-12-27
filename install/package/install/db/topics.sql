CREATE TABLE `{:=DBPREFIX=:}topics` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `board` smallint(5) unsigned NOT NULL default '0',
  `topic` text NOT NULL,
  `prefix` smallint(5) unsigned NOT NULL default '0',
  `posts` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `date` int(10) unsigned NOT NULL default '0',
  `status` enum('0','1','2') NOT NULL default '0',
  `last` int(10) unsigned NOT NULL default '0',
  `sticky` enum('0','1') NOT NULL default '0',
  `last_name` varchar(255) NOT NULL default '',
  `vquestion` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `last` (`last`),
  KEY `name` (`name`),
  KEY `board` (`board`),
  FULLTEXT KEY `topic` (`topic`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;
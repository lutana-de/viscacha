CREATE TABLE `{:=DBPREFIX=:}groups` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `admin` enum('0','1') NOT NULL default '0',
  `gmod` enum('0','1') NOT NULL default '0',
  `guest` enum('0','1') NOT NULL default '0',
  `members` enum('0','1') NOT NULL default '0',
  `profile` enum('0','1') NOT NULL default '0',
  `pdf` enum('0','1') NOT NULL default '0',
  `pm` enum('0','1') NOT NULL default '0',
  `wwo` enum('0','1') NOT NULL default '0',
  `search` enum('0','1') NOT NULL default '0',
  `team` enum('0','1') NOT NULL default '0',
  `usepic` enum('0','1') NOT NULL default '0',
  `useabout` enum('0','1') NOT NULL default '0',
  `usesignature` enum('0','1') NOT NULL default '0',
  `downloadfiles` enum('0','1') NOT NULL default '0',
  `forum` enum('0','1') NOT NULL default '0',
  `posttopics` enum('0','1') NOT NULL default '0',
  `postreplies` enum('0','1') NOT NULL default '0',
  `addvotes` enum('0','1') NOT NULL default '0',
  `attachments` enum('0','1') NOT NULL default '0',
  `edit` enum('0','1') NOT NULL default '0',
  `voting` enum('0','1') NOT NULL default '0',
  `docs` enum('0','1') NOT NULL default '0',
  `flood` smallint(5) unsigned NOT NULL default '15',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `core` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `core` (`core`)
) TYPE=MyISAM AUTO_INCREMENT=6 ;

INSERT INTO `{:=DBPREFIX=:}groups` (`id`, `admin`, `gmod`, `guest`, `members`, `profile`, `pdf`, `pm`, `wwo`, `search`, `team`, `usepic`, `useabout`, `usesignature`, `downloadfiles`, `forum`, `posttopics`, `postreplies`, `addvotes`, `attachments`, `edit`, `voting`, `docs`, `flood`, `title`, `name`, `core`) VALUES (1, '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, 'Administrator', 'Administratoren', '1'),
(2, '0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 15, 'G-Mod', 'Super Moderatoren', '0'),
(4, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 20, 'Mitglied', 'Mitglieder', '1'),
(5, '0', '0', '1', '0', '0', '1', '0', '0', '1', '1', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '1', 60, 'Gast', 'G�ste', '1'),
(3, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 15, 'Moderator', 'Moderatoren', '0');
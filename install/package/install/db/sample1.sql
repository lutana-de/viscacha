INSERT INTO `{:=DBPREFIX=:}bbcode` (`id`, `bbcodetag`, `bbcodereplacement`, `bbcodeexample`, `bbcodeexplanation`, `twoparams`, `title`, `buttonimage`) VALUES ('1', 's', '&lt;s&gt;{param}&lt;/s&gt;', '&lt;s&gt;Dies gilt nicht mehr&lt;/s&gt;', 'Etwas durchstreichen', '0', 'Strikethrough', '');

INSERT INTO `{:=DBPREFIX=:}categories` (`id`, `name`, `description`, `parent`, `position`) VALUES ('1', 'Viscacha', 'Sample Category', '0', '0');

INSERT INTO `{:=DBPREFIX=:}forums` (`id`, `name`, `description`, `topics`, `replies`, `parent`, `position`, `last_topic`, `count_posts`, `opt`, `optvalue`, `forumzahl`, `topiczahl`, `prefix`, `invisible`, `readonly`, `reply_notification`, `topic_notification`, `active_topic`, `message_active`, `message_title`, `message_text`) VALUES ('1', 'Announcements', 'Get the latest community news.', '1', '0', '1', '0', '1', '1', '', '', '0', '0', '0', '0', '0', '', '', '1', '0', '', '');
INSERT INTO `{:=DBPREFIX=:}forums` (`id`, `name`, `description`, `topics`, `replies`, `parent`, `position`, `last_topic`, `count_posts`, `opt`, `optvalue`, `forumzahl`, `topiczahl`, `prefix`, `invisible`, `readonly`, `reply_notification`, `topic_notification`, `active_topic`, `message_active`, `message_title`, `message_text`) VALUES ('2', 'Test-Forum', 'Test all things you want!', '3', '0', '1', '1', '4', '0', '', '', '0', '0', '0', '0', '', '', '', '0', '1', 'Rules', 'Please do not spam! Advertising and other posts that are not allowed according to the forum rules will be deleted!<br />\r\n<em>Thanks, the Forum Staff</em>');
INSERT INTO `{:=DBPREFIX=:}forums` (`id`, `name`, `description`, `topics`, `replies`, `parent`, `position`, `last_topic`, `count_posts`, `opt`, `optvalue`, `forumzahl`, `topiczahl`, `prefix`, `invisible`, `readonly`, `reply_notification`, `topic_notification`, `active_topic`, `message_active`, `message_title`, `message_text`) VALUES ('3', 'Viscacha.org', 'Just a link to the best forum software on earth: Viscacha ;-)', '0', '0', '1', '2', '0', '0', 're', 'http://www.viscacha.org', '0', '0', '0', '0', '', '', '', '0', '0', '', '');

INSERT INTO `{:=DBPREFIX=:}replies` (`id`, `topic`, `topic_id`, `name`, `comment`, `dosmileys`, `ip`, `date`, `edit`, `tstart`) VALUES ('1', 'Welcome to Viscacha!', '1', '1', 'Hi [reader],\r\n\r\nthis is the new version of [b]Viscacha 0.8[/b]!\r\n\r\nViscacha is a free bulletin board system with an integrated content management system. The intention of the software engineers is to combine the current standards with new and user friendly features. The system supports plugins and components for easily extending the core system. Viscacha uses an database abstraction layer to support as many databases as possible. With this software you can easily set up a complete (personal) homepage. The CMS extends the bulletin board system to have a homepage which is connected to the community.\r\n\r\nBest regards,\r\nthe [i]Viscacha-Team[/i]', '1', '127.0.0.1', UNIX_TIMESTAMP(), '', '1');
INSERT INTO `{:=DBPREFIX=:}replies` (`id`, `topic`, `topic_id`, `name`, `comment`, `dosmileys`, `ip`, `date`, `edit`, `tstart`) VALUES ('2', 'Lorem Ipsum', '2', '1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur augue. Curabitur convallis, lectus id mollis ullamcorper, pede augue commodo dui, sed dignissim risus arcu et sem. Aenean vitae libero. Duis egestas imperdiet nulla. Maecenas dapibus. Donec sit amet nisl non nibh tincidunt consectetuer. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Sed risus arcu, tempus eget, pellentesque nec, blandit nec, metus. Nulla at nunc. Phasellus posuere, orci ac imperdiet varius, purus erat vulputate eros, in dignissim erat metus et orci. Pellentesque ullamcorper. Donec tempor mattis mauris. Nulla tincidunt elit non nulla. Quisque nunc elit, accumsan eget, semper ut, dapibus sed, risus. Vivamus elementum felis. In hac habitasse platea dictumst. Donec quam est, pretium vitae, ullamcorper vitae, malesuada tincidunt, lacus.\r\n\r\nPhasellus rhoncus aliquam dolor. Phasellus gravida libero quis lacus. Fusce eu orci sit amet ipsum consequat varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sed nunc. Integer luctus. In hac habitasse platea dictumst. Pellentesque est risus, fermentum quis, laoreet id, bibendum vitae, mauris. Fusce porttitor hendrerit orci. Nam aliquet ante eu dolor. Quisque ornare posuere ipsum.\r\n\r\nPellentesque auctor est a urna congue dapibus. Ut enim eros, euismod eget, commodo in, congue nonummy, nunc. In placerat mi id justo. Cras vulputate. Sed dignissim mi sed tortor. Integer nec augue id erat fringilla imperdiet. Donec quis tellus eu massa tristique aliquam. Fusce orci est, porttitor nec, semper in, laoreet eget, lectus. Nam ut diam. Duis metus.\r\n\r\nMaecenas fringilla interdum lectus. Proin quis eros. Aliquam consequat erat non elit. Curabitur sodales arcu et metus. Quisque ultricies, tortor dapibus tempus gravida, ligula pede dapibus leo, at aliquam sem risus non nulla. Duis volutpat, turpis ac semper congue, sem tellus gravida lacus, ac rhoncus erat libero in diam. Nunc tempor leo non velit. Nunc aliquam, felis at porta convallis, odio tellus tincidunt augue, ac sodales pede nulla et erat. Suspendisse tortor libero, rutrum ac, lacinia sed, consectetuer nec, augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent at justo. Integer tincidunt, urna vitae dapibus tempus, sapien massa scelerisque lectus, non tincidunt nisi erat vel purus.\r\n\r\nMorbi non leo. Suspendisse et turpis. Praesent tortor tortor, luctus in, iaculis nonummy, scelerisque ut, eros. Nunc quis dui quis sem vulputate dictum. Pellentesque et dolor. Nullam rhoncus. Pellentesque malesuada vehicula ante. Nunc nisl. Ut ultrices rhoncus sem. Etiam felis. Etiam venenatis, diam id accumsan iaculis, dolor nisi luctus sem, ut lobortis tellus purus in nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut ac orci. Etiam euismod auctor augue. Phasellus odio sem, scelerisque id, faucibus in, sagittis sed, mauris. Sed nisl turpis, consectetuer ac, pellentesque ut, posuere nec, pede.', '1', '127.0.0.1', UNIX_TIMESTAMP(), '', '1');
INSERT INTO `{:=DBPREFIX=:}replies` (`id`, `topic`, `topic_id`, `name`, `comment`, `dosmileys`, `ip`, `date`, `edit`, `tstart`) VALUES ('3', 'BB-Codes', '3', '1', 'Just some BB-Codes:\r\n\r\n[ot]This is the Off-Topic-BB-Code![/ot]\r\n\r\nThis is a smiley:  :idea: \r\n\r\n[quote=Pablo Picasso]Computers are useless. They can only give you answers.[/quote]\r\n\r\n[code=php]\r\n<?php\r\n/**\r\n *	Viscacha - An advanced bulletin board solution to manage your content easily\r\n *	Copyright (C) 2004-2007  Viscacha.org\r\n *\r\n *	Author: Matthias Mohr\r\n *	Publisher: http://www.viscacha.org\r\n *	Start Date: May 22, 2004\r\n *\r\n *	This program is free software; you can redistribute it and/or modify\r\n *	it under the terms of the GNU General Public License as published by\r\n *	the Free Software Foundation; either version 2 of the License, or\r\n *	(at your option) any later version.\r\n *\r\n *	This program is distributed in the hope that it will be useful,\r\n *	but WITHOUT ANY WARRANTY; without even the implied warranty of\r\n *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\n *	GNU General Public License for more details.\r\n *\r\n *	You should have received a copy of the GNU General Public License\r\n *	along with this program; if not, write to the Free Software\r\n *	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA\r\n */\r\nrequire_once(\"source/class.Viscacha.php\");\r\n$object = new Viscacha();\r\necho $object->main();\r\n?>\r\n[/code]', '1', '127.0.0.1', UNIX_TIMESTAMP(), '', '1');
INSERT INTO `{:=DBPREFIX=:}replies` (`id`, `topic`, `topic_id`, `name`, `comment`, `dosmileys`, `ip`, `date`, `edit`, `tstart`) VALUES ('4', 'How do you rate Viscacha?', '4', '1', 'Please tell us: [b]How do you rate Viscacha?[/b]\r\n\r\nRegards, the Viscacha-Team :) ', '1', '127.0.0.1', UNIX_TIMESTAMP(), '', '1');

INSERT INTO `{:=DBPREFIX=:}textparser` (`search`, `replace`) VALUES ('Asshole', '*******');
INSERT INTO `{:=DBPREFIX=:}textparser` (`search`, `replace`) VALUES ('Bitch', '*****');

INSERT INTO `{:=DBPREFIX=:}topics` (`id`, `board`, `topic`, `prefix`, `posts`, `name`, `date`, `status`, `last`, `sticky`, `last_name`, `vquestion`) VALUES ('1', '1', 'Welcome to Viscacha!', '0', '0', '1', UNIX_TIMESTAMP(), '0', UNIX_TIMESTAMP(), '0', '1', '');
INSERT INTO `{:=DBPREFIX=:}topics` (`id`, `board`, `topic`, `prefix`, `posts`, `name`, `date`, `status`, `last`, `sticky`, `last_name`, `vquestion`) VALUES ('2', '2', 'Lorem Ipsum', '0', '0', '1', UNIX_TIMESTAMP(), '0', UNIX_TIMESTAMP(), '0', '1', '');
INSERT INTO `{:=DBPREFIX=:}topics` (`id`, `board`, `topic`, `prefix`, `posts`, `name`, `date`, `status`, `last`, `sticky`, `last_name`, `vquestion`) VALUES ('3', '2', 'BB-Codes', '0', '0', '1', UNIX_TIMESTAMP(), '0', UNIX_TIMESTAMP(), '0', '1', '');
INSERT INTO `{:=DBPREFIX=:}topics` (`id`, `board`, `topic`, `prefix`, `posts`, `name`, `date`, `status`, `last`, `sticky`, `last_name`, `vquestion`) VALUES ('4', '2', 'How do you rate Viscacha?', '0', '0', '1', UNIX_TIMESTAMP(), '0', UNIX_TIMESTAMP(), '1', '1', 'How do you rate Viscacha?');

INSERT INTO `{:=DBPREFIX=:}vote` (`id`, `tid`, `answer`) VALUES ('1', '4', 'Good');
INSERT INTO `{:=DBPREFIX=:}vote` (`id`, `tid`, `answer`) VALUES ('2', '4', 'Average');
INSERT INTO `{:=DBPREFIX=:}vote` (`id`, `tid`, `answer`) VALUES ('3', '4', 'Bad');
INSERT INTO `{:=DBPREFIX=:}vote` (`id`, `tid`, `answer`) VALUES ('4', '4', 'Still unsure :-x');

INSERT INTO `{:=DBPREFIX=:}votes` (`id`, `mid`, `aid`) VALUES ('1', '1', '4');

<?php
/*
	Viscacha - A bulletin board solution for easily managing your content
	Copyright (C) 2004-2009  The Viscacha Project

	Author: Matthias Mohr (et al.)
	Publisher: The Viscacha Project, http://www.viscacha.org
	Start Date: May 22, 2004

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

	pseudo-cron v1.3
	(c) 2003,2004 Kai Blankenhorn
	www.bitfolge.de/pseudocron
	kaib@bitfolge.de
	modified by: 	Matthias Mohr, 2005
					DigiLog multimedia, 2005
*/

error_reporting(E_ALL);

define('SCRIPTNAME', 'cron');
define('VISCACHA_CORE', '1');
define('TEMPSHOWLOG', 1);
define('TEMPNOFUNCINIT', 1);

require_once("data/config.inc.php");
include("classes/function.viscacha_frontend.php");

require_once("classes/cron/class.parser.php");
require_once("classes/cron/function.cron.php");

if ($config['foffline']) {
	PixelImage();
}

$cronTab = "data/cron/crontab.inc.php";
$writeDir = "data/cron/";
$jobdir = "classes/cron/jobs/";

if ($config['pccron_uselog'] == 1) {
	$useLog = true;
}
else {
	$useLog = false;
}
if ($config['pccron_sendlog'] == 1) {
	$sendLogToEmail = $config['pccron_sendlog_email'];
}
else {
	$sendLogToEmail = '';
}
$maxJobs = $config['pccron_maxjobs'];

$resultsSummary = "";

($code = $plugins->load('cron_start')) ? eval($code) : null;

PixelImage();
InitCron();

($code = $plugins->load('cron_end')) ? eval($code) : null;

$db->close();

?>
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
*/

if (defined('VISCACHA_CORE') == false) { die('Error: Hacking Attempt'); }

// Small hack for the new php 5.3 timezone warnings
date_default_timezone_set(@date_default_timezone_get());

/* Fixed php functions */

// IDNA Convert Class
include_once (dirname(__FILE__).'/class.idna.php');

function convert_host_to_idna($host) {
	$idna = new idna_convert();
	return $idna->encode($host);
}

function fsockopen_idna($host, $port, $timeout) {
	$host = convert_host_to_idna($host);
	$fp = @fsockopen($host, $port, $errno, $errstr, $timeout);
	return array($fp, $errno, $errstr, $host);
}

function is_id ($x) {
	return (is_numeric($x) && $x >= 1 ? intval($x) == $x : false);
}

// Generates an alpha-numeric 32 char unique ID
function generate_uid($value = null) {
	if (function_exists('random_bytes')) {
		return bin2hex(random_bytes(16));
	}
	else if (function_exists('openssl_random_pseudo_bytes')) {
		return bin2hex(openssl_random_pseudo_bytes(16));
	}
	else {
		return md5(uniqid(mt_rand(), true));
	}
}

// Variable headers are not secure in php (HTTP response Splitting).
// Better use viscacha_header() instead of header().
// viscacha_header() removes \r, \n, \0
function viscacha_header($header, $replace = true, $code = 0) {
	$header = str_replace("\n", '', $header);
	$header = str_replace("\r", '', $header);
	$header = str_replace("\0", '', $header);
	if ($code > 0) {
		header($header, $replace, $code);
	}
	else {
		header($header, $replace);
	}
}

function viscacha_htmlentities($text, $quote = ENT_QUOTES, $double_encode = TRUE) {
	return htmlentities($text, $quote, 'UTF-8', $double_encode);
}

function viscacha_html_entity_decode($text, $quote = ENT_QUOTES) {
	return html_entity_decode($text, $quote, 'UTF-8');
}

function viscacha_htmlspecialchars($text, $quote = ENT_QUOTES, $double_encode = TRUE) {
	return htmlspecialchars($text, $quote, 'UTF-8', $double_encode);
}

function viscacha_htmlspecialchars_decode($text, $quote = ENT_QUOTES) {
	return htmlspecialchars_decode($text, $quote);
}

/**
 * Sends a http status code to the client.
 *
 * Aditional header data can be send depending on the code number given in the first parameter.
 * Only some error codes support this and each error code has its own additional header data.
 * Supported additional headers:
 * - 201/202/301/302/307 => Location: Specify a new location (url)
 * - 401 => WWW-Authenticate: Specify a page name
 * - 503 => Retry-after: Specify the time the page is unavailable
 *
 * @param int $code Error Code Number
 * @param mixed $additional Additional Header data (depends in error code number)
 * @return boolean
 */
function sendStatusCode($code, $additional = null) {
	$status = array(
		100 => 'Continue',
		101 => 'Switching Protocols',
		200 => 'OK',
		201 => 'Created',
		202 => 'Accepted',
		203 => 'Non-Authoritative Information',
		204 => 'No Content',
		205 => 'Reset Content',
		206 => 'Partial Content',
		300 => 'Multiple Choices',
		301 => 'Moved Permanently',
		302 => 'Moved Temporarily', // Found
		303 => 'See Other',
		304 => 'Not Modified',
		305 => 'Use Proxy',
		307 => 'Temporary Redirect',
		400 => 'Bad Request',
		401 => 'Authorization Required', // Unauthorized
		402 => 'Payment Required',
		403 => 'Forbidden',
		404 => 'Not Found',
		405 => 'Method Not Allowed',
		406 => 'Not Acceptable',
		407 => 'Proxy Authentication Required',
		408 => 'Request Time-Out',
		409 => 'Conflict',
		410 => 'Gone',
		411 => 'Length Required',
		412 => 'Precondition Failed',
		413 => 'Request Entity Too Large',
		414 => 'Request-URI Too Large',
		415 => 'Unsupported Media Type',
		416 => 'Request Rang Not Satisfiable',
		417 => 'Expectation Failed',
		500 => 'Internal Server Error',
		501 => 'Not Implemented',
		502 => 'Bad Gateway',
		503 => 'Service Temporarily Unavailable', // Service Unavailable
		504 => 'Gateway Time-Out',
		505 => 'HTTP Version not supported'
	);

	if (isset($status[$code])) {

		// Send status code
		viscacha_header("Status: {$code} {$status[$code]}");

		// Additional headers
		if ($additional != null) {
			switch ($code) {
				case '201':
				case '202':
				case '301':
				case '302':
				case '307':
					viscacha_header("Location: {$additional}");
				break;
				case '401':
					viscacha_header('WWW-Authenticate: Basic Realm="'.$additional.'"');
				break;
				case '503':
					viscacha_header("Retry-After: {$additional}");
				break;
			}
		}

		return true;
	}
	else {
		return false;
	}
}

/* Some other important functions */

// Function to determine which OS is used
function isWindows() {
	if (mb_strtoupper(mb_substr(PHP_OS, 0, 3)) == 'WIN') {
		return true;
	}
	elseif (isset($_SERVER['OS']) && mb_strpos(mb_strtolower($_SERVER['OS']), 'Windows') !== false) {
		return true;
	}
	elseif (function_exists('php_uname') && mb_stristr(@php_uname(), 'windows')) {
		return true;
	}
	else {
		return false;
	}
}
function isMac() {
	$mac = mb_strtoupper(mb_substr(PHP_OS, 0, 3));
	return ($mac == 'MAC' || $mac == 'DAR');
}

/**
 * getDocRoot fixes a problem with Windows where PHP does not have $_SERVER['DOCUMENT_ROOT']
 * built in. getDocRoot returns what $_SERVER['DOCUMENT_ROOT'] should have. It should work on
 * other builds, such as Unix, but is best used with Windows. There are two return cases for
 * Windows, one is the document root for the server's web files (c:/inetpub/wwwroot), the
 * other version is the first folder beyond that point (if documents are stored in user folders).
 *
 * @author Allan Bogh - Buckwheat469@hotmail.com
 * @version 1.0 - based on research on www.helicron.net/php
 *
 * @param $folderFix - This optional parameter tells the function to include the first folder in
 *						the return (c:/inetpub/wwwroot/userfolder instead of c:/inetpub/wwwroot).
 *						Set to true if folder should be returned.
 * @return The document root string.
 **/
function getDocumentRoot(){
	//sets up the localpath
	$localpath = getenv("SCRIPT_NAME");
 	$localpath = mb_substr($localpath, mb_strpos($localpath, '/', iif(mb_strlen($localpath) >= 1, 1, 0)), mb_strlen($localpath));

	//realpath sometimes doesn't work, but gets the full path of the file
	$absolutepath = realpath($localpath);
	if((!isset($absolutepath) || $absolutepath=="") && isset($_SERVER['ORIG_PATH_TRANSLATED'])){
		$absolutepath = $_SERVER['ORIG_PATH_TRANSLATED'];
	}

	//checks if Windows is being used to replace the \ to /
	if(isWindows() == true){
		$absolutepath = str_replace("\\","/",$absolutepath);
	}

	//prepares the document root string
	$docroot = mb_substr($absolutepath,0,mb_strpos($absolutepath,$localpath));
	return $docroot;
}

// if function for templates
function iif($if, $true, $false = '') {
	return ($if ? $true : $false);
}

// extracts the top directory
function extract_dir($source, $realpath = true) {
	if ($realpath) {
		$source = realpath($source);
	}
	else {
		$source = rtrim($source, '/\\');
	}
	$pos = mb_strrpos($source, '/');
	if ($pos === false) {
		$pos = mb_strrpos($source, '\\');
	}
	if ($pos > 0) {
		$dest = mb_substr($source, 0, $pos+1);
	}
	else {
		$dest = '';
	}
	return $dest;
}
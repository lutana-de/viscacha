<?php
class cache_index_moderators extends CacheItem {

	function __construct($filename, $cachedir = "cache/") {
		parent::__construct($filename, $cachedir);
		$this->max_age = 60*60; // Maximal 1 h alt
	}

	function load() {
		global $db, $scache;
		$memberdata_obj = $scache->load('memberdata');
		$memberdata = $memberdata_obj->get();
		if ($this->exists() == true) {
		    $this->import();
		}
		else {
		    $result = $db->query('SELECT mid, bid FROM '.$db->pre.'moderators');
		    $this->data = array();
		    while($row = $db->fetch_assoc($result)) {
		    	if (isset($memberdata[$row['mid']])) {
		    		$row['name'] = $memberdata[$row['mid']];
		    		$this->data[$row['bid']][] = $row;
		    	}
		    }
			$this->export();
		}
	}

}
?>
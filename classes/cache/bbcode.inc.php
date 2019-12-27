<?php
class cache_bbcode extends CacheItem {
	function load () {
		global $db;
		if ($this->exists() == true) {
			$this->import();
		}
		else {
			$this->data = array(
				'censor' => array(),
				'bb' => array()
			);
			$result = $db->query("SELECT * FROM {$db->pre}textparser");
			while ($bb = $db->fetch_assoc($result)) {
				$this->data['censor'][] = $bb;
			}
			$this->export();
		}
	}
}
?>
<?php
/*
  Viscacha - An advanced bulletin board solution to manage your content easily
  Copyright (C) 2004-2017, Lutana
  http://www.viscacha.org

  Authors: Matthias Mohr et al.
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

namespace Viscacha\Database;

class Result {

	private $statement;
	private $results;
	private $affectedRows;
	private $columnCount;
	private $query;
	private $values;
	
	public function __construct(\PDOStatement $pdoStatement, $query = null, array $values = array()) {
		$this->statement = $pdoStatement;
		$this->results = null;
		$this->affectedRows = null;
		$this->columnCount = null;
		$this->query = $query;
		$this->values = $values;
	}
	
	public function cache() {
		if ($this->getColumnCount() > 0) {
			$this->results = $this->fetchMatrix();
		}
		$this->columnCount = $this->getColumnCount();
		$this->affectedRows = $this->getAffectedRows();
		$this->statement->closeCursor();
	}
	
	public function cacheObject() {
		if ($this->getColumnCount() > 0) {
			$this->results = $this->fetchObjectMatrix();
		}
		$this->columnCount = $this->getColumnCount();
		$this->affectedRows = $this->getAffectedRows();
		$this->statement->closeCursor();
	}
	
	public function getQuery() {
		return $this->query;
	}
	
	public function getValues() {
		return $this->values;
	}
	
	public function getCache() {
		return $this->results;
	}

	public function getResultCount() {
		return $this->getAffectedRows(); // ToDo: Remove from code
	}

	public function getColumnCount() {
		return $this->columnCount !== null ? $this->columnCount : $this->statement->columnCount();
	}

	public function getAffectedRows() {
		return $this->affectedRows !== null ? $this->affectedRows : $this->statement->rowCount();
	}

	public function fetchMatrix() {
		return $this->statement->fetchAll(\PDO::FETCH_ASSOC);
	}

	public function fetchObjectMatrix($class = "stdClass") {
		$this->statement->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, $class); 
		return $this->statement->fetchAll();
	}

	public function fetchList($column = 1) {
		$data = array();
		while ($row = $this->fetchOne($column)) {
			$data[] = $row;
		}
		return $data;
	}

	public function fetch() {
		return $this->statement->fetch(\PDO::FETCH_ASSOC);
	}

	public function fetchObject($class = "stdClass") {
		$this->statement->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, $class); 
		return $this->statement->fetch();
	}

	public function fetchOne($column = 1) {
		if (is_string($column)) {
			$row = $this->fetch();
			return isset($row[$column]) ? $row[$column] : false;
		}
		else {
			$column--;
			return $this->statement->fetchColumn($column);
		}
	}

}
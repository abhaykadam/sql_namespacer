#!/usr/bin/awk -f
BEGIN {
	/* patterns */
	TABLE_STRUCTURE = "-- Table structure for table `(.*)`"
	DROP_TABLE = "DROP TABLE IF EXISTS `(.*)`"
	CREATE_TABLE = "CREATE TABLE `(.*)`"
	DUMP_DATA = "-- Dumping data for table `(.*)`"
	LOCK_TABLES = "LOCK TABLES `(.*)`"
	INSERT_INTO = "INSERT INTO `(.*)`"
	ALTER_TABLE = "ALTER TABLE `(.*)`"
}
$0 ~ TABLE_STRUCTURE {
	print gensub(TABLE_STRUCTURE, "-- Table structure for table `" prefix "\\1`", "g", $0)
	next
}
$0 ~ DROP_TABLE {
	print gensub(DROP_TABLE, "DROP TABLE IF EXISTS `" prefix "\\1`", "g", $0)
	next
}
$0 ~ CREATE_TABLE {
	print gensub(CREATE_TABLE, "CREATE TABLE `" prefix "\\1`", "g", $0)
	next
}
$0 ~ DUMP_DATA {
	print gensub(DUMP_DATA, "-- Dumping data for table `" prefix "\\1`", "g", $0)
	next
}
$0 ~ LOCK_TABLES {
	print gensub(LOCK_TABLES, "LOCK TABLES `" prefix "\\1`", "g", $0)
	next
}
$0 ~ INSERT_INTO {
	print gensub(INSERT_INTO, "INSERT INTO `" prefix "\\1`", "g", $0)
	next
}
$0 ~ ALTER_TABLE {
	print gensub(ALTER_TABLE, "ALTER TABLE `" prefix "\\1`", "g", $0)
	next
}
{
	print $0
}
END {
}

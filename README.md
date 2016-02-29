# sql_namespacer

Run the script as
`awk -f sql_namespacer.awk prefix=namespace_ file.sql`

## Limitations:
The table name needs to be backticked:

Valid statement: ``CREATE TABLE `table_name` `` 

Invalid Statement: ``CREATE TABLE table_name`` is not.

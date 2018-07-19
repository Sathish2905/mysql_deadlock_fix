# mysql_deadlock_fix
The following will create a simple stored procedure that uses a cursor to kill all processes one by one except for the process currently being used:
mysql_deadlock_fix_procedure.sql
The following will create a simple Event that will run on the scheduled time :
mysql_deadlock_fix_event.sql

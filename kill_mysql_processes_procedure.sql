DROP PROCEDURE IF EXISTS kill_other_processes;
DELIMITER $$
CREATE PROCEDURE kill_other_processes () 
BEGIN
  DECLARE finished INT DEFAULT 0 ;
  DECLARE proc_id INT ;
  DECLARE proc_id_cursor CURSOR FOR 
  SELECT 
    id 
  FROM
    information_schema.processlist 
  WHERE USER = 'root';;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1 ;
  OPEN proc_id_cursor ;
  proc_id_cursor_loop :
  LOOP
    FETCH proc_id_cursor INTO proc_id ;
    IF finished = 1 
    THEN LEAVE proc_id_cursor_loop ;
    END IF ;
    IF proc_id <> CONNECTION_ID() 
    THEN KILL proc_id ;
    END IF ;
  END LOOP proc_id_cursor_loop ;
  CLOSE proc_id_cursor ;
END $$

DELIMITER ;
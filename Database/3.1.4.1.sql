DELIMITER $

CREATE TRIGGER user_log_trigger
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'INSERT', 'user');
END $

CREATE TRIGGER user_update_log_trigger
AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'UPDATE', 'user');
END $

CREATE TRIGGER user_delete_log_trigger
AFTER DELETE ON user
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'DELETE', 'user');
END $
DELIMITER ;


DELIMITER $
CREATE TRIGGER job_log_trigger
AFTER INSERT ON job
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'INSERT', 'job');
END $

CREATE TRIGGER job_update_log_trigger
AFTER UPDATE ON job
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'UPDATE', 'job');
END $

CREATE TRIGGER job_delete_log_trigger
AFTER DELETE ON job
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'DELETE', 'job');
END $
DELIMITER ;


DELIMITER $
CREATE TRIGGER degree_log_trigger
AFTER INSERT ON degree
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'INSERT', 'degree');
END $

CREATE TRIGGER degree_update_log_trigger
AFTER UPDATE ON degree
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'UPDATE', 'degree');
END $

CREATE TRIGGER degree_delete_log_trigger
AFTER DELETE ON degree
FOR EACH ROW
BEGIN
    DECLARE v_username VARCHAR(30);
    SET v_username = (SELECT CURRENT_USER());

    INSERT INTO dba_log (username, action_type, table_name)
    VALUES (v_username, 'DELETE', 'degree');
END $
DELIMITER ;

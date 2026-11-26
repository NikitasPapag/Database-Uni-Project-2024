CREATE INDEX idx_istoriko_grade ON istoriko_aitiseon(grade);

CREATE INDEX idx_istoriko_evaluator ON istoriko_aitiseon(evaluator1_username, evaluator2_username);

DELIMITER $

CREATE PROCEDURE find_applications_by_grade(IN grade_min INT, IN grade_max INT)
BEGIN
    SELECT employee_username, job_id
    FROM istoriko_aitiseon
    WHERE grade BETWEEN grade_min AND grade_max;
END$

DELIMITER ;


DELIMITER $

CREATE PROCEDURE find_applications_by_evaluator(IN evaluator_username VARCHAR(30))
BEGIN
    SELECT employee_username, job_id
    FROM istoriko_aitiseon
    WHERE evaluator1_username = evaluator_username OR evaluator2_username = evaluator_username;
END$

DELIMITER ;

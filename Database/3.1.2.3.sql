
CREATE PROCEDURE generate_istoriko_data(num_entries INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE e1 VARCHAR(30);
  DECLARE e2 VARCHAR(30);
  DECLARE emp VARCHAR(30);
  DECLARE job INT;
  DECLARE grd INT;

  /* Elegxos an yparxei eparkhs arithmos apo evaluators, employees, jobs etsi wste na kanoume generate 60.000 eggrafes */
  DECLARE evaluator_count INT;
  DECLARE employee_count INT;
  DECLARE job_count INT;

  SELECT COUNT(*) INTO evaluator_count FROM evaluator;
  SELECT COUNT(*) INTO employee_count FROM employee;
  SELECT COUNT(*) INTO job_count FROM job;

  IF evaluator_count < 10 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Δεν υπάρχει επαρκής αριθμός evaluators στη βάση. Ο ελάχιστος απαιτούμενος αριθμός είναι 10.';
  END IF;
  
  IF employee_count < 10 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Δεν υπάρχει επαρκής αριθμός employees στη βάση. Ο ελάχιστος απαιτούμενος αριθμός είναι 10';
  END IF;
  
  IF job_count < 10 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Δεν υπάρχει επαρκής αριθμός jobs στη βάση. Ο ελάχιστος απαιτούμενος αριθμός είναι 10';
  END IF;

  /*Tyxaia epilogh apo evaluators, employees, jobs*/
  WHILE i < num_entries DO
    SET e1 = (SELECT username FROM evaluator ORDER BY RAND() LIMIT 1);
    /* Epilogh deyterou aksiologiti etsi wste na mhn taytizetai me ton prwto */
    SET e2 = (SELECT username FROM evaluator WHERE username != e1 ORDER BY RAND() LIMIT 1);
    SET emp = (SELECT username FROM employee ORDER BY RAND() LIMIT 1);
    SET job = (SELECT id FROM job ORDER BY RAND() LIMIT 1);
    /* Sto grd xrhsimopoioume floor giati theloume bathmoys apo 1-20 omws epeidh exoume bathmoys sto diastima [1,21) to floor kanei th proseggisi gia to 20 */
    SET grd = FLOOR(1 + RAND() * 20);

    /* Eisagwgh sto table istoriko_aitiseon */
    INSERT INTO istoriko_aitiseon (evaluator1_username, evaluator2_username, employee_username, job_id, grade)
    VALUES (e1, e2, emp, job, grd);

    SET i = i + 1;
  END WHILE;
END $

DELIMITER ;


CALL generate_istoriko_data(60000);
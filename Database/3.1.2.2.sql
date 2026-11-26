DELIMITER $

CREATE PROCEDURE bathmologia_prosonton(
IN username_ergazomenou VARCHAR(30),
OUT protinomenos_vathmos INT
)
BEGIN
DECLARE vathmos_ptyxion INT DEFAULT 0;
DECLARE vathmos_glwsswn INT DEFAULT 0;
DECLARE vathmos_project INT DEFAULT 0;

/* Ypologismos vathmoy ptyxion */
SELECT SUM(
CASE
 WHEN bathmida = 'BSc' THEN 1
 WHEN bathmida = 'MSc' THEN 2
 WHEN bathmida = 'PhD' THEN 3
ELSE 0
END
) INTO vathmos_ptyxion
FROM has_degree
WHERE cand_usrname = username_ergazomenou;

/* Ypologismos vathmoy glosswn */
SELECT COUNT(*) INTO vathmos_glwsswn
FROM languages
WHERE candid = username_ergazomenou;

/* Ypologismos vathmou gia project */
SELECT COUNT(*) INTO vathmos_project
FROM project
WHERE candid = username_ergazomenou;

/* Ypologismos telikou protinomenou vathmou */
SET protinomenos_vathmos = vathmos_ptyxion + vathmos_glwsswn + vathmos_project;
END $

DELIMITER ;


DELIMITER $

CREATE TRIGGER after_insert_evaluation
AFTER INSERT ON evaluation
FOR EACH ROW
proc_block: BEGIN /* thetoume edw to proc_block gia na 'fygoume' meta opoy xreiastei */

  DECLARE num_evaluations INT;
  DECLARE avg_grade FLOAT;
  DECLARE username_ergazomenou VARCHAR(30);
  DECLARE job_id INT;
  DECLARE proposed_grade INT;
  DECLARE final_grade FLOAT;
  DECLARE best_candidate VARCHAR(30);
  DECLARE katastasi ENUM('energi', 'olokliromeni', 'akyromeni');

  /* Eyresi tou username tou ergazomenou kai tou job id gia thn aitisi */
  SELECT cand_usrname, job_id INTO username_ergazomenou, job_id
  FROM aitisi_proagogis
  WHERE aitisi_id = NEW.aitisi_id;

 /* Aporipsi ean h aitisi einai akiromeni */
    SELECT katastasi INTO katastasi
    FROM aitisi_proagogis
    WHERE aitisi_id = NEW.aitisi_id;

    IF katastasi = akyromeni THEN 
    LEAVE proc_block; 
    END IF;
    

  /* Eyresh toy arithmoy aksiologisewn */
  SELECT COUNT(*) INTO num_evaluations
  FROM evaluation
  WHERE aitisi_id = NEW.aitisi_id;

  /* Ean yparxoyn 2 aksiologiseis tote briskoume ton meso oro */
  IF num_evaluations = 2 THEN
    SELECT AVG(grade) INTO avg_grade
    FROM evaluation
    WHERE aitisi_id = NEW.aitisi_id;

    
    SET final_grade = avg_grade;

  ELSE
    /* Ypologismos bathmou me bash ta prosonta */
    CALL bathmologia_prosonton(username_ergazomenou, proposed_grade);

    /* Xrhsh proteinomenou bathmou ean den exoume 2 aksiologhseis */
    SET final_grade = proposed_grade
  END IF;

  /* Bazoume sthn aithsh ton teliko bathmo */
  UPDATE aitisi_proagogis
  SET grade = final_grade
  WHERE aitisi_id = NEW.aitisi_id;

  /* Epilogi toy kalyteroy ypopsifiou */
  SELECT cand_usrname INTO best_candidate
  FROM aitisi_proagogis
  WHERE job_id = job_id
  ORDER BY grade DESC, hmerominia_aitisis
  LIMIT 1;

  /* Enimerosi thesis me ton kalytero ypopshfio */
  UPDATE job
  SET best_candidate = best_candidate
  WHERE id = job_id;

  /* Diagrafh aitisis apton pinaka afoy oloklirothei */
  DELETE FROM aitisi_proagogis
  WHERE aitisi_id = NEW.aitisi_id;
END $

DELIMITER ;

DELIMITER $


CREATE PROCEDURE Ananeosi_Istorikoy()
BEGIN
    /* Eisagwgi aitiseon poy exoyn aksiologithei hdh sto istoriko */
    INSERT INTO istoriko_aitiseon (evaluator1_username, evaluator2_username, employee_username, job_id, katastasi, grade)
    SELECT a.evaluator1_username, a.evaluator2_username, a.employee_username, a.job_id,'olokliromeni' AS katastasi,
           CASE
               WHEN a.katastasi = 'akyromeni' THEN 0
               /* Pairnoume ton meso oro aptous bathmous ,ton kanoume round gia na mhn einai
               dekadikos, kai me th synarthsh coalesce eksafalizoume oti ean h timi einai
               NULL tote tha antikatastathei me to 0 */
               ELSE COALESCE(ROUND(AVG(e.grade)), 0)
           END AS grade
    FROM aitisi_proagogis a
    LEFT JOIN evaluation e ON a.aitisi_id = e.aitisi_id
    GROUP BY a.aitisi_id;

    /* Diagrafoume tis aitiseis poy exoyn hdh aksiologithei */
    DELETE FROM aitisi_proagogis
    WHERE aitisi_id IN (SELECT aitisi_id FROM evaluation);
END $

DELIMITER ;


CALL Ananeosi_Istorikoy();
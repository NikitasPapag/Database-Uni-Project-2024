DELIMITER $

CREATE PROCEDURE Apotelesma_Thesis (
  IN job_id INT
)
BEGIN
  DECLARE cand_usrname VARCHAR(30);
  DECLARE max_grade FLOAT DEFAULT 0;
  DECLARE final_candidate VARCHAR(30);
  DECLARE temp_grade FLOAT;
  DECLARE final_grade FLOAT;
  
  /*Euresi olon twn ypopsifiwn gia thn sygkekrimeni thesi*/
  SELECT cand_usrname INTO cand_usrname
  FROM aitisi_proagogis
  WHERE job_id = job_id
  LIMIT 1;

  WHILE cand_usrname IS NOT NULL DO
    /*Elegxos gia katastasi*/
    CALL Elenxos_Bathmologias_Axiologiti('evaluator1', cand_usrname, job_id, temp_grade);
    SET final_grade = temp_grade;
    
    CALL Elenxos_Bathmologias_Axiologiti('evaluator2', cand_usrname, job_id, temp_grade);
    SET final_grade = final_grade + temp_grade;
    
    SET final_grade = final_grade / 2;

    /*Elegxos gia an o ypopsifios exei to megisto bathmo*/
    IF final_grade > max_grade THEN
      SET max_grade = final_grade;
      SET final_candidate = cand_usrname;
    END IF;

    /*Epomenos ypopsifios*/
    SELECT cand_usrname INTO cand_usrname
    FROM aitisi_proagogis
    WHERE job_id = job_id AND cand_usrname > cand_usrname
    ORDER BY cand_usrname
    LIMIT 1;
  END WHILE;

  /*Teliko apotelesma gia thn thesi*/
  IF max_grade > 0 THEN
    -- Update gia ton kalytero ypopsifio
    UPDATE job 
    SET best_candidate = final_candidate
    WHERE id = job_id;

    /*Klisi tis stored procedure gia ananeosi tou istorikou*/
    CALL Ananeosi_Istorikoy();
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Den vrethike katalili aitisi gia thn thesi.';
  END IF;
END $

DELIMITER ;

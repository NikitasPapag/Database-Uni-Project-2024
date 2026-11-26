CREATE PROCEDURE Elenxos_Bathmologias_Axiologiti (
  IN evaluator_username VARCHAR(30),
  IN employee_username VARCHAR(30),
  IN job_id INT,
  OUT vathmos INT
)
BEGIN
  DECLARE aitisi_id INT;
  DECLARE bathmologia_exists INT;
  
  /*Eyresi tou aitisi_id gia ton sygkekrimeno ergazomeno kai thn sygkekrimeni thesi ergasias */
  SELECT aitisi_id INTO aitisi_id
  FROM aitisi_proagogis
  WHERE cand_usrname = employee_username
    AND job_id = job_id;
  
  IF aitisi_id IS NULL THEN
     /*Den vrethike aitisi*/
    SET vathmos = 0;
  ELSE
    /*Elegxos gia bathmologia*/
    SELECT COUNT(*) INTO bathmologia_exists
    FROM evaluation
    WHERE aitisi_id = aitisi_id
      AND evaluator_username = evaluator_username;
    
    IF bathmologia_exists = 0 THEN
      /*Den yparxei bathmologia, ypologizw me vash ta prosonta*/
      CALL bathmologia_prosonton(employee_username, vathmos);
    ELSE
      /*Epistrofh tou bathmou*/
      SELECT grade INTO vathmos
      FROM evaluation
      WHERE aitisi_id = aitisi_id
        AND evaluator_username = evaluator_username;
    END IF;
  END IF;
END $

DELIMITER ;

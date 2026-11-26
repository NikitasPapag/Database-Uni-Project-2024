DELIMITER $

CREATE PROCEDURE Diaxeirisi_Aitiseon (
  IN employee_username VARCHAR(30),
  IN job_id INT,
  IN action CHAR(1)
)
BEGIN
  DECLARE aitisi_count INT;
  DECLARE aitisi_status ENUM('energi', 'olokliromeni', 'akyromeni');
  
  /*Elegxos gia eisodo 'i' (Insert)*/
  IF action = 'i' THEN
    /*Elegxos an yparxoyn hdh aitiseis gia ton ergazomeno kai thn sygkekrimeni thesi*/
    SELECT COUNT(*) INTO aitisi_count
    FROM aitisi_proagogis
    WHERE cand_usrname = employee_username
      AND job_id = job_id;
    
    IF aitisi_count = 0 THEN
      /*Dimioyrgia neas aitisis*/
      INSERT INTO aitisi_proagogis (cand_usrname, job_id, katastasi)
      VALUES (employee_username, job_id, 'energi');
    ELSE
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Υπάρχει ήδη αίτηση για αυτόν τον εργαζόμενο στη συγκεκριμένη θέση.';
    END IF;
    
  /*Elegxos gia eisodo 'c' (Cancel)*/
  ELSEIF action = 'c' THEN
    /*Epilogi katastasis*/
    SELECT katastasi INTO aitisi_status
    FROM aitisi_proagogis
    WHERE cand_usrname = employee_username
      AND job_id = job_id;
    
    IF aitisi_status = 'energi' THEN
      /*Akyrwsh tis aitisis*/
      UPDATE aitisi_proagogis
      SET katastasi = 'akyromeni'
      WHERE cand_usrname = employee_username
        AND job_id = job_id;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Η αίτηση ακυρώθηκε επιτυχώς.';
    ELSEIF aitisi_status = 'akyromeni' THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Η αίτηση είναι ήδη ακυρωμένη.';
    ELSE
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Δεν υπάρχει αίτηση για ακύρωση.';
    END IF;
    
  /*Elegxos gia eisodo 'a' (Activate)*/
  ELSEIF action = 'a' THEN
    /*Epilogi katastasis*/
    SELECT katastasi INTO aitisi_status
    FROM aitisi_proagogis
    WHERE cand_usrname = employee_username
      AND job_id = job_id;
    
    IF aitisi_status = 'akyromeni' THEN
      /*Energopoihsh tis aitisis*/
      UPDATE aitisi_proagogis
      SET katastasi = 'energi'
      WHERE cand_usrname = employee_username
        AND job_id = job_id;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Η αίτηση ενεργοποιήθηκε επιτυχώς.';
    ELSEIF aitisi_status = 'energi' THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Η αίτηση είναι ήδη ενεργή.';
    ELSE
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Δεν υπάρχει αίτηση για ενεργοποίηση.';
    END IF;
    
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Μη έγκυρη επιλογή δράσης.';
  END IF;
END $

DELIMITER ;

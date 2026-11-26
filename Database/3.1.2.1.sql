DELIMITER $
CREATE TRIGGER before_insert_aitisi_proagogis
BEFORE INSERT ON aitisi_proagogis
FOR EACH ROW
BEGIN
  DECLARE trgr_start_date DATE;
  
  /*Elegxos gia thn enarksh ths thesis*/
  SELECT start_date INTO trgr_start_date
  FROM job
  WHERE id = NEW.job_id;

  /*Elegxos an yparxei h thesi */
  IF trgr_start_date IS NULL THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Η θέση εργασίας δεν υπάρχει.';
  END IF;
  
  /*Elegxos xronikoy perithorioy*/
  IF DATEDIFF(trgr_start_date, CURDATE()) < 15 THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Οι αιτήσεις μπορούν να καταχωρούνται μέχρι 15 μέρες πριν την ημερομηνία έναρξης της θέσης.';
  END IF;
END $
DELIMITER ;

DELIMITER $
CREATE TRIGGER before_insert_elegkse_gia_energes_aitiseis
BEFORE INSERT ON aitisi_proagogis
FOR EACH ROW
BEGIN
  DECLARE energes_aitiseis INT;
  
  /* Elegxos gia ton arithmo twn energwn aitisewn */
  SELECT COUNT(*) INTO energes_aitiseis
  FROM aitisi_proagogis
  WHERE cand_usrname = NEW.cand_usrname
    AND katastasi = energi;
  
  /* Elegxos an o arithmos energwn aitisewn ksepernaei tis 3 epitrepomenes */
  IF energes_aitiseis >= 3 THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ο εργαζόμενος δεν μπορεί να έχει περισσότερες από τρεις ενεργές αιτήσεις.';
  END IF;
END$
DELIMITER ;

DELIMITER $
CREATE TRIGGER before_update_akirosi_aitisis
BEFORE UPDATE ON aitisi_proagogis
FOR EACH ROW
BEGIN
  DECLARE trgr_start_date DATE;
  
  /*Mono gia energes aitiseis */
  IF OLD.katastasi = energi AND NEW.katastasi = akyromeni THEN
    /* Elegxos gia thn hmeromhnia enarkshs thesis */
    SELECT start_date INTO trgr_start_date
    FROM job
    WHERE id = OLD.job_id;
    
    /* Elegxos an h akyrwsh einai entos toy epitreptou orioy*/
    IF DATEDIFF(trgr_start_date, CURDATE()) < 10 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Οι αιτήσεις μπορούν να ακυρωθούν μέχρι 10 μέρες πριν την ημερομηνία έναρξης της θέσης.';
    END IF;
  END IF;
END $
DELIMITER ;


DELIMITER $
CREATE PROCEDURE Cancel_Aitisi_Proagogis (IN p_aitisi_id INT)
BEGIN
  DECLARE trgr_start_date DATE;
  DECLARE trgr_katastasi ENUM('energi', 'olokliromeni', 'akyromeni');
  
  /* Epilogi katastasis kai hmeromhnia enarkshs ths aitisis */
  SELECT katastasi, start_date INTO trgr_katastasi, trgr_start_date
  FROM aitisi_proagogis
  JOIN job ON aitisi_proagogis.job_id = job.id
  WHERE aitisi_proagogis.aitisi_id = p_aitisi_id;
  
  /* Elegxos an h katastash einai energi */
  IF trgr_katastasi = 'energi' THEN
    /* Elegxow gia to an einai dynath h akyrwsh me bash to xroniko perithorio */
    IF DATEDIFF(trgr_start_date, CURDATE()) >= 10 THEN
      /* Enimerosi ths katastasis se akiromeni */
      UPDATE aitisi_proagogis
      SET katastasi = 'akyromeni'
      WHERE aitisi_id = p_aitisi_id;
    ELSE
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Η αίτηση δεν μπορεί να ακυρωθεί καθώς έχουν απομείνει λιγότερες από 10 μέρες για την έναρξη της θέσης.';
    END IF;
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Η αίτηση δεν είναι σε κατάσταση ''energi'' και δεν μπορεί να ακυρωθεί.';
  END IF;
END$
DELIMITER ;

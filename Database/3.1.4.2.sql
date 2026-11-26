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
  
  /*Elegxos tou arithmou twn energwn aitisewn */
  SELECT COUNT(*) INTO energes_aitiseis
  FROM aitisi_proagogis
  WHERE cand_usrname = NEW.cand_usrname
    AND katastasi = energi;
  
  /*Elegxos an o arithmos energwn aitisewn ksepernaei tis 3 epitrepomenes */
  IF energes_aitiseis >= 3 THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ο εργαζόμενος δεν μπορεί να έχει περισσότερες από τρεις ενεργές αιτήσεις.';
  END IF;
END$
DELIMITER ;

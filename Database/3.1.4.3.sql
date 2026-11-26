DELIMITER $

CREATE TRIGGER before_update_akirosi_aitisis_proagogis2
BEFORE UPDATE ON aitisi_proagogis
FOR EACH ROW
BEGIN
  DECLARE job_start_date DATE;
  DECLARE active_request_count INT;

  /* Anaktisi ths imerominias enarkshs ths thesis */
  SELECT start_date INTO job_start_date
  FROM job
  WHERE id = NEW.job_id;

  /* Apotropi akirosis ean apexei ligotero apo 10 meres aptin enarksh */
  IF NEW.katastasi = akiromeni AND OLD.katastasi = energi THEN
    IF DATEDIFF(job_start_date, NOW()) < 10 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Δεν είναι δυνατή η ακύρωση αίτησης που απέχει λιγότερο από 10 μέρες από την έναρξη της θέσης.';
    END IF;
  END IF;

  /* Apotropi energopoihshs ean yparxoyn hdh 3 energes aitiseis */
  IF NEW.katastasi = energi AND OLD.katastasi = akiromeni THEN
    SELECT COUNT(*)
    INTO active_request_count
    FROM aitisi_proagogis
    WHERE cand_usrname = NEW.cand_usrname
      AND katastasi = energi;

    IF active_request_count >= 3 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Δεν μπορούν να υπάρχουν παραπάνω από 3 ενεργές αιτήσεις.';
    END IF;
  END IF;
END $

DELIMITER ;

